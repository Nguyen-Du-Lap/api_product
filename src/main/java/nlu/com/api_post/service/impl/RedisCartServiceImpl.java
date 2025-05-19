package nlu.com.api_post.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import nlu.com.api_post.exception.ResourceNotFoundException;
import nlu.com.api_post.model.dto.request.CartItemRequest;
import nlu.com.api_post.model.dto.response.CartResponse;
import nlu.com.api_post.service.CartService;
import nlu.com.api_post.service.ProductService;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
@RequiredArgsConstructor
public class RedisCartServiceImpl implements CartService {
    private static final String CART_KEY_PREFIX = "cart:";
    private static final long CART_EXPIRY_DAYS = 30;

    private final RedisTemplate<String, String> redisTemplate;
    private final ProductService productService;
    private final ObjectMapper objectMapper;

    @Override
    public CartResponse getCart(String userId) {
        String cartKey = getCartKey(userId);
        String cartJson = redisTemplate.opsForValue().get(cartKey);
        
        if (cartJson == null) {
            return createEmptyCart(userId);
        }

        try {
            return objectMapper.readValue(cartJson, CartResponse.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Error deserializing cart", e);
        }
    }

    @Override
    public CartResponse addItemToCart(String userId, CartItemRequest item) {
        CartResponse cart = getCart(userId);
        
        // Validate product exists and get details
        var product = productService.getProductById(item.getProductId());
        
        // Check if item already exists in cart
        var existingItem = cart.getItems().stream()
                .filter(i -> i.getProductId().equals(item.getProductId()))
                .findFirst();

        if (existingItem.isPresent()) {
            // Update quantity of existing item
            existingItem.get().setQuantity(existingItem.get().getQuantity() + item.getQuantity());
            existingItem.get().setSubtotal(existingItem.get().getPrice().multiply(BigDecimal.valueOf(existingItem.get().getQuantity())));
        } else {
            // Add new item
            var cartItem = new CartResponse.CartItemResponse();
            cartItem.setItemId(UUID.randomUUID().toString());
            cartItem.setProductId(product.getId());
            cartItem.setProductName(product.getName());
            cartItem.setPrice(product.getPrice());
            cartItem.setQuantity(item.getQuantity());
            cartItem.setSubtotal(product.getPrice().multiply(BigDecimal.valueOf(item.getQuantity())));
            cart.getItems().add(cartItem);
        }

        updateCartTotals(cart);
        saveCart(userId, cart);
        return cart;
    }

    @Override
    public CartResponse updateCartItem(String userId, String itemId, CartItemRequest item) {
        CartResponse cart = getCart(userId);
        
        var cartItem = cart.getItems().stream()
                .filter(i -> i.getItemId().equals(itemId))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Cart item not found"));

        cartItem.setQuantity(item.getQuantity());
        cartItem.setSubtotal(cartItem.getPrice().multiply(BigDecimal.valueOf(item.getQuantity())));

        updateCartTotals(cart);
        saveCart(userId, cart);
        return cart;
    }

    @Override
    public CartResponse removeItemFromCart(String userId, String itemId) {
        CartResponse cart = getCart(userId);
        
        cart.getItems().removeIf(item -> item.getItemId().equals(itemId));
        
        updateCartTotals(cart);
        saveCart(userId, cart);
        return cart;
    }

    @Override
    public void clearCart(String userId) {
        String cartKey = getCartKey(userId);
        redisTemplate.delete(cartKey);
    }

    private String getCartKey(String userId) {
        return CART_KEY_PREFIX + userId;
    }

    private CartResponse createEmptyCart(String userId) {
        CartResponse cart = new CartResponse();
        cart.setUserId(userId);
        cart.setItems(new ArrayList<>());
        cart.setTotalAmount(BigDecimal.ZERO);
        cart.setTotalItems(0);
        return cart;
    }

    private void updateCartTotals(CartResponse cart) {
        BigDecimal totalAmount = BigDecimal.ZERO;
        int totalItems = 0;

        for (var item : cart.getItems()) {
            totalAmount = totalAmount.add(item.getSubtotal());
            totalItems += item.getQuantity();
        }

        cart.setTotalAmount(totalAmount);
        cart.setTotalItems(totalItems);
    }

    private void saveCart(String userId, CartResponse cart) {
        String cartKey = getCartKey(userId);
        try {
            String cartJson = objectMapper.writeValueAsString(cart);
            redisTemplate.opsForValue().set(cartKey, cartJson, CART_EXPIRY_DAYS, TimeUnit.DAYS);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Error serializing cart", e);
        }
    }
} 
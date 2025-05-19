package nlu.com.api_post.service;

import nlu.com.api_post.model.dto.request.CartItemRequest;
import nlu.com.api_post.model.dto.response.CartResponse;

public interface CartService {
    CartResponse getCart(String userId);
    CartResponse addItemToCart(String userId, CartItemRequest item);
    CartResponse updateCartItem(String userId, String itemId, CartItemRequest item);
    CartResponse removeItemFromCart(String userId, String itemId);
    void clearCart(String userId);
} 
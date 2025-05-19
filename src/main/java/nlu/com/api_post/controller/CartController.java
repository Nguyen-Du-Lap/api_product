package nlu.com.api_post.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import nlu.com.api_post.model.dto.request.CartItemRequest;
import nlu.com.api_post.model.dto.response.CartResponse;
import nlu.com.api_post.service.CartService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/carts")
@RequiredArgsConstructor
public class CartController {
    
    private final CartService cartService;
    
    @GetMapping("/{userId}")
    public ResponseEntity<CartResponse> getCart(@PathVariable String userId) {
        return ResponseEntity.ok(cartService.getCart(userId));
    }
    
    @PostMapping("/{userId}/items")
    public ResponseEntity<CartResponse> addItemToCart(
            @PathVariable String userId,
            @Valid @RequestBody CartItemRequest item) {
        return ResponseEntity.ok(cartService.addItemToCart(userId, item));
    }
    
    @PutMapping("/items/{itemId}")
    public ResponseEntity<CartResponse> updateCartItem(
            @RequestParam String userId,
            @PathVariable String itemId,
            @Valid @RequestBody CartItemRequest item) {
        return ResponseEntity.ok(cartService.updateCartItem(userId, itemId, item));
    }
    
    @DeleteMapping("/items/{itemId}")
    public ResponseEntity<CartResponse> removeItemFromCart(
            @RequestParam String userId,
            @PathVariable String itemId) {
        return ResponseEntity.ok(cartService.removeItemFromCart(userId, itemId));
    }
    
    @DeleteMapping("/{userId}/clear")
    public ResponseEntity<Void> clearCart(@PathVariable String userId) {
        cartService.clearCart(userId);
        return ResponseEntity.noContent().build();
    }
} 
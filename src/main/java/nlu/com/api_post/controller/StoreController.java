package nlu.com.api_post.controller;

import java.util.List;

import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import nlu.com.api_post.model.dto.request.StoreCreationRequest;
import nlu.com.api_post.model.dto.request.StoreStatusUpdateRequest;
import nlu.com.api_post.model.dto.request.StoreUpdateRequest;
import nlu.com.api_post.model.dto.response.ApiResponse;
import nlu.com.api_post.model.dto.response.StoreResponse;
import nlu.com.api_post.service.StoreService;

@RestController
@RequestMapping("/api/stores")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
@Slf4j
public class StoreController {
    StoreService storeService;
    
    @GetMapping
    public ApiResponse<List<StoreResponse>> getAllStores() {
        List<StoreResponse> stores = storeService.getAllStores();
        return ApiResponse.<List<StoreResponse>>builder()
                .result(stores)
                .message("List of stores")
                .build();
    }
    
    @GetMapping("/{id}")
    public ApiResponse<StoreResponse> getStoreById(@PathVariable String id) {
        StoreResponse store = storeService.getStoreById(id);
        return ApiResponse.<StoreResponse>builder()
                .result(store)
                .message("Store retrieved successfully")
                .build();
    }
    
    @GetMapping("/user/{userId}")
    public ApiResponse<List<StoreResponse>> getStoresByUserId(@PathVariable String userId) {
        List<StoreResponse> stores = storeService.getStoresByUserId(userId);
        return ApiResponse.<List<StoreResponse>>builder()
                .result(stores)
                .message("Stores for user retrieved successfully")
                .build();
    }
    
    @PostMapping
    public ApiResponse<StoreResponse> createStore(@RequestBody @Valid StoreCreationRequest request) {
        StoreResponse createdStore = storeService.createStore(request);
        return ApiResponse.<StoreResponse>builder()
                .result(createdStore)
                .message("Store created successfully")
                .build();
    }
    
    @PutMapping("/{id}")
    public ApiResponse<StoreResponse> updateStore(
            @PathVariable String id, 
            @RequestBody @Valid StoreUpdateRequest request) {
        StoreResponse updatedStore = storeService.updateStore(id, request);
        return ApiResponse.<StoreResponse>builder()
                .result(updatedStore)
                .message("Store updated successfully")
                .build();
    }
    
    @PatchMapping("/{id}/status")
    public ApiResponse<StoreResponse> updateStoreStatus(
            @PathVariable String id, 
            @RequestBody @Valid StoreStatusUpdateRequest request) {
        StoreResponse updatedStore = storeService.updateStoreStatus(id, request);
        return ApiResponse.<StoreResponse>builder()
                .result(updatedStore)
                .message("Store status updated successfully")
                .build();
    }
    
    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteStore(@PathVariable String id) {
        storeService.deleteStore(id);
        return ApiResponse.<Void>builder()
                .message("Store deleted successfully")
                .build();
    }
} 
package nlu.com.api_post.service;

import java.util.List;

import nlu.com.api_post.model.dto.request.StoreCreationRequest;
import nlu.com.api_post.model.dto.request.StoreStatusUpdateRequest;
import nlu.com.api_post.model.dto.request.StoreUpdateRequest;
import nlu.com.api_post.model.dto.response.StoreResponse;

public interface StoreService {
    StoreResponse createStore(StoreCreationRequest request);
    
    List<StoreResponse> getAllStores();
    
    StoreResponse getStoreById(String id);
    
    List<StoreResponse> getStoresByUserId(String userId);
    
    StoreResponse updateStore(String id, StoreUpdateRequest request);
    
    StoreResponse updateStoreStatus(String id, StoreStatusUpdateRequest request);
    
    void deleteStore(String id);
} 
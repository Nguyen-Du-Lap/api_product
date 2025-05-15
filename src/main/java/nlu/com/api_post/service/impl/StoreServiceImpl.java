package nlu.com.api_post.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import nlu.com.api_post.exception.ResourceNotFoundException;
import nlu.com.api_post.mapper.StoreMapper;
import nlu.com.api_post.model.dto.request.StoreCreationRequest;
import nlu.com.api_post.model.dto.request.StoreStatusUpdateRequest;
import nlu.com.api_post.model.dto.request.StoreUpdateRequest;
import nlu.com.api_post.model.dto.response.StoreResponse;
import nlu.com.api_post.model.entity.Store;
import nlu.com.api_post.model.entity.User;
import nlu.com.api_post.repository.StoreRepository;
import nlu.com.api_post.repository.UserRepository;
import nlu.com.api_post.service.StoreService;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class StoreServiceImpl implements StoreService {
    StoreRepository storeRepository;
    UserRepository userRepository;
    StoreMapper storeMapper;

    @Override
    @Transactional
    public StoreResponse createStore(StoreCreationRequest request) {
        User user = userRepository.findById(request.getUserId())
                .orElseThrow(() -> new ResourceNotFoundException("User not found with ID: " + request.getUserId()));
        
        Store store = storeMapper.toEntity(request, user);
        Store savedStore = storeRepository.save(store);
        
        return storeMapper.toResponse(savedStore);
    }

    @Override
    public List<StoreResponse> getAllStores() {
        return storeRepository.findAll().stream()
                .map(storeMapper::toResponse)
                .collect(Collectors.toList());
    }

    @Override
    public StoreResponse getStoreById(String id) {
        Store store = findStoreById(id);
        return storeMapper.toResponse(store);
    }

    @Override
    public List<StoreResponse> getStoresByUserId(String userId) {
        return storeRepository.findByUserId(userId).stream()
                .map(storeMapper::toResponse)
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public StoreResponse updateStore(String id, StoreUpdateRequest request) {
        Store store = findStoreById(id);
        storeMapper.updateEntity(store, request);
        Store updatedStore = storeRepository.save(store);
        
        return storeMapper.toResponse(updatedStore);
    }

    @Override
    @Transactional
    public StoreResponse updateStoreStatus(String id, StoreStatusUpdateRequest request) {
        Store store = findStoreById(id);
        store.setStatus(request.getStatus());
        Store updatedStore = storeRepository.save(store);
        
        return storeMapper.toResponse(updatedStore);
    }

    @Override
    @Transactional
    public void deleteStore(String id) {
        Store store = findStoreById(id);
        storeRepository.delete(store);
    }
    
    private Store findStoreById(String id) {
        return storeRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Store not found with ID: " + id));
    }
} 
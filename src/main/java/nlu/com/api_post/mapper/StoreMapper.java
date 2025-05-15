package nlu.com.api_post.mapper;

import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import nlu.com.api_post.model.dto.request.StoreCreationRequest;
import nlu.com.api_post.model.dto.request.StoreUpdateRequest;
import nlu.com.api_post.model.dto.response.StoreResponse;
import nlu.com.api_post.model.entity.Store;
import nlu.com.api_post.model.entity.StoreStatus;
import nlu.com.api_post.model.entity.User;

@Component
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class StoreMapper {
    UserMapper userMapper;
    
    public Store toEntity(StoreCreationRequest request, User user) {
        return Store.builder()
                .name(request.getName())
                .description(request.getDescription())
                .logo(request.getLogo())
                .status(StoreStatus.PENDING)
                .createdAt(LocalDateTime.now())
                .user(user)
                .build();
    }
    
    public void updateEntity(Store store, StoreUpdateRequest request) {
        if (request.getName() != null) {
            store.setName(request.getName());
        }
        if (request.getDescription() != null) {
            store.setDescription(request.getDescription());
        }
        if (request.getLogo() != null) {
            store.setLogo(request.getLogo());
        }
    }
    
    public StoreResponse toResponse(Store store) {
        return StoreResponse.builder()
                .id(store.getId())
                .name(store.getName())
                .description(store.getDescription())
                .logo(store.getLogo())
                .status(store.getStatus())
                .createdAt(store.getCreatedAt())
                .user(userMapper.toUserResponse(store.getUser()))
                .build();
    }
} 
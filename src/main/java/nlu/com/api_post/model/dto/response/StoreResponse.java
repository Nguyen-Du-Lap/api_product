package nlu.com.api_post.model.dto.response;

import java.time.LocalDateTime;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import nlu.com.api_post.model.entity.StoreStatus;

@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class StoreResponse {
    String id;
    String name;
    String description;
    String logo;
    StoreStatus status;
    LocalDateTime createdAt;
    UserResponse user;
} 
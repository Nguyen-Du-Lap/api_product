package nlu.com.api_post.model.dto.request;

import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import nlu.com.api_post.model.entity.StoreStatus;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class StoreStatusUpdateRequest {
    @NotNull(message = "Status is required")
    StoreStatus status;
} 
package nlu.com.api_post.model.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class StoreCreationRequest {
    @NotBlank(message = "Store name is required")
    String name;
    
    String description;
    
    String logo;
    
    @NotBlank(message = "User ID is required")
    String userId;
} 
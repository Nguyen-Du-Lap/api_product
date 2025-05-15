package nlu.com.api_post.model.dto.request;

import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class StoreUpdateRequest {
    String name;
    String description;
    String logo;
} 
package nlu.com.api_post.model.dto.response;

import lombok.Data;
import lombok.Builder;

import java.time.LocalDateTime;

@Data
@Builder
public class ProductImageResponse {
    private String id;
    private String imageUrl;
    private boolean isPrimary;
    private LocalDateTime createdAt;
} 
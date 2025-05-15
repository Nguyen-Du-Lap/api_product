package nlu.com.api_post.model.dto.response;

import lombok.Data;
import lombok.Builder;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Set;

@Data
@Builder
public class ProductResponse {
    private String id;
    private String name;
    private String description;
    private BigDecimal price;
    private Integer stock;
    private String storeId;
    private String storeName;
    private String categoryId;
    private String categoryName;
    private String brandId;
    private String brandName;
    private Set<ProductImageResponse> images;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
} 
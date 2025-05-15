package nlu.com.api_post.mapper;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import nlu.com.api_post.model.dto.request.ProductCreationRequest;
import nlu.com.api_post.model.dto.request.ProductUpdateRequest;
import nlu.com.api_post.model.dto.response.ProductResponse;
import nlu.com.api_post.model.dto.response.ProductImageResponse;
import nlu.com.api_post.model.entity.Product;
import nlu.com.api_post.model.entity.Store;
import nlu.com.api_post.model.entity.Category;
import nlu.com.api_post.model.entity.Brand;
import nlu.com.api_post.model.entity.ProductImage;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProductMapper {
    
    public Product toEntity(ProductCreationRequest request, Store store, Category category, Brand brand) {
        return Product.builder()
                .name(request.getName())
                .description(request.getDescription())
                .price(request.getPrice())
                .stock(request.getStock())
                .store(store)
                .category(category)
                .brand(brand)
                .createdAt(LocalDateTime.now())
                .build();
    }
    
    public void updateEntity(Product product, ProductUpdateRequest request, Category category, Brand brand) {
        if (request.getName() != null) {
            product.setName(request.getName());
        }
        if (request.getDescription() != null) {
            product.setDescription(request.getDescription());
        }
        if (request.getPrice() != null) {
            product.setPrice(request.getPrice());
        }
        if (request.getStock() != null) {
            product.setStock(request.getStock());
        }
        if (category != null) {
            product.setCategory(category);
        }
        if (brand != null) {
            product.setBrand(brand);
        }
    }
    
    public ProductResponse toResponse(Product product) {
        return ProductResponse.builder()
                .id(product.getId())
                .name(product.getName())
                .description(product.getDescription())
                .price(product.getPrice())
                .stock(product.getStock())
                .storeId(product.getStore().getId())
                .storeName(product.getStore().getName())
                .categoryId(product.getCategory() != null ? product.getCategory().getId() : null)
                .categoryName(product.getCategory() != null ? product.getCategory().getName() : null)
                .brandId(product.getBrand() != null ? product.getBrand().getId() : null)
                .brandName(product.getBrand() != null ? product.getBrand().getName() : null)
                .images(product.getImages() != null ? 
                    product.getImages().stream()
                        .map(this::toImageResponse)
                        .collect(Collectors.toSet()) : null)
                .createdAt(product.getCreatedAt())
                .build();
    }

    private ProductImageResponse toImageResponse(ProductImage image) {
        return ProductImageResponse.builder()
                .id(image.getId())
                .imageUrl(image.getImageUrl())
                .isPrimary(image.isPrimary())
                .createdAt(image.getCreatedAt())
                .build();
    }
} 
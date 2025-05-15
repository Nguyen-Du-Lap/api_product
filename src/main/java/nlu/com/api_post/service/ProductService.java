package nlu.com.api_post.service;

import nlu.com.api_post.model.dto.request.ProductCreationRequest;
import nlu.com.api_post.model.dto.request.ProductStockUpdateRequest;
import nlu.com.api_post.model.dto.request.ProductUpdateRequest;
import nlu.com.api_post.model.dto.response.ProductResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.math.BigDecimal;

public interface ProductService {
    Page<ProductResponse> getAllProducts(String name, BigDecimal minPrice, BigDecimal maxPrice,
                                       String storeId, String categoryId, String brandId, Pageable pageable);
    
    ProductResponse getProductById(String id);
    
    Page<ProductResponse> getProductsByStoreId(String storeId, Pageable pageable);
    
    Page<ProductResponse> getProductsByCategoryId(String categoryId, Pageable pageable);
    
    Page<ProductResponse> getProductsByBrandId(String brandId, Pageable pageable);
    
    ProductResponse createProduct(ProductCreationRequest request);
    
    ProductResponse updateProduct(String id, ProductUpdateRequest request);
    
    ProductResponse updateProductStock(String id, ProductStockUpdateRequest request);
    
    void deleteProduct(String id);
} 
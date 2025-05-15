package nlu.com.api_post.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import nlu.com.api_post.model.dto.request.ProductCreationRequest;
import nlu.com.api_post.model.dto.request.ProductStockUpdateRequest;
import nlu.com.api_post.model.dto.request.ProductUpdateRequest;
import nlu.com.api_post.model.dto.response.ApiResponse;
import nlu.com.api_post.model.dto.response.ProductResponse;
import nlu.com.api_post.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;

@RestController
@RequestMapping("/products")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
@Slf4j
public class ProductController {

    ProductService productService;

    @GetMapping
    public ApiResponse<Page<ProductResponse>> getAllProducts(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) BigDecimal minPrice,
            @RequestParam(required = false) BigDecimal maxPrice,
            @RequestParam(required = false) String storeId,
            @RequestParam(required = false) String categoryId,
            @RequestParam(required = false) String brandId,
            @PageableDefault(page = 0, size = 10, sort = "name", direction = Sort.Direction.ASC) Pageable pageable) {
        Page<ProductResponse> products = productService.getAllProducts(name, minPrice, maxPrice, storeId, categoryId, brandId, pageable);
        return ApiResponse.<Page<ProductResponse>>builder()
                .result(products)
                .message("List of products")
                .build();
    }

    @GetMapping("/{id}")
    public ApiResponse<ProductResponse> getProductById(@PathVariable String id) {
        ProductResponse product = productService.getProductById(id);
        return ApiResponse.<ProductResponse>builder()
                .result(product)
                .message("Product retrieved successfully")
                .build();
    }

    @GetMapping("/store/{storeId}")
    public ApiResponse<Page<ProductResponse>> getProductsByStoreId(
            @PathVariable String storeId,
            @PageableDefault(page = 0, size = 10, sort = "name", direction = Sort.Direction.ASC) Pageable pageable) {
        Page<ProductResponse> products = productService.getProductsByStoreId(storeId, pageable);
        return ApiResponse.<Page<ProductResponse>>builder()
                .result(products)
                .message("Products for store retrieved successfully")
                .build();
    }

    @GetMapping("/category/{categoryId}")
    public ApiResponse<Page<ProductResponse>> getProductsByCategoryId(
            @PathVariable String categoryId,
            @PageableDefault(page = 0, size = 10, sort = "name", direction = Sort.Direction.ASC) Pageable pageable) {
        Page<ProductResponse> products = productService.getProductsByCategoryId(categoryId, pageable);
        return ApiResponse.<Page<ProductResponse>>builder()
                .result(products)
                .message("Products for category retrieved successfully")
                .build();
    }

    @GetMapping("/brand/{brandId}")
    public ApiResponse<Page<ProductResponse>> getProductsByBrandId(
            @PathVariable String brandId,
            @PageableDefault(page = 0, size = 10, sort = "name", direction = Sort.Direction.ASC) Pageable pageable) {
        Page<ProductResponse> products = productService.getProductsByBrandId(brandId, pageable);
        return ApiResponse.<Page<ProductResponse>>builder()
                .result(products)
                .message("Products for brand retrieved successfully")
                .build();
    }

    @PostMapping
    public ApiResponse<ProductResponse> createProduct(@RequestBody @Valid ProductCreationRequest request) {
        ProductResponse createdProduct = productService.createProduct(request);
        return ApiResponse.<ProductResponse>builder()
                .result(createdProduct)
                .message("Product created successfully")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<ProductResponse> updateProduct(
            @PathVariable String id,
            @RequestBody @Valid ProductUpdateRequest request) {
        ProductResponse updatedProduct = productService.updateProduct(id, request);
        return ApiResponse.<ProductResponse>builder()
                .result(updatedProduct)
                .message("Product updated successfully")
                .build();
    }

    @PatchMapping("/{id}/stock")
    public ApiResponse<ProductResponse> updateProductStock(
            @PathVariable String id,
            @RequestBody @Valid ProductStockUpdateRequest request) {
        ProductResponse updatedProduct = productService.updateProductStock(id, request);
        return ApiResponse.<ProductResponse>builder()
                .result(updatedProduct)
                .message("Product stock updated successfully")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteProduct(@PathVariable String id) {
        productService.deleteProduct(id);
        return ApiResponse.<Void>builder()
                .message("Product deleted successfully")
                .build();
    }
} 
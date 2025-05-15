package nlu.com.api_post.service.impl;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import nlu.com.api_post.exception.ResourceNotFoundException;
import nlu.com.api_post.mapper.ProductMapper;
import nlu.com.api_post.model.dto.request.ProductCreationRequest;
import nlu.com.api_post.model.dto.request.ProductStockUpdateRequest;
import nlu.com.api_post.model.dto.request.ProductUpdateRequest;
import nlu.com.api_post.model.dto.response.ProductResponse;
import nlu.com.api_post.model.entity.Product;
import nlu.com.api_post.model.entity.Store;
import nlu.com.api_post.model.entity.Category;
import nlu.com.api_post.model.entity.Brand;
import nlu.com.api_post.repository.ProductRepository;
import nlu.com.api_post.repository.StoreRepository;
import nlu.com.api_post.repository.CategoryRepository;
import nlu.com.api_post.repository.BrandRepository;
import nlu.com.api_post.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProductServiceImpl implements ProductService {

    ProductRepository productRepository;
    StoreRepository storeRepository;
    CategoryRepository categoryRepository;
    BrandRepository brandRepository;
    ProductMapper productMapper;

    @Override
    public Page<ProductResponse> getAllProducts(String name, BigDecimal minPrice, BigDecimal maxPrice,
    String storeId, String categoryId, String brandId, Pageable pageable) {
        return productRepository.findAllWithFilters(name, minPrice, maxPrice, storeId, categoryId, brandId, pageable)
                .map(productMapper::toResponse);
    }

    @Override
    public ProductResponse getProductById(String id) {
        Product product = findProductById(id);
        return productMapper.toResponse(product);
    }

    @Override
    public Page<ProductResponse> getProductsByStoreId(String storeId, Pageable pageable) {
        return productRepository.findByStoreId(storeId, pageable)
                .map(productMapper::toResponse);
    }

    @Override
    public Page<ProductResponse> getProductsByCategoryId(String categoryId, Pageable pageable) {
        return productRepository.findByCategoryId(categoryId, pageable)
                .map(productMapper::toResponse);
    }

    @Override
    public Page<ProductResponse> getProductsByBrandId(String brandId, Pageable pageable) {
        return productRepository.findByBrandId(brandId, pageable)
                .map(productMapper::toResponse);
    }

    @Override
    @Transactional
    public ProductResponse createProduct(ProductCreationRequest request) {
        Store store = storeRepository.findById(String.valueOf(request.getStoreId()))
                .orElseThrow(() -> new ResourceNotFoundException("Store not found with ID: " + request.getStoreId()));
        
        Category category = request.getCategoryId() != null ? 
                categoryRepository.findById(request.getCategoryId())
                        .orElseThrow(() -> new ResourceNotFoundException("Category not found with ID: " + request.getCategoryId()))
                : null;
        
        Brand brand = request.getBrandId() != null ?
                brandRepository.findById(request.getBrandId())
                        .orElseThrow(() -> new ResourceNotFoundException("Brand not found with ID: " + request.getBrandId()))
                : null;

        Product product = productMapper.toEntity(request, store, category, brand);
        Product savedProduct = productRepository.save(product);
        
        return productMapper.toResponse(savedProduct);
    }

    @Override
    @Transactional
    public ProductResponse updateProduct(String id, ProductUpdateRequest request) {
        Product product = findProductById(id);
        
        Category category = request.getCategoryId() != null ? 
                categoryRepository.findById(request.getCategoryId())
                        .orElseThrow(() -> new ResourceNotFoundException("Category not found with ID: " + request.getCategoryId()))
                : null;
        
        Brand brand = request.getBrandId() != null ?
                brandRepository.findById(request.getBrandId())
                        .orElseThrow(() -> new ResourceNotFoundException("Brand not found with ID: " + request.getBrandId()))
                : null;

        productMapper.updateEntity(product, request, category, brand);
        Product updatedProduct = productRepository.save(product);
        
        return productMapper.toResponse(updatedProduct);
    }

    @Override
    @Transactional
    public ProductResponse updateProductStock(String id, ProductStockUpdateRequest request) {
        Product product = findProductById(id);
        product.setStock(request.getStock());
        Product updatedProduct = productRepository.save(product);
        
        return productMapper.toResponse(updatedProduct);
    }

    @Override
    @Transactional
    public void deleteProduct(String id) {
        Product product = findProductById(id);
        productRepository.delete(product);
    }

    private Product findProductById(String id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found with ID: " + id));
    }
} 
package nlu.com.api_post.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import nlu.com.api_post.model.entity.Product;

import java.math.BigDecimal;

@Repository
public interface ProductRepository extends JpaRepository<Product, String> {
    Page<Product> findByStoreId(String storeId, Pageable pageable);
    
    Page<Product> findByCategoryId(String categoryId, Pageable pageable);
    
    Page<Product> findByBrandId(String brandId, Pageable pageable);
    
    @Query("SELECT p FROM Product p WHERE " +
           "(:name IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', :name, '%'))) AND " +
           "(:minPrice IS NULL OR p.price >= :minPrice) AND " +
           "(:maxPrice IS NULL OR p.price <= :maxPrice) AND " +
           "(:storeId IS NULL OR p.store.id = :storeId) AND " +
           "(:categoryId IS NULL OR p.category.id = :categoryId) AND " +
           "(:brandId IS NULL OR p.brand.id = :brandId)")
    Page<Product> findAllWithFilters(
        @Param("name") String name,
        @Param("minPrice") BigDecimal minPrice,
        @Param("maxPrice") BigDecimal maxPrice,
        @Param("storeId") String storeId,
        @Param("categoryId") String categoryId,
        @Param("brandId") String brandId,
        Pageable pageable
    );
} 
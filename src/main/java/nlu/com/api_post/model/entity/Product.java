package nlu.com.api_post.model.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Set;

import jakarta.persistence.*;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    
    String name;
    String description;
    BigDecimal price;
    Integer stock;
    
    @Column(name = "created_at")
    LocalDateTime createdAt;
    
    @ManyToOne
    @JoinColumn(name = "category_id")
    Category category;
    
    @ManyToOne
    @JoinColumn(name = "store_id")
    Store store;
    
    @ManyToOne
    @JoinColumn(name = "brand_id")
    Brand brand;
    
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    Set<ProductImage> images;
    
    @OneToMany(mappedBy = "product")
    Set<OrderItem> orderItems;
    
    @OneToMany(mappedBy = "product")
    Set<CartItem> cartItems;
    
    @OneToMany(mappedBy = "product")
    Set<Review> reviews;
} 
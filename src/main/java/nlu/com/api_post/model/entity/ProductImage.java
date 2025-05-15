package nlu.com.api_post.model.entity;

import java.time.LocalDateTime;

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
@Table(name = "product_images")
public class ProductImage {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    
    @Column(name = "image_url")
    String imageUrl;
    
    @Column(name = "is_primary")
    boolean isPrimary;
    
    @Column(name = "created_at")
    LocalDateTime createdAt;
    
    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    Product product;
} 
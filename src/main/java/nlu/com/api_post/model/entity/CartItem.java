package nlu.com.api_post.model.entity;

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
@Table(name = "cart_items")
public class CartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    
    Integer quantity;
    
    @ManyToOne
    @JoinColumn(name = "cart_id")
    Cart cart;
    
    @ManyToOne
    @JoinColumn(name = "product_id")
    Product product;
} 
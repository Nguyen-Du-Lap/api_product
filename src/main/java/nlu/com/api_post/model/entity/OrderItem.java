package nlu.com.api_post.model.entity;

import java.math.BigDecimal;

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
@Table(name = "order_items")
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    
    Integer quantity;
    BigDecimal price;
    
    @ManyToOne
    @JoinColumn(name = "order_id")
    Order order;
    
    @ManyToOne
    @JoinColumn(name = "product_id")
    Product product;
} 
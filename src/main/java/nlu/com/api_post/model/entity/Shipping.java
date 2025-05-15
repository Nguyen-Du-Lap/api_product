package nlu.com.api_post.model.entity;

import java.math.BigDecimal;
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
@Table(name = "shipping")
public class Shipping {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    
    String address;
    
    @Column(name = "shipping_method")
    String shippingMethod;
    
    @Column(name = "shipping_cost")
    BigDecimal shippingCost;
    
    @Column(name = "delivered_at")
    LocalDateTime deliveredAt;
    
    @OneToOne
    @JoinColumn(name = "order_id")
    Order order;
} 
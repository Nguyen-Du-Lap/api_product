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
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    
    @Column(name = "total_price")
    BigDecimal totalPrice;
    
    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending'")
    OrderStatus status;
    
    @Column(name = "created_at")
    LocalDateTime createdAt;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    User user;
    
    @OneToMany(mappedBy = "order")
    Set<OrderItem> orderItems;
    
    @OneToOne(mappedBy = "order")
    Shipping shipping;
} 
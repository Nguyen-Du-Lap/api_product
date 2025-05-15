package nlu.com.api_post.model.entity;

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
@Table(name = "carts")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    
    @Column(name = "created_at")
    LocalDateTime createdAt;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    User user;
    
    @OneToMany(mappedBy = "cart")
    Set<CartItem> cartItems;
} 
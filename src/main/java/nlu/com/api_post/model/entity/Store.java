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
@Table(name = "stores")
public class Store {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    
    String name;
    String description;
    String logo;
    
    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "ENUM('online', 'pending', 'suspended') DEFAULT 'pending'")
    StoreStatus status;
    
    @Column(name = "created_at")
    LocalDateTime createdAt;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    User user;
    
    @OneToMany(mappedBy = "store", fetch = FetchType.LAZY)
    Set<Product> products;
} 
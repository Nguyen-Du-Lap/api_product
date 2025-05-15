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
@Table(name = "categories")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    
    String name;

    String description;
    
    @Column(name = "created_at")
    LocalDateTime createdAt;
    
    @OneToMany(mappedBy = "category")
    Set<Product> products;
} 
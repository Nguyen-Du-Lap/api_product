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
@Table(name = "discounts")
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    
    @Column(unique = true)
    String code;
    
    String description;
    Integer percentage;
    
    @Column(name = "valid_from")
    LocalDateTime validFrom;
    
    @Column(name = "valid_to")
    LocalDateTime validTo;
    
    @Column(name = "created_at")
    LocalDateTime createdAt;
} 
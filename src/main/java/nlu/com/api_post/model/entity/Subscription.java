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
@Table(name = "subscriptions")
public class Subscription {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    
    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "ENUM('active', 'inactive', 'cancelled') DEFAULT 'inactive'")
    SubscriptionStatus status;
    
    @Column(name = "started_at")
    LocalDateTime startedAt;
    
    @Column(name = "ended_at")
    LocalDateTime endedAt;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    User user;
} 
package nlu.com.api_post.model.entity;

import java.time.LocalDate;
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
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;

    @Column(name = "username", unique = true, columnDefinition = "VARCHAR(255) COLLATE utf8mb4_unicode_ci")
    String username;
    String email;
    String password;
    String firstName;
    LocalDate dob;
    String lastName;
    @Column(name = "enabled", columnDefinition = "BOOLEAN DEFAULT TRUE")
    boolean enabled;
    @ManyToMany
    Set<Role> roles;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    Set<Post> posts;
}
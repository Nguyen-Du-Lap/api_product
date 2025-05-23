package nlu.com.api_post.model.dto.request;

import jakarta.validation.constraints.Size;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Data
public class LoginRequest {
    @Size(min = 4, message = "USERNAME_INVALID")
    String username;
    @Size(min = 4, message = "INVALID_PASSWORD")
    String password;
    String recaptchaToken;
}

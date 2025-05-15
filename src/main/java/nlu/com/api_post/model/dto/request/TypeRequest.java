package nlu.com.api_post.model.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TypeRequest {
    @NotBlank(message = "NAME_BLANK_INVALID")
    String name;

    @NotBlank(message = "DESCRIPTION_BLANK_INVALID")
    String description;
}

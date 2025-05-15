package nlu.com.api_post.model.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class CategoryCreationRequest {
    @NotBlank(message = "Category name cannot be blank")
    @Size(min = 2, max = 100, message = "Category name must be between {min} and {max} characters")
    private String name;

    @Size(max = 500, message = "Description cannot exceed {max} characters")
    private String description;
} 
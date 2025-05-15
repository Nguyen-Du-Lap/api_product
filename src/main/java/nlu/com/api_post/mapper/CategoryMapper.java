package nlu.com.api_post.mapper;

import nlu.com.api_post.model.dto.request.CategoryCreationRequest;
import nlu.com.api_post.model.dto.request.CategoryUpdateRequest;
import nlu.com.api_post.model.dto.response.CategoryResponse;
import nlu.com.api_post.model.entity.Category;
import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface CategoryMapper {
    Category toEntity(CategoryCreationRequest request);
    void updateEntity(@MappingTarget Category category, CategoryUpdateRequest request);
    CategoryResponse toResponse(Category category);
} 
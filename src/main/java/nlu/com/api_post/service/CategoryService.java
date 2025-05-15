package nlu.com.api_post.service;

import nlu.com.api_post.model.dto.request.CategoryCreationRequest;
import nlu.com.api_post.model.dto.request.CategoryUpdateRequest;
import nlu.com.api_post.model.dto.response.CategoryResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface CategoryService {
    Page<CategoryResponse> getAllCategories(Pageable pageable);
    CategoryResponse getCategoryById(String id);
    CategoryResponse createCategory(CategoryCreationRequest request);
    CategoryResponse updateCategory(String id, CategoryUpdateRequest request);
    void deleteCategory(String id);
} 
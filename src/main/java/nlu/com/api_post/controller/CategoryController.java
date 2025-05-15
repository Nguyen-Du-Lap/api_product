package nlu.com.api_post.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import nlu.com.api_post.model.dto.request.CategoryCreationRequest;
import nlu.com.api_post.model.dto.request.CategoryUpdateRequest;
import nlu.com.api_post.model.dto.response.ApiResponse;
import nlu.com.api_post.model.dto.response.CategoryResponse;
import nlu.com.api_post.service.CategoryService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/categories")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
@Slf4j
public class CategoryController {

    CategoryService categoryService;

    @GetMapping
    public ApiResponse<Page<CategoryResponse>> getAllCategories(
            @PageableDefault(page = 0, size = 10, sort = "name", direction = Sort.Direction.ASC) Pageable pageable) {
        Page<CategoryResponse> categories = categoryService.getAllCategories(pageable);
        return ApiResponse.<Page<CategoryResponse>>builder()
                .result(categories)
                .message("List of categories")
                .build();
    }

    @GetMapping("/{id}")
    public ApiResponse<CategoryResponse> getCategoryById(@PathVariable String id) {
        CategoryResponse category = categoryService.getCategoryById(id);
        return ApiResponse.<CategoryResponse>builder()
                .result(category)
                .message("Category retrieved successfully")
                .build();
    }

    @PostMapping
    public ApiResponse<CategoryResponse> createCategory(@RequestBody @Valid CategoryCreationRequest request) {
        CategoryResponse createdCategory = categoryService.createCategory(request);
        return ApiResponse.<CategoryResponse>builder()
                .result(createdCategory)
                .message("Category created successfully")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<CategoryResponse> updateCategory(
            @PathVariable String id,
            @RequestBody @Valid CategoryUpdateRequest request) {
        CategoryResponse updatedCategory = categoryService.updateCategory(id, request);
        return ApiResponse.<CategoryResponse>builder()
                .result(updatedCategory)
                .message("Category updated successfully")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteCategory(@PathVariable String id) {
        categoryService.deleteCategory(id);
        return ApiResponse.<Void>builder()
                .message("Category deleted successfully")
                .build();
    }
} 
package nlu.com.api_post.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import nlu.com.api_post.model.dto.request.BrandCreationRequest;
import nlu.com.api_post.model.dto.request.BrandUpdateRequest;
import nlu.com.api_post.model.dto.response.ApiResponse;
import nlu.com.api_post.model.dto.response.BrandResponse;
import nlu.com.api_post.service.BrandService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/brands")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
@Slf4j
public class BrandController {

    BrandService brandService;

    @GetMapping
    public ApiResponse<Page<BrandResponse>> getAllBrands(
            @PageableDefault(page = 0, size = 10, sort = "name", direction = Sort.Direction.ASC) Pageable pageable) {
        Page<BrandResponse> brands = brandService.getAllBrands(pageable);
        return ApiResponse.<Page<BrandResponse>>builder()
                .result(brands)
                .message("List of brands")
                .build();
    }

    @GetMapping("/{id}")
    public ApiResponse<BrandResponse> getBrandById(@PathVariable String id) {
        BrandResponse brand = brandService.getBrandById(id);
        return ApiResponse.<BrandResponse>builder()
                .result(brand)
                .message("Brand retrieved successfully")
                .build();
    }

    @PostMapping
    public ApiResponse<BrandResponse> createBrand(@RequestBody @Valid BrandCreationRequest request) {
        BrandResponse createdBrand = brandService.createBrand(request);
        return ApiResponse.<BrandResponse>builder()
                .result(createdBrand)
                .message("Brand created successfully")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<BrandResponse> updateBrand(
            @PathVariable String id,
            @RequestBody @Valid BrandUpdateRequest request) {
        BrandResponse updatedBrand = brandService.updateBrand(id, request);
        return ApiResponse.<BrandResponse>builder()
                .result(updatedBrand)
                .message("Brand updated successfully")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteBrand(@PathVariable String id) {
        brandService.deleteBrand(id);
        return ApiResponse.<Void>builder()
                .message("Brand deleted successfully")
                .build();
    }
} 
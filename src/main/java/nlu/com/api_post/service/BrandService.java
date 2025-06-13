package nlu.com.api_post.service;

import nlu.com.api_post.model.dto.request.BrandCreationRequest;
import nlu.com.api_post.model.dto.request.BrandUpdateRequest;
import nlu.com.api_post.model.dto.response.BrandResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface BrandService {
    Page<BrandResponse> getAllBrands(Pageable pageable);
    BrandResponse getBrandById(String id);
    BrandResponse createBrand(BrandCreationRequest request);
    BrandResponse updateBrand(String id, BrandUpdateRequest request);
    void deleteBrand(String id);
}
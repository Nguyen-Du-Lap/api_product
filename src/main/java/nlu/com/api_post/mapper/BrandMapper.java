package nlu.com.api_post.mapper;

import nlu.com.api_post.model.dto.request.BrandCreationRequest;
import nlu.com.api_post.model.dto.request.BrandUpdateRequest;
import nlu.com.api_post.model.dto.response.BrandResponse;
import nlu.com.api_post.model.entity.Brand;
import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface BrandMapper {
    Brand toEntity(BrandCreationRequest request);
    void updateEntity(@MappingTarget Brand brand, BrandUpdateRequest request);
    BrandResponse toResponse(Brand brand);
}
package nlu.com.api_post.model.dto.response;

import lombok.Data;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Builder;

@Data
@Builder
public class RecaptchaResponse {
    private boolean success;
    @JsonProperty("error-codes")
    private List<String> errorCodes;
} 
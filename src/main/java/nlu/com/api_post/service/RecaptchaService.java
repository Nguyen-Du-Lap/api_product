package nlu.com.api_post.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;
import nlu.com.api_post.model.dto.response.RecaptchaResponse;

@Slf4j
@Service
public class RecaptchaService {
    @Value("${recaptcha.secret}")
    private String recaptchaSecret;

    @Value("${recaptcha.url}")
    private String recaptchaUrl;

    public boolean verifyToken(String token) {
        RestTemplate restTemplate = new RestTemplate();
    
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    
        MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
        map.add("secret", recaptchaSecret);
        map.add("response", token);
    
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);
    
        ResponseEntity<RecaptchaResponse> response =
            restTemplate.postForEntity(recaptchaUrl, request, RecaptchaResponse.class);
    
        return response.getBody() != null && response.getBody().isSuccess();
    }
}

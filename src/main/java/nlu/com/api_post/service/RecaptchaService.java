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

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import nlu.com.api_post.model.dto.response.RecaptchaResponse;
import nlu.com.api_post.repository.httpClient.RecaptchaClient;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RecaptchaService {

    @NonFinal
    @Value("${recaptcha.secret}")
    String recaptchaSecret;

    RecaptchaClient recaptchaClient;

    public boolean verifyToken(String token) {
        RecaptchaResponse response = recaptchaClient.verify(recaptchaSecret, token);
    
        return response.success();
    }
}

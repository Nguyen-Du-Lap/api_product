package nlu.com.api_post.repository.httpClient;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nlu.com.api_post.model.dto.response.RecaptchaResponse;

@FeignClient(name = "recaptchaClient", url = "${recaptcha.url}")
public interface RecaptchaClient {

    @PostMapping("/siteverify")
    RecaptchaResponse verify(@RequestParam("secret") String secret, @RequestParam("response") String response);
}

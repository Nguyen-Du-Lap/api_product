package nlu.com.api_post;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.servers.Server;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@OpenAPIDefinition(
    servers = {
        @Server(url = "/api", description = "Default Server URL")
    }
)
@SpringBootApplication
public class ApiPostApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiPostApplication.class, args);
	}

}

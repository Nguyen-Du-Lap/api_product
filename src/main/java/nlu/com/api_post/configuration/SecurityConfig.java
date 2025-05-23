package nlu.com.api_post.configuration;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.oauth2.server.resource.authentication.JwtGrantedAuthoritiesConverter;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {
        private static final String[] PUBLIC_ENDPOINTS = {
                        "/users", "/auth/token", "/auth/introspect", "/auth/logout", "/auth/refresh", "/auth/login",
                        "/v3/api-docs/**", "/swagger-ui/**", "/swagger-ui.html"
        };

        private static final String[] PUBLIC_GET_ENDPOINTS = {
                        "/posts/**",
                        "/v3/api-docs/**",
                        "/swagger-ui/**",
                        "/swagger-ui.html",
                        "/categories/**",
                        "/products/**",
        };

        @Autowired
        CustomJwtDecoder customJwtDecoder;

        @Bean
        public SecurityFilterChain filterChain(HttpSecurity httpSecurity,
                        JwtAuthenticationConverter getJwtAuthenticationConverter) throws Exception {

                httpSecurity.csrf(csrf -> csrf.disable())
                                .cors(cors -> cors.configurationSource(request -> {
                                        CorsConfiguration configuration = new CorsConfiguration();
                                        configuration.setAllowedOrigins(List.of("*"));
                                        configuration.setAllowedMethods(
                                                        List.of("GET", "POST", "PUT", "DELETE", "PATCH"));
                                        configuration.setAllowedHeaders(List.of("*"));
                                        return configuration;
                                }));
                                
                httpSecurity.authorizeHttpRequests(request -> request
                                .requestMatchers(HttpMethod.POST, PUBLIC_ENDPOINTS).permitAll()
                                .requestMatchers(HttpMethod.GET, PUBLIC_GET_ENDPOINTS).permitAll()
                                .anyRequest()
                                .authenticated());

                httpSecurity.oauth2ResourceServer(oauth2 -> oauth2.jwt(jwtConfigurer -> jwtConfigurer
                                .decoder(customJwtDecoder)
                                .jwtAuthenticationConverter(jwtAuthenticationConverter()))
                                .authenticationEntryPoint(new JwtAuthenticationEntryPoint()));

                return httpSecurity.build();
        }

        // Converter authorities
        @Bean
        JwtAuthenticationConverter jwtAuthenticationConverter() {
                JwtGrantedAuthoritiesConverter jwtGrantedAuthoritiesConverter = new JwtGrantedAuthoritiesConverter();
                jwtGrantedAuthoritiesConverter.setAuthorityPrefix("");

                JwtAuthenticationConverter jwtAuthenticationConverter = new JwtAuthenticationConverter();
                jwtAuthenticationConverter.setJwtGrantedAuthoritiesConverter(jwtGrantedAuthoritiesConverter);

                return jwtAuthenticationConverter;
        }

        @Bean
        PasswordEncoder passwordEncoder() {
                return new BCryptPasswordEncoder(10);
        }
}

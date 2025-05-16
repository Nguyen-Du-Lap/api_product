package nlu.com.api_post.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;

@Getter
public enum ErrorCode {
    UNCATEGORIZED_EXCEPTION(9999, "Uncategorized error", HttpStatus.INTERNAL_SERVER_ERROR),
    INVALID_KEY(1001, "Invalid key", HttpStatus.BAD_REQUEST),
    USER_EXISTED(1002, "User already exists", HttpStatus.BAD_REQUEST),
    USERNAME_INVALID(1003, "Username must be at least {min} characters", HttpStatus.BAD_REQUEST),
    INVALID_PASSWORD(1004, "Password must be at least {min} characters", HttpStatus.BAD_REQUEST),
    USER_NOT_EXISTED(1005, "User not found", HttpStatus.NOT_FOUND),
    UNAUTHENTICATED(1006, "Unauthenticated", HttpStatus.UNAUTHORIZED),
    UNAUTHORIZED(1007, "Permission denied", HttpStatus.FORBIDDEN),
    INVALID_DOB(1008, "Age must be at least {min}", HttpStatus.BAD_REQUEST),
    CANNOT_CREATE_TOKEN(1009, "Token creation failed", HttpStatus.UNAUTHORIZED),
    PATH_NOT_EXISTED(1010, "Path not found", HttpStatus.NOT_FOUND),
    TYPE_NOT_EXISTED(1011, "Type not found", HttpStatus.BAD_REQUEST),
    TITLE_BLANK_INVALID(1012, "Title cannot be blank", HttpStatus.BAD_REQUEST),
    CONTENT_BLANK_INVALID(1013, "Content cannot be blank", HttpStatus.BAD_REQUEST),
    TYPE_BLANK_INVALID(1014, "Type cannot be blank", HttpStatus.BAD_REQUEST),
    TITLE_INVALID(1015, "Title exceeds maximum length", HttpStatus.BAD_REQUEST),
    CONTENT_INVALID(1016, "Content exceeds maximum length", HttpStatus.BAD_REQUEST),
    NAME_BLANK_INVALID(1017, "Name cannot be blank", HttpStatus.BAD_REQUEST),
    DESCRIPTION_BLANK_INVALID(1018, "Description cannot be blank", HttpStatus.BAD_REQUEST),
    DATE_INVALID(1019, "Invalid date format", HttpStatus.BAD_REQUEST),
    POST_NOT_EXISTED(1020, "Post not found", HttpStatus.NOT_FOUND),
    PARAMETER_NOT_CORRECT(1021, "Invalid parameter", HttpStatus.BAD_REQUEST),
    CATEGORY_NOT_FOUND(1022, "Category not found", HttpStatus.NOT_FOUND),
    RECAPTCHA_INVALID(1023, "Recaptcha validation failed", HttpStatus.BAD_REQUEST);

    private final int code;
    private final String message;
    private final HttpStatusCode statusCode;

    ErrorCode(int code, String message, HttpStatusCode statusCode) {
        this.code = code;
        this.message = message;
        this.statusCode = statusCode;
    }
}

# API Product Management System

A Spring Boot-based REST API for managing products, stores, categories, brands, and their relationships.

## Project Structure

```
src/main/java/nlu/com/api_post/
├── controller/         # REST API endpoints
├── service/           # Business logic layer
├── repository/        # Data access layer
├── model/            # Data models
│   ├── entity/       # JPA entities
│   └── dto/          # Data Transfer Objects
│       ├── request/  # Request DTOs
│       └── response/ # Response DTOs
├── mapper/           # Object mapping layer
└── exception/        # Custom exception handling
```

## API Response Structure

### Standard Response Format
All API responses follow a consistent structure using `ApiResponse<T>`:

```json
{
    "code": 1000,          // Response code (1000 for success)
    "message": String,     // Success/error message
    "result": T           // The actual response data (can be null)
}
```

### Response Examples

#### Success Response
```json
{
    "code": 1000,
    "message": "Product retrieved successfully",
    "result": {
        "id": "123e4567-e89b-12d3-a456-426614174000",
        "name": "Product Name",
        "price": 99.99
    }
}
```

#### Error Response
```json
{
    "code": 1020,
    "message": "Post not existed",
    "result": null
}
```

## Error Codes

### HTTP Status Codes
- `200 OK`: Request successful
- `400 Bad Request`: Invalid input data
- `401 Unauthorized`: Authentication required
- `403 Forbidden`: Insufficient permissions
- `404 Not Found`: Resource not found
- `500 Internal Server Error`: Server error

### Error Code Table

| Code | Error Code | Description | HTTP Status |
|------|------------|-------------|-------------|
| 9999 | UNCATEGORIZED_EXCEPTION | Uncategorized error | 500 |
| 1001 | INVALID_KEY | Invalid key | 400 |
| 1002 | USER_EXISTED | User already exists | 400 |
| 1003 | USERNAME_INVALID | Username must be at least {min} characters | 400 |
| 1004 | INVALID_PASSWORD | Password must be at least {min} characters | 400 |
| 1005 | USER_NOT_EXISTED | User not found | 404 |
| 1006 | UNAUTHENTICATED | Unauthenticated | 401 |
| 1007 | UNAUTHORIZED | Permission denied | 403 |
| 1008 | INVALID_DOB | Age must be at least {min} | 400 |
| 1009 | CANNOT_CREATE_TOKEN | Token creation failed | 401 |
| 1010 | PATH_NOT_EXISTED | Path not found | 404 |
| 1011 | TYPE_NOT_EXISTED | Type not found | 400 |
| 1012 | TITLE_BLANK_INVALID | Title cannot be blank | 400 |
| 1013 | CONTENT_BLANK_INVALID | Content cannot be blank | 400 |
| 1014 | TYPE_BLANK_INVALID | Type cannot be blank | 400 |
| 1015 | TITLE_INVALID | Title exceeds maximum length | 400 |
| 1016 | CONTENT_INVALID | Content exceeds maximum length | 400 |
| 1017 | NAME_BLANK_INVALID | Name cannot be blank | 400 |
| 1018 | DESCRIPTION_BLANK_INVALID | Description cannot be blank | 400 |
| 1019 | DATE_INVALID | Invalid date format | 400 |
| 1020 | POST_NOT_EXISTED | Post not found | 404 |
| 1021 | PARAMETER_NOT_CORRECT | Invalid parameter | 400 |

## Core Features

### 1. Product Management
- CRUD operations for products
- Pagination, filtering, and sorting support
- Product image management
- Stock management
- Price management

### 2. Store Management
- Store CRUD operations
- Store status management (online, pending, suspended)
- Store-product relationships

### 3. Category & Brand Management
- Category CRUD operations
- Brand CRUD operations
- Product categorization and branding

### 4. Order Management
- Order creation and tracking
- Order status management
- Order item management

### 5. Cart Management
- Shopping cart operations
- Cart item management

## API Endpoints

### Products
- `GET /products` - Get all products with pagination and filtering
- `GET /products/{id}` - Get product by ID
- `GET /products/store/{storeId}` - Get products by store
- `GET /products/category/{categoryId}` - Get products by category
- `GET /products/brand/{brandId}` - Get products by brand
- `POST /products` - Create new product
- `PUT /products/{id}` - Update product
- `PATCH /products/{id}/stock` - Update product stock
- `DELETE /products/{id}` - Delete product

### Product Images
- `GET /products/{productId}/images` - Get product images
- `GET /products/{productId}/images/primary` - Get primary image
- `POST /products/{productId}/images` - Upload images
- `PATCH /products/images/{imageId}/set-primary` - Set primary image
- `DELETE /products/images/{imageId}` - Delete image

### Stores
- `GET /stores` - Get all stores
- `GET /stores/{id}` - Get store by ID
- `GET /stores/user/{userId}` - Get stores by user
- `POST /stores` - Create store
- `PUT /stores/{id}` - Update store
- `PATCH /stores/{id}/status` - Update store status
- `DELETE /stores/{id}` - Delete store

## Data Models

### Product
- Basic info: id, name, description, price, stock
- Relationships: store, category, brand
- Images: Set of product images
- Timestamps: createdAt, updatedAt

### ProductImage
- id: UUID
- imageUrl: String
- isPrimary: boolean
- product: Many-to-One relationship
- createdAt: timestamp

### Store
- Basic info: id, name, description, logo
- Status: online, pending, suspended
- User relationship
- Products collection

### Category & Brand
- id: UUID
- name: String
- createdAt: timestamp
- Products collection

## Technical Details

### Pagination & Sorting
- Default page size: 10
- Default page number: 0
- Default sort: name (ascending)
- Customizable through Pageable parameter

### Data Transfer Objects (DTOs)
- Request DTOs for input validation
- Response DTOs for data transformation
- Mapper classes for entity-DTO conversion

### Exception Handling
- Custom exceptions for business logic
- ResourceNotFoundException for missing entities
- Validation exceptions for invalid input

### Database Schema
- UUID-based primary keys
- Foreign key constraints
- Cascade operations for related entities
- Timestamp tracking

## Best Practices Implemented
1. Separation of concerns (Controller, Service, Repository)
2. DTO pattern for data transfer
3. Proper exception handling
4. Input validation
5. Pagination and sorting
6. Transaction management
7. Lazy loading for relationships
8. Builder pattern for object creation
9. Lombok for reducing boilerplate
10. Proper documentation

## Dependencies

### Core Dependencies
- **Spring Boot** (3.2.x)
  - Spring Web
  - Spring Data JPA
  - Spring Security
  - Spring Validation

### Database
- **MySQL/PostgreSQL** (8.0+)
- **Hibernate** (6.4.x)
- **Flyway** (for database migrations)

### Utilities
- **Lombok** (1.18.x)
  - Reduces boilerplate code
  - Provides annotations for getters, setters, builders
- **MapStruct** (1.5.x)
  - Object mapping between DTOs and entities
  - Compile-time mapping generation
- **Jackson** (2.16.x)
  - JSON serialization/deserialization
  - Custom serializers for special types

### Validation & Security
- **Jakarta Validation** (3.0.x)
  - Input validation
  - Custom validation annotations
- **Spring Security** (6.2.x)
  - Authentication and authorization
  - JWT token handling

### Testing
- **JUnit 5** (5.10.x)
- **Mockito** (5.8.x)
- **Spring Test**
- **TestContainers** (for integration testing)

### Documentation
- **SpringDoc OpenAPI** (2.3.x)
  - Swagger UI integration
  - API documentation
- **Spring REST Docs** (3.0.x)
  - API documentation generation

### Development Tools
- **Spring Boot DevTools**
  - Hot reload
  - Development utilities
- **Spring Boot Actuator**
  - Application monitoring
  - Health checks
  - Metrics

### Logging
- **SLF4J** (2.0.x)
- **Logback** (1.4.x)
  - Structured logging
  - Log file rotation

### Build Tool
- **Maven** (3.9.x)
  - Dependency management
  - Build lifecycle
  - Plugin management

### Optional Dependencies
- **Redis** (for caching)
- **Elasticsearch** (for search functionality)
- **RabbitMQ** (for message queuing)
- **MinIO** (for file storage)

## Configuration
- Database connection properties
- Server port and context path
- JPA/Hibernate settings
- Logging configuration

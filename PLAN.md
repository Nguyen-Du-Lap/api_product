1.func Stores
- GET /api/stores - Get all stores with pagination and filtering options
- GET /api/stores/{id} - Get store by ID
- GET /api/stores/user/{userId} - Get stores by user ID
- POST /api/stores - Create a new store
- PUT /api/stores/{id} - Update store details
- PATCH /api/stores/{id}/status - Update store status
- DELETE /api/stores/{id} - Delete a store

2.func products
- GET /api/products - Get all products with pagination, filtering, and sorting
- GET /api/products/{id} - Get product by ID
- GET /api/products/store/{storeId} - Get products by store ID
- GET /api/products/category/{categoryId} - Get products by category ID
- GET /api/products/brand/{brandId} - Get products by brand ID
- POST /api/products - Create a new product
- PUT /api/products/{id} - Update product details
- PATCH /api/products/{id}/stock - Update product stock
- DELETE /api/products/{id} - Delete a product

3.func Product Images
- GET /api/products/{productId}/images - Get all images for a product
- GET /api/products/{productId}/images/primary - Get the primary image for a product
- POST /api/products/{productId}/images - Upload new product image(s)
- PATCH /api/products/images/{imageId}/set-primary - Set an image as primary
- DELETE /api/products/images/{imageId} - Delete a product image

4.func Categories
- GET /api/categories - Get all categories
- GET /api/categories/{id} - Get category by ID
- POST /api/categories - Create a new category
- PUT /api/categories/{id} - Update category
- DELETE /api/categories/{id} - Delete a category

5.func Brands
- GET /api/brands - Get all brands
- GET /api/brands/{id} - Get brand by ID
- POST /api/brands - Create a new brand
- PUT /api/brands/{id} - Update brand
- DELETE /api/brands/{id} - Delete a brand

6.func Orders
- GET /api/orders - Get all orders with filtering options
- GET /api/orders/{id} - Get order by ID
- GET /api/orders/user/{userId} - Get orders by user ID
- GET /api/orders/store/{storeId} - Get orders for a specific store
- POST /api/orders - Create a new order
- PATCH /api/orders/{id}/status - Update order status
- DELETE /api/orders/{id} - Cancel/delete an order

7.func Cart
- GET /api/carts/{userId} - Get user's cart
- POST /api/carts/{userId}/items - Add item to cart
- PUT /api/carts/items/{itemId} - Update cart item quantity
- DELETE /api/carts/items/{itemId} - Remove item from cart
- DELETE /api/carts/{userId}/clear - Clear cart

8.func Reviews
- GET /api/products/{productId}/reviews - Get reviews for a product
- POST /api/products/{productId}/reviews - Add a review
- PUT /api/reviews/{id} - Update a review
- DELETE /api/reviews/{id} - Delete a review

9.func Authentication
- POST /api/auth/register - Register a new user
- POST /api/auth/login - User login
- POST /api/auth/logout - User logout
- GET /api/auth/me - Get current user info
- POST /api/auth/refresh-token - Refresh access token

10.func Users
- GET /api/users - Get all users (admin only)
- GET /api/users/{id} - Get user by ID
- PUT /api/users/{id} - Update user profile
- PATCH /api/users/{id}/status - Enable/disable user
- DELETE /api/users/{id} - Delete a user

11.func Store Analytics
- GET /api/stores/{storeId}/analytics/sales - Get sales data
- GET /api/stores/{storeId}/analytics/products - Get product performance
- GET /api/stores/{storeId}/analytics/customers - Get customer data

12.func Discounts
- GET /api/discounts - Get all discounts
- GET /api/discounts/{code} - Get discount by code
- POST /api/discounts - Create a new discount
- PUT /api/discounts/{id} - Update discount
- DELETE /api/discounts/{id} - Delete a discount
- POST /api/orders/{orderId}/apply-discount/{code} - Apply discount to order
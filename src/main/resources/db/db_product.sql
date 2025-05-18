
-- Dumping database structure for db_product
CREATE DATABASE IF NOT EXISTS `db_product` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_product`;

-- Dumping structure for table db_product.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.brands: ~5 rows (approximately)
INSERT INTO `brands` (`id`, `created_at`, `name`) VALUES
	('356626a8-313f-11f0-8e43-e2740ae364af', NULL, 'Apple'),
	('35662b4c-313f-11f0-8e43-e2740ae364af', NULL, 'Samsung'),
	('35662e92-313f-11f0-8e43-e2740ae364af', NULL, 'Sony'),
	('35662f78-313f-11f0-8e43-e2740ae364af', NULL, 'Dell'),
	('35662fed-313f-11f0-8e43-e2740ae364af', NULL, 'Xiaomi');

-- Dumping structure for table db_product.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpay9408fi1tlnkqv3fhetr6hy` (`user_id`),
  CONSTRAINT `FKpay9408fi1tlnkqv3fhetr6hy` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.carts: ~0 rows (approximately)

-- Dumping structure for table db_product.cart_items
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` varchar(255) NOT NULL,
  `quantity` int DEFAULT NULL,
  `cart_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpcttvuq4mxppo8sxggjtn5i2c` (`cart_id`),
  KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`),
  CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKpcttvuq4mxppo8sxggjtn5i2c` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.cart_items: ~0 rows (approximately)

-- Dumping structure for table db_product.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.categories: ~10 rows (approximately)
INSERT INTO `categories` (`id`, `created_at`, `name`, `description`) VALUES
	('2ca272db-313f-11f0-8e43-e2740ae364af', NULL, 'Điện thoại', NULL),
	('2ca27a55-313f-11f0-8e43-e2740ae364af', NULL, 'Laptop', NULL),
	('2ca28153-313f-11f0-8e43-e2740ae364af', NULL, 'Máy tính bảng', NULL),
	('2ca28208-313f-11f0-8e43-e2740ae364af', NULL, 'Tai nghe', NULL),
	('2ca28601-313f-11f0-8e43-e2740ae364af', NULL, 'Loa Bluetooth', NULL),
	('2ca28691-313f-11f0-8e43-e2740ae364af', NULL, 'Phụ kiện máy tính', NULL),
	('2ca2870a-313f-11f0-8e43-e2740ae364af', NULL, 'Đồng hồ thông minh', NULL),
	('2ca2876b-313f-11f0-8e43-e2740ae364af', NULL, 'Camera giám sát', NULL),
	('2ca287cb-313f-11f0-8e43-e2740ae364af', NULL, 'Màn hình máy tính', NULL),
	('2ca28824-313f-11f0-8e43-e2740ae364af', NULL, 'Thiết bị lưu trữ', NULL);

-- Dumping structure for table db_product.discounts
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `percentage` int DEFAULT NULL,
  `valid_from` datetime(6) DEFAULT NULL,
  `valid_to` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKbc29q3wh0lqhy0k84bx3afk08` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.discounts: ~0 rows (approximately)

-- Dumping structure for table db_product.invalidated_token
CREATE TABLE IF NOT EXISTS `invalidated_token` (
  `id` varchar(255) NOT NULL,
  `expiry_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.invalidated_token: ~0 rows (approximately)

-- Dumping structure for table db_product.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `total_price` decimal(38,2) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.orders: ~0 rows (approximately)

-- Dumping structure for table db_product.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` varchar(255) NOT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  KEY `FKocimc7dtr037rh4ls4l95nlfi` (`product_id`),
  CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKocimc7dtr037rh4ls4l95nlfi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.order_items: ~0 rows (approximately)

-- Dumping structure for table db_product.permission
CREATE TABLE IF NOT EXISTS `permission` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.permission: ~0 rows (approximately)

-- Dumping structure for table db_product.post
CREATE TABLE IF NOT EXISTS `post` (
  `id` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `is_approve` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa3895xfgv2gocq57cljf293o6` (`type_name`),
  KEY `FK72mt33dhhs48hf9gcqrq4fxte` (`user_id`),
  CONSTRAINT `FK72mt33dhhs48hf9gcqrq4fxte` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa3895xfgv2gocq57cljf293o6` FOREIGN KEY (`type_name`) REFERENCES `type` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.post: ~0 rows (approximately)

-- Dumping structure for table db_product.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `brand_id` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `store_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa3a4mpsfdf4d2y6r8ra3sc8mv` (`brand_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  KEY `FKgcyffheofvmy2x5l78xam63mc` (`store_id`),
  CONSTRAINT `FKa3a4mpsfdf4d2y6r8ra3sc8mv` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `FKgcyffheofvmy2x5l78xam63mc` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.products: ~20 rows (approximately)
INSERT INTO `products` (`id`, `created_at`, `description`, `name`, `price`, `stock`, `brand_id`, `category_id`, `store_id`) VALUES
	('b7cd24cb-316b-11f0-8e43-e2740ae364af', NULL, 'Điện thoại thông minh Apple chất lượng cao', 'iPhone 1', 2104.26, 32, '356626a8-313f-11f0-8e43-e2740ae364af', '2ca272db-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7d11245-316b-11f0-8e43-e2740ae364af', NULL, 'Điện thoại thông minh Apple chất lượng cao', 'iPhone 2', 9813.59, 13, '356626a8-313f-11f0-8e43-e2740ae364af', '2ca272db-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7d53c9d-316b-11f0-8e43-e2740ae364af', NULL, 'Điện thoại thông minh Apple chất lượng cao', 'iPhone 3', 8519.85, 36, '356626a8-313f-11f0-8e43-e2740ae364af', '2ca272db-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7d97dce-316b-11f0-8e43-e2740ae364af', NULL, 'Điện thoại thông minh Apple chất lượng cao', 'iPhone 4', 4554.87, 20, '356626a8-313f-11f0-8e43-e2740ae364af', '2ca272db-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7dd5639-316b-11f0-8e43-e2740ae364af', NULL, 'Điện thoại thông minh Apple chất lượng cao', 'iPhone 5', 10863.96, 25, '356626a8-313f-11f0-8e43-e2740ae364af', '2ca272db-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7e14737-316b-11f0-8e43-e2740ae364af', NULL, 'Điện thoại Samsung cấu hình mạnh mẽ', 'Samsung Galaxy 6', 6421.39, 50, '35662b4c-313f-11f0-8e43-e2740ae364af', '2ca272db-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7e5442b-316b-11f0-8e43-e2740ae364af', NULL, 'Điện thoại Samsung cấu hình mạnh mẽ', 'Samsung Galaxy 7', 5230.77, 44, '35662b4c-313f-11f0-8e43-e2740ae364af', '2ca272db-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7e8db69-316b-11f0-8e43-e2740ae364af', NULL, 'Điện thoại Samsung cấu hình mạnh mẽ', 'Samsung Galaxy 8', 2592.07, 46, '35662b4c-313f-11f0-8e43-e2740ae364af', '2ca272db-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7ecb940-316b-11f0-8e43-e2740ae364af', NULL, 'Điện thoại Samsung cấu hình mạnh mẽ', 'Samsung Galaxy 9', 3172.41, 53, '35662b4c-313f-11f0-8e43-e2740ae364af', '2ca272db-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7f08653-316b-11f0-8e43-e2740ae364af', NULL, 'Điện thoại Samsung cấu hình mạnh mẽ', 'Samsung Galaxy 10', 7947.24, 53, '35662b4c-313f-11f0-8e43-e2740ae364af', '2ca272db-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7f45181-316b-11f0-8e43-e2740ae364af', NULL, 'Laptop cao cấp đến từ Dell', 'Laptop Dell XPS 11', 3445.78, 41, '35662f78-313f-11f0-8e43-e2740ae364af', '2ca27a55-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7f7d171-316b-11f0-8e43-e2740ae364af', NULL, 'Laptop cao cấp đến từ Dell', 'Laptop Dell XPS 12', 4944.65, 14, '35662f78-313f-11f0-8e43-e2740ae364af', '2ca27a55-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7fb653c-316b-11f0-8e43-e2740ae364af', NULL, 'Laptop cao cấp đến từ Dell', 'Laptop Dell XPS 13', 3936.41, 19, '35662f78-313f-11f0-8e43-e2740ae364af', '2ca27a55-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b7ff0142-316b-11f0-8e43-e2740ae364af', NULL, 'Laptop cao cấp đến từ Dell', 'Laptop Dell XPS 14', 1289.85, 39, '35662f78-313f-11f0-8e43-e2740ae364af', '2ca27a55-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b803574c-316b-11f0-8e43-e2740ae364af', NULL, 'Laptop cao cấp đến từ Dell', 'Laptop Dell XPS 15', 10079.47, 47, '35662f78-313f-11f0-8e43-e2740ae364af', '2ca27a55-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b8076c9f-316b-11f0-8e43-e2740ae364af', NULL, 'Tai nghe chống ồn Sony chất lượng âm thanh tốt', 'Tai nghe Sony WH-16', 10901.25, 46, '35662e92-313f-11f0-8e43-e2740ae364af', '2ca28208-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b80b415e-316b-11f0-8e43-e2740ae364af', NULL, 'Tai nghe chống ồn Sony chất lượng âm thanh tốt', 'Tai nghe Sony WH-17', 7408.59, 11, '35662e92-313f-11f0-8e43-e2740ae364af', '2ca28208-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b80fec86-316b-11f0-8e43-e2740ae364af', NULL, 'Tai nghe chống ồn Sony chất lượng âm thanh tốt', 'Tai nghe Sony WH-18', 3651.86, 20, '35662e92-313f-11f0-8e43-e2740ae364af', '2ca28208-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b814b39d-316b-11f0-8e43-e2740ae364af', NULL, 'Đồng hồ thông minh Xiaomi giá rẻ', 'Smart Watch Xiaomi 19', 3707.99, 45, '35662fed-313f-11f0-8e43-e2740ae364af', '2ca2870a-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8'),
	('b8190ebf-316b-11f0-8e43-e2740ae364af', NULL, 'Đồng hồ thông minh Xiaomi giá rẻ', 'Smart Watch Xiaomi 20', 8585.13, 42, '35662fed-313f-11f0-8e43-e2740ae364af', '2ca2870a-313f-11f0-8e43-e2740ae364af', '4ac30173-d3be-44ba-856f-dc36d61e29a8');

-- Dumping structure for table db_product.product_images
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_primary` bit(1) DEFAULT NULL,
  `product_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`),
  CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.product_images: ~120 rows (approximately)
INSERT INTO `product_images` (`id`, `created_at`, `image_url`, `is_primary`, `product_id`) VALUES
	('b7cdb22c-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7cd24cb-316b-11f0-8e43-e2740ae364af'),
	('b7ce3c0d-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7cd24cb-316b-11f0-8e43-e2740ae364af'),
	('b7cec3f4-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7cd24cb-316b-11f0-8e43-e2740ae364af'),
	('b7cf5570-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7cd24cb-316b-11f0-8e43-e2740ae364af'),
	('b7cfdc03-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7cd24cb-316b-11f0-8e43-e2740ae364af'),
	('b7d093a4-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7cd24cb-316b-11f0-8e43-e2740ae364af'),
	('b7d19e23-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d11245-316b-11f0-8e43-e2740ae364af'),
	('b7d249d5-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d11245-316b-11f0-8e43-e2740ae364af'),
	('b7d2d53a-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d11245-316b-11f0-8e43-e2740ae364af'),
	('b7d392ac-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d11245-316b-11f0-8e43-e2740ae364af'),
	('b7d41ad2-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d11245-316b-11f0-8e43-e2740ae364af'),
	('b7d4a0cc-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d11245-316b-11f0-8e43-e2740ae364af'),
	('b7d5e9ff-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d53c9d-316b-11f0-8e43-e2740ae364af'),
	('b7d66967-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d53c9d-316b-11f0-8e43-e2740ae364af'),
	('b7d6e6a8-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d53c9d-316b-11f0-8e43-e2740ae364af'),
	('b7d77325-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d53c9d-316b-11f0-8e43-e2740ae364af'),
	('b7d81497-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d53c9d-316b-11f0-8e43-e2740ae364af'),
	('b7d89bf8-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d53c9d-316b-11f0-8e43-e2740ae364af'),
	('b7da145a-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d97dce-316b-11f0-8e43-e2740ae364af'),
	('b7dab05a-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d97dce-316b-11f0-8e43-e2740ae364af'),
	('b7db374c-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d97dce-316b-11f0-8e43-e2740ae364af'),
	('b7dbb99b-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d97dce-316b-11f0-8e43-e2740ae364af'),
	('b7dc50ca-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d97dce-316b-11f0-8e43-e2740ae364af'),
	('b7dcd4cd-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7d97dce-316b-11f0-8e43-e2740ae364af'),
	('b7ddfd49-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7dd5639-316b-11f0-8e43-e2740ae364af'),
	('b7de86cf-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7dd5639-316b-11f0-8e43-e2740ae364af'),
	('b7df2454-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7dd5639-316b-11f0-8e43-e2740ae364af'),
	('b7dfa490-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7dd5639-316b-11f0-8e43-e2740ae364af'),
	('b7e02963-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7dd5639-316b-11f0-8e43-e2740ae364af'),
	('b7e0c573-316b-11f0-8e43-e2740ae364af', NULL, 'https://w7.pngwing.com/pngs/450/269/png-transparent-space-gray-iphone-x-showing-ios-and-iphone-4-iphone-8-plus-iphone-5-iphone-x-iphone-apple-gadget-electronics-mobile-phone-thumbnail.png', b'1', 'b7dd5639-316b-11f0-8e43-e2740ae364af'),
	('b7e22d8a-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e14737-316b-11f0-8e43-e2740ae364af'),
	('b7e2a854-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e14737-316b-11f0-8e43-e2740ae364af'),
	('b7e333c4-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e14737-316b-11f0-8e43-e2740ae364af'),
	('b7e3ccbd-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e14737-316b-11f0-8e43-e2740ae364af'),
	('b7e4569f-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e14737-316b-11f0-8e43-e2740ae364af'),
	('b7e4cdf0-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e14737-316b-11f0-8e43-e2740ae364af'),
	('b7e5de49-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e5442b-316b-11f0-8e43-e2740ae364af'),
	('b7e65790-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e5442b-316b-11f0-8e43-e2740ae364af'),
	('b7e6d7c2-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e5442b-316b-11f0-8e43-e2740ae364af'),
	('b7e74e16-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e5442b-316b-11f0-8e43-e2740ae364af'),
	('b7e7cc86-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e5442b-316b-11f0-8e43-e2740ae364af'),
	('b7e85193-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e5442b-316b-11f0-8e43-e2740ae364af'),
	('b7e97297-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e8db69-316b-11f0-8e43-e2740ae364af'),
	('b7ea3097-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e8db69-316b-11f0-8e43-e2740ae364af'),
	('b7eab210-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e8db69-316b-11f0-8e43-e2740ae364af'),
	('b7eb3525-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e8db69-316b-11f0-8e43-e2740ae364af'),
	('b7ebb21a-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e8db69-316b-11f0-8e43-e2740ae364af'),
	('b7ec34f6-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7e8db69-316b-11f0-8e43-e2740ae364af'),
	('b7ed6575-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7ecb940-316b-11f0-8e43-e2740ae364af'),
	('b7edf865-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7ecb940-316b-11f0-8e43-e2740ae364af'),
	('b7ee7ee1-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7ecb940-316b-11f0-8e43-e2740ae364af'),
	('b7eef94d-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7ecb940-316b-11f0-8e43-e2740ae364af'),
	('b7ef78c4-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7ecb940-316b-11f0-8e43-e2740ae364af'),
	('b7f00976-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7ecb940-316b-11f0-8e43-e2740ae364af'),
	('b7f12ab1-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7f08653-316b-11f0-8e43-e2740ae364af'),
	('b7f1a999-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7f08653-316b-11f0-8e43-e2740ae364af'),
	('b7f2597b-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7f08653-316b-11f0-8e43-e2740ae364af'),
	('b7f2db95-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7f08653-316b-11f0-8e43-e2740ae364af'),
	('b7f359a7-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7f08653-316b-11f0-8e43-e2740ae364af'),
	('b7f3d8c4-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1703065477962-80bb1b614fd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Ftc3VuZyUyMGdhbGFyeXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b7f08653-316b-11f0-8e43-e2740ae364af'),
	('b7f4ead7-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f45181-316b-11f0-8e43-e2740ae364af'),
	('b7f566c5-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f45181-316b-11f0-8e43-e2740ae364af'),
	('b7f5e5a8-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f45181-316b-11f0-8e43-e2740ae364af'),
	('b7f66692-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f45181-316b-11f0-8e43-e2740ae364af'),
	('b7f6e1dc-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f45181-316b-11f0-8e43-e2740ae364af'),
	('b7f75d09-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f45181-316b-11f0-8e43-e2740ae364af'),
	('b7f855b9-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f7d171-316b-11f0-8e43-e2740ae364af'),
	('b7f8d095-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f7d171-316b-11f0-8e43-e2740ae364af'),
	('b7f94be4-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f7d171-316b-11f0-8e43-e2740ae364af'),
	('b7f9f6e1-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f7d171-316b-11f0-8e43-e2740ae364af'),
	('b7fa74b8-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f7d171-316b-11f0-8e43-e2740ae364af'),
	('b7faed63-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7f7d171-316b-11f0-8e43-e2740ae364af'),
	('b7fc0c18-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7fb653c-316b-11f0-8e43-e2740ae364af'),
	('b7fc90fe-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7fb653c-316b-11f0-8e43-e2740ae364af'),
	('b7fd0ec8-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7fb653c-316b-11f0-8e43-e2740ae364af'),
	('b7fd8a38-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7fb653c-316b-11f0-8e43-e2740ae364af'),
	('b7fe02ab-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7fb653c-316b-11f0-8e43-e2740ae364af'),
	('b7fe82f8-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7fb653c-316b-11f0-8e43-e2740ae364af'),
	('b7ff8a0d-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7ff0142-316b-11f0-8e43-e2740ae364af'),
	('b8000a63-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7ff0142-316b-11f0-8e43-e2740ae364af'),
	('b8008f47-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7ff0142-316b-11f0-8e43-e2740ae364af'),
	('b8013425-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7ff0142-316b-11f0-8e43-e2740ae364af'),
	('b8022f1f-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7ff0142-316b-11f0-8e43-e2740ae364af'),
	('b802b777-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b7ff0142-316b-11f0-8e43-e2740ae364af'),
	('b8040d8a-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b803574c-316b-11f0-8e43-e2740ae364af'),
	('b804b052-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b803574c-316b-11f0-8e43-e2740ae364af'),
	('b80535fc-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b803574c-316b-11f0-8e43-e2740ae364af'),
	('b805cf37-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b803574c-316b-11f0-8e43-e2740ae364af'),
	('b80656a4-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b803574c-316b-11f0-8e43-e2740ae364af'),
	('b806f395-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1593642633279-1796119d5482?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcCUyMGRlbGx8ZW58MHx8MHx8fDA%3D', b'1', 'b803574c-316b-11f0-8e43-e2740ae364af'),
	('b807f56c-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b8076c9f-316b-11f0-8e43-e2740ae364af'),
	('b8087618-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b8076c9f-316b-11f0-8e43-e2740ae364af'),
	('b808fb90-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b8076c9f-316b-11f0-8e43-e2740ae364af'),
	('b8097bf3-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b8076c9f-316b-11f0-8e43-e2740ae364af'),
	('b80a04c5-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b8076c9f-316b-11f0-8e43-e2740ae364af'),
	('b80ab2c6-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b8076c9f-316b-11f0-8e43-e2740ae364af'),
	('b80beea7-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80b415e-316b-11f0-8e43-e2740ae364af'),
	('b80c6d75-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80b415e-316b-11f0-8e43-e2740ae364af'),
	('b80ce6e3-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80b415e-316b-11f0-8e43-e2740ae364af'),
	('b80d6554-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80b415e-316b-11f0-8e43-e2740ae364af'),
	('b80dedd5-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80b415e-316b-11f0-8e43-e2740ae364af'),
	('b80e73ea-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80b415e-316b-11f0-8e43-e2740ae364af'),
	('b81096ec-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80fec86-316b-11f0-8e43-e2740ae364af'),
	('b81139fe-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80fec86-316b-11f0-8e43-e2740ae364af'),
	('b811b60e-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80fec86-316b-11f0-8e43-e2740ae364af'),
	('b81230a9-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80fec86-316b-11f0-8e43-e2740ae364af'),
	('b812b03b-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80fec86-316b-11f0-8e43-e2740ae364af'),
	('b8141cf5-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1693841114868-db5888a8bc37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGhlYWQlMjBwaG9uZSUyMHNvbnl8ZW58MHx8MHx8fDA%3D', b'1', 'b80fec86-316b-11f0-8e43-e2740ae364af'),
	('b81553f3-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b814b39d-316b-11f0-8e43-e2740ae364af'),
	('b815d788-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b814b39d-316b-11f0-8e43-e2740ae364af'),
	('b816e83a-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b814b39d-316b-11f0-8e43-e2740ae364af'),
	('b81763e7-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b814b39d-316b-11f0-8e43-e2740ae364af'),
	('b817efe0-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b814b39d-316b-11f0-8e43-e2740ae364af'),
	('b818892d-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b814b39d-316b-11f0-8e43-e2740ae364af'),
	('b819ba68-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b8190ebf-316b-11f0-8e43-e2740ae364af'),
	('b81a383b-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b8190ebf-316b-11f0-8e43-e2740ae364af'),
	('b81aba25-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b8190ebf-316b-11f0-8e43-e2740ae364af'),
	('b81b36fe-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b8190ebf-316b-11f0-8e43-e2740ae364af'),
	('b81bc58f-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b8190ebf-316b-11f0-8e43-e2740ae364af'),
	('b81c6fab-316b-11f0-8e43-e2740ae364af', NULL, 'https://images.unsplash.com/photo-1682258634152-170a536a8185?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c21hcnQlMjB3YXRjaCUyMHhpYW9taXxlbnwwfHwwfHx8MA%3D%3D', b'1', 'b8190ebf-316b-11f0-8e43-e2740ae364af');

-- Dumping structure for table db_product.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` varchar(255) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpl51cejpw4gy5swfar8br9ngi` (`product_id`),
  KEY `FKsdlcf7wf8l1k0m00gik0m6b1m` (`user_id`),
  CONSTRAINT `FKpl51cejpw4gy5swfar8br9ngi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKsdlcf7wf8l1k0m00gik0m6b1m` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.reviews: ~0 rows (approximately)

-- Dumping structure for table db_product.role
CREATE TABLE IF NOT EXISTS `role` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.role: ~2 rows (approximately)
INSERT INTO `role` (`name`, `description`) VALUES
	('ADMIN', 'Admin role'),
	('USER', 'User role');

-- Dumping structure for table db_product.role_permissions
CREATE TABLE IF NOT EXISTS `role_permissions` (
  `role_name` varchar(255) NOT NULL,
  `permissions_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_name`,`permissions_name`),
  KEY `FKf5aljih4mxtdgalvr7xvngfn1` (`permissions_name`),
  CONSTRAINT `FKcppvu8fk24eqqn6q4hws7ajux` FOREIGN KEY (`role_name`) REFERENCES `role` (`name`),
  CONSTRAINT `FKf5aljih4mxtdgalvr7xvngfn1` FOREIGN KEY (`permissions_name`) REFERENCES `permission` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.role_permissions: ~0 rows (approximately)

-- Dumping structure for procedure db_product.seed_products
DELIMITER //
CREATE PROCEDURE `seed_products`()
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE j INT;
  DECLARE p_name VARCHAR(255);
  DECLARE p_desc TEXT;
  DECLARE p_cat_id VARCHAR(36);
  DECLARE p_brand_id VARCHAR(36);
  DECLARE p_store_id VARCHAR(36);
  DECLARE pid VARCHAR(36);
  DECLARE img_url_base TEXT;

  WHILE i <= 20 DO
    SET pid = UUID();

    CASE
      WHEN i <= 5 THEN
        SET p_name = CONCAT('iPhone ', i);
        SET p_desc = 'Điện thoại thông minh Apple chất lượng cao';
        SET p_cat_id = (SELECT id FROM categories WHERE name = 'Điện thoại' LIMIT 1);
        SET p_brand_id = (SELECT id FROM brands WHERE name = 'Apple' LIMIT 1);
      WHEN i <= 10 THEN
        SET p_name = CONCAT('Samsung Galaxy ', i);
        SET p_desc = 'Điện thoại Samsung cấu hình mạnh mẽ';
        SET p_cat_id = (SELECT id FROM categories WHERE name = 'Điện thoại' LIMIT 1);
        SET p_brand_id = (SELECT id FROM brands WHERE name = 'Samsung' LIMIT 1);
      WHEN i <= 15 THEN
        SET p_name = CONCAT('Laptop Dell XPS ', i);
        SET p_desc = 'Laptop cao cấp đến từ Dell';
        SET p_cat_id = (SELECT id FROM categories WHERE name = 'Laptop' LIMIT 1);
        SET p_brand_id = (SELECT id FROM brands WHERE name = 'Dell' LIMIT 1);
      WHEN i <= 18 THEN
        SET p_name = CONCAT('Tai nghe Sony WH-', i);
        SET p_desc = 'Tai nghe chống ồn Sony chất lượng âm thanh tốt';
        SET p_cat_id = (SELECT id FROM categories WHERE name = 'Tai nghe' LIMIT 1);
        SET p_brand_id = (SELECT id FROM brands WHERE name = 'Sony' LIMIT 1);
      ELSE
        SET p_name = CONCAT('Smart Watch Xiaomi ', i);
        SET p_desc = 'Đồng hồ thông minh Xiaomi giá rẻ';
        SET p_cat_id = (SELECT id FROM categories WHERE name = 'Đồng hồ thông minh' LIMIT 1);
        SET p_brand_id = (SELECT id FROM brands WHERE name = 'Xiaomi' LIMIT 1);
    END CASE;

    SET p_store_id = (SELECT id FROM stores LIMIT 1);

    INSERT INTO products (id, name, description, price, stock, category_id, store_id, brand_id)
    VALUES (pid, p_name, p_desc, ROUND(RAND() * 10000 + 1000, 2), FLOOR(RAND() * 50 + 10), p_cat_id, p_store_id, p_brand_id);

    SET img_url_base = REPLACE(p_name, ' ', '_');
    SET j = 1;

    WHILE j <= 6 DO
      INSERT INTO product_images (id, product_id, image_url, is_primary)
      VALUES (UUID(), pid, CONCAT('https://example.com/images/', img_url_base, '_', j, '.jpg'), IF(j = 1, TRUE, FALSE));
      SET j = j + 1;
    END WHILE;

    SET i = i + 1;
  END WHILE;
END//
DELIMITER ;

-- Dumping structure for table db_product.shipping
CREATE TABLE IF NOT EXISTS `shipping` (
  `id` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `delivered_at` datetime(6) DEFAULT NULL,
  `shipping_cost` decimal(38,2) DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK5tqgqx54jwxmib2c1f49l677a` (`order_id`),
  CONSTRAINT `FK2umyblvwmvm2ju0be634j89x4` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.shipping: ~0 rows (approximately)

-- Dumping structure for table db_product.stores
CREATE TABLE IF NOT EXISTS `stores` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('online','pending','suspended') DEFAULT 'pending',
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm65gmk5hrq9cwdnfudj03iwmu` (`user_id`),
  CONSTRAINT `FKm65gmk5hrq9cwdnfudj03iwmu` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.stores: ~0 rows (approximately)
INSERT INTO `stores` (`id`, `created_at`, `description`, `logo`, `name`, `status`, `user_id`) VALUES
	('4ac30173-d3be-44ba-856f-dc36d61e29a8', '2025-05-15 14:21:05.189037', 'Bán đồ điện tử', 'string', 'TechZone', 'pending', 'bafd1cdb-1d49-49c4-8182-df8c3a5d3d8f');

-- Dumping structure for table db_product.subscriptions
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` varchar(255) NOT NULL,
  `ended_at` datetime(6) DEFAULT NULL,
  `started_at` datetime(6) DEFAULT NULL,
  `status` enum('active','inactive','cancelled') DEFAULT 'inactive',
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjv5hoiko2qkwlbqccoyktauiv` (`user_id`),
  CONSTRAINT `FKjv5hoiko2qkwlbqccoyktauiv` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.subscriptions: ~0 rows (approximately)

-- Dumping structure for table db_product.type
CREATE TABLE IF NOT EXISTS `type` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.type: ~0 rows (approximately)

-- Dumping structure for table db_product.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.user: ~2 rows (approximately)
INSERT INTO `user` (`id`, `dob`, `first_name`, `last_name`, `password`, `username`, `email`, `enabled`) VALUES
	('5ad5b918-147c-4da3-8053-aad6afe5a434', '2002-05-16', 'lapnguyen', 'lapnguyen', '$2a$10$WdYSvMNynhH.jbDHqqp71...0aVuG0P4iGFE/K96jCNoQEWoo/IH.', 'lapnguyen', NULL, 0),
	('bafd1cdb-1d49-49c4-8182-df8c3a5d3d8f', NULL, NULL, NULL, '$2a$10$eEA/8KiDBcn8Du9X42Bwt.JKy7kudTwwsse0Rek1Is2qCj0u3ipIG', 'admin', NULL, 1);

-- Dumping structure for table db_product.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` varchar(255) NOT NULL,
  `roles_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`roles_name`),
  KEY `FK6pmbiap985ue1c0qjic44pxlc` (`roles_name`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK6pmbiap985ue1c0qjic44pxlc` FOREIGN KEY (`roles_name`) REFERENCES `role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.user_roles: ~0 rows (approximately)
INSERT INTO `user_roles` (`user_id`, `roles_name`) VALUES
	('bafd1cdb-1d49-49c4-8182-df8c3a5d3d8f', 'ADMIN'),
	('5ad5b918-147c-4da3-8053-aad6afe5a434', 'USER');


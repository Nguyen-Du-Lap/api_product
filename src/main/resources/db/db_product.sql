

-- Dumping database structure for db_product
CREATE DATABASE IF NOT EXISTS `db_product` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_product`;

-- Dumping structure for table db_product.invalidated_token
CREATE TABLE IF NOT EXISTS `invalidated_token` (
  `id` varchar(255) NOT NULL,
  `expiry_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_product.invalidated_token: ~0 rows (approximately)

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

-- Dumping data for table db_product.user: ~1 rows (approximately)
INSERT INTO `user` (`id`, `dob`, `first_name`, `last_name`, `password`, `username`, `email`, `enabled`) VALUES
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

-- Dumping data for table db_product.user_roles: ~1 rows (approximately)
INSERT INTO `user_roles` (`user_id`, `roles_name`) VALUES
	('bafd1cdb-1d49-49c4-8182-df8c3a5d3d8f', 'ADMIN');

  -- TẠO BẢNG CỬA HÀNG
CREATE TABLE stores (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  logo VARCHAR(255),
  status ENUM('online', 'pending', 'suspended') DEFAULT 'pending',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES user(id)
);

-- BẢNG DANH MỤC
CREATE TABLE categories (
  id VARCHAR(36) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- BẢNG NHÃN HIỆU (BRANDS)
CREATE TABLE brands (
  id VARCHAR(36) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- BẢNG SẢN PHẨM
CREATE TABLE products (
  id VARCHAR(36) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10,2),
  stock INT DEFAULT 0,
  category_id VARCHAR(36),
  store_id VARCHAR(36),
  brand_id VARCHAR(36),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES categories(id),
  FOREIGN KEY (store_id) REFERENCES stores(id),
  FOREIGN KEY (brand_id) REFERENCES brands(id)
);

-- BẢNG HÌNH ẢNH SẢN PHẨM
CREATE TABLE product_images (
  id VARCHAR(36) PRIMARY KEY,
  product_id VARCHAR(36) NOT NULL,
  image_url VARCHAR(255) NOT NULL,
  is_primary BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- BẢNG ĐƠN HÀNG
CREATE TABLE orders (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  total_price DECIMAL(10,2),
  status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES user(id)
);

-- BẢNG CHI TIẾT ĐƠN HÀNG
CREATE TABLE order_items (
  id VARCHAR(36) PRIMARY KEY,
  order_id VARCHAR(36),
  product_id VARCHAR(36),
  quantity INT DEFAULT 1,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- BẢNG GIỎ HÀNG
CREATE TABLE carts (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES user(id)
);

-- BẢNG MỤC TRONG GIỎ HÀNG
CREATE TABLE cart_items (
  id VARCHAR(36) PRIMARY KEY,
  cart_id VARCHAR(36),
  product_id VARCHAR(36),
  quantity INT DEFAULT 1,
  FOREIGN KEY (cart_id) REFERENCES carts(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- BẢNG ĐÁNH GIÁ
CREATE TABLE reviews (
  id VARCHAR(36) PRIMARY KEY,
  product_id VARCHAR(36),
  user_id VARCHAR(36),
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (user_id) REFERENCES user(id)
);

-- BẢNG VẬN CHUYỂN
CREATE TABLE shipping (
  id VARCHAR(36) PRIMARY KEY,
  order_id VARCHAR(36),
  address VARCHAR(255),
  shipping_method VARCHAR(100),
  shipping_cost DECIMAL(10,2),
  delivered_at DATETIME,
  FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- BẢNG GIẢM GIÁ
CREATE TABLE discounts (
  id VARCHAR(36) PRIMARY KEY,
  code VARCHAR(100) UNIQUE,
  description TEXT,
  percentage INT CHECK (percentage BETWEEN 0 AND 100),
  valid_from DATETIME,
  valid_to DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- BẢNG ĐĂNG KÝ (SUBSCRIPTION)
CREATE TABLE subscriptions (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  status ENUM('active', 'inactive', 'cancelled') DEFAULT 'inactive',
  started_at DATETIME,
  ended_at DATETIME,
  FOREIGN KEY (user_id) REFERENCES user(id)
);



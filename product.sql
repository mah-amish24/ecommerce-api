-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ecommerce-api
DROP DATABASE IF EXISTS `ecommerce-api`;
CREATE DATABASE IF NOT EXISTS `ecommerce-api` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `ecommerce-api`;

-- Dumping structure for table ecommerce-api.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce-api.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table ecommerce-api.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce-api.migrations: ~6 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_06_12_074850_create_tokens_table', 1),
	(6, '2024_06_12_075144_create_products_table', 1);

-- Dumping structure for table ecommerce-api.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce-api.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;

-- Dumping structure for table ecommerce-api.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce-api.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table ecommerce-api.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_user_id_foreign` (`user_id`),
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce-api.products: ~56 rows (approximately)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `user_id`, `name`, `description`, `price`, `image`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php6707.tmp', '2024-06-12 06:14:29', '2024-06-12 06:14:29'),
	(4, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php22DE.tmp', '2024-06-12 06:28:31', '2024-06-12 06:28:31'),
	(5, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php5A5A.tmp', '2024-06-12 06:28:38', '2024-06-12 06:28:38'),
	(7, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php7854.tmp', '2024-06-12 06:28:45', '2024-06-12 06:28:45'),
	(8, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php7D94.tmp', '2024-06-12 06:28:47', '2024-06-12 06:28:47'),
	(9, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php8239.tmp', '2024-06-12 06:28:48', '2024-06-12 06:28:48'),
	(10, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php870C.tmp', '2024-06-12 06:28:49', '2024-06-12 06:28:49'),
	(11, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php8BB1.tmp', '2024-06-12 06:28:50', '2024-06-12 06:28:50'),
	(12, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php9017.tmp', '2024-06-12 06:28:51', '2024-06-12 06:28:51'),
	(13, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php949C.tmp', '2024-06-12 06:28:53', '2024-06-12 06:28:53'),
	(14, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php9940.tmp', '2024-06-12 06:28:54', '2024-06-12 06:28:54'),
	(15, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php9D87.tmp', '2024-06-12 06:28:55', '2024-06-12 06:28:55'),
	(16, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\phpA1BE.tmp', '2024-06-12 06:28:56', '2024-06-12 06:28:56'),
	(17, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\phpA682.tmp', '2024-06-12 06:28:57', '2024-06-12 06:28:57'),
	(18, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\phpD90D.tmp', '2024-06-12 06:29:10', '2024-06-12 06:29:10'),
	(19, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\phpDFB5.tmp', '2024-06-12 06:29:12', '2024-06-12 06:29:12'),
	(23, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php88FD.tmp', '2024-06-12 07:01:36', '2024-06-12 07:01:36'),
	(24, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\phpF4BC.tmp', '2024-06-12 07:11:53', '2024-06-12 07:11:53'),
	(25, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\phpE59D.tmp', '2024-06-12 07:15:06', '2024-06-12 07:15:06'),
	(27, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php9203.tmp', '2024-06-12 07:21:18', '2024-06-12 07:21:18'),
	(28, 1, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php998.tmp', '2024-06-12 08:30:37', '2024-06-12 08:30:37'),
	(29, 2, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php1BAC.tmp', '2024-06-12 17:00:54', '2024-06-12 17:00:54'),
	(30, 2, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php42AD.tmp', '2024-06-12 17:01:04', '2024-06-12 17:01:04'),
	(31, 2, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php75B5.tmp', '2024-06-12 17:01:17', '2024-06-12 17:01:17'),
	(32, 2, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\phpBEF4.tmp', '2024-06-12 17:01:36', '2024-06-12 17:01:36'),
	(34, 2, 'Product 1', 'This is a product', 99.99, 'photo-1020478.jpg', '2024-06-12 17:32:47', '2024-06-12 17:32:47'),
	(35, 2, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php71C8.tmp', '2024-06-12 19:32:00', '2024-06-12 19:32:00'),
	(36, 2, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\php54C6.tmp', '2024-06-12 19:32:58', '2024-06-12 19:32:58'),
	(37, 2, 'Product 1', 'This is a product', 99.99, 'D:\\xampp\\tmp\\phpB1CC.tmp', '2024-06-12 19:33:22', '2024-06-12 19:33:22'),
	(40, 2, 'Updated Product2', 'This is an updated product2', 89.99, 'photo-1020478.jpg', '2024-06-12 19:35:25', '2024-06-12 20:35:41'),
	(41, 2, 'Product 1', 'This is a product', 99.99, 'logo.jpg', '2024-06-12 19:54:32', '2024-06-12 19:54:32'),
	(42, 2, 'Product 1', 'This is a product', 99.99, 'logo.jpg', '2024-06-12 20:01:27', '2024-06-12 20:01:27'),
	(43, 2, 'Product 1', 'This is a product', 99.99, 'logo.jpg', '2024-06-12 20:02:16', '2024-06-12 20:02:16'),
	(44, 2, 'Product 1', 'This is a product', 99.99, 'logo.jpg', '2024-06-12 20:09:33', '2024-06-12 20:09:33'),
	(45, 2, 'Product 45', 'This is a product 45', 99.99, 'logo.jpg', '2024-06-12 20:39:33', '2024-06-12 20:39:33'),
	(46, 2, 'Product 45', 'This is a product 45', 99.99, 'logo.jpg', '2024-06-12 20:40:34', '2024-06-12 20:40:34'),
	(47, 2, 'Product 45', 'This is a product 45', 99.99, 'logo.jpg', '2024-06-12 20:41:37', '2024-06-12 20:41:37'),
	(48, 2, 'Product 45', 'This is a product 45', 99.99, 'logo.jpg', '2024-06-12 20:43:13', '2024-06-12 20:43:13'),
	(49, 2, 'Product 45', 'This is a product 45', 99.99, 'logo.jpg', '2024-06-12 20:45:26', '2024-06-12 20:45:26'),
	(50, 2, 'Product 45', 'This is a product 45', 99.99, 'logo.jpg', '2024-06-12 20:45:34', '2024-06-12 20:45:34'),
	(51, 2, 'Product 45', 'This is a product 45', 99.99, 'logo.jpg', '2024-06-12 20:54:39', '2024-06-12 20:54:39'),
	(52, 2, 'Product 45', 'This is a product 45', 99.99, 'logo.jpg', '2024-06-12 20:55:20', '2024-06-12 20:55:20'),
	(53, 2, 'Product 45', NULL, 99.99, 'logo.jpg', '2024-06-12 20:56:02', '2024-06-12 20:56:02'),
	(54, 2, 'Product 45', NULL, 99.99, 'logo.jpg', '2024-06-12 20:57:33', '2024-06-12 20:57:33'),
	(55, 2, 'Product 45', NULL, 99.99, 'logo.jpg', '2024-06-12 20:57:56', '2024-06-12 20:57:56'),
	(56, 2, 'Product 45', NULL, 99.99, 'logo.jpg', '2024-06-12 20:58:26', '2024-06-12 20:58:26'),
	(57, 2, 'Product 45', NULL, 99.99, 'logo.jpg', '2024-06-12 20:59:44', '2024-06-12 20:59:44'),
	(58, 2, 'Product 45', NULL, 99.99, 'logo.jpg', '2024-06-12 21:02:29', '2024-06-12 21:02:29'),
	(59, 2, 'Product 45', NULL, 99.99, 'logo.jpg', '2024-06-12 21:03:50', '2024-06-12 21:03:50'),
	(60, 2, 'Product 45', NULL, 99.99, 'logo.jpg', '2024-06-12 21:06:55', '2024-06-12 21:06:55'),
	(61, 2, 'Product 45', NULL, 99.99, 'logo.jpg', '2024-06-12 21:07:59', '2024-06-12 21:07:59'),
	(62, 2, 'Product 45', NULL, 99.99, 'logo.jpg', '2024-06-12 21:10:05', '2024-06-12 21:10:05'),
	(63, 2, 'Product 45', NULL, 99.99, 'logo.jpg', '2024-06-12 21:12:23', '2024-06-12 21:12:23'),
	(64, 2, 'Product 45', 'desc2', 99.99, 'logo.jpg', '2024-06-12 21:20:01', '2024-06-12 21:20:01'),
	(65, 2, 'Product 45', 'desc2', 99.99, 'logo.jpg', '2024-06-12 21:20:44', '2024-06-12 21:20:44'),
	(66, 2, 'Product 45', 'desc2', 99.99, 'logo.jpg', '2024-06-12 21:21:37', '2024-06-12 21:21:37');

-- Dumping structure for table ecommerce-api.tokens
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unique` (`token`),
  KEY `tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce-api.tokens: ~8 rows (approximately)
DELETE FROM `tokens`;
INSERT INTO `tokens` (`id`, `user_id`, `token`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 1, '2e1e9fbe61cb5aaaf7c4828b0ca82055b4e68963b1ab9b322b1fa35007f38aa8', '2024-06-12 06:59:56', '2024-06-12 05:59:56', '2024-06-12 05:59:56'),
	(2, 1, '4d1a9763618ac7979760f26d02c2b7f572bb4e38b1924b59aa34c19774f2158a', '2024-06-12 07:00:06', '2024-06-12 06:00:06', '2024-06-12 06:00:06'),
	(3, 1, 'bbd11de50c0fe69eb90a9f8a23be7dba779af26b2aabec8d0bae14f5ddd4e8b9', '2024-06-12 07:14:06', '2024-06-12 06:14:06', '2024-06-12 06:14:06'),
	(4, 1, '0826101a509503816e0dcfececa07c7880a7f09aed54d3b9ed6d5d3750a4ce4e', '2024-06-12 07:16:30', '2024-06-12 06:16:30', '2024-06-12 06:16:30'),
	(5, 1, '2e062fa43828248ba6bdb71f0b33f28d9a94ff8ed3723de98eee09f98d4e5dc1', '2024-06-12 07:23:53', '2024-06-12 06:23:53', '2024-06-12 06:23:53'),
	(6, 1, 'ba9dab73eebbb1f75b9fc7e1add1f8df62e70a74347ca163dfedda58a24f238b', '2024-06-12 07:36:13', '2024-06-12 06:36:13', '2024-06-12 06:36:13'),
	(7, 1, '9aaf1f818c73d73abd788efc748541e5de2acf9add81f9a5d49e293da687aaa4', '2024-06-12 07:38:22', '2024-06-12 06:38:22', '2024-06-12 06:38:22'),
	(8, 1, 'a78aa57302fc12487223d6d6d18cc7c2ef41a916ee64258e26474c3cc027cd47', '2024-06-12 07:42:15', '2024-06-12 06:42:15', '2024-06-12 06:42:15'),
	(9, 1, '8092a45c5ebac2ead44e9e5f46bc8a41c487ee1571e84987b0e78595229d4fce', '2024-06-12 08:00:28', '2024-06-12 07:00:28', '2024-06-12 07:00:28'),
	(10, 1, '10977eb8a1f6d35a90d01fe0b67ebd1c2c323864f5942a36678673f8e90e2ac8', '2024-06-12 09:28:11', '2024-06-12 08:28:11', '2024-06-12 08:28:11'),
	(11, 2, '346a394f4047336b960170c1ce3beaab713a93d0171488871a131261b9ea73cf', '2024-06-12 17:59:30', '2024-06-12 16:59:30', '2024-06-12 16:59:30'),
	(12, 2, 'f1070c70494125b94c852aef9359b85885b05bc0be8e8f06bba96ab444bcb889', '2024-06-12 19:04:37', '2024-06-12 18:04:37', '2024-06-12 18:04:37'),
	(13, 2, 'de427dcbef4fcbff0903e4cf7b9260f0c0d0e9e83e683a44b17d0fc815971160', '2024-06-12 20:10:35', '2024-06-12 19:10:35', '2024-06-12 19:10:35'),
	(14, 2, 'bf8fb3b6d4db54aef85bc34f45e54b24ce69c8a99e4aff0ac5f77e269aa8d3f4', '2024-06-12 20:24:57', '2024-06-12 19:24:57', '2024-06-12 19:24:57'),
	(15, 2, 'c2dd681d856208ed0cf1589b8cf46408f0f74ff777c1664441b65ce133451a66', '2024-06-12 21:26:01', '2024-06-12 20:26:01', '2024-06-12 20:26:01');

-- Dumping structure for table ecommerce-api.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce-api.users: ~2 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'John Doe', 'john@example.com', NULL, '$2y$10$UaO47/53wGSYJn6rQX62Qejc2Z.QMVi241ySdJivLulFrqbDj2v7.', NULL, '2024-06-12 05:55:29', '2024-06-12 05:55:29'),
	(2, 'sara', 'sara@example.com', NULL, '$2y$10$jZa6kw/gKTRrBajHXS6y3ewAzclIYx1vY3Xc3h5vshIzNja0wsawK', NULL, '2024-06-12 16:59:04', '2024-06-12 16:59:04');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.21 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for laravel-tricks
CREATE DATABASE IF NOT EXISTS `laravel-tricks` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `laravel-tricks`;


-- Dumping structure for table laravel-tricks.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-tricks.categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
REPLACE INTO `categories` (`id`, `name`, `slug`, `description`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Views', 'views', 'All tricks related to the View class, e.g. View Composers.', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'Eloquent', 'eloquent', 'Eloquent ORM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Dumping structure for table laravel-tricks.category_trick
CREATE TABLE IF NOT EXISTS `category_trick` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `trick_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `category_trick_category_id_foreign` (`category_id`),
  KEY `category_trick_trick_id_foreign` (`trick_id`),
  CONSTRAINT `category_trick_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `category_trick_trick_id_foreign` FOREIGN KEY (`trick_id`) REFERENCES `tricks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-tricks.category_trick: ~3 rows (approximately)
/*!40000 ALTER TABLE `category_trick` DISABLE KEYS */;
REPLACE INTO `category_trick` (`id`, `category_id`, `trick_id`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 2, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `category_trick` ENABLE KEYS */;


-- Dumping structure for table laravel-tricks.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-tricks.migrations: ~12 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`migration`, `batch`) VALUES
	('2013_11_13_222806_create_users_table', 1),
	('2013_11_13_222807_create_tricks_table', 1),
	('2013_11_13_222808_create_tags_table', 1),
	('2013_11_13_222809_create_categories_table', 1),
	('2013_11_13_222810_create_votes_table', 1),
	('2013_11_13_222811_create_tag_trick_table', 1),
	('2013_11_13_222812_create_category_trick_table', 1),
	('2013_11_13_222813_create_profiles_table', 1),
	('2013_11_20_072925_add_order_to_category_table', 1),
	('2013_11_22_072925_add_spam_to_tricks_table', 1),
	('2013_11_25_202456_create_password_reminders_table', 1),
	('2014_04_17_181442_add_remember_to_user_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table laravel-tricks.password_reminders
CREATE TABLE IF NOT EXISTS `password_reminders` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_reminders_email_index` (`email`),
  KEY `password_reminders_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-tricks.password_reminders: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reminders` ENABLE KEYS */;


-- Dumping structure for table laravel-tricks.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-tricks.profiles: ~0 rows (approximately)
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;


-- Dumping structure for table laravel-tricks.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '0',
  `is_admin` varchar(50) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table laravel-tricks.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` (`id`, `name`, `is_admin`, `created_at`, `updated_at`) VALUES
	(1, 'Hashmat', '1', '2016-04-10 16:45:36', '2016-04-10 16:45:36'),
	(2, 'Hashmat', '2', '2016-04-10 16:46:59', '2016-04-10 16:46:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for table laravel-tricks.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(11) unsigned DEFAULT NULL,
  `role_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK1_user` (`user_id`),
  KEY `FK2_role` (`role_id`),
  CONSTRAINT `FK1_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK2_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table laravel-tricks.role_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;


-- Dumping structure for table laravel-tricks.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`),
  KEY `tags_user_id_foreign` (`user_id`),
  CONSTRAINT `tags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-tricks.tags: ~3 rows (approximately)
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
REPLACE INTO `tags` (`id`, `name`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'database', 'database', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'view data', 'view-data', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, '4.1', '41', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


-- Dumping structure for table laravel-tricks.tag_trick
CREATE TABLE IF NOT EXISTS `tag_trick` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `trick_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_trick_tag_id_foreign` (`tag_id`),
  KEY `tag_trick_trick_id_foreign` (`trick_id`),
  CONSTRAINT `tag_trick_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tag_trick_trick_id_foreign` FOREIGN KEY (`trick_id`) REFERENCES `tricks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-tricks.tag_trick: ~4 rows (approximately)
/*!40000 ALTER TABLE `tag_trick` DISABLE KEYS */;
REPLACE INTO `tag_trick` (`id`, `tag_id`, `trick_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 3, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tag_trick` ENABLE KEYS */;


-- Dumping structure for table laravel-tricks.tricks
CREATE TABLE IF NOT EXISTS `tricks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spam` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `code` text COLLATE utf8_unicode_ci NOT NULL,
  `vote_cache` int(10) unsigned NOT NULL DEFAULT '0',
  `view_cache` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tricks_slug_unique` (`slug`),
  KEY `tricks_user_id_foreign` (`user_id`),
  CONSTRAINT `tricks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-tricks.tricks: ~3 rows (approximately)
/*!40000 ALTER TABLE `tricks` DISABLE KEYS */;
REPLACE INTO `tricks` (`id`, `spam`, `title`, `slug`, `description`, `code`, `vote_cache`, `view_cache`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Display all SQL executed in Eloquent', 'display-all-sql-executed-in-eloquent', 'Put this in your routes.php file and you will see the SQL that Eloquent is executing when you go to pages that have any sort of access to Eloquent models. This helps a lot when debugging SQL in Laravel.', '// Display all SQL executed in Eloquent\nEvent::listen(\'illuminate.query\', function($query)\n{\n    var_dump($query);\n});', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 0, 'Dynamic View assignments', 'dynamic-view-assignments', 'Laravel offers a dynamic interface for assigning certain data. This can be used e.g. for adding a dynamic \'where\' to your Eloquent queries. However, not everyone know that this same trick also works on View assignments!', '// In Eloquent, you can assigned \'where\' clauses dynamically\nPost::whereSlug(\'slug\')->get();\n// Results in ...WHERE `slug` = \'slug\'...\n\n// The same trick is possible when using Views!\nView::make(\'posts.index\')->withPosts($posts);\n\n// Same as: View::make(\'posts.index\')->with(\'posts\', $posts);', 0, 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 0, 'Eager loading constraints', 'eager-loading-constraints', 'Ever find yourself wanting to only find models that have a certain relationship matching certain conditions? Laravel 4.1 makes this really easy, and introduces great eager loading constraints!', '1', 0, 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tricks` ENABLE KEYS */;


-- Dumping structure for table laravel-tricks.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-tricks.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `remember_token`, `email`, `photo`, `username`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'user1@example.com', NULL, 'msurguy', '$2y$10$VqaUrbQjd7nCMQk4rMpVnOu2HYb9EsksybYhsOelqQNFw24p9JM1K', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, NULL, 'user2@example.com', NULL, 'stidges', '$2y$10$b7fHDmXIWlmrjaiIZ5CMru10EvrCv.zoX3ZEaLwIsNQJyoBRIyG3K', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table laravel-tricks.votes
CREATE TABLE IF NOT EXISTS `votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `trick_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `votes_user_id_foreign` (`user_id`),
  KEY `votes_trick_id_foreign` (`trick_id`),
  CONSTRAINT `votes_trick_id_foreign` FOREIGN KEY (`trick_id`) REFERENCES `tricks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-tricks.votes: ~0 rows (approximately)
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

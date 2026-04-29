-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 29, 2026 at 10:42 AM
-- Server version: 8.0.45-0ubuntu0.24.04.1
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grp`
--

-- --------------------------------------------------------

--
-- Table structure for table `business_fit_options`
--

CREATE TABLE `business_fit_options` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_fit_options`
--

INSERT INTO `business_fit_options` (`id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(1, 'Healthy Meal Prep Service', '<p><strong>Why it fits:</strong></p><ul><li><p>Uses existing stove asset</p></li><li><p>Low initial capital required</p></li><li><p>Can be operated from home or small kitchen</p></li><li><p>Fits within time availability for meal prep</p></li></ul><p><strong>Operating model:</strong></p><p>Prepare and package healthy meals for clients who pick up or have them delivered.</p><p><strong>Complexity:</strong> Low<br><strong>Risk band:</strong> Low<br><strong>Capital fit:</strong> Fit within R0-R500 for initial supplies.<br><br><strong>Why it’s strong:</strong></p><p>Minimal selling required; focus on word-of-mouth and local marketing.</p>', '2026-03-09 18:29:42', '2026-03-09 18:29:42'),
(2, 'Catering for Small Events', '<p><strong>Why it fits:</strong></p><ul><li><p>Leverages cooking skills and create set menus</p></li><li><p>Can be conducted in small groups</p></li><li><p>Low overhead costs as events would be small</p></li><li><p>Flexible timing to fit schedule and less complex preparations</p></li></ul><p><strong>Operating model:</strong></p><p>Offer catering focused on small events using your stove.</p><p><strong>Complexity:</strong> Medium<br><strong>Risk band:</strong> Low<br><strong>Capital fit:</strong> Minimal investment for materials and marketing.<br><br><strong>Why it’s strong:</strong></p><p>Catering can be less intimidating than teaching.</p>', '2026-03-09 18:30:14', '2026-03-09 19:23:07'),
(3, 'Homemade Snack Sales', '<p><strong>Why it fits:</strong></p><ul><li><p>Minimal setup required</p></li><li><p>Can produce snacks using existing stove</p></li><li><p>Low risk and capital investment</p></li><li><p>Fits within available time for preparation</p></li></ul><p><strong>Operating model:</strong></p><p>Make and sell homemade snacks to local clinics, hospitals, or community events.</p><p><strong>Complexity:</strong> Low<br><strong>Risk band:</strong> Low<br><strong>Capital fit:</strong> Initial investment for ingredients and packaging.<br><br><strong>Why it’s strong:</strong></p><p>Focus on local sales reduces pressure to sell.</p>', '2026-03-09 18:30:31', '2026-03-09 18:30:31'),
(4, 'Cooking Classes for Beginners', '<p><strong>Why it fits:</strong></p><ul><li><p>Leverages cooking skills</p></li><li><p>Can be conducted in small groups or one-on-one</p></li><li><p>Low overhead costs</p></li><li><p>Flexible timing to fit schedule</p></li></ul><p><strong>Operating model:</strong></p><p>Offer cooking classes focusing on healthy meals using the stove.</p><p><strong>Complexity:</strong> Medium<br><strong>Risk band:</strong> Low<br><strong>Capital fit:</strong> Minimal investment for materials and marketing.<br><br><strong>Why it’s strong:</strong></p><p>Teaching can be less intimidating than selling.</p>', '2026-03-09 18:30:49', '2026-03-09 18:30:49'),
(5, 'Meal Planning Consultation', '<p><strong>Why it fits:</strong></p><ul><li><p>No cooking required, just planning</p></li><li><p>Utilizes admin skills for organization</p></li><li><p>Low capital needed for marketing</p></li><li><p>Fits within available time for consultation</p></li></ul><p><strong>Operating model:</strong></p><p>Provide meal planning services for individuals or families looking for healthy eating solutions.</p><p><strong>Complexity:</strong> Low<br><strong>Risk band:</strong> Low<br><strong>Capital fit:</strong> Only needs investment in marketing materials.<br><br><strong>Why it’s strong:</strong></p><p>Focus on providing value rather than direct selling.</p>', '2026-03-09 18:31:08', '2026-03-09 18:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('grp-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1773083314),
('grp-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1773083314;', 1773083314),
('grp-cache-livewire-rate-limiter:7bb38be84a5591d31f1f84e89eae1e6935efcf7c', 'i:1;', 1773311085),
('grp-cache-livewire-rate-limiter:7bb38be84a5591d31f1f84e89eae1e6935efcf7c:timer', 'i:1773311085;', 1773311085),
('grp-cache-livewire-rate-limiter:970a12ee8b6fa76c40877f5ef0128da685de61fd', 'i:1;', 1773134188),
('grp-cache-livewire-rate-limiter:970a12ee8b6fa76c40877f5ef0128da685de61fd:timer', 'i:1773134188;', 1773134188),
('grp-cache-livewire-rate-limiter:bf3c8045341e70070a78ad49c4c83489fe542cde', 'i:3;', 1773076481),
('grp-cache-livewire-rate-limiter:bf3c8045341e70070a78ad49c4c83489fe542cde:timer', 'i:1773076481;', 1773076481);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capital_bands`
--

CREATE TABLE `capital_bands` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amount` int UNSIGNED NOT NULL,
  `max_amount` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `capital_bands`
--

INSERT INTO `capital_bands` (`id`, `label`, `min_amount`, `max_amount`, `created_at`, `updated_at`) VALUES
(1, 'R0-R500', 0, 500, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(2, 'R500-R2000', 500, 2000, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(3, 'R2000-R5000', 2000, 5000, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(4, 'R5000+', 5000, NULL, '2026-03-05 19:15:43', '2026-03-05 19:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `confidence_to_sells`
--

CREATE TABLE `confidence_to_sells` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `confidence_to_sells`
--

INSERT INTO `confidence_to_sells` (`id`, `label`, `level`, `created_at`, `updated_at`) VALUES
(1, 'Very Low', 1, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(2, 'Low', 2, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(3, 'Medium', 3, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(4, 'High', 4, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(5, 'Very High', 5, '2026-03-05 19:15:43', '2026-03-05 19:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `label`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Taxi Rank / Transport Hub', 'High foot traffic transportation hubs', '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(2, 'School / College Area', 'Educational institutions and student areas', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(3, 'Residential Township / High-Density Housing', 'Residential areas with high population density', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(4, 'Shopping Centre / Mall / Retail Strip', 'Commercial retail areas and shopping districts', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(5, 'Industrial Area / Factories / Construction Site', 'Industrial zones with manufacturing and construction', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(6, 'Clinic / Hospital / Government Office', 'Healthcare and government service areas', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(7, 'Informal Market / Street Market', 'Unstructured markets and street trading areas', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(8, 'Rural / Low Foot Traffic Area', 'Rural areas with limited pedestrian traffic', '2026-03-05 19:15:44', '2026-03-05 19:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_16_162554_create_capital_bands_table', 1),
(5, '2026_02_16_163342_create_time_availabilities_table', 1),
(6, '2026_02_16_163343_create_risk_tolerances_table', 1),
(7, '2026_02_16_163343_create_skills_table', 1),
(8, '2026_02_23_073041_create_confidence_to_sells_table', 2),
(9, '2026_02_23_093014_create_locations_table', 2),
(10, '2026_03_05_185303_create_questions_table', 3),
(11, '2026_03_09_175514_create_business_fit_options_table', 4),
(12, '2026_03_09_181816_create_tailored_action_plans_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `category`, `question`, `created_at`, `updated_at`) VALUES
(1, 'FINANCE', 'Do you know exactly how much money you need to start your business?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(2, 'FINANCE', 'Do you calculate how much profit you make after paying for stock and expenses?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(3, 'FINANCE', 'Do you keep a daily record of money coming in and going out?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(4, 'FINANCE', 'Do you separate your business money from your personal money?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(5, 'FINANCE', 'If sales drop for 2 weeks, do you have backup savings to survive?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(6, 'SALES', 'Are you comfortable talking to strangers about your product?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(7, 'SALES', 'Do you know why customers choose your product instead of others?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(8, 'SALES', 'Do you ask customers for feedback after they buy?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(9, 'SALES', 'Do you try to sell more than one item to a customer (e.g., add-ons)?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(10, 'SALES', 'If customers say “it’s too expensive,” do you know how to respond?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(11, 'OPERATIONS', 'Do you have a fixed daily routine for your business?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(12, 'OPERATIONS', 'Do you check your stock before it runs out?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(13, 'OPERATIONS', 'Do you track how many products you sell each day?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(14, 'OPERATIONS', 'Do you prepare for busy times (e.g., weekends, payday)?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(15, 'OPERATIONS', 'If something goes wrong (equipment breaks, supplier late), do you have a backup plan?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(16, 'MARKETING', 'Do you actively promote your business every week?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(17, 'MARKETING', 'Do you know who your ideal customer is?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(18, 'MARKETING', 'Do customers easily see your business (signage, location, visibility)?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(19, 'MARKETING', 'Do you use WhatsApp, social media, or word-of-mouth to bring customers?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(20, 'MARKETING', 'Do you run small promotions or specials to attract attention?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(21, 'RISKS', 'Have you identified what could cause your business to fail?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(22, 'RISKS', 'Do you have more than one supplier?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(23, 'RISKS', 'Are you prepared for price increases in stock?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(24, 'RISKS', 'Do you protect your equipment and stock from theft or damage?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(25, 'RISKS', 'Do you understand any local rules or permits needed?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(26, 'EMPLOYEES', 'Have you ever managed someone before?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(27, 'EMPLOYEES', 'Do you know what tasks you would delegate first?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(28, 'EMPLOYEES', 'Do you have clear rules for staff (working hours, behaviour)?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(29, 'EMPLOYEES', 'Do you know how to calculate wages correctly?', '2026-03-05 19:15:44', '2026-03-05 19:15:44'),
(30, 'EMPLOYEES', 'If an employee performs badly, do you know how to handle it?', '2026-03-05 19:15:44', '2026-03-05 19:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `risk_tolerances`
--

CREATE TABLE `risk_tolerances` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `risk_tolerances`
--

INSERT INTO `risk_tolerances` (`id`, `label`, `level`, `created_at`, `updated_at`) VALUES
(1, 'Low', 1, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(2, 'Medium', 2, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(3, 'High', 3, '2026-03-05 19:15:43', '2026-03-05 19:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6JjY9QMrvyhGI6pNLmRMa9sR5qbJdyr3JnVM4vGH', NULL, '52.123.145.90', 'Mozilla/5.0 (Windows NT 6.1; WOW64) SkypeUriPreview Preview/0.5 skype-url-preview@microsoft.com', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVdnTTZrRVk3ZFIwU2xsNWpYTklISm1jR2I5QmlFeDZtbUdSbjFQbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1774898111),
('9dPUQnZLbczS3LbgiadNWNPmOBc0sqR3y2ADXniF', NULL, '41.198.150.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiendWcFhRdEJJYU5zZ0dMSzlySDhxS0V3bFZibks4bWxkSGJHZDR0SiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1776097800),
('9o9mLCr9YPn9zZjT4HlFo0gBu4ng81uTG3TtuiXS', 1, '156.155.108.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia00xeGVCcHFkUkVUenVYTXhSMXhPVkwwbHN3eWhVZ2ozcVlnNkpuTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1773247758),
('dTZhhfc4Iv0LjPnRsCGwBeBloBnroo31D5Zg3gqw', 1, '156.155.108.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWtENTNDeFVPOGhrWEQwMjNmQ3FsU0N6UTdqNEdTWjBGellLYVVPNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1777456144),
('eBIG4poYJTzXb209ci6R7bxAHviZX7jeUAhQkIIr', 1, '156.155.108.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVTFhZlJpRjB3SjZvMXZwT1RxMVRXb00zdEFTcjlHZWl3TGwwVU5tTiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiN2JmOTcxNzNkNDBkNzRlOTIzZjZlMmRlZDE0YWJjOTFjM2EzNmE5NTI4NDAzMmYyYTJkNDJjODY2ZTJiZDI5OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljL3F1ZXN0aW9ucyI7czo1OiJyb3V0ZSI7czo5OiJxdWVzdGlvbnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1776097901),
('eU36VbOEBPz1VH09soX8welQhOVYPukggxPqiaKb', 1, '156.155.108.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZU5ocVpEdVBPdWdwdVlFY21HOFd2NUplYUFYOENUQU1mRmZPWTBWUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1776333465),
('h4D689xrwKXRyPYRHFvOTJf4oDNg7G9fYmasptLc', NULL, '213.139.10.76', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnBYbnZSWEExWEgzNGJXN3lHa0hyWDJBQnVGdUM5M0xRRXVPNFE3cyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1776333469),
('n1aby1sjodlBmxT4KLG96nmZkcoW0oA4ycKcoCZb', NULL, '41.73.41.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3NvNW4xQkRxMUNMYmVYa3laaUVZUzZyTkMza1pOa3VmbXg2aDBtRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljL3F1ZXN0aW9ucyI7czo1OiJyb3V0ZSI7czo5OiJxdWVzdGlvbnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1776097831),
('NbEdaED8zGcqv3xBZv98ETt4puec3P1mS3TTJlOm', NULL, '104.47.19.126', '', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidXlxVms5RGFXR1lXY2ZjbXBYaFlDenl5RlNhdkxMRU9pRzhIeGYzeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1776334109),
('NZJwdmqMgayTbe6oaViaTHFaXaxNIdWmPFtfvQBP', 1, '156.155.108.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUXYxZHdFSndLZGNUOXVKN2Q5ckV5NEkyVGdJMGZBOXNNUDdZT3FmbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljL2FkbWluL3RhaWxvcmVkLWFjdGlvbi1wbGFucy8yL2VkaXQiO3M6NToicm91dGUiO3M6NTE6ImZpbGFtZW50LmFkbWluLnJlc291cmNlcy50YWlsb3JlZC1hY3Rpb24tcGxhbnMuZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjdiZjk3MTczZDQwZDc0ZTkyM2Y2ZTJkZWQxNGFiYzkxYzNhMzZhOTUyODQwMzJmMmEyZDQyYzg2NmUyYmQyOTkiO3M6NjoidGFibGVzIjthOjM6e3M6NDA6IjI0ZjY0M2I0NTgzNGVkMWZjMTg3ZjQyMzdiMTNkOGE3X2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjg6ImNhdGVnb3J5IjtzOjU6ImxhYmVsIjtzOjg6IkNhdGVnb3J5IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo4OiJxdWVzdGlvbiI7czo1OiJsYWJlbCI7czo4OiJRdWVzdGlvbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IlVwZGF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiODBkYjliY2M4MTYyZmU1YWM1ZTEyYjk3NWZkYjlkNTJfY29sdW1ucyI7YTozOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NToidGl0bGUiO3M6NToibGFiZWwiO3M6NToiVGl0bGUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6IjA1YzljMmY0NTU0YmUxNDJlN2Y3NzRlNzUwNDk1YjY0X2NvbHVtbnMiO2E6Mzp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjIzOiJidXNpbmVzc0ZpdE9wdGlvbi50aXRsZSI7czo1OiJsYWJlbCI7czoxOToiQnVzaW5lc3MgZml0IG9wdGlvbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IlVwZGF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319fX0=', 1773248573),
('qK2gHWdOCWDieznxE6sheyWJwKI8lV3yYDB2KQvq', NULL, '213.139.10.73', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibE91dG80clhrRGZYUUR4ZmlzRDhxZ2pzaGczaVRnNTZZdHBsaWFkcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljL2FkbWluL2xvZ2luIjtzOjU6InJvdXRlIjtzOjI1OiJmaWxhbWVudC5hZG1pbi5hdXRoLmxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozODoiaHR0cDovLzEwMi4zNy4xMzcuMjIyL2dycC9wdWJsaWMvYWRtaW4iO319', 1773291172),
('r2QPT7d2ZrhXCzS81MyKb5i8GchttR02BvwgwvO1', NULL, '102.182.197.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXNvSUJUaHljUlBKd2dhQ01zcWFhVUNHNWxSNW1WM09hYjE2NnFDbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljL3F1ZXN0aW9ucyI7czo1OiJyb3V0ZSI7czo5OiJxdWVzdGlvbnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1776335895),
('rdxcB7TrjXNVINQEB742tJwWPGQyi8CZE2XsC40k', 1, '105.224.63.246', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:148.0) Gecko/20100101 Firefox/148.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWUxUbkRHNGdXdTA4YlFXYmpsZkJnQ05ISUIzZWEwMDRGa2ZQdUwyMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljL2FkbWluIjtzOjU6InJvdXRlIjtzOjMwOiJmaWxhbWVudC5hZG1pbi5wYWdlcy5kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiN2JmOTcxNzNkNDBkNzRlOTIzZjZlMmRlZDE0YWJjOTFjM2EzNmE5NTI4NDAzMmYyYTJkNDJjODY2ZTJiZDI5OSI7fQ==', 1773311026),
('SQfznAfkGwNGonrjZ9ksAIq4qZMxvh1P1bKVV19m', NULL, '171.78.214.111', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:149.0) Gecko/20100101 Firefox/149.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUxwUWhGTGNjNzdZSDEzdDZ1ZXliOWlxVDltYzU5cnBRTDVtcnFDMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1776415313),
('ufliYqrDPcpr5h7qHNu0Qw5wfeSdtM6O6WwG5UKZ', 1, '156.155.108.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUDFJVkJoajZLZ3h0ZEVreWk4VlhFYWgyYTJEODM4WmZhTUtKOTFsTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI3YmY5NzE3M2Q0MGQ3NGU5MjNmNmUyZGVkMTRhYmM5MWMzYTM2YTk1Mjg0MDMyZjJhMmQ0MmM4NjZlMmJkMjk5IjtzOjY6InRhYmxlcyI7YTo5OntzOjQwOiI5NTU3NjBlMGNjMDFhZjU3ZGMzOWU5OTEwYjkwOGMzNF9jb2x1bW5zIjthOjU6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJsYWJlbCI7czo1OiJsYWJlbCI7czo1OiJMYWJlbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6Im1pbl9hbW91bnQiO3M6NToibGFiZWwiO3M6MTA6Ik1pbiBhbW91bnQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJtYXhfYW1vdW50IjtzOjU6ImxhYmVsIjtzOjEwOiJNYXggYW1vdW50IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiJmYjVmMzM3ZTljYTFhYmQ3YTAxZjFmN2QzNTNiMjE2OV9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJsYWJlbCI7czo1OiJsYWJlbCI7czo1OiJMYWJlbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NToibGV2ZWwiO3M6NToibGFiZWwiO3M6NToiTGV2ZWwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6ImE4NzJjNjA2Zjk5NjZjZjdjNGJhMGZjN2IyZDA1OGFlX2NvbHVtbnMiO2E6Mzp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjU6ImxhYmVsIjtzOjU6IkxhYmVsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiIyNGY2NDNiNDU4MzRlZDFmYzE4N2Y0MjM3YjEzZDhhN19jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo4OiJjYXRlZ29yeSI7czo1OiJsYWJlbCI7czo4OiJDYXRlZ29yeSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6ODoicXVlc3Rpb24iO3M6NToibGFiZWwiO3M6ODoiUXVlc3Rpb24iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6IjNjNzYyYjU2ZTAxZWRlZjNjOTE2OGExODU0YTUyZTQ3X2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjU6ImxhYmVsIjtzOjU6IkxhYmVsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJsZXZlbCI7czo1OiJsYWJlbCI7czo1OiJMZXZlbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IlVwZGF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiODliZDRiNDRhNmMyYjJmN2M5OTQwMmFmMTBmOGJkZTlfY29sdW1ucyI7YTozOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6NToibGFiZWwiO3M6NToiTGFiZWwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6IjZiNTIwNjBhNTRjYmZhMzI1NGFhMmFiZTU0NDc3NjI3X2NvbHVtbnMiO2E6NTp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjU6ImxhYmVsIjtzOjU6IkxhYmVsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNzoibWluX2hvdXJzX3Blcl9kYXkiO3M6NToibGFiZWwiO3M6MTc6Ik1pbiBob3VycyBwZXIgZGF5IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNzoibWF4X2hvdXJzX3Blcl9kYXkiO3M6NToibGFiZWwiO3M6MTc6Ik1heCBob3VycyBwZXIgZGF5IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiI4MGRiOWJjYzgxNjJmZTVhYzVlMTJiOTc1ZmRiOWQ1Ml9jb2x1bW5zIjthOjM6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJ0aXRsZSI7czo1OiJsYWJlbCI7czo1OiJUaXRsZSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IlVwZGF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MToiMjRmNjQzYjQ1ODM0ZWQxZmMxODdmNDIzN2IxM2Q4YTdfcGVyX3BhZ2UiO3M6MjoiNTAiO319', 1773301503),
('xMxbjxRr6ivJdIZOIIsqHxs6XkWBLH1T7JfdlJ4H', NULL, '102.182.197.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXVuejFVZEVka25ZeWhncU5XbzEydEttdE9zQW9yN2ZYYWxVdW5ySSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1776334111),
('XQCwXMYweWzTbJx5EQopJT5dtydXYN4zzICZbtQb', 1, '156.155.108.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSGQwSXdmVmFFWHFoaXFndFE2OFFaZjhNZHZ5bzFaQnp0NUVoV2dTdCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiN2JmOTcxNzNkNDBkNzRlOTIzZjZlMmRlZDE0YWJjOTFjM2EzNmE5NTI4NDAzMmYyYTJkNDJjODY2ZTJiZDI5OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6InRhYmxlcyI7YTo4OntzOjQwOiI5NTU3NjBlMGNjMDFhZjU3ZGMzOWU5OTEwYjkwOGMzNF9jb2x1bW5zIjthOjU6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJsYWJlbCI7czo1OiJsYWJlbCI7czo1OiJMYWJlbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6Im1pbl9hbW91bnQiO3M6NToibGFiZWwiO3M6MTA6Ik1pbiBhbW91bnQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJtYXhfYW1vdW50IjtzOjU6ImxhYmVsIjtzOjEwOiJNYXggYW1vdW50IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiJmYjVmMzM3ZTljYTFhYmQ3YTAxZjFmN2QzNTNiMjE2OV9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJsYWJlbCI7czo1OiJsYWJlbCI7czo1OiJMYWJlbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NToibGV2ZWwiO3M6NToibGFiZWwiO3M6NToiTGV2ZWwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6ImE4NzJjNjA2Zjk5NjZjZjdjNGJhMGZjN2IyZDA1OGFlX2NvbHVtbnMiO2E6Mzp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjU6ImxhYmVsIjtzOjU6IkxhYmVsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiIzYzc2MmI1NmUwMWVkZWYzYzkxNjhhMTg1NGE1MmU0N19jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJsYWJlbCI7czo1OiJsYWJlbCI7czo1OiJMYWJlbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NToibGV2ZWwiO3M6NToibGFiZWwiO3M6NToiTGV2ZWwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6Ijg5YmQ0YjQ0YTZjMmIyZjdjOTk0MDJhZjEwZjhiZGU5X2NvbHVtbnMiO2E6Mzp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjU6ImxhYmVsIjtzOjU6IkxhYmVsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiI2YjUyMDYwYTU0Y2JmYTMyNTRhYTJhYmU1NDQ3NzYyN19jb2x1bW5zIjthOjU6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJsYWJlbCI7czo1OiJsYWJlbCI7czo1OiJMYWJlbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTc6Im1pbl9ob3Vyc19wZXJfZGF5IjtzOjU6ImxhYmVsIjtzOjE3OiJNaW4gaG91cnMgcGVyIGRheSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTc6Im1heF9ob3Vyc19wZXJfZGF5IjtzOjU6ImxhYmVsIjtzOjE3OiJNYXggaG91cnMgcGVyIGRheSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjQ7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IlVwZGF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiMjRmNjQzYjQ1ODM0ZWQxZmMxODdmNDIzN2IxM2Q4YTdfY29sdW1ucyI7YTo0OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6ODoiY2F0ZWdvcnkiO3M6NToibGFiZWwiO3M6ODoiQ2F0ZWdvcnkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjg6InF1ZXN0aW9uIjtzOjU6ImxhYmVsIjtzOjg6IlF1ZXN0aW9uIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQxOiIyNGY2NDNiNDU4MzRlZDFmYzE4N2Y0MjM3YjEzZDhhN19wZXJfcGFnZSI7czoyOiIyNSI7fX0=', 1773314618),
('Xv52VtHWEKFYSESn64Zwkp4hxX3lSJwX2Nz7yKR6', NULL, '4.222.252.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.7444.163 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRE9sTkVSMGRrYUpjdkU3Uzd6ZDh4VXI1TkJXMTJoQW5wZVNBYm9JNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDIuMzcuMTM3LjIyMi9ncnAvcHVibGljIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1776334196),
('YRhEEQAgV9MpMJrRcdZ5PEWQefBWhFPjN4zEA0vz', NULL, '104.47.19.126', '', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRTBJcDFVTVVUTkZyY2ZUbUQzWDBwa084dlJzaE55WmRFY2ttWlhkTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1776334109);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `label`, `created_at`, `updated_at`) VALUES
(1, 'Cooking', '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(2, 'Sales', '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(3, 'Repairs', '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(4, 'Hair', '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(5, 'Admin', '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(6, 'Sourcing', '2026-03-05 19:15:43', '2026-03-05 19:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `tailored_action_plans`
--

CREATE TABLE `tailored_action_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `business_fit_option_id` bigint UNSIGNED NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tailored_action_plans`
--

INSERT INTO `tailored_action_plans` (`id`, `business_fit_option_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, '<p>Starting a healthy meal prep service is a fantastic venture, especially in Johannesburg, where health-conscious consumers are on the rise. Here&#039;s a structured plan to help you get started effectively.</p><p></p><p>## 1. Key Skills and Knowledge to Develop</p><p>- <strong>Nutritional Knowledge</strong>: Understanding balanced diets, dietary restrictions, and meal planning.</p><p>- <strong>Food Safety Regulations</strong>: Familiarize yourself with local health regulations and food safety standards.</p><p>- <strong>Marketing Skills</strong>: Learn how to effectively utilize social media and other marketing strategies to attract your target audience.</p><p>- <strong>Customer Service</strong>: Develop communication skills to interact with your clients effectively.</p><p></p><p>## 2. Startup Essentials and Preparation Steps</p><p>- <strong>Business Registration</strong>: Register your business with the Companies and Intellectual Property Commission (CIPC).</p><p>- <strong>Food Handling Certificate</strong>: Obtain a food handling certificate from a recognized institution.</p><p>- <strong>Create a Business Plan</strong>: Include your budget, target market, competition analysis, and marketing strategy.</p><p>- <strong>Set Up a Social Media Presence</strong>: Create profiles on platforms like Instagram and Facebook to showcase your meal prep offerings.</p><p></p><p>## 3. Timeline for Launch</p><p>- <strong>Weeks 1-2</strong>: Research and finalize your business plan, including budgeting and target market analysis.</p><p>- <strong>Weeks 3-4</strong>: Register your business, obtain necessary permits, and start building an online presence.</p><p>- <strong>Weeks 5-8</strong>: Finalize suppliers, test recipes, and develop a marketing strategy.</p><p>- <strong>Weeks 9-10</strong>: Launch your service with a soft opening, offering promotions to attract initial customers.</p><p></p><p>## 4. Essential Tools or Equipment Needed</p><p>- <strong>Kitchen Equipment</strong>: High-quality knives, cutting boards, pots, pans, and food storage containers.</p><p>- <strong>Packaging</strong>: Eco-friendly packaging solutions (biodegradable containers, recyclable bags).</p><p>- <strong>Marketing Tools</strong>: Social media management tools (e.g., Hootsuite) and website hosting.</p><p>- <strong>Delivery Resources</strong>: Consider a reliable courier service for delivering meals.</p><p></p><p>## 5. First 30-Day Action Items</p><p>1. Register your business and obtain necessary health permits.</p><p>2. Finalize your meal prep menu with healthy recipes.</p><p>3. Source eco-friendly packaging materials.</p><p>4. Set up social media accounts and start posting engaging content.</p><p>5. Network with local gyms or health stores to find potential customers.</p><p>6. Conduct a taste test with family and friends for feedback.</p><p>7. Create introductory offers to attract early customers.</p><p></p><p>## 6. Recommended Suppliers and Vendors</p><p>### 1. <strong>Fresh Produce Suppliers</strong></p><p>- <strong>Supplier Name</strong>: Fresh Earth</p><p>- <strong>What They Supply</strong>: Organic fruits and vegetables.</p><p>- <strong>Location</strong>: Johannesburg.</p><p>- <strong>Why Recommended</strong>: Focus on organic produce aligns with the healthy meal prep concept.</p><p>- <strong>Pricing</strong>: Varies; generally around ZAR 20-50 per kg for vegetables.</p><p>- <strong>Contact</strong>: [Fresh Earth](<a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https://www.freshearth.co.za\">https://www.freshearth.co.za</a>) | +27 11 782 0530</p><p></p><p>### 2. <strong>Eco-Friendly Packaging</strong></p><p>- <strong>Supplier Name</strong>: EcoPack</p><p>- <strong>What They Supply</strong>: Biodegradable food containers and packaging.</p><p>- <strong>Location</strong>: Nationwide, delivery to Johannesburg.</p><p>- <strong>Why Recommended</strong>: Specializes in sustainable packaging solutions.</p><p>- <strong>Pricing</strong>: ZAR 1-5 per container, depending on size.</p><p>- <strong>Contact</strong>: [EcoPack](<a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https://www.ecopack.co.za\">https://www.ecopack.co.za</a>) | +27 11 394 1757</p><p></p><p>### 3. <strong>Kitchen Equipment</strong></p><p>- <strong>Supplier Name</strong>: Bidfood</p><p>- <strong>What They Supply</strong>: Kitchenware and cooking equipment.</p><p>- <strong>Location</strong>: Nationwide, with a distribution center in Johannesburg.</p><p>- <strong>Why Recommended</strong>: Extensive range of kitchen essentials at competitive prices.</p><p>- <strong>Pricing</strong>: Varies widely; expect to spend ZAR 5,000-10,000 for initial setup.</p><p>- <strong>Contact</strong>: [Bidfood](<a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https://www.bidfood.co.za\">https://www.bidfood.co.za</a>) | +27 11 885 2000</p><p></p><p>## 7. Success Probability (12 Months)</p><p>- <strong>Estimated Success Probability</strong>: 75%</p><p>- <strong>Confidence Level</strong>: Medium</p><p>- <strong>Assumptions Used</strong>:</p><p>- You possess basic cooking skills and are willing to learn more.</p><p>- You have established connections with suppliers.</p><p>- You will actively promote your service and respond to customer feedback.</p><p>- <strong>Top 3 Local Challenges</strong>:</p><p>1. <strong>Competitor Saturation</strong>: The meal prep market in Johannesburg is competitive; differentiating your service is critical.</p><p>2. <strong>Regulatory Compliance</strong>: Adhering to health regulations and food safety standards can be challenging.</p><p>3. <strong>Customer Acquisition</strong>: Finding and retaining health-conscious customers requires effective marketing efforts.</p><p></p><p>### Conclusion</p><p>Embarking on a healthy meal prep service in Johannesburg holds great potential, especially with your preparedness and commitment to eco-friendly practices. Focus on building your brand and engaging with your community to overcome initial challenges. Good luck!</p>', '2026-03-09 18:52:01', '2026-03-09 18:52:01'),
(2, 2, '<p>## 1. Key Skills and Knowledge to Develop</p><p>- <strong>Food Safety Regulations:</strong> Understand local health and safety regulations related to food preparation and serving.</p><p>- <strong>Culinary Skills:</strong> While you have baking skills, expanding your knowledge in other cuisines can attract a broader clientele.</p><p>- <strong>Event Planning:</strong> Familiarize yourself with event planning basics to better understand your clients&#039; needs.</p><p>- <strong>Customer Service:</strong> Develop strong communication and interpersonal skills to interact effectively with clients.</p><p>- <strong>Financial Management:</strong> Continue refining your budgeting skills, especially in pricing and profitability analysis.</p><p></p><p>## 2. Startup Essentials and Preparation Steps</p><p>- <strong>Business Registration:</strong> Register your business with the Companies and Intellectual Property Commission (CIPC).</p><p>- <strong>Health and Safety Compliance:</strong> Obtain necessary licenses from the Department of Health, including a food handling certificate.</p><p>- <strong>Insurance:</strong> Consider liability insurance to protect against potential claims.</p><p>- <strong>Menu Development:</strong> Design a sample menu that showcases your specialties and caters to various events, especially weddings.</p><p>- <strong>Branding:</strong> Create a unique brand identity, including logo and promotional materials.</p><p></p><p>## 3. Timeline for Launch</p><p>- <strong>Week 1-2:</strong> Business registration and legal compliance (licenses, insurance).</p><p>- <strong>Week 3-4:</strong> Menu development and brand design.</p><p>- <strong>Week 5-6:</strong> Set up social media profiles and begin marketing efforts.</p><p>- <strong>Week 7-8:</strong> Reach out to local venues and event planners for partnerships.</p><p>- <strong>Week 9:</strong> Soft launch (catering for friends/family events for feedback).</p><p>- <strong>Week 10:</strong> Official launch.</p><p></p><p>## 4. Essential Tools or Equipment Needed</p><p>- <strong>Kitchen Equipment:</strong></p><p>- Commercial oven (approx. ZAR 15,000 - ZAR 25,000)</p><p>- Mixer (approx. ZAR 3,000 - ZAR 5,000)</p><p>- Cooking utensils and bakeware (approx. ZAR 1,500 - ZAR 3,000)</p><p>- <strong>Transportation:</strong> Reliable vehicle for deliveries (consider leasing if purchasing upfront is not feasible).</p><p>- <strong>Serving Equipment:</strong> Disposable plates and cutlery for events (approx. ZAR 500 - ZAR 1,000).</p><p>- <strong>Website:</strong> A simple website for showcasing your services (approx. ZAR 3,000 - ZAR 10,000).</p><p></p><p>## 5. First 30-Day Action Items</p><p>1. Finalize business registration and obtain necessary permits.</p><p>2. Develop a sample menu and conduct taste tests.</p><p>3. Create social media accounts (Instagram, Facebook) and start posting content.</p><p>4. Network with wedding planners and local venues.</p><p>5. Establish an online presence with a simple website or landing page.</p><p>6. Start a small promotional campaign (e.g., local Facebook ads targeting event planners).</p><p>7. Attend local events or fairs to showcase your services.</p><p></p><p>## 6. Recommended Suppliers and Vendors</p><p>- <strong>Supplier Name:</strong> Metro Foods</p><p>- <strong>What they provide:</strong> Wholesale groceries, including ingredients for baking and catering.</p><p>- <strong>Location:</strong> Nationwide, with branches in Johannesburg.</p><p>- <strong>Why Recommended:</strong> Competitive pricing and variety of products.</p><p>- <strong>Approx. Pricing:</strong> Bulk items starting from ZAR 100.</p><p>- <strong>Contact Info:</strong> [Metro Foods](<a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https://metro.co.za/\">https://metro.co.za/</a>)</p><p></p><p>- <strong>Supplier Name:</strong> Restaurant Depot</p><p>- <strong>What they provide:</strong> Restaurant-grade kitchen equipment.</p><p>- <strong>Location:</strong> Johannesburg.</p><p>- <strong>Why Recommended:</strong> Good range of catering equipment at wholesale prices.</p><p>- <strong>Approx. Pricing:</strong> Items vary, commercial ovens from ZAR 15,000.</p><p>- <strong>Contact Info:</strong> [Restaurant Depot](<a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"http://www.restaurantdepot.co.za\">http://www.restaurantdepot.co.za</a>)</p><p></p><p>- <strong>Supplier Name:</strong> The Cake Box</p><p>- <strong>What they provide:</strong> Specialty baking supplies.</p><p>- <strong>Location:</strong> Johannesburg.</p><p>- <strong>Why Recommended:</strong> Quality baking ingredients and tools for small businesses.</p><p>- <strong>Approx. Pricing:</strong> Supplies starting around ZAR 200.</p><p>- <strong>Contact Info:</strong> [The Cake Box](<a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https://www.thecakebox.co.za\">https://www.thecakebox.co.za</a>)</p><p></p><p>## 7. Estimated Success Probability (12 Months)</p><p>### Success Probability: 75%</p><p>- <strong>Confidence level:</strong> Medium</p><p>- <strong>Assumptions used for this estimate:</strong></p><p>- You are equipped with baking skills and knowledge of pricing.</p><p>- Effective use of social media marketing will help build brand awareness.</p><p>- Strong competition in the market may limit growth but can be overcome with quality and unique offerings.</p><p></p><p>### Top 3 Local Challenges</p><p>1. <strong>High Competition:</strong> Many catering businesses exist in Johannesburg, making differentiation essential.</p><p>2. <strong>Economic Conditions:</strong> Fluctuations in disposable income can affect event budgets.</p><p>3. <strong>Supply Chain Issues:</strong> Local suppliers might face delays or stock shortages, impacting service delivery.</p><p></p><p>By following this structured plan, you can set a strong foundation for your catering business, capitalizing on your skills and the local market opportunities. Good luck with your venture!</p>', '2026-03-09 19:07:51', '2026-03-09 19:07:51');

-- --------------------------------------------------------

--
-- Table structure for table `time_availabilities`
--

CREATE TABLE `time_availabilities` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_hours_per_day` decimal(4,2) NOT NULL,
  `max_hours_per_day` decimal(4,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_availabilities`
--

INSERT INTO `time_availabilities` (`id`, `label`, `min_hours_per_day`, `max_hours_per_day`, `created_at`, `updated_at`) VALUES
(1, '<1h/day', 0.00, 1.00, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(2, '1-3h/day', 1.00, 3.00, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(3, '3-6h/day', 3.00, 6.00, '2026-03-05 19:15:43', '2026-03-05 19:15:43'),
(4, '6h+/day', 6.00, NULL, '2026-03-05 19:15:43', '2026-03-05 19:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@grp.com', '2026-03-05 19:15:44', '$2y$12$bI3JdrGydgVdgpkbRZW2oejwyi5ExyL6Tx0oJFuUz012LRzAS0a6a', 'sX0auinwrcA14eong9VlV9xF935lsAdxtWm3y6LdA1Je45otxnTxLEalZB2u', '2026-02-16 17:26:22', '2026-03-05 19:15:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business_fit_options`
--
ALTER TABLE `business_fit_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `capital_bands`
--
ALTER TABLE `capital_bands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `confidence_to_sells`
--
ALTER TABLE `confidence_to_sells`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `risk_tolerances`
--
ALTER TABLE `risk_tolerances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tailored_action_plans`
--
ALTER TABLE `tailored_action_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tailored_action_plans_business_fit_option_id_foreign` (`business_fit_option_id`);

--
-- Indexes for table `time_availabilities`
--
ALTER TABLE `time_availabilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business_fit_options`
--
ALTER TABLE `business_fit_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `capital_bands`
--
ALTER TABLE `capital_bands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `confidence_to_sells`
--
ALTER TABLE `confidence_to_sells`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `risk_tolerances`
--
ALTER TABLE `risk_tolerances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tailored_action_plans`
--
ALTER TABLE `tailored_action_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `time_availabilities`
--
ALTER TABLE `time_availabilities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tailored_action_plans`
--
ALTER TABLE `tailored_action_plans`
  ADD CONSTRAINT `tailored_action_plans_business_fit_option_id_foreign` FOREIGN KEY (`business_fit_option_id`) REFERENCES `business_fit_options` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-05-2025 a las 05:23:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reservaslaravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_13_033511_create_roles_table', 2),
(5, '2025_02_13_033944_add_role_id_to_users_table', 3),
(6, '2025_02_16_200515_add_fields_to_users_table', 4),
(7, '2025_02_16_201029_remove_name_from_users_table', 5),
(8, '2025_02_16_202851_add_delete_at_to_users_table', 6),
(10, '2025_02_16_203114_create_reservations_table', 7),
(11, '2025_02_16_203823_rename_status_in_reservations_table', 7),
(12, '2025_02_18_032846_create_reservations_details_table', 8),
(13, '2025_04_03_205042_rename_consultand_id_to_consultant_id_in_reservation_table', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `reservation_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `reservation_status` enum('pendiente','confirmada','cancelada') NOT NULL DEFAULT 'pendiente',
  `total_amount` decimal(8,2) DEFAULT NULL,
  `payment_status` enum('pendiente','pagado','fallido') NOT NULL DEFAULT 'pendiente',
  `cancellation_reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `consultant_id`, `reservation_date`, `start_time`, `end_time`, `reservation_status`, `total_amount`, `payment_status`, `cancellation_reason`, `created_at`, `updated_at`) VALUES
(1, 12, 4, '2025-03-30', '12:00:00', '13:00:00', 'pendiente', 26223.16, 'fallido', NULL, '2025-03-25 01:20:21', '2025-03-25 01:20:21'),
(2, 1, 4, '2025-04-09', '15:00:00', '16:00:00', 'cancelada', 50.00, 'fallido', NULL, '2025-03-25 01:29:42', '2025-03-25 01:29:42'),
(3, 10, 4, '2025-03-28', '15:00:00', '16:00:00', 'pendiente', 50.00, 'fallido', NULL, '2025-03-25 01:29:42', '2025-03-25 01:29:42'),
(4, 6, 4, '2025-03-27', '14:00:00', '15:00:00', 'cancelada', 50.00, 'pendiente', NULL, '2025-03-25 01:29:42', '2025-03-25 01:29:42'),
(5, 13, 28, '2025-04-08', '14:00:00', '15:00:00', 'pendiente', 50.00, 'fallido', NULL, '2025-03-25 01:29:42', '2025-04-09 00:51:42'),
(6, 12, 4, '2025-04-07', '13:00:00', '14:00:00', 'cancelada', 50.00, 'pendiente', NULL, '2025-03-25 01:29:42', '2025-03-25 01:29:42'),
(7, 5, 28, '2025-04-08', '15:00:00', '16:00:00', 'pendiente', 50.00, 'pagado', NULL, '2025-03-25 01:29:42', '2025-04-09 00:49:48'),
(8, 5, 4, '2025-04-20', '14:00:00', '15:00:00', 'confirmada', 50.00, 'pagado', NULL, '2025-03-25 01:29:42', '2025-04-09 00:44:22'),
(9, 11, 4, '2025-04-18', '11:00:00', '12:00:00', 'cancelada', 50.00, 'pagado', NULL, '2025-03-25 01:29:42', '2025-03-25 01:29:42'),
(11, 8, 28, '2025-05-02', '14:00:00', '15:00:00', 'confirmada', 50.00, 'pagado', NULL, '2025-03-25 01:29:42', '2025-04-29 08:53:33'),
(12, 1, 4, '2025-04-13', '15:00:00', '16:00:00', 'pendiente', 50.00, 'pendiente', NULL, '2025-03-25 01:29:42', '2025-03-25 01:29:42'),
(13, 1, 4, '2025-04-13', '10:00:00', '11:00:00', 'confirmada', 50.00, 'fallido', NULL, '2025-03-25 01:29:42', '2025-03-25 01:29:42'),
(14, 10, 4, '2025-04-21', '10:00:00', '11:00:00', 'cancelada', 50.00, 'fallido', NULL, '2025-03-25 01:29:43', '2025-03-25 01:29:43'),
(15, 5, 4, '2025-04-19', '13:00:00', '14:00:00', 'pendiente', 50.00, 'pagado', NULL, '2025-03-25 01:29:43', '2025-03-25 01:29:43'),
(16, 12, 4, '2025-04-17', '09:00:00', '10:00:00', 'pendiente', 50.00, 'pagado', NULL, '2025-03-25 01:29:43', '2025-03-25 01:29:43'),
(17, 10, 4, '2025-04-12', '10:00:00', '11:00:00', 'cancelada', 50.00, 'pendiente', NULL, '2025-03-25 01:29:43', '2025-03-25 01:29:43'),
(18, 1, 4, '2025-04-19', '13:00:00', '14:00:00', 'confirmada', 50.00, 'fallido', NULL, '2025-03-25 01:29:43', '2025-03-25 01:29:43'),
(19, 11, 4, '2025-03-28', '13:00:00', '14:00:00', 'pendiente', 50.00, 'fallido', NULL, '2025-03-25 01:29:43', '2025-03-25 01:29:43'),
(20, 6, 4, '2025-03-29', '09:00:00', '10:00:00', 'confirmada', 50.00, 'pendiente', NULL, '2025-03-25 01:29:43', '2025-03-25 01:29:43'),
(21, 5, 4, '2025-03-31', '15:00:00', '16:00:00', 'pendiente', 50.00, 'pagado', NULL, '2025-03-25 01:29:43', '2025-03-25 01:29:43'),
(22, 6, 4, '2025-04-11', '11:00:00', '12:00:00', 'pendiente', 50.00, 'pagado', NULL, '2025-04-04 02:31:55', '2025-04-04 02:31:55'),
(23, 11, 3, '2025-04-12', '12:00:00', '13:00:00', 'pendiente', 50.00, 'pendiente', NULL, '2025-04-04 02:32:29', '2025-04-04 02:32:29'),
(24, 27, 8, '2025-04-23', '10:44:54', '17:44:54', 'cancelada', NULL, 'pagado', 'Tengo problemas', NULL, '2025-04-11 08:32:06'),
(25, 27, 8, '2025-04-23', '10:44:54', '17:44:54', 'cancelada', NULL, 'pagado', 'No puedo', NULL, '2025-04-11 08:37:30'),
(26, 27, 3, '2025-04-10', '12:00:00', '13:00:00', 'cancelada', 50.00, 'pagado', 'no tengo tiempo', '2025-04-11 02:03:56', '2025-04-26 08:36:33'),
(27, 27, 28, '2025-04-24', '10:00:00', '11:00:00', 'cancelada', 50.00, 'pagado', 'no puedo', '2025-04-17 09:55:35', '2025-04-29 09:01:34'),
(28, 27, 28, '2025-04-30', '12:00:00', '13:00:00', 'confirmada', 50.00, 'pagado', NULL, '2025-04-17 09:58:02', '2025-04-17 09:58:02'),
(29, 27, 3, '2025-04-22', '12:00:00', '13:00:00', 'confirmada', 50.00, 'pagado', NULL, '2025-04-17 10:01:32', '2025-04-17 10:01:32'),
(30, 27, 3, '2025-05-01', '11:00:00', '12:00:00', 'confirmada', 50.00, 'pagado', NULL, '2025-04-24 01:19:03', '2025-04-24 01:19:03'),
(31, 27, 28, '2025-05-02', '13:00:00', '14:00:00', 'confirmada', 50.00, 'pagado', NULL, '2025-04-24 01:26:27', '2025-04-24 01:26:27'),
(32, 27, 28, '2025-04-29', '13:00:00', '14:00:00', 'confirmada', 50.00, 'pagado', NULL, '2025-04-26 08:16:45', '2025-04-26 08:16:45'),
(33, 27, 28, '2025-05-02', '13:00:00', '14:00:00', 'confirmada', 50.00, 'pagado', NULL, '2025-04-26 08:21:12', '2025-04-26 08:21:12'),
(34, 27, 28, '2025-04-30', '14:00:00', '15:00:00', 'confirmada', 50.00, 'pagado', NULL, '2025-04-26 08:35:28', '2025-04-26 08:35:28'),
(35, 10, 3, '2025-04-30', '13:00:00', '14:00:00', 'pendiente', 50.00, 'pagado', NULL, '2025-04-29 08:51:48', '2025-04-29 08:51:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservations_details`
--

CREATE TABLE `reservations_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reservation_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `payer_id` varchar(255) DEFAULT NULL,
  `payer_email` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `response_json` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reservations_details`
--

INSERT INTO `reservations_details` (`id`, `reservation_id`, `transaction_id`, `payer_id`, `payer_email`, `payment_status`, `amount`, `response_json`, `created_at`, `updated_at`) VALUES
(1, 28, '3S5854757H2869212', '2WP6ERSK999CQ', 'sb-zb4ib38957546@personal.example.com', NULL, 50.00, '{\"id\":\"3S5854757H2869212\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"payee\":{\"email_address\":\"sb-mskpm38923653@business.example.com\",\"merchant_id\":\"2AAAFXKGQFJF2\"},\"shipping\":{\"name\":{\"full_name\":\"Romel Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"14M526616K385551F\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2025-04-17T04:58:02Z\",\"update_time\":\"2025-04-17T04:58:02Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Romel\",\"surname\":\"Doe\"},\"email_address\":\"sb-zb4ib38957546@personal.example.com\",\"payer_id\":\"2WP6ERSK999CQ\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2025-04-17T04:57:55Z\",\"update_time\":\"2025-04-17T04:58:02Z\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/3S5854757H2869212\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2025-04-17 09:58:02', '2025-04-17 09:58:02'),
(2, 29, '4BV42718H41487640', '2WP6ERSK999CQ', 'sb-zb4ib38957546@personal.example.com', NULL, 50.00, '{\"id\":\"4BV42718H41487640\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"payee\":{\"email_address\":\"sb-mskpm38923653@business.example.com\",\"merchant_id\":\"2AAAFXKGQFJF2\"},\"shipping\":{\"name\":{\"full_name\":\"Romel Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"04168705PC686210E\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2025-04-17T05:01:32Z\",\"update_time\":\"2025-04-17T05:01:32Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Romel\",\"surname\":\"Doe\"},\"email_address\":\"sb-zb4ib38957546@personal.example.com\",\"payer_id\":\"2WP6ERSK999CQ\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2025-04-17T05:01:24Z\",\"update_time\":\"2025-04-17T05:01:32Z\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/4BV42718H41487640\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2025-04-17 10:01:32', '2025-04-17 10:01:32'),
(3, 30, '139909277K843000F', '2WP6ERSK999CQ', 'sb-zb4ib38957546@personal.example.com', NULL, 50.00, '{\"id\":\"139909277K843000F\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"payee\":{\"email_address\":\"sb-mskpm38923653@business.example.com\",\"merchant_id\":\"2AAAFXKGQFJF2\"},\"shipping\":{\"name\":{\"full_name\":\"Romel Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"0A986297T28684008\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2025-04-23T20:19:06Z\",\"update_time\":\"2025-04-23T20:19:06Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Romel\",\"surname\":\"Doe\"},\"email_address\":\"sb-zb4ib38957546@personal.example.com\",\"payer_id\":\"2WP6ERSK999CQ\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2025-04-23T20:18:35Z\",\"update_time\":\"2025-04-23T20:19:06Z\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/139909277K843000F\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2025-04-24 01:19:03', '2025-04-24 01:19:03'),
(4, 31, '1B030680CW7441610', '2WP6ERSK999CQ', 'sb-zb4ib38957546@personal.example.com', NULL, 50.00, '{\"id\":\"1B030680CW7441610\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"payee\":{\"email_address\":\"sb-mskpm38923653@business.example.com\",\"merchant_id\":\"2AAAFXKGQFJF2\"},\"shipping\":{\"name\":{\"full_name\":\"Romel Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"3V596131LM0997027\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2025-04-23T20:26:30Z\",\"update_time\":\"2025-04-23T20:26:30Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Romel\",\"surname\":\"Doe\"},\"email_address\":\"sb-zb4ib38957546@personal.example.com\",\"payer_id\":\"2WP6ERSK999CQ\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2025-04-23T20:26:20Z\",\"update_time\":\"2025-04-23T20:26:30Z\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/1B030680CW7441610\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2025-04-24 01:26:27', '2025-04-24 01:26:27'),
(5, 32, '63V88951T7938513U', '2WP6ERSK999CQ', 'sb-zb4ib38957546@personal.example.com', NULL, 50.00, '{\"id\":\"63V88951T7938513U\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"payee\":{\"email_address\":\"sb-mskpm38923653@business.example.com\",\"merchant_id\":\"2AAAFXKGQFJF2\"},\"shipping\":{\"name\":{\"full_name\":\"Romel Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"9UG22727A1479073Y\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2025-04-26T03:16:47Z\",\"update_time\":\"2025-04-26T03:16:47Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Romel\",\"surname\":\"Doe\"},\"email_address\":\"sb-zb4ib38957546@personal.example.com\",\"payer_id\":\"2WP6ERSK999CQ\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2025-04-26T03:15:55Z\",\"update_time\":\"2025-04-26T03:16:47Z\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/63V88951T7938513U\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2025-04-26 08:16:45', '2025-04-26 08:16:45'),
(6, 33, '9HJ2124621825391W', '2WP6ERSK999CQ', 'sb-zb4ib38957546@personal.example.com', NULL, 50.00, '{\"id\":\"9HJ2124621825391W\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"payee\":{\"email_address\":\"sb-mskpm38923653@business.example.com\",\"merchant_id\":\"2AAAFXKGQFJF2\"},\"shipping\":{\"name\":{\"full_name\":\"Romel Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"9BK57632E48037729\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2025-04-26T03:21:12Z\",\"update_time\":\"2025-04-26T03:21:12Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Romel\",\"surname\":\"Doe\"},\"email_address\":\"sb-zb4ib38957546@personal.example.com\",\"payer_id\":\"2WP6ERSK999CQ\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2025-04-26T03:21:03Z\",\"update_time\":\"2025-04-26T03:21:12Z\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/9HJ2124621825391W\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2025-04-26 08:21:12', '2025-04-26 08:21:12'),
(7, 34, '4X147130AC564172N', '2WP6ERSK999CQ', 'sb-zb4ib38957546@personal.example.com', NULL, 50.00, '{\"id\":\"4X147130AC564172N\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"payee\":{\"email_address\":\"sb-mskpm38923653@business.example.com\",\"merchant_id\":\"2AAAFXKGQFJF2\"},\"shipping\":{\"name\":{\"full_name\":\"Romel Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Lima\",\"admin_area_1\":\"Lima\",\"postal_code\":\"07001\",\"country_code\":\"PE\"}},\"payments\":{\"captures\":[{\"id\":\"6WP08385HE239815Y\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"50.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2025-04-26T03:35:30Z\",\"update_time\":\"2025-04-26T03:35:30Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Romel\",\"surname\":\"Doe\"},\"email_address\":\"sb-zb4ib38957546@personal.example.com\",\"payer_id\":\"2WP6ERSK999CQ\",\"address\":{\"country_code\":\"PE\"}},\"create_time\":\"2025-04-26T03:35:18Z\",\"update_time\":\"2025-04-26T03:35:30Z\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/4X147130AC564172N\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2025-04-26 08:35:28', '2025-04-26 08:35:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', '2025-02-20 00:39:44', '2025-02-20 00:39:44'),
(2, 'Consultor', '2025-02-20 00:39:44', '2025-02-20 00:39:44'),
(3, 'Usuario', '2025-02-20 00:39:44', '2025-02-20 00:39:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2dNkzeM8ViD8EIhglrcpMEpzlGhMbvj6JYVoFs0H', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR05MbDVmZVU1SWo5cXBPMmo0Uk5ZdE5lNTZ6NHdiMmpOdGh2OWF4SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ1OiJodHRwOi8vbG9jYWxob3N0L3Npc3RlbWFzL3Npc3Jlc2VydmFsYXJhdmVsL3B1YmxpYy93ZWxjb21lL2Z1bGxjYWxlbmRhcj9lbmQ9MjAyNS0wNS0xMVQwMCUzQTAwJTNBMDAtMDUlM0EwMCZzdGFydD0yMDI1LTAzLTMwVDAwJTNBMDAlM0EwMC0wNSUzQTAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1745877234),
('IvwqJO4g5O7P1xTntl7YOQ5CA3EQ8UnZOuouVNFB', 27, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQUszNUFhRzhoMjd5YzQxa3ZVTTdXU1YwSjNMQUZkWFdqc2lxa05LcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly9sb2NhbGhvc3Qvc2lzdGVtYXMvc2lzcmVzZXJ2YWxhcmF2ZWwvcHVibGljL2NsaWVudGUvcmVzZXJ2YSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI3O30=', 1745899771);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombres`, `apellidos`, `telefono`, `role_id`, `email`, `foto`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'Admin', '123456789', 1, 'admin@example.com', NULL, '2025-02-20 08:46:43', '$2y$12$y5C/ZXyLoPzPcscb9lJ4nu3YfwxMkAgzfA86X.l4rWFJaR5T2H63e', NULL, '2025-02-20 08:46:40', '2025-03-22 01:32:42', NULL),
(2, 'Amelys', 'Zemlak', '657-302-7861', 1, 'yhermiston@example.com', NULL, '2025-02-20 08:46:43', '$2y$12$H1SXCMB99zZi61Yjz//iSeqGGcwgZP.KFrEa/soxuDLNB2o/QZvEK', 'mtb1wXYSr9hKzm26lTqLRQxiahkJscv2UtrTHUPgAWuC2WlZQPFS7JYrRdvz', '2025-02-20 08:46:44', '2025-03-22 02:13:47', '2025-03-22 02:13:47'),
(3, 'Freida', 'Wyman', '+15205404859', 2, 'lang.lou@example.com', NULL, '2025-02-20 08:46:44', '$2y$12$C8B6VL.FCfQZYT.ePgLz6OkfD2A1ffOX.JUXL/WI9wWA55JeXq03q', 'ZdcHKXcD4mvRcrfvwI2vOxg63wpI31je6EMpYslISQt90XjWAg0btEMNK856', '2025-02-20 08:46:44', '2025-03-25 00:31:40', NULL),
(4, 'Ivy', 'Kuhlman', '906.724.4042', 3, 'jryan@example.org', NULL, '2025-02-20 08:46:44', '$2y$12$h7E866pw0Hoq.oEpPx2Lm.e52QlDxHMQQvMzOiFm.ouRV95Ncr./W', 'Bw3ydPszvH', '2025-02-20 08:46:44', '2025-04-09 00:48:21', NULL),
(5, 'Howard', 'Kuhlman', '+19033516881', 3, 'xmcdermott@example.net', NULL, '2025-02-20 08:46:44', '$2y$12$VsaCE64KF0IqUcoob9JoqOYWetgmN3qXw7DtLVOZE7yD00POV.WFW', 'VBHlD9BDGt8hjGfd28Qha3jnnODTd47mMz08joZlZ6fXE2LUGJn3SiohoYFa', '2025-02-20 08:46:47', '2025-02-20 08:46:47', NULL),
(6, 'Kayley', 'Wolff', '870.725.9746', 3, 'samanta64@example.com', NULL, '2025-02-20 08:46:45', '$2y$12$yCvQgMPnoFA1qEQXQuvp6.XTuebPrHF42wfrurEfAonMKlXOUp3EC', 'IKO6Wj22wp', '2025-02-20 08:46:47', '2025-02-20 08:46:47', NULL),
(7, 'Dedrick', 'Herzog', '+1.478.541.0745', 3, 'parker.kaylie@example.net', NULL, '2025-02-20 08:46:45', '$2y$12$S5C20zCB4eVQLlmaC5UlLu98msiPDPY3qEXTB3wh07NKiDRFhsY/S', '3TRws9pbsI', '2025-02-20 08:46:47', '2025-03-25 00:30:07', '2025-03-25 00:30:07'),
(8, 'Ellsworth', 'Waelchi', '+1 (509) 263-0908', 3, 'lynch.ernesto@example.com', NULL, '2025-02-20 08:46:46', '$2y$12$uyakPtiR6MMQEAm.ixaHQ.T2tZa/t.1KFkEflA7IzLy1Sj6tiE9K.', '84qChdaMrM', '2025-02-20 08:46:47', '2025-03-25 00:31:05', NULL),
(9, 'Bransonsss', 'Okuneva', '1-223-666-3020', 3, 'ursula.mertz@example.com', NULL, '2025-02-20 08:46:46', '$2y$12$B5.kXAffbB0uypxibTXREeE4R0.f0MQ1Jyk/eekR9iiCZPvBl2Dv.', 't9nxW8qMev', '2025-02-20 08:46:47', '2025-03-22 02:15:46', '2025-03-22 02:15:46'),
(10, 'Thaddeus', 'Bartoletti', '+1 (424) 231-7305', 3, 'ulind@example.org', NULL, '2025-02-20 08:46:46', '$2y$12$sYP8G4NYPp4Qgl0XYJd2tu/poRpZIMvJBN9jPu5V4JOtB8jrq1Exq', 'cSVAEVlPBW', '2025-02-20 08:46:47', '2025-02-20 08:46:47', NULL),
(11, 'Pinkie', 'Prohaska', '+1 (253) 896-9258', 3, 'schmidt.luis@example.com', NULL, '2025-02-20 08:46:46', '$2y$12$aG1o.O6JeoewxzlvyEhxIuInKfpCRh447vGXqaSQR/5ZnpmdyRLsW', 'PGKqR9Qhi0', '2025-02-20 08:46:47', '2025-02-20 08:46:47', NULL),
(12, 'Reagan', 'Wilderman', '+1 (678) 552-2925', 3, 'fwehner@example.net', NULL, '2025-02-20 08:46:47', '$2y$12$04vQLdZfgBW.8l3GHyvz5.u3GQNrDuLgB4LW6ly08PDmFjhN87IKa', 'MlIAxpT88I', '2025-02-20 08:46:47', '2025-02-20 08:46:47', NULL),
(13, 'Herminio', 'Nitzsche', '1-307-777-9496', 3, 'lora98@example.net', NULL, '2025-02-20 08:46:47', '$2y$12$PAhClv3r73ApNHxIsChpW.QRyxh/AVmiL9v7y4x4X.E2HDrShibge', 'Cq1vyyd57BnkhFvs5CEz6ngGrBo2RChzTeoGdvOMKRGRlGMI0YwlhSE4IdPY', '2025-02-20 08:46:47', '2025-02-20 08:46:47', NULL),
(14, 'Gregory', 'Bode', '+1 (843) 392-1611', 3, 'lonnie.cassin@example.com', NULL, '2025-02-20 08:46:47', '$2y$12$DFLfVXRHDImf5ElYPRWIJeLPj/MFzyuNl.1thUZzZiZ0fF6njxzuq', 'ETJmwPmHCs', '2025-02-20 08:46:47', '2025-03-25 00:35:24', '2025-03-25 00:35:24'),
(27, 'pro', 'dev', '5199999999', 3, 'user2@gmail.com', 'fotos/ZXILsM1poGdyHyhFTviW9G8VSnN8aJF6NatKRFLJ.png', NULL, '$2y$12$xBHJBOscn4VpHg1BjcjdK.7BrwYqoF5.pBuP8oVVEWNtnwfydN0gi', NULL, '2025-03-22 02:26:21', '2025-03-22 02:26:21', NULL),
(28, 'Amelys', 'Zemlak', '987654322', 2, 'user3@gmail.com', NULL, NULL, '$2y$12$9KXTvkCmeBEnxO3MrYQTWO5ZIdoElQoLl39qrfmJyJNeSjkhozYVq', NULL, '2025-04-04 02:16:17', '2025-04-04 02:16:17', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_user_id_foreign` (`user_id`),
  ADD KEY `reservations_consultand_id_foreign` (`consultant_id`);

--
-- Indices de la tabla `reservations_details`
--
ALTER TABLE `reservations_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_details_reservation_id_foreign` (`reservation_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `reservations_details`
--
ALTER TABLE `reservations_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_consultand_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reservations_details`
--
ALTER TABLE `reservations_details`
  ADD CONSTRAINT `reservations_details_reservation_id_foreign` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

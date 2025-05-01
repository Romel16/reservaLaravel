-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-05-2025 a las 05:21:21
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
(27, 'pro', 'dev', '51990537606', 3, 'user2@gmail.com', 'fotos/ZXILsM1poGdyHyhFTviW9G8VSnN8aJF6NatKRFLJ.png', NULL, '$2y$12$xBHJBOscn4VpHg1BjcjdK.7BrwYqoF5.pBuP8oVVEWNtnwfydN0gi', NULL, '2025-03-22 02:26:21', '2025-03-22 02:26:21', NULL),
(28, 'Amelys', 'Zemlak', '987654322', 2, 'user3@gmail.com', NULL, NULL, '$2y$12$9KXTvkCmeBEnxO3MrYQTWO5ZIdoElQoLl39qrfmJyJNeSjkhozYVq', NULL, '2025-04-04 02:16:17', '2025-04-04 02:16:17', NULL);

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

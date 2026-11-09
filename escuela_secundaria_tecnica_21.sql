-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2026 a las 05:35:32
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
-- Base de datos: `escuela_secundaria_tecnica_21`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  `grupo_id` bigint(20) DEFAULT NULL,
  `semestre` smallint(6) DEFAULT NULL,
  `escuela_procedencia` varchar(255) DEFAULT NULL,
  `periodo_ingreso` varchar(50) DEFAULT NULL,
  `periodo_actual` varchar(50) DEFAULT NULL,
  `situacion` varchar(50) DEFAULT NULL,
  `periodos_validados` int(11) DEFAULT NULL,
  `creditos_acumulados` decimal(6,1) DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'ACTIVO',
  `nss` varchar(30) DEFAULT NULL,
  `alergia` varchar(255) DEFAULT NULL,
  `medicamentos` varchar(255) DEFAULT NULL,
  `datos_personales` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nombres` varchar(120) NOT NULL,
  `apellidos` varchar(120) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `tipo_sangre` varchar(5) DEFAULT NULL,
  `calle_direccion` text DEFAULT NULL,
  `tutor_padre` varchar(255) DEFAULT NULL,
  `tutor_docente_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `usuario_id`, `grupo_id`, `semestre`, `escuela_procedencia`, `periodo_ingreso`, `periodo_actual`, `situacion`, `periodos_validados`, `creditos_acumulados`, `estado`, `nss`, `alergia`, `medicamentos`, `datos_personales`, `created_at`, `updated_at`, `nombres`, `apellidos`, `fecha_nacimiento`, `curp`, `tipo_sangre`, `calle_direccion`, `tutor_padre`, `tutor_docente_id`) VALUES
(1, 4, 2, 2, 'tecnica 52', '2009', '2011', 'regular', NULL, NULL, 'ACTIVO', 'asdasdas', 'polen', 'paracetamol', 'Estudiante aplicado', '2026-02-27 16:50:50', '2026-02-28 00:39:15', 'omar', 'puc', '2006-05-15', 'PUCO080515HDFRRS09', 'O+', '21b entre 34a y 36', 'ricardo puc', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_materia`
--

CREATE TABLE `alumno_materia` (
  `id` bigint(20) NOT NULL,
  `alumno_id` bigint(20) NOT NULL,
  `materia_id` bigint(20) NOT NULL,
  `grupo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno_materia`
--

INSERT INTO `alumno_materia` (`id`, `alumno_id`, `materia_id`, `grupo_id`) VALUES
(74, 1, 18, 2),
(73, 1, 19, 2),
(75, 1, 20, 2),
(69, 1, 21, 2),
(72, 1, 22, 2),
(71, 1, 23, 2),
(68, 1, 24, 2),
(77, 1, 25, 2),
(70, 1, 26, 2),
(76, 1, 27, 2),
(78, 1, 28, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_docente`
--

CREATE TABLE `asistencia_docente` (
  `id` bigint(20) NOT NULL,
  `usuario_docente_id` bigint(20) NOT NULL,
  `materia_id` bigint(20) NOT NULL,
  `alumno_id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'PRESENTE',
  `observaciones` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Volcado de datos para la tabla `asistencia_docente`
--

INSERT INTO `asistencia_docente` (`id`, `usuario_docente_id`, `materia_id`, `alumno_id`, `fecha`, `estado`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 3, 24, 1, '2026-03-23', 'PRESENTE', 'dos minitos tarde', '2026-03-24 03:41:11', '2026-03-24 04:03:26'),
(2, 3, 19, 1, '2026-03-23', 'PRESENTE', '', '2026-03-24 03:48:22', '2026-03-24 03:48:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_logs`
--

CREATE TABLE `auth_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `credential_attempted` varchar(255) DEFAULT NULL,
  `status` enum('success','failed') NOT NULL,
  `error_type` varchar(100) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_logs`
--

INSERT INTO `auth_logs` (`id`, `user_id`, `credential_attempted`, `status`, `error_type`, `ip_address`, `created_at`) VALUES
(1, NULL, 'reyespuc12', 'failed', 'user_not_found', '::1', '2026-02-28 01:12:45'),
(2, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 01:13:52'),
(3, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 01:17:54'),
(4, 1, 'reyespucachac@gmail.com', 'failed', 'wrong_password', '::1', '2026-02-28 01:18:01'),
(5, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 01:18:10'),
(6, 4, 'OMP123', 'failed', 'wrong_password', '::1', '2026-02-28 01:18:26'),
(7, 4, 'OMP123', 'failed', 'wrong_password', '::1', '2026-02-28 01:18:29'),
(8, 4, 'OMP123', 'failed', 'wrong_password', '::1', '2026-02-28 01:18:32'),
(9, 4, 'OMP123', 'failed', 'account_blocked', '::1', '2026-02-28 01:18:41'),
(10, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 01:19:30'),
(11, 4, 'OMP123', 'failed', 'account_blocked', '::1', '2026-02-28 01:19:47'),
(12, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 01:19:58'),
(13, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 01:37:13'),
(14, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 02:08:17'),
(15, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 02:08:38'),
(16, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 02:20:29'),
(17, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 02:30:25'),
(18, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 02:58:08'),
(19, 4, 'OMP123', 'failed', 'wrong_password', '::1', '2026-02-28 02:58:33'),
(20, 4, 'OMP123', 'failed', 'account_blocked', '::1', '2026-02-28 02:59:04'),
(21, 4, 'OMP123', 'failed', 'account_blocked', '::1', '2026-02-28 02:59:23'),
(22, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 02:59:46'),
(23, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 03:07:40'),
(24, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 03:12:20'),
(25, 3, 'ALF123', 'success', NULL, '::1', '2026-02-28 03:13:22'),
(26, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 03:24:09'),
(27, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 03:24:36'),
(28, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 03:26:44'),
(29, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 18:29:19'),
(30, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 18:40:33'),
(31, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 18:51:29'),
(32, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 18:54:19'),
(33, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 19:05:17'),
(34, NULL, 'OPM123', 'failed', 'user_not_found', '::1', '2026-02-28 19:22:12'),
(35, NULL, 'OPM123', 'failed', 'user_not_found', '::1', '2026-02-28 19:22:19'),
(36, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 19:22:27'),
(37, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 19:24:38'),
(38, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 19:27:04'),
(39, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 19:34:16'),
(40, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 19:37:38'),
(41, NULL, 'OPM123', 'failed', 'user_not_found', '::1', '2026-02-28 19:59:55'),
(42, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 20:00:08'),
(43, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 20:06:52'),
(44, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 20:09:27'),
(45, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 20:10:44'),
(46, 5, 'TAS124', 'success', NULL, '::1', '2026-02-28 20:11:54'),
(47, 4, 'OMP123', 'failed', 'wrong_password', '::1', '2026-02-28 20:17:14'),
(48, 4, 'OMP123', 'failed', 'account_blocked', '::1', '2026-02-28 20:17:18'),
(49, 4, 'OMP123', 'failed', 'account_blocked', '::1', '2026-02-28 20:17:20'),
(50, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 20:17:41'),
(51, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 20:18:20'),
(52, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 20:28:16'),
(53, 5, 'TAS124', 'success', NULL, '::1', '2026-02-28 21:13:38'),
(54, 5, 'TAS124', 'success', NULL, '::1', '2026-02-28 21:57:51'),
(55, 5, 'TAS124', 'success', NULL, '::1', '2026-02-28 23:11:24'),
(56, 5, 'TAS124', 'success', NULL, '::1', '2026-02-28 23:26:12'),
(57, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 23:26:55'),
(58, 5, 'TAS124', 'success', NULL, '::1', '2026-02-28 23:32:32'),
(59, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 23:32:54'),
(60, 5, 'TAS124', 'success', NULL, '::1', '2026-02-28 23:33:27'),
(61, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 23:38:35'),
(62, 5, 'TAS124', 'success', NULL, '::1', '2026-02-28 23:44:07'),
(63, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-02-28 23:46:42'),
(64, 5, 'TAS124', 'success', NULL, '::1', '2026-02-28 23:47:16'),
(65, 4, 'OMP123', 'success', NULL, '::1', '2026-02-28 23:47:35'),
(66, 5, 'TAS124', 'success', NULL, '::1', '2026-02-28 23:48:23'),
(67, 5, 'TAS124', 'success', NULL, '::1', '2026-02-28 23:49:26'),
(68, 5, 'TAS124', 'success', NULL, '::1', '2026-03-01 00:21:29'),
(69, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-01 00:23:49'),
(70, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-01 00:34:18'),
(71, 5, 'TAS124', 'success', NULL, '::1', '2026-03-01 00:35:24'),
(72, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-01 00:36:15'),
(73, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-01 00:41:42'),
(74, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-01 00:46:33'),
(75, 5, 'TAS124', 'success', NULL, '::1', '2026-03-01 00:47:10'),
(76, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-06 01:24:17'),
(77, 1, 'reyespucachac@gmail.com', 'failed', 'wrong_password', '::1', '2026-03-08 01:37:34'),
(78, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-08 01:37:39'),
(79, NULL, 'TAS123', 'failed', 'user_not_found', '::1', '2026-03-08 01:39:43'),
(80, NULL, 'TAS123', 'failed', 'user_not_found', '::1', '2026-03-08 01:39:51'),
(81, 5, 'TAS124', 'success', NULL, '::1', '2026-03-08 01:39:59'),
(82, 4, 'OMP123', 'success', NULL, '::1', '2026-03-08 01:40:44'),
(83, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-09 23:15:59'),
(84, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-09 23:39:56'),
(85, 4, 'OMP123', 'success', NULL, '::1', '2026-03-09 23:40:12'),
(86, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-10 23:43:02'),
(87, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 01:22:04'),
(88, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 01:22:46'),
(89, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 01:23:23'),
(90, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 01:24:00'),
(91, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 01:24:55'),
(92, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 01:50:56'),
(93, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 01:58:54'),
(94, NULL, 'omarachac123@gmail.com', 'failed', 'user_not_found', '::1', '2026-03-24 02:00:24'),
(95, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 02:00:43'),
(96, NULL, 'OMP12', 'failed', 'user_not_found', '::1', '2026-03-24 02:01:09'),
(97, NULL, 'OMP12', 'failed', 'user_not_found', '::1', '2026-03-24 02:01:15'),
(98, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 02:01:22'),
(99, 4, 'OMP123', 'success', NULL, '::1', '2026-03-24 02:01:52'),
(100, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 02:23:17'),
(101, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 03:25:17'),
(102, 3, 'ALF123', 'success', NULL, '::1', '2026-03-24 03:26:54'),
(103, 4, 'OMP123', 'failed', 'wrong_password', '::1', '2026-03-24 03:27:26'),
(104, 4, 'OMP123', 'success', NULL, '::1', '2026-03-24 03:27:29'),
(105, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 03:28:22'),
(106, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 03:42:09'),
(107, 1, 'reyespucachac@gmail.com', 'success', NULL, '::1', '2026-03-24 03:45:35'),
(108, 3, 'ALF123', 'success', NULL, '::1', '2026-03-24 03:46:14'),
(109, 3, 'ALF123', 'success', NULL, '::1', '2026-03-24 03:56:32'),
(110, 3, 'ALF123', 'success', NULL, '::1', '2026-03-24 04:02:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blocked_ips`
--

CREATE TABLE `blocked_ips` (
  `ip_address` varchar(45) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT 1,
  `blocked_until` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blocked_users`
--

CREATE TABLE `blocked_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `blocked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `unblocked_at` timestamp NULL DEFAULT NULL,
  `unblocked_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `blocked_users`
--

INSERT INTO `blocked_users` (`id`, `user_id`, `reason`, `blocked_at`, `unblocked_at`, `unblocked_by`) VALUES
(1, 4, 'Múltiples intentos fallidos de inicio de sesión', '2026-02-28 20:17:14', '2026-02-28 20:18:07', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_parcial`
--

CREATE TABLE `calificacion_parcial` (
  `id` bigint(20) NOT NULL,
  `alumno_materia_id` bigint(20) NOT NULL,
  `parcial_id` bigint(20) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'NO_CURSADO',
  `calificacion` smallint(6) NOT NULL DEFAULT 0
) ;

--
-- Volcado de datos para la tabla `calificacion_parcial`
--

INSERT INTO `calificacion_parcial` (`id`, `alumno_materia_id`, `parcial_id`, `estado`, `calificacion`) VALUES
(1, 68, 1, 'CALIFICADO', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conducta_reporte`
--

CREATE TABLE `conducta_reporte` (
  `id` bigint(20) NOT NULL,
  `alumno_materia_id` bigint(20) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credencial`
--

CREATE TABLE `credencial` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `email_matricula` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultimo_acceso` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `credencial`
--

INSERT INTO `credencial` (`id`, `usuario_id`, `email_matricula`, `password_hash`, `fecha_creacion`, `ultimo_acceso`) VALUES
(1, 1, 'reyespucachac@gmail.com', 'reyespuc12', '2026-02-26 22:24:14', NULL),
(2, 3, 'ALF123', 'reyespuc12', '2026-02-27 04:59:45', NULL),
(3, 4, 'OMP123', 'omar123', '2026-02-27 15:53:37', NULL),
(4, 5, 'TAS124', 'trabajosocial123', '2026-02-28 20:11:35', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente_materia`
--

CREATE TABLE `docente_materia` (
  `id` bigint(20) NOT NULL,
  `usuario_docente_id` bigint(20) NOT NULL,
  `materia_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `docente_materia`
--

INSERT INTO `docente_materia` (`id`, `usuario_docente_id`, `materia_id`, `created_at`) VALUES
(69, 3, 13, '2026-03-24 03:45:55'),
(70, 3, 9, '2026-03-24 03:45:55'),
(71, 3, 15, '2026-03-24 03:45:55'),
(72, 3, 12, '2026-03-24 03:45:55'),
(73, 3, 11, '2026-03-24 03:45:55'),
(74, 3, 7, '2026-03-24 03:45:55'),
(75, 3, 6, '2026-03-24 03:45:55'),
(76, 3, 8, '2026-03-24 03:45:55'),
(77, 3, 16, '2026-03-24 03:45:55'),
(78, 3, 14, '2026-03-24 03:45:55'),
(79, 3, 17, '2026-03-24 03:45:55'),
(80, 3, 24, '2026-03-24 03:45:55'),
(81, 3, 21, '2026-03-24 03:45:55'),
(82, 3, 26, '2026-03-24 03:45:55'),
(83, 3, 23, '2026-03-24 03:45:55'),
(84, 3, 22, '2026-03-24 03:45:55'),
(85, 3, 19, '2026-03-24 03:45:55'),
(86, 3, 18, '2026-03-24 03:45:55'),
(87, 3, 20, '2026-03-24 03:45:55'),
(88, 3, 27, '2026-03-24 03:45:55'),
(89, 3, 25, '2026-03-24 03:45:55'),
(90, 3, 28, '2026-03-24 03:45:55'),
(91, 3, 34, '2026-03-24 03:45:55'),
(92, 3, 31, '2026-03-24 03:45:55'),
(93, 3, 36, '2026-03-24 03:45:55'),
(94, 3, 29, '2026-03-24 03:45:55'),
(95, 3, 33, '2026-03-24 03:45:55'),
(96, 3, 32, '2026-03-24 03:45:55'),
(97, 3, 3, '2026-03-24 03:45:55'),
(98, 3, 30, '2026-03-24 03:45:55'),
(99, 3, 37, '2026-03-24 03:45:55'),
(100, 3, 35, '2026-03-24 03:45:55'),
(101, 3, 38, '2026-03-24 03:45:55'),
(102, 3, 10, '2026-03-24 03:45:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

CREATE TABLE `expediente` (
  `id` bigint(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `referencia_id` bigint(20) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id`, `nombre`) VALUES
(1, 'Primero'),
(2, 'Segundo'),
(3, 'Tercero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado_horario_materia`
--

CREATE TABLE `grado_horario_materia` (
  `id` bigint(20) NOT NULL,
  `grado_id` bigint(20) NOT NULL,
  `materia_id` bigint(20) NOT NULL,
  `dia_semana` smallint(6) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Volcado de datos para la tabla `grado_horario_materia`
--

INSERT INTO `grado_horario_materia` (`id`, `grado_id`, `materia_id`, `dia_semana`, `hora_inicio`, `hora_fin`, `created_at`, `updated_at`) VALUES
(116, 1, 16, 1, '07:00:00', '08:00:00', '2026-03-24 01:56:23', '2026-03-24 01:56:23'),
(117, 1, 6, 1, '08:00:00', '09:00:00', '2026-03-24 01:56:23', '2026-03-24 01:56:23'),
(118, 1, 16, 1, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(119, 1, 8, 1, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(120, 1, 16, 1, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(121, 1, 6, 1, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(122, 1, 16, 1, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(123, 1, 8, 1, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(124, 1, 9, 2, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(125, 1, 11, 2, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(126, 1, 16, 2, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(127, 1, 6, 2, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(128, 1, 7, 2, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(129, 1, 8, 2, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(130, 1, 9, 2, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(131, 1, 11, 2, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(132, 1, 13, 3, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(133, 1, 16, 3, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(134, 1, 6, 3, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(135, 1, 7, 3, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(136, 1, 8, 3, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(137, 1, 9, 3, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(138, 1, 10, 3, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(139, 1, 11, 3, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(140, 1, 12, 4, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(141, 1, 13, 4, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(142, 1, 15, 4, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(143, 1, 16, 4, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(144, 1, 6, 4, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(145, 1, 7, 4, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(146, 1, 8, 4, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(147, 1, 9, 4, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(148, 1, 10, 5, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(149, 1, 11, 5, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(150, 1, 12, 5, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(151, 1, 13, 5, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(152, 1, 14, 5, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(153, 1, 15, 5, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(154, 1, 16, 5, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(155, 1, 17, 5, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(156, 2, 27, 1, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(157, 2, 21, 1, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(158, 2, 27, 1, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(159, 2, 18, 1, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(160, 2, 27, 1, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(161, 2, 20, 1, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(162, 2, 21, 1, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(163, 2, 27, 1, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(164, 2, 18, 2, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(165, 2, 20, 2, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(166, 2, 21, 2, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(167, 2, 22, 2, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(168, 2, 27, 2, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(169, 2, 18, 2, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(170, 2, 19, 2, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(171, 2, 20, 2, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(172, 2, 21, 3, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(173, 2, 22, 3, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(174, 2, 24, 3, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(175, 2, 27, 3, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(176, 2, 18, 3, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(177, 2, 19, 3, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(178, 2, 20, 3, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(179, 2, 21, 3, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(180, 2, 22, 4, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(181, 2, 23, 4, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(182, 2, 24, 4, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(183, 2, 26, 4, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(184, 2, 27, 4, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(185, 2, 18, 4, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(186, 2, 19, 4, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(187, 2, 20, 4, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(188, 2, 21, 5, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(189, 2, 22, 5, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(190, 2, 23, 5, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(191, 2, 24, 5, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(192, 2, 25, 5, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(193, 2, 26, 5, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(194, 2, 27, 5, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(195, 2, 28, 5, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(196, 3, 37, 1, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(197, 3, 31, 1, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(198, 3, 37, 1, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(199, 3, 29, 1, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(200, 3, 37, 1, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(201, 3, 3, 1, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(202, 3, 31, 1, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(203, 3, 37, 1, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(204, 3, 29, 2, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(205, 3, 3, 2, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(206, 3, 31, 2, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(207, 3, 32, 2, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(208, 3, 37, 2, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(209, 3, 29, 2, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(210, 3, 30, 2, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(211, 3, 3, 2, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(212, 3, 31, 3, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(213, 3, 32, 3, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(214, 3, 34, 3, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(215, 3, 37, 3, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(216, 3, 29, 3, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(217, 3, 30, 3, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(218, 3, 3, 3, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(219, 3, 31, 3, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(220, 3, 32, 4, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(221, 3, 33, 4, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(222, 3, 34, 4, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(223, 3, 36, 4, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(224, 3, 37, 4, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(225, 3, 29, 4, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(226, 3, 30, 4, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(227, 3, 3, 4, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(228, 3, 31, 5, '07:00:00', '08:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(229, 3, 32, 5, '08:00:00', '09:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(230, 3, 33, 5, '09:00:00', '10:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(231, 3, 34, 5, '10:00:00', '11:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(232, 3, 35, 5, '11:00:00', '12:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(233, 3, 36, 5, '12:00:00', '13:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(234, 3, 37, 5, '13:00:00', '14:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24'),
(235, 3, 38, 5, '14:00:00', '15:00:00', '2026-03-24 01:56:24', '2026-03-24 01:56:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` bigint(20) NOT NULL,
  `grado_id` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `grado_id`, `nombre`) VALUES
(2, 2, 'A'),
(3, 2, 'B'),
(4, 2, 'C'),
(5, 2, 'D'),
(6, 2, 'E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_backup`
--

CREATE TABLE `historial_backup` (
  `id` bigint(20) NOT NULL,
  `nombre_backup` varchar(255) NOT NULL,
  `ruta_archivo` varchar(500) DEFAULT NULL,
  `tipos_datos` varchar(500) DEFAULT NULL,
  `cantidad_registros` int(11) DEFAULT NULL,
  `tamanio_bytes` bigint(20) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(20) NOT NULL DEFAULT 'COMPLETADO',
  `descripcion` text DEFAULT NULL,
  `realizado_por` varchar(150) DEFAULT 'Sistema'
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_restauracion`
--

CREATE TABLE `historial_restauracion` (
  `id` bigint(20) NOT NULL,
  `id_backup` bigint(20) NOT NULL,
  `tipos_datos` varchar(500) DEFAULT NULL,
  `cantidad_registros` int(11) DEFAULT NULL,
  `fecha_restauracion` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(20) NOT NULL DEFAULT 'COMPLETADO',
  `realizado_por` varchar(150) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id` bigint(20) NOT NULL,
  `dia_semana` smallint(6) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `justificante`
--

CREATE TABLE `justificante` (
  `id` bigint(20) NOT NULL,
  `expediente_id` bigint(20) NOT NULL,
  `creado_por_usuario_id` bigint(20) NOT NULL,
  `validado_por_usuario_id` bigint(20) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE'
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex_materia`
--

CREATE TABLE `kardex_materia` (
  `id` bigint(20) NOT NULL,
  `alumno_materia_id` bigint(20) NOT NULL,
  `calificacion_final` smallint(6) NOT NULL DEFAULT 0,
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE'
) ;

--
-- Volcado de datos para la tabla `kardex_materia`
--

INSERT INTO `kardex_materia` (`id`, `alumno_materia_id`, `calificacion_final`, `estado`) VALUES
(1, 68, 0, 'PENDIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro`
--

CREATE TABLE `maestro` (
  `id` bigint(20) NOT NULL,
  `nombres` varchar(120) NOT NULL,
  `apellidos` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `maestro`
--

INSERT INTO `maestro` (`id`, `nombres`, `apellidos`) VALUES
(1, 'Carlos', 'García López'),
(2, 'María', 'Rodríguez Pérez'),
(3, 'Juan', 'Martínez Ruiz'),
(4, 'Laura', 'López García'),
(5, 'Pedro', 'Fernández Díaz'),
(6, 'Reyes Alfonso', 'Antonio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro_materia_horario`
--

CREATE TABLE `maestro_materia_horario` (
  `id` bigint(20) NOT NULL,
  `maestro_id` bigint(20) NOT NULL,
  `materia_id` bigint(20) NOT NULL,
  `grupo_id` bigint(20) NOT NULL,
  `horario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id` bigint(20) NOT NULL,
  `grado_id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `clave` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `grado_id`, `nombre`, `clave`) VALUES
(3, 3, 'MATEMATICAS', 'MAT1234'),
(6, 1, 'Lengua materna (Español)', 'ESP1'),
(7, 1, 'Lengua extranjera (Inglés)', 'ING1'),
(8, 1, 'Matemáticas', 'MAT1'),
(9, 1, 'Ciencia y Tecnología (Biología)', 'BIO1'),
(10, 1, 'Historia', 'HIS1'),
(11, 1, 'Geografía', 'GEO1'),
(12, 1, 'Formación Cívica y Ética', 'FCE1'),
(13, 1, 'Artes', 'ART1'),
(14, 1, 'Tutoría y Educación Socioemocional', 'TUT1'),
(15, 1, 'Educación física', 'EFI1'),
(16, 1, 'Tecnología', 'TEC1'),
(17, 1, 'Vida Saludable', 'VS1'),
(18, 2, 'Lengua materna (Español)', 'ESP2'),
(19, 2, 'Lengua extranjera (Inglés)', 'ING2'),
(20, 2, 'Matemáticas II', 'MAT2'),
(21, 2, 'Ciencia y Tecnología (Física)', 'FIS2'),
(22, 2, 'Historia', 'HIS2'),
(23, 2, 'Formación Cívica y Ética', 'FCE2'),
(24, 2, 'Artes', 'ART2'),
(25, 2, 'Tutoría y Educación Socioemocional', 'TUT2'),
(26, 2, 'Educación física II', 'EFI2'),
(27, 2, 'Tecnología', 'TEC2'),
(28, 2, 'Vida Saludable', 'VS2'),
(29, 3, 'Español', 'ESP3'),
(30, 3, 'Segunda Lengua (Inglés)', 'ING3'),
(31, 3, 'Ciencia III (Química)', 'QUI3'),
(32, 3, 'Historia II', 'HIS3'),
(33, 3, 'Formación Cívica y Ética II', 'FCE3'),
(34, 3, 'Artes III', 'ART3'),
(35, 3, 'Tutoría', 'TUT3'),
(36, 3, 'Educación física III', 'EFI3'),
(37, 3, 'Tecnología', 'TEC3'),
(38, 3, 'Vida Saludable', 'VS3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_parcial`
--

CREATE TABLE `materia_parcial` (
  `id` bigint(20) NOT NULL,
  `materia_id` bigint(20) NOT NULL,
  `parcial_id` bigint(20) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parcial`
--

CREATE TABLE `parcial` (
  `id` bigint(20) NOT NULL,
  `numero` smallint(6) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `bloqueado` tinyint(1) NOT NULL DEFAULT 0
) ;

--
-- Volcado de datos para la tabla `parcial`
--

INSERT INTO `parcial` (`id`, `numero`, `nombre`, `bloqueado`) VALUES
(1, 1, 'Primer Parcial', 0),
(2, 2, 'Segundo Parcial', 0),
(3, 3, 'Tercer Parcial', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes_academicos`
--

CREATE TABLE `reportes_academicos` (
  `id` bigint(20) NOT NULL,
  `docente_usuario_id` bigint(20) NOT NULL,
  `trabajo_social_usuario_id` bigint(20) DEFAULT NULL,
  `alumno_id` bigint(20) NOT NULL,
  `materia_id` bigint(20) NOT NULL,
  `promedio_actual` decimal(5,2) NOT NULL,
  `calificacion_final` decimal(5,2) DEFAULT NULL,
  `asunto` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_atencion` timestamp NULL DEFAULT NULL,
  `comentario_trabajo_social` text DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `reportes_academicos`
--

INSERT INTO `reportes_academicos` (`id`, `docente_usuario_id`, `trabajo_social_usuario_id`, `alumno_id`, `materia_id`, `promedio_actual`, `calificacion_final`, `asunto`, `descripcion`, `estado`, `fecha_creacion`, `fecha_atencion`, `comentario_trabajo_social`) VALUES
(1, 3, 5, 1, 24, 8.50, NULL, 'Seguimiento estudiante', 'El alumno presenta areas de oportunidad en la materia.', 'ATENDIDO', '2026-03-24 02:51:49', '2026-03-24 02:58:32', 'Se cito al alumno y se tomo nota del seguimiento.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes_sistema`
--

CREATE TABLE `reportes_sistema` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `tipo_usuario` varchar(40) NOT NULL,
  `tipo_reporte` varchar(50) NOT NULL,
  `asunto` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE',
  `respuesta_admin` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_respuesta` timestamp NULL DEFAULT NULL,
  `leido` tinyint(1) NOT NULL DEFAULT 0
) ;

--
-- Volcado de datos para la tabla `reportes_sistema`
--

INSERT INTO `reportes_sistema` (`id`, `usuario_id`, `tipo_usuario`, `tipo_reporte`, `asunto`, `descripcion`, `estado`, `respuesta_admin`, `fecha_creacion`, `fecha_respuesta`, `leido`) VALUES
(1, 5, 'Trabajo Social', 'solicitud_general', 'eliminacion de datos', 'solicitro una baja de datos para el reporte de un alumno el cual estan mal sus datos', 'ARCHIVADO', 'si claro', '2026-02-28 23:38:05', '2026-03-01 00:46:49', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_falta`
--

CREATE TABLE `reporte_falta` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `descripcion` text NOT NULL,
  `archivo_justificante` longtext DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE',
  `validado_por_usuario_id` bigint(20) DEFAULT NULL,
  `comentario_trabajo_social` text DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(3, 'Alumno'),
(2, 'Docente'),
(4, 'Trabajo Social');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_eliminacion_reporte`
--

CREATE TABLE `solicitud_eliminacion_reporte` (
  `id` bigint(20) NOT NULL,
  `reporte_id` bigint(20) NOT NULL,
  `tipo_reporte` varchar(50) NOT NULL,
  `solicitante_id` bigint(20) NOT NULL,
  `motivo_eliminacion` text NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE',
  `fecha_solicitud` timestamp NOT NULL DEFAULT current_timestamp(),
  `respuesta_admin` text DEFAULT NULL,
  `procesado_por_admin_id` bigint(20) DEFAULT NULL,
  `fecha_procesado` timestamp NULL DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `solicitud_eliminacion_reporte`
--

INSERT INTO `solicitud_eliminacion_reporte` (`id`, `reporte_id`, `tipo_reporte`, `solicitante_id`, `motivo_eliminacion`, `estado`, `fecha_solicitud`, `respuesta_admin`, `procesado_por_admin_id`, `fecha_procesado`) VALUES
(1, 3, 'reporte_falta', 5, 'solicito eliminacion ya que esta erroneo los datos ', 'APROBADA', '2026-03-01 00:23:25', '', 1, '2026-03-01 00:42:32'),
(2, 2, 'reporte_falta', 5, 'solicito la eliminacion de este reporte', 'APROBADA', '2026-03-01 00:36:06', 'con gusto se elimanra el reporte', 1, '2026-03-01 00:42:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_login_ips`
--

CREATE TABLE `user_login_ips` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login_count` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_login_ips`
--

INSERT INTO `user_login_ips` (`id`, `user_id`, `ip_address`, `last_login`, `login_count`) VALUES
(1, 1, '::1', '2026-03-24 03:45:35', 44),
(8, 4, '::1', '2026-03-24 03:27:29', 23),
(15, 3, '::1', '2026-03-24 04:02:35', 5),
(33, 5, '::1', '2026-03-08 01:39:59', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL,
  `rol_id` bigint(20) NOT NULL,
  `nombres` varchar(120) NOT NULL,
  `apellidos` varchar(120) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `rol_id`, `nombres`, `apellidos`, `activo`) VALUES
(1, 1, 'Administrador', 'Sistema', 1),
(2, 0, '[value-3]', '[value-4]', 0),
(3, 2, 'reyes alfonso', 'antonio', 1),
(4, 3, 'omar', 'puc', 1),
(5, 4, 'Trabajo', 'Social', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_alumno_usuario` (`usuario_id`),
  ADD UNIQUE KEY `idx_alumno_curp` (`curp`),
  ADD KEY `fk_alumno_tutor_docente` (`tutor_docente_id`),
  ADD KEY `fk_alumno_grupo` (`grupo_id`);

--
-- Indices de la tabla `alumno_materia`
--
ALTER TABLE `alumno_materia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alumno_id` (`alumno_id`,`materia_id`,`grupo_id`),
  ADD KEY `materia_id` (`materia_id`),
  ADD KEY `grupo_id` (`grupo_id`);

--
-- Indices de la tabla `asistencia_docente`
--
ALTER TABLE `asistencia_docente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_asistencia` (`materia_id`,`alumno_id`,`fecha`),
  ADD KEY `usuario_docente_id` (`usuario_docente_id`),
  ADD KEY `alumno_id` (`alumno_id`);

--
-- Indices de la tabla `auth_logs`
--
ALTER TABLE `auth_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_ip` (`ip_address`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indices de la tabla `blocked_ips`
--
ALTER TABLE `blocked_ips`
  ADD PRIMARY KEY (`ip_address`),
  ADD KEY `idx_blocked_until` (`blocked_until`);

--
-- Indices de la tabla `blocked_users`
--
ALTER TABLE `blocked_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_blocked_at` (`blocked_at`);

--
-- Indices de la tabla `calificacion_parcial`
--
ALTER TABLE `calificacion_parcial`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alumno_materia_id` (`alumno_materia_id`,`parcial_id`),
  ADD KEY `parcial_id` (`parcial_id`);

--
-- Indices de la tabla `conducta_reporte`
--
ALTER TABLE `conducta_reporte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumno_materia_id` (`alumno_materia_id`);

--
-- Indices de la tabla `credencial`
--
ALTER TABLE `credencial`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_matricula` (`email_matricula`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `docente_materia`
--
ALTER TABLE `docente_materia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_docente_materia` (`usuario_docente_id`,`materia_id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indices de la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `grado_horario_materia`
--
ALTER TABLE `grado_horario_materia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_grado_hora` (`grado_id`,`dia_semana`,`hora_inicio`),
  ADD UNIQUE KEY `unique_grado_materia_hora` (`grado_id`,`materia_id`,`dia_semana`,`hora_inicio`,`hora_fin`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `grado_id` (`grado_id`,`nombre`);

--
-- Indices de la tabla `historial_backup`
--
ALTER TABLE `historial_backup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fecha` (`fecha_creacion`),
  ADD KEY `idx_estado` (`estado`);

--
-- Indices de la tabla `historial_restauracion`
--
ALTER TABLE `historial_restauracion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_backup` (`id_backup`),
  ADD KEY `idx_fecha` (`fecha_restauracion`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `justificante`
--
ALTER TABLE `justificante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expediente_id` (`expediente_id`),
  ADD KEY `creado_por_usuario_id` (`creado_por_usuario_id`),
  ADD KEY `validado_por_usuario_id` (`validado_por_usuario_id`);

--
-- Indices de la tabla `kardex_materia`
--
ALTER TABLE `kardex_materia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alumno_materia_id` (`alumno_materia_id`);

--
-- Indices de la tabla `maestro`
--
ALTER TABLE `maestro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `maestro_materia_horario`
--
ALTER TABLE `maestro_materia_horario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `maestro_id` (`maestro_id`,`materia_id`,`grupo_id`,`horario_id`),
  ADD UNIQUE KEY `materia_id` (`materia_id`,`grupo_id`,`horario_id`),
  ADD KEY `grupo_id` (`grupo_id`),
  ADD KEY `horario_id` (`horario_id`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `grado_id` (`grado_id`,`nombre`);

--
-- Indices de la tabla `materia_parcial`
--
ALTER TABLE `materia_parcial`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `materia_id` (`materia_id`,`parcial_id`),
  ADD KEY `parcial_id` (`parcial_id`);

--
-- Indices de la tabla `parcial`
--
ALTER TABLE `parcial`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`);

--
-- Indices de la tabla `reportes_academicos`
--
ALTER TABLE `reportes_academicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docente_usuario_id` (`docente_usuario_id`),
  ADD KEY `trabajo_social_usuario_id` (`trabajo_social_usuario_id`),
  ADD KEY `materia_id` (`materia_id`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_alumno` (`alumno_id`);

--
-- Indices de la tabla `reportes_sistema`
--
ALTER TABLE `reportes_sistema`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_tipo_usuario` (`tipo_usuario`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_leido` (`leido`);

--
-- Indices de la tabla `reporte_falta`
--
ALTER TABLE `reporte_falta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `validado_por_usuario_id` (`validado_por_usuario_id`),
  ADD KEY `idx_usuario_id` (`usuario_id`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_fecha_creacion` (`fecha_creacion`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `solicitud_eliminacion_reporte`
--
ALTER TABLE `solicitud_eliminacion_reporte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solicitante_id` (`solicitante_id`),
  ADD KEY `procesado_por_admin_id` (`procesado_por_admin_id`);

--
-- Indices de la tabla `user_login_ips`
--
ALTER TABLE `user_login_ips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_ip` (`user_id`,`ip_address`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_last_login` (`last_login`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `alumno_materia`
--
ALTER TABLE `alumno_materia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT de la tabla `asistencia_docente`
--
ALTER TABLE `asistencia_docente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_logs`
--
ALTER TABLE `auth_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de la tabla `blocked_users`
--
ALTER TABLE `blocked_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `calificacion_parcial`
--
ALTER TABLE `calificacion_parcial`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conducta_reporte`
--
ALTER TABLE `conducta_reporte`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credencial`
--
ALTER TABLE `credencial`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `docente_materia`
--
ALTER TABLE `docente_materia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `grado_horario_materia`
--
ALTER TABLE `grado_horario_materia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `historial_backup`
--
ALTER TABLE `historial_backup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_restauracion`
--
ALTER TABLE `historial_restauracion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `justificante`
--
ALTER TABLE `justificante`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kardex_materia`
--
ALTER TABLE `kardex_materia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maestro`
--
ALTER TABLE `maestro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `maestro_materia_horario`
--
ALTER TABLE `maestro_materia_horario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `materia_parcial`
--
ALTER TABLE `materia_parcial`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parcial`
--
ALTER TABLE `parcial`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reportes_academicos`
--
ALTER TABLE `reportes_academicos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reportes_sistema`
--
ALTER TABLE `reportes_sistema`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_falta`
--
ALTER TABLE `reporte_falta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `solicitud_eliminacion_reporte`
--
ALTER TABLE `solicitud_eliminacion_reporte`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_login_ips`
--
ALTER TABLE `user_login_ips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`),
  ADD CONSTRAINT `fk_alumno_grupo` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`),
  ADD CONSTRAINT `fk_alumno_tutor_docente` FOREIGN KEY (`tutor_docente_id`) REFERENCES `maestro` (`id`),
  ADD CONSTRAINT `fk_alumno_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `alumno_materia`
--
ALTER TABLE `alumno_materia`
  ADD CONSTRAINT `alumno_materia_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`),
  ADD CONSTRAINT `alumno_materia_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`),
  ADD CONSTRAINT `alumno_materia_ibfk_3` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`);

--
-- Filtros para la tabla `asistencia_docente`
--
ALTER TABLE `asistencia_docente`
  ADD CONSTRAINT `asistencia_docente_ibfk_1` FOREIGN KEY (`usuario_docente_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asistencia_docente_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asistencia_docente_ibfk_3` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `calificacion_parcial`
--
ALTER TABLE `calificacion_parcial`
  ADD CONSTRAINT `calificacion_parcial_ibfk_1` FOREIGN KEY (`alumno_materia_id`) REFERENCES `alumno_materia` (`id`),
  ADD CONSTRAINT `calificacion_parcial_ibfk_2` FOREIGN KEY (`parcial_id`) REFERENCES `parcial` (`id`);

--
-- Filtros para la tabla `conducta_reporte`
--
ALTER TABLE `conducta_reporte`
  ADD CONSTRAINT `conducta_reporte_ibfk_1` FOREIGN KEY (`alumno_materia_id`) REFERENCES `alumno_materia` (`id`);

--
-- Filtros para la tabla `credencial`
--
ALTER TABLE `credencial`
  ADD CONSTRAINT `credencial_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `docente_materia`
--
ALTER TABLE `docente_materia`
  ADD CONSTRAINT `docente_materia_ibfk_1` FOREIGN KEY (`usuario_docente_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `docente_materia_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `grado_horario_materia`
--
ALTER TABLE `grado_horario_materia`
  ADD CONSTRAINT `grado_horario_materia_ibfk_1` FOREIGN KEY (`grado_id`) REFERENCES `grado` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grado_horario_materia_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`grado_id`) REFERENCES `grado` (`id`);

--
-- Filtros para la tabla `historial_restauracion`
--
ALTER TABLE `historial_restauracion`
  ADD CONSTRAINT `historial_restauracion_ibfk_1` FOREIGN KEY (`id_backup`) REFERENCES `historial_backup` (`id`);

--
-- Filtros para la tabla `justificante`
--
ALTER TABLE `justificante`
  ADD CONSTRAINT `justificante_ibfk_1` FOREIGN KEY (`expediente_id`) REFERENCES `expediente` (`id`),
  ADD CONSTRAINT `justificante_ibfk_2` FOREIGN KEY (`creado_por_usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `justificante_ibfk_3` FOREIGN KEY (`validado_por_usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `kardex_materia`
--
ALTER TABLE `kardex_materia`
  ADD CONSTRAINT `kardex_materia_ibfk_1` FOREIGN KEY (`alumno_materia_id`) REFERENCES `alumno_materia` (`id`);

--
-- Filtros para la tabla `maestro_materia_horario`
--
ALTER TABLE `maestro_materia_horario`
  ADD CONSTRAINT `maestro_materia_horario_ibfk_1` FOREIGN KEY (`maestro_id`) REFERENCES `maestro` (`id`),
  ADD CONSTRAINT `maestro_materia_horario_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`),
  ADD CONSTRAINT `maestro_materia_horario_ibfk_3` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`),
  ADD CONSTRAINT `maestro_materia_horario_ibfk_4` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`id`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`grado_id`) REFERENCES `grado` (`id`);

--
-- Filtros para la tabla `materia_parcial`
--
ALTER TABLE `materia_parcial`
  ADD CONSTRAINT `materia_parcial_ibfk_1` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`),
  ADD CONSTRAINT `materia_parcial_ibfk_2` FOREIGN KEY (`parcial_id`) REFERENCES `parcial` (`id`);

--
-- Filtros para la tabla `reportes_academicos`
--
ALTER TABLE `reportes_academicos`
  ADD CONSTRAINT `reportes_academicos_ibfk_1` FOREIGN KEY (`docente_usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `reportes_academicos_ibfk_2` FOREIGN KEY (`trabajo_social_usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `reportes_academicos_ibfk_3` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`),
  ADD CONSTRAINT `reportes_academicos_ibfk_4` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`);

--
-- Filtros para la tabla `reportes_sistema`
--
ALTER TABLE `reportes_sistema`
  ADD CONSTRAINT `reportes_sistema_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `reporte_falta`
--
ALTER TABLE `reporte_falta`
  ADD CONSTRAINT `reporte_falta_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `reporte_falta_ibfk_2` FOREIGN KEY (`validado_por_usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `solicitud_eliminacion_reporte`
--
ALTER TABLE `solicitud_eliminacion_reporte`
  ADD CONSTRAINT `solicitud_eliminacion_reporte_ibfk_1` FOREIGN KEY (`solicitante_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `solicitud_eliminacion_reporte_ibfk_2` FOREIGN KEY (`procesado_por_admin_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

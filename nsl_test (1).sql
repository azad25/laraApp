-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2020 at 12:25 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nsl_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_counter_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `phone`, `description`, `address`, `parent_counter_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'California', '435-726-9416 x964', 'Ut dolore quia nihil. Veniam iure voluptatibus omnis. Dolore et nisi et numquam nisi in officiis velit.', '44621 Blanda Loaf\nLuettgenview, IL 40049-3349', 2, 1, '2020-03-01 00:17:34', '2020-03-01 00:17:34'),
(2, 'District of Columbia', '783-780-8636', 'Exercitationem nesciunt aspernatur voluptate adipisci explicabo quo. Nostrum maxime nostrum sit sunt natus quo et nemo. Commodi sunt inventore suscipit nobis commodi.', '2814 Addison Greens\nLangoshborough, NV 12977-0531', 6, 2, '2020-03-01 00:17:34', '2020-03-01 00:17:34'),
(3, 'Idaho', '935-513-5187', 'Qui ea eum omnis et sint consectetur. Et asperiores aperiam fugiat et magni temporibus qui. Nisi dolor numquam dolor ut omnis error.', '80236 Catherine Ville Apt. 469\nWest Bradly, UT 83822-6868', 6, 2, '2020-03-01 00:17:34', '2020-03-01 00:17:34'),
(4, 'Arizona', '669-949-1861 x51059', 'Cum harum voluptatibus eius voluptatem tenetur velit libero. Qui vel voluptas et sed. Aspernatur unde delectus voluptatibus omnis.', '161 Pfannerstill Inlet\nEast Alvenamouth, ME 62829-3522', 8, 2, '2020-03-01 00:17:34', '2020-03-01 00:17:34'),
(5, 'Hawaii', '318-352-0596 x969', 'Veniam omnis voluptatem porro voluptatibus vero quia. Quidem omnis et deleniti voluptas nesciunt ratione id. Quis labore non animi officia qui deserunt voluptatum.', '9384 Keebler Mountain Apt. 371\nAlejandraborough, DE 83238', 8, 2, '2020-03-01 00:17:34', '2020-03-01 00:17:34'),
(6, 'New York', '612-623-2582 x15012', 'Laborum blanditiis est perferendis. Dolores molestiae sapiente commodi. Quo eaque occaecati id asperiores inventore vel. Necessitatibus sint consequatur vel sed.', '5673 Ryan Coves\nFrederikshire, NE 04759', 8, 2, '2020-03-01 00:17:34', '2020-03-01 00:17:34'),
(7, 'Texas', '665-521-3773', 'Modi totam est corrupti. Cumque veniam doloremque cum non tenetur. Rerum rem et architecto molestiae cumque. Magnam et voluptatem eligendi corrupti ipsam.', '41226 Armstrong Springs Suite 576\nTorphyberg, MD 53283', 2, 1, '2020-03-01 00:17:34', '2020-03-01 00:17:34'),
(8, 'Ohio', '1-612-446-2872', 'Nostrum aut minus qui dolorem. Maxime impedit id impedit itaque officiis nihil iusto. Assumenda nihil sunt porro perferendis magni. Dicta officia quibusdam est excepturi tempore et.', '845 Josefina Stravenue\nWaelchichester, RI 88672-6264', 5, 2, '2020-03-01 00:17:35', '2020-03-01 05:23:34'),
(9, 'Oregon', '1-972-935-3585', 'Earum sunt neque excepturi non eaque nihil mollitia. Qui velit eos corporis ipsa nobis quas saepe. Est ratione asperiores iusto aut. Asperiores molestiae nobis nam.', '52920 Gaylord Springs Apt. 929\nMcDermottside, NV 21494-4228', 6, 2, '2020-03-01 00:17:35', '2020-03-01 00:17:35'),
(10, 'Nebraska', '1-475-935-3822 x3639', 'Est et quaerat ut voluptate dicta laudantium dolores. Ipsa est corrupti odio. Accusantium voluptas eum tenetur molestiae. Mollitia ut consectetur debitis ullam adipisci qui.', '920 Bergstrom Unions Apt. 114\nPourosside, OR 62188-4379', 5, 1, '2020-03-01 00:17:35', '2020-03-01 00:17:35'),
(11, 'Ohio', '1-319-563-9140 x70357', 'Commodi ab expedita rerum a et tempora. Hic voluptas soluta sint tempore libero maiores. Modi est dolores laudantium eveniet et provident.', '96084 Eliezer Estates Apt. 012\nWest Jackyport, CA 92311-0463', 4, 2, '2020-03-01 00:17:35', '2020-03-01 00:17:35'),
(12, 'South Carolina', '+18807719391', 'Excepturi quo eligendi eligendi veniam rerum. Quia quia dolorem sit qui tempora enim. Sequi ea accusantium non dolorem possimus aspernatur. Aut quas quisquam et aut alias sit.', '37549 Lee Village\nMcClurebury, MO 99217', 7, 2, '2020-03-01 00:17:35', '2020-03-01 00:17:35'),
(13, 'Kentucky', '+16693979739', 'Quas at libero aliquam quam dicta omnis aut. Sint alias natus non distinctio aliquid quasi. Ut sint quia fugiat ullam adipisci sit ea. Ut vel occaecati necessitatibus dolores quae qui.', '16290 Brook Harbor\nNorth Durwardfort, ME 05350', 7, 2, '2020-03-01 00:17:35', '2020-03-01 00:17:35'),
(14, 'USA', '01763427265', '1111111', 'Sadarghat', 14, 2, '2020-03-01 05:34:01', '2020-03-01 05:34:01');

-- --------------------------------------------------------

--
-- Table structure for table `branch_schedules`
--

CREATE TABLE `branch_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `ship_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branch_schedules`
--

INSERT INTO `branch_schedules` (`id`, `branch_id`, `schedule_id`, `ship_id`, `created_at`, `updated_at`) VALUES
(1, 8, 19, 4, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(2, 9, 19, 20, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(3, 12, 16, 25, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(4, 13, 19, 22, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(5, 10, 21, 21, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(6, 9, 17, 13, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(7, 12, 17, 25, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(8, 8, 22, 23, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(9, 8, 18, 22, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(10, 8, 20, 11, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(11, 7, 17, 3, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(12, 12, 14, 24, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(13, 4, 17, 7, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(14, 9, 16, 3, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(15, 3, 13, 22, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(16, 1, 22, 20, '2020-03-01 02:13:39', '2020-03-01 02:13:39'),
(17, 2, 13, 16, '2020-03-01 02:13:40', '2020-03-01 02:13:40'),
(18, 9, 17, 19, '2020-03-01 02:13:40', '2020-03-01 02:13:40'),
(19, 8, 21, 9, '2020-03-01 02:13:40', '2020-03-01 02:13:40'),
(20, 11, 22, 14, '2020-03-01 02:13:40', '2020-03-01 02:13:40'),
(21, 11, 22, 21, '2020-03-01 02:13:40', '2020-03-01 02:13:40'),
(22, 9, 16, 7, '2020-03-01 02:13:40', '2020-03-01 02:13:40'),
(23, 9, 18, 17, '2020-03-01 02:13:40', '2020-03-01 02:13:40'),
(24, 4, 16, 9, '2020-03-01 02:13:40', '2020-03-01 02:13:40'),
(25, 8, 17, 17, '2020-03-01 02:13:40', '2020-03-01 02:13:40'),
(26, 2, 13, 2, '2020-03-01 05:12:16', '2020-03-01 05:12:16'),
(27, 2, 18, 7, '2020-03-01 05:16:31', '2020-03-01 05:16:31'),
(28, 2, 21, 1, '2020-03-01 05:17:16', '2020-03-01 05:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `counterName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `counterName`, `description`, `phone`, `destination_id`, `created_at`, `updated_at`) VALUES
(1, 'Utah', 'Rerum dicta vel ex sint necessitatibus. Non aut dicta doloribus et consequuntur. Nostrum non quo officia autem. Molestias debitis fugit optio doloribus earum tempora in.', '293-904-0236 x32216', 19, '2020-02-29 23:06:24', '2020-02-29 23:06:24'),
(2, 'Washington', 'Unde temporibus eos dignissimos est expedita. Et illum est amet sint dolor blanditiis optio. Et aut illo sit. Magnam et omnis eaque sit qui labore.', '918.331.8055 x9795', 20, '2020-02-29 23:06:24', '2020-02-29 23:06:24'),
(3, 'New Mexico', 'Nihil quia non minus ad. Neque dolores possimus sit sit numquam non. Fuga eius veniam repudiandae vel nobis hic. Adipisci labore voluptates maiores unde accusamus numquam.', '747-732-7033 x0291', 19, '2020-02-29 23:06:24', '2020-02-29 23:06:24'),
(4, 'Alabama', 'Voluptas omnis facilis error vel maiores ab. Vero ipsa officiis architecto a. Eligendi ut velit sed qui veniam odit quam. Nihil aperiam omnis ab consequatur non est sint ex.', '279-549-6912', 18, '2020-02-29 23:06:24', '2020-02-29 23:06:24'),
(5, 'North Dakota', 'Aut consequatur quam maiores neque voluptatem. Omnis recusandae et velit est nihil. Velit eos omnis veritatis aut aut.', '+1 (409) 868-0534', 17, '2020-02-29 23:06:24', '2020-02-29 23:06:24'),
(6, 'Virginia', 'Possimus occaecati consequatur consequatur. Accusamus vero eveniet asperiores molestias pariatur quo dolorem. In dolores iste ut ratione quia voluptates non.', '+15762620710', 20, '2020-02-29 23:06:24', '2020-02-29 23:06:24'),
(7, 'Louisiana', 'Tenetur vero ea quas omnis. Corporis dicta optio aspernatur veniam ut ut repellat officia. At voluptatem dolor ullam commodi.', '404-689-1983 x1178', 18, '2020-02-29 23:06:24', '2020-02-29 23:06:24'),
(8, 'New Jersey', 'Rerum architecto natus magni laborum eos. Magni accusantium expedita sint dolores numquam. Sed ut quis ratione repudiandae in. Nesciunt rem voluptatem doloremque ullam aut sequi.', '1-851-847-6820 x173', 15, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(9, 'Utah', 'Impedit modi quos sunt at laudantium. Ad provident quo alias assumenda. Quasi id eum corrupti doloremque.', '(403) 365-9435', 14, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(10, 'Indiana', 'Est quod fuga architecto id. Nesciunt dicta rerum error rerum. Voluptatem voluptatem saepe dolorem ipsa.', '608-749-9322', 17, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(11, 'Oklahoma', 'Ipsam quia placeat alias non. Numquam iste ea nobis vitae. Recusandae provident voluptate vel cumque. Qui odit atque impedit qui.', '836.703.3125', 20, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(12, 'Georgia', 'Et aut sint autem et numquam quisquam rerum. Et fugit qui non libero.', '+1.691.733.8707', 16, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(13, 'South Carolina', 'Officiis a molestias provident eius esse veritatis nostrum. Voluptas dolore doloribus nulla atque et. Est suscipit beatae harum provident unde ut neque.', '(839) 267-9509', 15, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(14, 'Texas', 'Perferendis maxime rerum quod. Sit commodi modi rem officia pariatur deserunt blanditiis. Porro quibusdam velit possimus quia tempora.', '(345) 373-0792 x65936', 19, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(15, 'Ohio', 'Dolorum explicabo maiores odio rerum et quia blanditiis. Qui pariatur voluptas fugit. Recusandae exercitationem magni accusantium a laboriosam ducimus sit.', '297.883.9393 x2864', 17, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(16, 'Oregon', 'Aut explicabo perspiciatis nisi exercitationem est. Amet et est est. Asperiores ut aut doloribus quasi tempora dolorum. Illo voluptatem qui quaerat maiores.', '+1 (210) 971-2422', 12, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(17, 'Ohio', 'Minima molestiae temporibus voluptatem neque. Sint nisi cum id magnam provident eligendi sit. Recusandae adipisci atque consequatur. Ut aut consequatur sunt non.', '775-766-5378 x102', 17, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(18, 'Oklahoma', 'Nemo aliquam fugiat aliquam sed qui dolorem exercitationem. Et mollitia maxime aliquam. Soluta rerum necessitatibus veniam expedita voluptates dolorum in.', '875-853-0686 x231', 17, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(19, 'Hawaii', 'Perspiciatis amet fuga animi quidem necessitatibus et et. Quidem doloremque rem voluptatem quae voluptatum ut. Eum quo quam sunt soluta voluptatem quia earum.', '728.284.4080 x0146', 14, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(20, 'Colorado', 'Asperiores nisi et et at facilis. Quam adipisci veritatis unde sunt sunt. Autem qui odit rerum ducimus. Aut enim inventore ipsa exercitationem est magni voluptatibus.', '+1-883-907-5417', 20, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(21, 'Oregon', 'Quod ut eius optio placeat aspernatur ullam. Veritatis cumque iusto adipisci est. Temporibus et ipsa sint porro non eum magnam.', '676.559.5338', 18, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(22, 'Montana', 'Sint consequatur nemo odio perferendis consequatur. Autem recusandae optio sint consequatur nobis et qui. Aut et sapiente distinctio molestiae et est eum. Distinctio quia et consequuntur qui.', '921.542.7323 x85991', 18, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(23, 'Florida', 'Voluptatem eius ad enim maxime enim maxime. Id id cum eligendi accusantium dolorem. Natus est earum omnis unde velit. Sunt esse quod quia et adipisci consequatur magnam est.', '645-705-7517 x4608', 13, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(24, 'Idaho', 'Doloribus vel aut amet sit. Natus dolores modi totam officia. Dolor necessitatibus aut dolorem eum. Optio cum mollitia et sint.', '(702) 314-9946 x894', 16, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(25, 'Tennessee', 'Non id sunt nulla blanditiis at officia consequatur illum. Aut doloremque quia nihil eos. Laborum pariatur quia quo. Eligendi molestias iusto enim ea.', '1-886-656-8760', 15, '2020-02-29 23:06:25', '2020-02-29 23:06:25'),
(26, 'Test', 'test', '01763427265', 16, '2020-02-29 23:28:25', '2020-02-29 23:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `destinationName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `destinationName`, `description`, `created_at`, `updated_at`) VALUES
(11, 'Oklahoma', 'Ea soluta odio quo magnam dolorem officiis. Omnis adipisci sit quisquam distinctio ex. Consequatur omnis quae maxime exercitationem ad unde libero.', '2020-02-29 13:32:28', '2020-02-29 13:32:28'),
(12, 'Nevada', 'Sit natus sunt et velit exercitationem. Ut eum fuga incidunt porro quam. Enim dolor in in et id consequatur.', '2020-02-29 13:32:28', '2020-02-29 13:32:28'),
(13, 'Delaware', 'Facilis dolorem placeat explicabo fugiat nesciunt reiciendis. Amet voluptatem perspiciatis mollitia quae et eligendi sit. Aut vero non animi cupiditate impedit.', '2020-02-29 13:32:28', '2020-02-29 13:32:28'),
(14, 'California', 'Voluptatibus quod eum rerum. Temporibus voluptate nam doloremque aspernatur ut vel. Ut perspiciatis natus et. Consequatur commodi placeat ea quis quae. Consectetur quibusdam natus iure provident.', '2020-02-29 13:32:28', '2020-02-29 13:32:28'),
(15, 'California', 'Alias et sit alias laboriosam reiciendis qui facere non. Et ad qui aliquam architecto quia deserunt temporibus. Laborum reiciendis aut aut.', '2020-02-29 13:32:28', '2020-02-29 13:32:28'),
(16, 'Florida', 'Reiciendis fugit beatae iusto numquam. Voluptatibus consequatur aliquid autem cupiditate temporibus. Debitis molestiae molestiae iste quia iure facilis odit.', '2020-02-29 13:32:28', '2020-02-29 13:32:28'),
(17, 'Kansas', 'Corrupti aut ut quia debitis. Occaecati nobis non velit minima quia dolorem. Quis rerum iste ipsa expedita sed.', '2020-02-29 13:32:29', '2020-02-29 13:32:29'),
(18, 'Michigan', 'Tempora atque voluptatem inventore quo possimus. Nihil dicta quae sunt voluptas enim. Doloremque et voluptatem quia dicta itaque. Est ipsum dolorem qui rerum fuga dolorem.', '2020-02-29 13:32:29', '2020-02-29 13:32:29'),
(19, 'Colorado', 'Autem commodi et est eaque. Aliquid a consequatur et eligendi omnis quo facere. Iure blanditiis corrupti esse qui saepe quo voluptatem aut. Vel sit et rem ad ea totam.', '2020-02-29 13:32:29', '2020-02-29 13:32:29'),
(20, 'Hawaii', 'Inventore et atque quia quae natus. Ratione et doloremque et. Iusto numquam culpa voluptatem illo.', '2020-02-29 13:32:29', '2020-02-29 13:32:29'),
(21, 'Oklahoma', 'asdewq', '2020-02-29 15:24:47', '2020-02-29 15:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `layouts`
--

CREATE TABLE `layouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(12, '2020_02_28_205553_create_ships_table', 2),
(13, '2020_02_28_210021_create_destinations_table', 2),
(14, '2020_02_28_210447_create_schedules_table', 2),
(15, '2020_02_28_210659_create_counters_table', 2),
(16, '2020_02_28_213729_create_branches_table', 2),
(17, '2020_02_28_214306_create_seat_categories_table', 2),
(18, '2020_02_28_214834_create_seats_table', 2),
(19, '2020_02_28_215441_create_tickets_table', 2),
(20, '2020_02_28_220426_create_seat_tickets_table', 2),
(21, '2020_02_28_220855_create_layouts_table', 2),
(22, '2020_02_28_222647_change_users_table', 3),
(23, '2020_02_29_120741_add_user_id_to_branches', 4),
(24, '2020_02_29_191923_add_schedule_id_to_ships_table', 5),
(25, '2020_02_29_192000_change_schedule_table', 5),
(26, '2020_02_29_205553_create_ships_table', 6),
(27, '2020_02_29_211923_add_schedule_id_to_ships_table', 7),
(28, '2020_02_29_222000_change_schedule_table', 8),
(29, '2020_03_01_045942_create_counters_table', 9),
(30, '2020_03_01_050205_change_branches_table', 10),
(31, '2020_03_01_061511_create_branches_table', 11),
(32, '2020_03_01_061708_add_user_id_to_branches', 12),
(33, '2020_03_01_062423_create_ships_table', 13),
(34, '2020_03_01_062658_create_branch_schedules_table', 14),
(35, '2020_03_01_081042_create_branch_schedules_table', 15),
(36, '2020_03_03_173850_change_seats_table', 16),
(37, '2020_03_05_165655_add_schedule_id_and_user_id_to_tickets_table', 17),
(38, '2020_03_05_170154_create_tickets_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('4948887f3bf1fdca7cbd01c7430e675e94bad1bfd5d7baa5403b555b2a50a4ed77c4db1a5bc364f3', 2, 1, 'MyApp', '[]', 0, '2020-03-01 22:55:50', '2020-03-01 22:55:50', '2021-03-02 04:55:50'),
('71306f019df9c17d010df0d470cb42ac65f9a2d574f1583cd765580565102f89dac04c3b412f8bc2', 2, 1, 'MyApp', '[]', 0, '2020-03-01 22:56:11', '2020-03-01 22:56:11', '2021-03-02 04:56:11'),
('92e2be2b66cb3eda64be0a89f99870c6d8169b3909c04ddfc17d8525d07ed152faa2e80961c3e2c8', 2, 1, 'MyApp', '[]', 1, '2020-02-29 03:06:51', '2020-02-29 03:06:51', '2021-03-01 09:06:51'),
('a3ceea3c19a0a85f232cc4b9ca37bb044397a87c62d056bec4704385f9f384c7d42b90c19a8d60b0', 2, 1, 'MyApp', '[]', 1, '2020-02-29 03:18:13', '2020-02-29 03:18:13', '2021-03-01 09:18:13'),
('da86e66880079cc9623b8e8e1f9ee631069121b8f5fbe0bba6df45b53f6e2414928637369b9f0af0', 2, 1, 'MyApp', '[]', 1, '2020-03-01 00:08:41', '2020-03-01 00:08:41', '2021-03-01 06:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'VoH0XgHrxWKlfvp3JI5TSSmQ9WqYDMCHTzTpST2k', 'http://localhost', 1, 0, 0, '2020-02-28 14:46:58', '2020-02-28 14:46:58'),
(2, NULL, 'Laravel Password Grant Client', 'VLaQrfXmZlum0q3QpZkdL1GBanYghXEoxNyAxKV8', 'http://localhost', 0, 1, 0, '2020-02-28 14:46:58', '2020-02-28 14:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-02-28 14:46:58', '2020-02-28 14:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `schedule` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departure` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arrival` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fromm` bigint(20) UNSIGNED NOT NULL,
  `too` bigint(20) UNSIGNED NOT NULL,
  `destination_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `schedule`, `departure`, `arrival`, `description`, `fromm`, `too`, `destination_id`, `created_at`, `updated_at`) VALUES
(13, 'Utah', '04:57 am', '12:56 pm', 'Nobis cum fugit temporibus. Sequi in optio nemo aut quia et. Nam repellat accusamus dicta ab dignissimos ducimus. Ea eos nesciunt cupiditate suscipit magni dignissimos optio.', 20, 18, 20, '2020-02-29 13:39:27', '2020-02-29 13:39:27'),
(14, 'Connecticut', '06:27 am', '05:08 am', 'Quis totam ut totam vel at excepturi ipsa. Quasi qui nam sunt eligendi blanditiis assumenda. Exercitationem placeat omnis non et ut.', 13, 18, 15, '2020-02-29 13:39:27', '2020-02-29 13:39:27'),
(15, 'Montana', '13:40 pm', '11:32 am', 'Quasi qui cupiditate aliquam et sed. Laboriosam voluptatem temporibus est iusto fugiat. Ipsum consequatur in officia quis fugit quos est maxime. Rem quo nemo sed delectus minima.', 18, 19, 18, '2020-02-29 13:39:27', '2020-02-29 13:39:27'),
(16, 'New Hampshire', '21:14 pm', '22:15 pm', 'Dolor vitae et vel pariatur officia aut et. Sit et quasi sit commodi rerum deserunt qui.', 16, 15, 18, '2020-02-29 13:39:27', '2020-02-29 13:39:27'),
(17, 'Hawaii', '09:38 am', '00:37 am', 'Enim nemo nesciunt dolore et. Quos voluptatibus rem iusto repellendus. Dolor at ipsum iure ut ut soluta. Maxime ab earum deleniti occaecati sed.', 19, 16, 20, '2020-02-29 13:39:27', '2020-02-29 13:39:27'),
(18, 'Wisconsin', '00:14 am', '09:20 am', 'Temporibus sed sint quia voluptates. Facilis pariatur tempore quaerat autem enim perferendis. Qui non officia in fugiat sed nam.', 20, 17, 13, '2020-02-29 13:39:27', '2020-02-29 13:39:27'),
(19, 'Virginia', '20:50 pm', '20:47 pm', 'Est aut doloribus sunt animi et iusto. Id quis molestiae cupiditate cum. Necessitatibus maxime et dolorum ad.', 14, 16, 19, '2020-02-29 13:39:27', '2020-02-29 13:39:27'),
(20, 'New Mexico', '01:23 am', '08:44 am', 'Quibusdam qui cum consequuntur architecto. Vel magnam ea inventore voluptas praesentium. Maiores repudiandae qui officia.', 15, 17, 18, '2020-02-29 13:39:27', '2020-02-29 13:39:27'),
(21, 'Illinois', '05:18 am', '11:38 am', 'Vel consequatur omnis culpa autem cum officia. Asperiores voluptate earum dolor aut. Aut vel enim accusantium sed sequi enim.', 17, 11, 16, '2020-02-29 13:39:27', '2020-02-29 13:39:27'),
(22, 'Florida', '05:32 am', '13:56 pm', 'Architecto inventore nemo expedita labore. Quos perspiciatis porro neque qui eaque. Repellat possimus similique explicabo velit laborum.', 18, 19, 13, '2020-02-29 13:39:27', '2020-02-29 13:39:27'),
(23, 'aaaa', '1 am', '1 am', 'aaa', 12, 14, 12, '2020-02-29 16:37:34', '2020-02-29 16:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seat_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_id` bigint(20) UNSIGNED NOT NULL,
  `seat_category` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `seat_name`, `description`, `ship_id`, `seat_category`, `created_at`, `updated_at`) VALUES
(115, 'seat-changed', NULL, 4, 26, '2020-03-03 12:27:01', '2020-03-04 22:57:09'),
(116, 'seat-3', NULL, 4, 26, '2020-03-03 12:27:01', '2020-03-03 12:27:01'),
(117, 'seat-4', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(118, 'seat-5', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(119, 'seat-6', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(120, 'seat-7', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(121, 'seat-8', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(122, 'seat-9', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(123, 'seat-10', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(124, 'seat-11', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(125, 'seat-12', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(126, 'seat-13', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(127, 'seat-14', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(128, 'seat-15', NULL, 4, 26, '2020-03-03 12:27:02', '2020-03-03 12:27:02'),
(129, 'seat-16', NULL, 4, 26, '2020-03-03 12:27:03', '2020-03-03 12:27:03'),
(130, 'seat-1', NULL, 2, 33, '2020-03-03 12:39:45', '2020-03-03 12:39:45'),
(131, 'seat-2', NULL, 2, 33, '2020-03-03 12:39:45', '2020-03-03 12:39:45'),
(132, 'seat-3', NULL, 2, 33, '2020-03-03 12:39:45', '2020-03-03 12:39:45'),
(133, 'seat-4', NULL, 2, 33, '2020-03-03 12:39:45', '2020-03-03 12:39:45'),
(134, 'seat-5', NULL, 2, 33, '2020-03-03 12:39:46', '2020-03-03 12:39:46'),
(135, 'seat-6', NULL, 2, 33, '2020-03-03 12:39:46', '2020-03-03 12:39:46'),
(136, 'seat-7', NULL, 2, 33, '2020-03-03 12:39:46', '2020-03-03 12:39:46'),
(137, 'seat-8', NULL, 2, 33, '2020-03-03 12:39:46', '2020-03-03 12:39:46'),
(138, 'seat-9', NULL, 2, 33, '2020-03-03 12:39:46', '2020-03-03 12:39:46'),
(139, 'seat-10', NULL, 2, 33, '2020-03-03 12:39:46', '2020-03-03 12:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `seat_categories`
--

CREATE TABLE `seat_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seat_categories`
--

INSERT INTO `seat_categories` (`id`, `category_name`, `category_price`, `category_description`, `ship_id`, `created_at`, `updated_at`) VALUES
(25, 'Single Cabin', '1200', 'Single Cabin', 1, '2020-03-01 23:37:44', '2020-03-01 23:37:44'),
(26, 'Double Cabin', '2200', 'Double Cabin', 1, '2020-03-01 23:38:09', '2020-03-01 23:38:09'),
(27, 'VIP Cabin', '5500', 'VIP Cabin', 1, '2020-03-01 23:38:38', '2020-03-01 23:38:38'),
(28, 'Economy Class', '500', 'Economy Class', 1, '2020-03-01 23:39:00', '2020-03-01 23:39:00'),
(29, 'Business Class', '800', 'Business Class', 1, '2020-03-01 23:39:43', '2020-03-01 23:39:43'),
(33, 'test-edited', '1234', 'sdfsd', 2, '2020-03-03 12:39:18', '2020-03-04 23:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `seat_tickets`
--

CREATE TABLE `seat_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `seat_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ships`
--

CREATE TABLE `ships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ships`
--

INSERT INTO `ships` (`id`, `shipName`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Shanelle Herzog', 'Sit et dolores odio eum. Tempora nam et maxime aut laboriosam tenetur temporibus. Ab debitis enim dolores aut nulla temporibus. Et iure a dolorem rem.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(2, 'Pattie Reichert', 'Non ut deserunt officiis et velit. Ex ipsum consequatur rerum est. Cupiditate soluta et atque quae harum et exercitationem. Aspernatur aliquid rem error ex facere voluptatem.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(3, 'Amie Lehner', 'Est qui sit nam ut qui sed. Nisi cum minus dolore mollitia maiores unde. Fuga in neque at veniam dolor autem eaque. Minus quia porro consequuntur qui sit.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(4, 'Dr. Prince Rodriguez', 'Eum quia aut eos et. Eveniet quas beatae totam recusandae tempore non. Animi dolorum itaque sunt.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(5, 'Mr. General Schroeder Sr.', 'Recusandae non sint possimus ea culpa. Magni blanditiis deleniti distinctio laboriosam qui.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(6, 'Josephine Erdman', 'Dolor quod ipsa est dignissimos quos quis. Atque odit voluptas suscipit voluptatem qui ad minima. Dolores et nostrum quasi quis ut debitis et nisi.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(7, 'Favian Price', 'Rerum et et consequuntur repellat. Accusantium laboriosam odit corporis eligendi voluptatem molestias. Est quia fugiat consequatur quia cumque omnis. Voluptates adipisci fugit dolorem quod aut quos.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(8, 'Mr. Anibal Terry', 'Consequatur veniam minus minus nam. Et quidem ab qui unde consequatur eum. Aut eligendi a quo vero placeat.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(9, 'Prof. Claudine Hermiston', 'Voluptatum vitae numquam asperiores. Quis dolor aut natus aperiam incidunt illo est. Veritatis cumque dolorum dolorum qui. Consequatur minima eaque exercitationem dolore aut.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(10, 'Markus West MD', 'Et voluptas quisquam saepe accusamus vel dignissimos atque. Aut veniam ipsa voluptatem sed harum. Sunt sint saepe quam et consequuntur. Corrupti quia impedit nihil sed similique.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(11, 'Prof. Einar Green II', 'Ut eos at sit occaecati vel enim. Doloremque deleniti quam quos aut velit ut dolorum. Voluptatum dolore aut voluptas nesciunt totam similique. Fuga sit maiores laborum est.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(12, 'Myles Kemmer', 'Repellendus odit enim deleniti non perferendis dolore rerum. Quis distinctio sed sint quia quod sint sint. Sit aperiam sit perspiciatis explicabo libero doloribus.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(13, 'Prof. Leonie O\'Reilly', 'Ut commodi consequatur voluptas tempora. Expedita qui qui quo omnis ea. Vitae similique ut id et ut enim. Sit aspernatur qui quam porro.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(14, 'Dr. Vella Lind V', 'In eos debitis dolores aspernatur. Pariatur rem sit iste ducimus a quod. Eos necessitatibus qui aliquid consequuntur nulla quo iure.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(15, 'Terrance Reynolds', 'Vel eligendi voluptatem quod quasi perspiciatis suscipit. Velit eos cum eum dolorem qui et. Omnis voluptatem molestias consequatur excepturi.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(16, 'Kolby Gislason', 'Et repellat soluta maxime qui maxime. Illo quod et sint ipsam. Cum sit dolorem voluptas est odit nulla doloremque. Adipisci quod rem atque possimus officia adipisci.', 2, '2020-03-01 02:07:46', '2020-03-01 02:07:46'),
(17, 'Mrs. Virginia Weimann MD', 'Possimus non ut nihil officia tempora. Eius commodi non sed delectus omnis repellendus consequatur voluptatum. Enim itaque impedit cumque impedit.', 2, '2020-03-01 02:07:47', '2020-03-01 02:07:47'),
(18, 'Kenna Orn', 'Vel quis voluptas corrupti non. Omnis ad et facere inventore et. Fugit et numquam quos qui. Sit et minima consequatur ea. Expedita ex est omnis et eveniet ipsa nihil.', 2, '2020-03-01 02:07:47', '2020-03-01 02:07:47'),
(19, 'Prof. Shyann Mayert MD', 'Sapiente exercitationem sapiente dignissimos sed molestiae reiciendis laborum. Animi ea dolor nam magnam dolorem. Saepe voluptate ipsum corporis. Ea labore voluptates numquam sed.', 2, '2020-03-01 02:07:47', '2020-03-01 02:07:47'),
(20, 'Emmett Pagac', 'Eaque eius placeat ipsum vel eos. Et fugit eveniet magnam nostrum sit. Pariatur ad nobis natus dolorem et maiores.', 2, '2020-03-01 02:07:47', '2020-03-01 02:07:47'),
(21, 'Pink Jast', 'Sunt nesciunt veniam asperiores quia. Ea rerum voluptatem nemo dolores modi ratione.', 2, '2020-03-01 02:07:47', '2020-03-01 02:07:47'),
(22, 'Mr. Clifton Fahey', 'Laudantium amet modi quia laboriosam voluptatibus quaerat quam. Laudantium voluptate quas ea in eveniet. Est hic et totam quas. Consequuntur quia aut dolore optio illum qui alias.', 2, '2020-03-01 02:07:47', '2020-03-01 02:07:47'),
(23, 'Prof. Emma Cole III', 'Aperiam et omnis qui id asperiores. Autem rerum delectus laudantium repellat ratione quia. Quos enim ut placeat quis.', 2, '2020-03-01 02:07:47', '2020-03-01 02:07:47'),
(24, 'Helene Rohan', 'Inventore quis doloremque eum repudiandae molestias iure. Ipsam est eum eaque explicabo. At quod nam expedita exercitationem omnis quisquam eum culpa.', 2, '2020-03-01 02:07:47', '2020-03-01 02:07:47'),
(25, 'Alexander Crooks DVM', 'Numquam assumenda esse soluta qui placeat qui. Ut quaerat distinctio error qui. Tenetur ipsam ea ipsum.', 2, '2020-03-01 02:07:47', '2020-03-01 02:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deck` tinyint(1) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `bkash` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `sold_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `bio` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile.png',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `type`, `bio`, `photo`, `branch_id`, `gender`, `phone`, `address`, `data`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'nizamshippinglines@gmail.com', '$2y$10$sAjrZt2lpB2ZfLZU3E/cRO04bmOWhCdtPPnjW7XrKSg0N1rrK9KJ.', 'admin', NULL, 'profile.png', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-28 14:24:27', '2020-02-28 14:50:37'),
(2, 'Ferdous Azad', 'test@gmail.com', '$2y$10$9aGj.O1v4BMTqmjznP58v.Sd9pLC5PD1pbuN790IIEgO4mC272ZpK', 'admin', NULL, 'profile.png', 2, NULL, NULL, NULL, NULL, NULL, '2020-02-28 14:47:58', '2020-02-29 03:02:47'),
(3, 'Ohidul Islam', 'ohidulislam045@gmail.com', '$2y$10$ZHZr6rXQXZpU1qnhQ.8.VO4EzZWQFlvOR45IG.s40UTLJrNbuVmyK', 'user', 'test user', 'profile.png', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-29 07:20:12', '2020-02-29 07:20:12'),
(6, 'test counter man', 'test2@gmail.com', '$2y$10$0Lu9.YmQaCoEc3XNzcqZzO5GmMxxNCe9WPA4wZ3Qcn7e34pRXNt8u', 'counter-man', NULL, 'profile.png', 3, NULL, NULL, NULL, NULL, NULL, '2020-03-05 10:20:31', '2020-03-05 10:30:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_parent_counter_id_index` (`parent_counter_id`),
  ADD KEY `branches_user_id_index` (`user_id`);

--
-- Indexes for table `branch_schedules`
--
ALTER TABLE `branch_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_schedules_branch_id_index` (`branch_id`),
  ADD KEY `branch_schedules_schedule_id_index` (`schedule_id`),
  ADD KEY `branch_schedules_ship_id_index` (`ship_id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `counters_destination_id_index` (`destination_id`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layouts`
--
ALTER TABLE `layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_destination_id_index` (`destination_id`),
  ADD KEY `schedules_from_index` (`fromm`),
  ADD KEY `schedules_to_index` (`too`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seats_seat_category_index` (`seat_category`),
  ADD KEY `seats_ship_id_index` (`ship_id`);

--
-- Indexes for table `seat_categories`
--
ALTER TABLE `seat_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seat_categories_ship_id_index` (`ship_id`);

--
-- Indexes for table `seat_tickets`
--
ALTER TABLE `seat_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seat_tickets_ticket_id_index` (`ticket_id`),
  ADD KEY `seat_tickets_seat_id_index` (`seat_id`);

--
-- Indexes for table `ships`
--
ALTER TABLE `ships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ships_user_id_index` (`user_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_schedule_index` (`schedule`),
  ADD KEY `tickets_sold_by_index` (`sold_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_branch_id_index` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `branch_schedules`
--
ALTER TABLE `branch_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `layouts`
--
ALTER TABLE `layouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `seat_categories`
--
ALTER TABLE `seat_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `seat_tickets`
--
ALTER TABLE `seat_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ships`
--
ALTER TABLE `ships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_parent_counter_id_foreign` FOREIGN KEY (`parent_counter_id`) REFERENCES `counters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branches_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `branch_schedules`
--
ALTER TABLE `branch_schedules`
  ADD CONSTRAINT `branch_schedules_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branch_schedules_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branch_schedules_ship_id_foreign` FOREIGN KEY (`ship_id`) REFERENCES `ships` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `counters`
--
ALTER TABLE `counters`
  ADD CONSTRAINT `counters_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_from_foreign` FOREIGN KEY (`fromm`) REFERENCES `destinations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_to_foreign` FOREIGN KEY (`too`) REFERENCES `destinations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_seat_category_foreign` FOREIGN KEY (`seat_category`) REFERENCES `seat_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seats_ship_id_foreign` FOREIGN KEY (`ship_id`) REFERENCES `ships` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seat_categories`
--
ALTER TABLE `seat_categories`
  ADD CONSTRAINT `seat_categories_ship_id_foreign` FOREIGN KEY (`ship_id`) REFERENCES `ships` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seat_tickets`
--
ALTER TABLE `seat_tickets`
  ADD CONSTRAINT `seat_tickets_seat_id_foreign` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seat_tickets_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ships`
--
ALTER TABLE `ships`
  ADD CONSTRAINT `ships_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_schedule_foreign` FOREIGN KEY (`schedule`) REFERENCES `branch_schedules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_sold_by_foreign` FOREIGN KEY (`sold_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

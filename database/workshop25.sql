-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Dec 26. 11:08
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `workshop25`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `branch_class` varchar(50) NOT NULL,
  `branch_div_id` varchar(50) NOT NULL,
  `branch_name_hu` varchar(100) NOT NULL,
  `branch_name_en` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `branches`
--

INSERT INTO `branches` (`branch_id`, `branch_class`, `branch_div_id`, `branch_name_hu`, `branch_name_en`, `category_id`, `sort_order`) VALUES
(1, 'branch-item', 'physics-branch__1', 'Mechanika', 'Mechanics', 1, 1),
(2, 'branch-item', 'physics-branch__2', 'Hőtan/Termodinamika', 'Thermodinamics', 1, 2),
(3, 'branch-item', 'physics-branch__3', 'Elektromosságtan', 'Electricity', 1, 3),
(4, 'branch-item', 'physics-branch__4', 'Atomfizika', 'Atomic physics', 1, 4),
(5, 'branch-item', 'physics-branch__5', 'Fénytan/Optika', 'Optics', 1, 5),
(6, 'branch-item', 'physics-branch__6', 'Csillagászat/Gravitáció', 'Astronomy/Space physics', 1, 6),
(7, 'branch-item', 'physics-branch__7', 'Határterületek', 'Border areas', 1, 7),
(8, 'branch-item', 'math-branch__1', 'Algebra, számelmélet', 'Algebra', 2, 1),
(9, 'branch-item', 'math-branch__2', 'Gondolkodási módszerek', 'Thinking methods', 2, 2),
(10, 'branch-item', 'math-branch__3', 'Analízis, függvények', 'Analysis, functions ', 2, 3),
(11, 'branch-item', 'math-branch__4', 'Geometria', 'Geometry', 2, 4),
(12, 'branch-item', 'math-branch__5', 'Statisztika, Valószínűség', 'Statistics, Probability', 2, 5),
(13, 'branch-item', 'maturity-branch__1', 'Fizika érettségi', 'Maturity on Physics', 3, 1),
(14, 'branch-item', 'maturity-branch__2', 'Matematika érettségi', 'Maturity on Math', 3, 2),
(15, 'branch-item', 'link-branch__1', 'Fizika linkek', 'Links on Math', 4, 1),
(16, 'branch-item', 'link-branch__2', 'Matematika linkek', 'Links on Physics', 4, 2),
(17, 'branch-item', 'video-branch__1', 'Fizika videók', 'Math videos', 5, 1),
(18, 'branch-item', 'video-branch__2', 'Matematika videók', 'Physics videos', 5, 2),
(19, 'branch-item', 'workshop-branch__1', 'A tananyagok haszálata', 'Using learning materials', 6, 1),
(20, 'branch-item', 'workshop-branch__2', 'Az MB szertárról', 'On the MB Workshop', 6, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `category_bar`
--

CREATE TABLE `category_bar` (
  `category_id` int(11) NOT NULL,
  `category_class` varchar(50) NOT NULL,
  `category_div_id` varchar(50) NOT NULL,
  `category_name_hu` varchar(200) NOT NULL,
  `category_name_en` varchar(200) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `category_bar`
--

INSERT INTO `category_bar` (`category_id`, `category_class`, `category_div_id`, `category_name_hu`, `category_name_en`, `sort_order`) VALUES
(1, 'category-button', 'physics-topics', 'Fizika témakörök', 'Physics topics', 1),
(2, 'category-button', 'math-topics', 'Matematika témakörök', 'Mathematics topics', 2),
(3, 'category-button', 'maturity-topics', 'Érettségi', 'Maturity exam', 3),
(4, 'category-button', 'useful-links', 'Hasznos linkek', 'Usefull links', 4),
(5, 'category-button', 'video-links', 'Videók', 'Videos', 5),
(6, 'category-button', 'workshop-topics', 'A szertár', 'The workshop', 6);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(6) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `password`, `email`, `phone`) VALUES
(1, 'Admin', 'ec6a6536ca304edf844d1d248a4f08dc', 'admin@admin.com', '06707070707'),
(3, 'molnar', '3049a1f0f1c808cdaa4fbed0e01649b1', 'm@g.hu', '111'),
(4, 'mb', '3049a1f0f1c808cdaa4fbed0e01649b1', 'mb@bbbb.hu', '111'),
(5, 'mmmm', '3cdf5666859f6906c283a1058cd5b9a7', 'mm@bb.hu', '1122323'),
(6, 'mb', '3cdf5666859f6906c283a1058cd5b9a7', 'mb@mb.hu', '33333'),
(7, 'nn', '3049a1f0f1c808cdaa4fbed0e01649b1', 'qq@gg.hu', '111'),
(8, 'én', '2f7b52aacfbf6f44e13d27656ecb1f59', 'mb@mb.com', '1111'),
(9, 'mb', '2f7b52aacfbf6f44e13d27656ecb1f59', 'mb@v.ss', '1111'),
(10, 'ssss', '2f7b52aacfbf6f44e13d27656ecb1f59', 's@ss.j', '1111');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `documents`
--

CREATE TABLE `documents` (
  `document_id` int(10) UNSIGNED NOT NULL,
  `title_hu` varchar(255) NOT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `description_hu` text DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `document_type` enum('pdf','link','image','gif','audio','video_local') NOT NULL,
  `file_url` varchar(512) NOT NULL,
  `thumbnail_url` varchar(512) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `file_size_mb` decimal(6,2) DEFAULT NULL,
  `is_external` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `documents`
--

INSERT INTO `documents` (`document_id`, `title_hu`, `title_en`, `description_hu`, `description_en`, `document_type`, `file_url`, `thumbnail_url`, `mime_type`, `file_size_mb`, `is_external`, `created_at`, `updated_at`) VALUES
(1, '01_Lendulet_Fogalma', NULL, NULL, NULL, 'pdf', '/documents/pdf/01_lendulet_fogalma.pdf', NULL, 'application/pdf', 0.63, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(2, '04_Pontrendszer_Dinamikaja', NULL, NULL, NULL, 'pdf', '/documents/pdf/04_pontrendszer_dinamikaja.pdf', NULL, 'application/pdf', 0.67, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(3, '10_Hullammozgas_Hangtan_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/10_Hullammozgas_hangtan_kozep_teszt_2020.pdf', NULL, 'application/pdf', 0.88, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(4, '11_A_Hotagulas_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/11_A_Hotagulas_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.62, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(5, '11_B_Gaztorvenyek_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/11_B_Gaztorvenyek_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.45, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(6, '11_Hotagulas_ Gaztorvenyek_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/11_Hotagulas_ Gaztorvenyek_kozep_teszt_2020.pdf', NULL, 'application/pdf', 2.20, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(7, '12_Termodinamika_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/12_Termodinamika_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.54, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(8, '13_Kalorimetria_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/13_Kalorimetria_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.77, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(9, '14_Elektrosztatika_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/14_Elektrosztatika_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.77, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(10, '15_Egyenaram_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/15_Egyenaram_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.86, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(11, '16_Magneses_Ter_Elektrodinamika_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/16_Magneses_ter_elektrodinamika_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.69, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(12, '17_Valtakozo_Aram_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/17_Valtakozo_aram_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.04, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(13, '18_Elektromagneses_Sugarzas_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/18_Elektromagneses_sugarzas_kozep_teszt_2020.pdf', NULL, 'application/pdf', 0.81, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(14, '19_Fizikai_ Optika_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/19_Fizikai_ optika_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.28, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(15, '1_Kinematika_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/1_Kinematika_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.67, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(16, '20_Geometriai_Optika_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/20_Geometriai_optika_kozep_teszt_2020.pdf', NULL, 'application/pdf', 2.06, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(17, '21_Hejfizika_Fotonok_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/21_Hejfizika_fotonok_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.26, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(18, '22_Magfizika_Radioaktivitas_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/22_Magfizika_radioaktivitas_kozep_teszt_2020.pdf', NULL, 'application/pdf', 2.63, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(19, '23_Csillagaszat_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/23_Csillagaszat_kozep_teszt_2020.pdf', NULL, 'application/pdf', 2.00, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(20, '24_Fizikatortenet_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/24_Fizikatortenet_kozep_teszt_2020.pdf', NULL, 'application/pdf', 0.71, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(21, '2_Lendulet_Pontrendszerek_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/2_Lendulet_pontrendszerek_kozep_teszt_2020.pdf', NULL, 'application/pdf', 0.80, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(22, '3_Newton_Torvenyek_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/3_Newton_torvenyek_kozep_teszt_2020.pdf', NULL, 'application/pdf', 2.02, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(23, '4_Kormozgás_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/4_Kormozgás_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.49, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(24, '5_Gravitacio_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/5_Gravitacio_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.21, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(25, '6_Statika_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/6_Statika_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.51, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(26, '7_Munka_Energia_ Teljesitmeny_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/7_Munka_energia_ teljesitmeny_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.63, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(27, '8_Hidro_Aerodinamika_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/8_Hidro_aerodinamika_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.66, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(28, '9_Rezgomozgas_Kozep_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/9_Rezgomozgas_kozep_teszt_2020.pdf', NULL, 'application/pdf', 1.05, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(29, 'A_Nehezsegi_Gyorsulas_Meghat_Fonalingaval_2021_Mb', NULL, NULL, NULL, 'pdf', '/documents/pdf/A_nehezsegi_gyorsulas_meghat_fonalingaval_2021_MB.pdf', NULL, 'application/pdf', 0.41, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(30, 'Dinamika_Gyakorlo_Teszt_9_2021', NULL, NULL, NULL, 'pdf', '/documents/pdf/Dinamika_gyakorlo_teszt_9_2021.pdf', NULL, 'application/pdf', 0.11, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(31, 'Dinamika_Kozep_Teszt_9_2021', NULL, NULL, NULL, 'pdf', '/documents/pdf/Dinamika_kozep_teszt_9_2021.pdf', NULL, 'application/pdf', 0.86, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(32, 'Evem_Vizsgalata_Tracker_Prog_2021', NULL, NULL, NULL, 'pdf', '/documents/pdf/EVEM_vizsgalata_tracker_prog_2021.pdf', NULL, 'application/pdf', 0.34, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(33, 'Elsztat_10_2019_Acsop', NULL, NULL, NULL, 'pdf', '/documents/pdf/Elsztat_10_2019_Acsop.pdf', NULL, 'application/pdf', 0.06, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(34, 'Elsztat_10_2019_Bcsop', NULL, NULL, NULL, 'pdf', '/documents/pdf/Elsztat_10_2019_Bcsop.pdf', NULL, 'application/pdf', 0.06, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(35, 'Fiz_01_Bevezetes', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_01_Bevezetes.pdf', NULL, 'application/pdf', 0.70, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(36, 'Fiz_03_Anyag', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_03_anyag.pdf', NULL, 'application/pdf', 0.64, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(37, 'Fiz_04_Mozgas', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_04_mozgas.pdf', NULL, 'application/pdf', 0.96, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(38, 'Fiz_05_Evem', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_05_EVEM.pdf', NULL, 'application/pdf', 1.04, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(39, 'Fiz_06_Valtozo_Mozgas', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_06_valtozo_mozgas.pdf', NULL, 'application/pdf', 0.54, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(40, 'Fiz_07_Mozgasok_Korolottunk', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_07_mozgasok_korolottunk.pdf', NULL, 'application/pdf', 0.69, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(41, 'Fiz_08_Mozgas_Grafikonok', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_08_mozgas_grafikonok.pdf', NULL, 'application/pdf', 0.81, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(42, 'Fiz_09_Newton_Torvenyek', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_09_Newton_torvenyek.pdf', NULL, 'application/pdf', 0.48, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(43, 'Fiz_10_Tomegvonzas_Suly', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_10_tomegvonzas_suly.pdf', NULL, 'application/pdf', 1.23, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(44, 'Fiz_11_Rugero_Surlodas', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_11_rugero_surlodas.pdf', NULL, 'application/pdf', 0.72, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(45, 'Fiz_12_Tap_Gordul_Kozegell', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_12_tap_gordul_kozegell.pdf', NULL, 'application/pdf', 0.75, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(46, 'Fiz_13_Munka_Energia', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_13_munka_energia.pdf', NULL, 'application/pdf', 1.13, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(47, 'Fiz_14_Lendulet_Pontrendszer', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_14_lendulet_pontrendszer.pdf', NULL, 'application/pdf', 0.72, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(48, 'Fiz_15_Utkozesek', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_15_utkozesek.pdf', NULL, 'application/pdf', 1.21, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(49, 'Fiz_16_Egyenletes_Kormozg', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_16_egyenletes_kormozg.pdf', NULL, 'application/pdf', 0.33, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(50, 'Fiz_17_Kormozgas_Dinamikaja', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_17_kormozgas_dinamikaja.pdf', NULL, 'application/pdf', 0.40, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(51, 'Fiz_18_Merev Test', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_18_merev test.pdf', NULL, 'application/pdf', 1.38, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(52, 'Fiz_19_Harmonikus_Rezges', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_19_Harmonikus_rezges.pdf', NULL, 'application/pdf', 0.76, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(53, 'Fiz_20_Rezges_Tulajdonsaga', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_20_Rezges_tulajdonsaga.pdf', NULL, 'application/pdf', 2.03, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(54, 'Fiz_21_Hullam_Terjedese', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_21_Hullam_terjedese.pdf', NULL, 'application/pdf', 3.96, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(55, 'Fiz_22_Hang_Hullam', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_22_Hang_hullam.pdf', NULL, 'application/pdf', 1.48, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(56, 'Fiz_26_Homerseklet', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_26_homerseklet.pdf', NULL, 'application/pdf', 2.14, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(57, 'Fiz_27_Hotagulas', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_27_Hotagulas.pdf', NULL, 'application/pdf', 2.13, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(58, 'Fiz_28_Kalorimetria', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_28_kalorimetria.pdf', NULL, 'application/pdf', 1.25, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(59, 'Fiz_29_Halmazallapot_Valt', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_29_halmazallapot_valt.pdf', NULL, 'application/pdf', 1.70, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(60, 'Fiz_30_Anyag_Gazok', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_30_anyag_gazok.pdf', NULL, 'application/pdf', 0.51, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(61, 'Fiz_31_Kinetikus_Gazmodell', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_31_Kinetikus_gazmodell.pdf', NULL, 'application/pdf', 0.37, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(62, 'Fiz_32_Hotan_1_Fotetele', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_32_Hotan_1_fotetele.pdf', NULL, 'application/pdf', 0.49, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(63, 'Fiz_33_Hoerogepek', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_33_hoerogepek.pdf', NULL, 'application/pdf', 0.69, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(64, 'Fiz_34_Elsztat_Alap', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_34_Elsztat_alap.pdf', NULL, 'application/pdf', 0.50, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(65, 'Fiz_35_Elektromos _Ter', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_35_Elektromos _ter.pdf', NULL, 'application/pdf', 0.70, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(66, 'Fiz_36_Kieg_Kondenzator', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_36_kieg_kondenzator.pdf', NULL, 'application/pdf', 1.00, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(67, 'Fiz_36_Vezetok_Elektr_Terben', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_36_vezetok_elektr_terben.pdf', NULL, 'application/pdf', 0.73, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(68, 'Fiz_37_Aram_Ohm_Torv', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_37_aram_ohm_torv.pdf', NULL, 'application/pdf', 0.81, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(69, 'Fiz_38_Aram_Hatasa_Aramforras', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_38_aram_hatasa_aramforras.pdf', NULL, 'application/pdf', 1.82, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(70, 'Fiz_39_Ellenallas_Kapcsolasok', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_39_ellenallas_kapcsolasok.pdf', NULL, 'application/pdf', 2.26, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(71, 'Fiz_40_Magneses_Ter', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_40_magneses_ter.pdf', NULL, 'application/pdf', 2.17, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(72, 'Fiz_41_Indukcio', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_41_indukcio.pdf', NULL, 'application/pdf', 1.29, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(73, 'Fiz_42_Valtoaram', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_42_valtoaram.pdf', NULL, 'application/pdf', 1.02, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(74, 'Fiz_43_Maxwell_Egyenletek', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_43_Maxwell_egyenletek.pdf', NULL, 'application/pdf', 0.71, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(75, 'Fiz_44_Elektromagneses_Hullam', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_44_Elektromagneses_hullam.pdf', NULL, 'application/pdf', 1.15, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(76, 'Fiz_45_Szinek_Fenyforrasok', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_45_szinek_fenyforrasok.pdf', NULL, 'application/pdf', 1.16, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(77, 'Fiz_46_Feny_Hullam', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_46_Feny_Hullam.pdf', NULL, 'application/pdf', 2.22, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(78, 'Fiz_47_Feny_Reszecske', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_47_Feny_reszecske.pdf', NULL, 'application/pdf', 1.26, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(79, 'Fiz_48_Geometriai_Optika', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_48_geometriai_optika.pdf', NULL, 'application/pdf', 1.17, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(80, 'Fiz_49_Optikai_Kepalkotas', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_49_optikai_kepalkotas.pdf', NULL, 'application/pdf', 1.02, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(81, 'Fiz_50_Optikai_Eszkozok', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_50_optikai_eszkozok.pdf', NULL, 'application/pdf', 1.54, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(82, 'Fiz_51_Atommodellek', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_51_Atommodellek.pdf', NULL, 'application/pdf', 1.69, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(83, 'Fiz_52_Spec_Relativitas', NULL, NULL, NULL, 'pdf', '/documents/pdf/Fiz_52_spec_relativitas.pdf', NULL, 'application/pdf', 1.51, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(84, 'Hangsebesseg_Merese_Pontosabb', NULL, NULL, NULL, 'pdf', '/documents/pdf/Hangsebesseg_merese_pontosabb.pdf', NULL, 'application/pdf', 0.23, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(85, 'Molnar_Botond_2013_Ido_Fogalma', NULL, NULL, NULL, 'pdf', '/documents/pdf/Molnar_Botond_2013_Ido_fogalma.pdf', NULL, 'application/pdf', 0.36, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(86, 'Newton_Torvenyek', NULL, NULL, NULL, 'pdf', '/documents/pdf/Newton_torvenyek.pdf', NULL, 'application/pdf', 0.28, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(87, 'Probaerettsegi_120 Perc_2019', NULL, NULL, NULL, 'pdf', '/documents/pdf/Probaerettsegi_120 perc_2019.pdf', NULL, 'application/pdf', 0.38, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(88, 'Abszolut_Ertek_Proba_9Ny', NULL, NULL, NULL, 'pdf', '/documents/pdf/abszolut_ertek_proba_9ny.pdf', NULL, 'application/pdf', 0.19, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(89, 'Atomreaktor_11_2019', NULL, NULL, NULL, 'pdf', '/documents/pdf/atomreaktor_11_2019.pdf', NULL, 'application/pdf', 0.10, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(90, 'Dinamikus_Tomegmeres', NULL, NULL, NULL, 'pdf', '/documents/pdf/dinamikus_tomegmeres.pdf', NULL, 'application/pdf', 1.81, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(91, 'Egyenes Egyenlete_2018_Pot', NULL, NULL, NULL, 'pdf', '/documents/pdf/egyenes egyenlete_2018_pot.pdf', NULL, 'application/pdf', 0.09, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(92, 'Egyenes_Mozgas_Kepletek', NULL, NULL, NULL, 'pdf', '/documents/pdf/egyenes_mozgas_kepletek.pdf', NULL, 'application/pdf', 0.19, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(93, 'Egyenes_Vonalu_Feladatok_2019_Gyakorlo', NULL, NULL, NULL, 'pdf', '/documents/pdf/egyenes_vonalu_feladatok_2019_gyakorlo.pdf', NULL, 'application/pdf', 0.41, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(94, 'Egyenes_Vonalu_Feladatok_2019_Keplettel_14_Betu', NULL, NULL, NULL, 'pdf', '/documents/pdf/egyenes_vonalu_feladatok_2019_keplettel_14_betu.pdf', NULL, 'application/pdf', 0.45, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(95, 'Egyenlet_9Ny_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/egyenlet_9ny_2020.pdf', NULL, 'application/pdf', 0.50, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(96, 'Egyenlet_9Ny_2020_Pót', NULL, NULL, NULL, 'pdf', '/documents/pdf/egyenlet_9ny_2020_pót.pdf', NULL, 'application/pdf', 1.05, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(97, 'Ekvipotencialis_Vonalak_Feladatlap_Mb', NULL, NULL, NULL, 'pdf', '/documents/pdf/ekvipotencialis_vonalak_feladatlap_MB.pdf', NULL, 'application/pdf', 0.32, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(98, 'Elem_Belso_Ellenallasa_Feladatlap_Mb', NULL, NULL, NULL, 'pdf', '/documents/pdf/elem_belso_ellenallasa_feladatlap_MB.pdf', NULL, 'application/pdf', 0.33, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(99, 'Energia_Munka_Impulzus_Teszt_2018_9', NULL, NULL, NULL, 'pdf', '/documents/pdf/energia_munka_impulzus_teszt_2018_9.pdf', NULL, 'application/pdf', 0.11, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(100, 'Energia_Munka_Teszt_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/energia_munka_teszt_2020.pdf', NULL, 'application/pdf', 0.11, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(101, 'Fuggoleges_Hajitas', NULL, NULL, NULL, 'pdf', '/documents/pdf/fuggoleges_hajitas.pdf', NULL, 'application/pdf', 0.16, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(102, 'G_Merese_Tracker_Prog', NULL, NULL, NULL, 'pdf', '/documents/pdf/g_merese_tracker_prog.pdf', NULL, 'application/pdf', 0.26, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(103, 'Grafok_Gyakorlo_11_2017', NULL, NULL, NULL, 'pdf', '/documents/pdf/grafok_gyakorlo_11_2017.pdf', NULL, 'application/pdf', 1.03, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(104, 'Gyokos Egyenlet_Egyenletrendszer', NULL, NULL, NULL, 'pdf', '/documents/pdf/gyokos egyenlet_egyenletrendszer.pdf', NULL, 'application/pdf', 0.37, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(105, 'Gyorsulas_Gyak_Mozaik', NULL, NULL, NULL, 'pdf', '/documents/pdf/gyorsulas_gyak_mozaik.pdf', NULL, 'application/pdf', 0.24, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(106, 'Hasonlosag_10_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/hasonlosag_10_2020.pdf', NULL, 'application/pdf', 0.40, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(107, 'Hasonlosag_10_Proba01', NULL, NULL, NULL, 'pdf', '/documents/pdf/hasonlosag_10_proba01.pdf', NULL, 'application/pdf', 0.17, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(108, 'Hasonlosag_10_Proba02', NULL, NULL, NULL, 'pdf', '/documents/pdf/hasonlosag_10_proba02.pdf', NULL, 'application/pdf', 0.17, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(109, 'Hidrosztat_Elmelet2019_Acsop', NULL, NULL, NULL, 'pdf', '/documents/pdf/hidrosztat_elmelet2019_Acsop.pdf', NULL, 'application/pdf', 0.34, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(110, 'Hotagulas_10_2018', NULL, NULL, NULL, 'pdf', '/documents/pdf/hotagulas_10_2018.pdf', NULL, 'application/pdf', 0.10, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(111, 'Hullam_Fogalmak', NULL, NULL, NULL, 'pdf', '/documents/pdf/hullam_fogalmak.pdf', NULL, 'application/pdf', 0.58, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(112, 'Hullamtan_Tesztek_2021', NULL, NULL, NULL, 'pdf', '/documents/pdf/hullamtan_tesztek_2021.pdf', NULL, 'application/pdf', 1.13, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(113, 'Hullám_Teszt_2018', NULL, NULL, NULL, 'pdf', '/documents/pdf/hullám_teszt_2018.pdf', NULL, 'application/pdf', 0.18, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(114, 'Huzal_Ellenallasa_Feladatlap_Mb', NULL, NULL, NULL, 'pdf', '/documents/pdf/huzal_ellenallasa_feladatlap_MB.pdf', NULL, 'application/pdf', 0.43, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(115, 'Ido_Fogalom_Prezi', NULL, NULL, NULL, 'pdf', '/documents/pdf/ido_fogalom_prezi.pdf', NULL, 'application/pdf', 0.30, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(116, 'Jeg_Olvadasho_Meres_Feladatlap', NULL, NULL, NULL, 'pdf', '/documents/pdf/jeg_olvadasho_meres_feladatlap.pdf', NULL, 'application/pdf', 0.40, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(117, 'Kerdesek_11_1_Rezgesek', NULL, NULL, NULL, 'pdf', '/documents/pdf/kerdesek_11_1_rezgesek.pdf', NULL, 'application/pdf', 0.18, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(118, 'Kerdesek_11_2_Hullamok_2021', NULL, NULL, NULL, 'pdf', '/documents/pdf/kerdesek_11_2_hullamok_2021.pdf', NULL, 'application/pdf', 0.85, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(119, 'Kerdesek_9_1_Mozgas_01', NULL, NULL, NULL, 'pdf', '/documents/pdf/kerdesek_9_1_mozgas_01.pdf', NULL, 'application/pdf', 0.18, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(120, 'Kerekpar_2017_Erettsegi', NULL, NULL, NULL, 'pdf', '/documents/pdf/kerekpar_2017_erettsegi.pdf', NULL, 'application/pdf', 0.94, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(121, 'Kinematika_Feladatok_Grafikus_Megoldasa', NULL, NULL, NULL, 'pdf', '/documents/pdf/kinematika_feladatok_grafikus_megoldasa.pdf', NULL, 'application/pdf', 2.10, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(122, 'Kinematika_Grafikus_Feladat', NULL, NULL, NULL, 'pdf', '/documents/pdf/kinematika_grafikus_feladat.pdf', NULL, 'application/pdf', 0.69, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(123, 'Kombinatorika_10_2019_Ab Csop', NULL, NULL, NULL, 'pdf', '/documents/pdf/kombinatorika_10_2019_AB csop.pdf', NULL, 'application/pdf', 0.80, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(124, 'Kondenzator', NULL, NULL, NULL, 'pdf', '/documents/pdf/kondenzator.pdf', NULL, 'application/pdf', 1.47, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(125, 'Kor _Egyenlet Gyakorlo_2018', NULL, NULL, NULL, 'pdf', '/documents/pdf/kor _egyenlet gyakorlo_2018.pdf', NULL, 'application/pdf', 0.18, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(126, 'Kor_Egyenlet _2018_Pot', NULL, NULL, NULL, 'pdf', '/documents/pdf/kor_egyenlet _2018_pot.pdf', NULL, 'application/pdf', 0.17, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(127, 'Kormozgas_9_2019', NULL, NULL, NULL, 'pdf', '/documents/pdf/kormozgas_9_2019.pdf', NULL, 'application/pdf', 0.07, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(128, 'Kormozgas_Kepletek', NULL, NULL, NULL, 'pdf', '/documents/pdf/kormozgas_kepletek.pdf', NULL, 'application/pdf', 0.29, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(129, 'Kormozgas_Teszt_Gyakorlo', NULL, NULL, NULL, 'pdf', '/documents/pdf/kormozgas_teszt_gyakorlo.pdf', NULL, 'application/pdf', 0.07, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(130, 'Kozegellenallas_Merese_Mb', NULL, NULL, NULL, 'pdf', '/documents/pdf/kozegellenallas_merese_MB.pdf', NULL, 'application/pdf', 0.25, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(131, 'Lin_Fuggveny_9Ny_2020', NULL, NULL, NULL, 'pdf', '/documents/pdf/lin_fuggveny_9ny_2020.pdf', NULL, 'application/pdf', 0.28, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(132, 'Logika_10_2019', NULL, NULL, NULL, 'pdf', '/documents/pdf/logika_10_2019.pdf', NULL, 'application/pdf', 0.27, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(133, 'Logika_10_2019_Pot', NULL, NULL, NULL, 'pdf', '/documents/pdf/logika_10_2019_pot.pdf', NULL, 'application/pdf', 0.33, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(134, 'Logika_Egyenletrendszer_10_2019', NULL, NULL, NULL, 'pdf', '/documents/pdf/logika_egyenletrendszer_10_2019.pdf', NULL, 'application/pdf', 0.45, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(135, 'Logika_Egyenletrendszer_10_2019_Pot', NULL, NULL, NULL, 'pdf', '/documents/pdf/logika_egyenletrendszer_10_2019_pot.pdf', NULL, 'application/pdf', 0.35, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(136, 'Masodfoku_2019', NULL, NULL, NULL, 'pdf', '/documents/pdf/masodfoku_2019.pdf', NULL, 'application/pdf', 0.45, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(137, 'Masodfoku_2019_Pot2', NULL, NULL, NULL, 'pdf', '/documents/pdf/masodfoku_2019_pot2.pdf', NULL, 'application/pdf', 0.37, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(138, 'Meres_Tracker_Programmal', NULL, NULL, NULL, 'pdf', '/documents/pdf/meres_tracker_programmal.pdf', NULL, 'application/pdf', 1.52, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(139, 'Mikola_Cso_Vizsgalata_Mb', NULL, NULL, NULL, 'pdf', '/documents/pdf/mikola_cso_vizsgalata_MB.pdf', NULL, 'application/pdf', 0.25, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(140, 'Mikola_Cso_Vizsgalata_Mb_Feladatlap2022', NULL, NULL, NULL, 'pdf', '/documents/pdf/mikola_cso_vizsgalata_MB_feladatlap2022.pdf', NULL, 'application/pdf', 0.43, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(141, 'Mozgas_Kozegellenallassal', NULL, NULL, NULL, 'pdf', '/documents/pdf/mozgas_kozegellenallassal.pdf', NULL, 'application/pdf', 0.12, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(142, 'Parhuzamos_Kapcsolas_Feladatlap_Mb', NULL, NULL, NULL, 'pdf', '/documents/pdf/parhuzamos_kapcsolas_feladatlap_MB.pdf', NULL, 'application/pdf', 0.18, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(143, 'Proba_Erettsegi_11_2018', NULL, NULL, NULL, 'pdf', '/documents/pdf/proba_erettsegi_11_2018.pdf', NULL, 'application/pdf', 0.40, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(144, 'Rezgesek_11_2019', NULL, NULL, NULL, 'pdf', '/documents/pdf/rezgesek_11_2019.pdf', NULL, 'application/pdf', 0.79, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(145, 'Rezgomozgas_Fogalmak_Valaszok', NULL, NULL, NULL, 'pdf', '/documents/pdf/rezgomozgas_fogalmak_valaszok.pdf', NULL, 'application/pdf', 0.63, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(146, 'Rugo_Merese_Mb', NULL, NULL, NULL, 'pdf', '/documents/pdf/rugo_merese_MB.pdf', NULL, 'application/pdf', 0.73, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(147, 'Rugoallando_Merese__Feladatlapmb', NULL, NULL, NULL, 'pdf', '/documents/pdf/rugoallando_merese__feladatlapMB.pdf', NULL, 'application/pdf', 0.18, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(148, 'Sincos_Tetel_11_2018', NULL, NULL, NULL, 'pdf', '/documents/pdf/sincos_tetel_11_2018.pdf', NULL, 'application/pdf', 0.35, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(149, 'Statisztika2019_1Oldal', NULL, NULL, NULL, 'pdf', '/documents/pdf/statisztika2019_1oldal.pdf', NULL, 'application/pdf', 0.18, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(150, 'Statisztika2019_2Oldal', NULL, NULL, NULL, 'pdf', '/documents/pdf/statisztika2019_2oldal.pdf', NULL, 'application/pdf', 0.38, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(151, 'Sulymeres_Forgatonyomatekkal_Mbvar1', NULL, NULL, NULL, 'pdf', '/documents/pdf/sulymeres_forgatonyomatekkal_MBvar1.pdf', NULL, 'application/pdf', 0.41, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(152, 'Surlodasi_Eh_Merese_Mb', NULL, NULL, NULL, 'pdf', '/documents/pdf/surlodasi_eh_merese_MB.pdf', NULL, 'application/pdf', 0.18, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(153, 'Szamtani_Sorozat_2019_12Kz', NULL, NULL, NULL, 'pdf', '/documents/pdf/szamtani_sorozat_2019_12KZ.pdf', NULL, 'application/pdf', 0.10, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(154, 'Szorzatta_Alakitas_9_2018', NULL, NULL, NULL, 'pdf', '/documents/pdf/szorzatta_alakitas_9_2018.pdf', NULL, 'application/pdf', 0.16, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(155, 'Szorzatta_Alakitas_9_2018_Var2', NULL, NULL, NULL, 'pdf', '/documents/pdf/szorzatta_alakitas_9_2018_var2.pdf', NULL, 'application/pdf', 0.05, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(156, 'Szorzatta_Alakitas_9Ny_2019_Abcsop', NULL, NULL, NULL, 'pdf', '/documents/pdf/szorzatta_alakitas_9ny_2019_ABcsop.pdf', NULL, 'application/pdf', 0.28, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(157, 'Tergeo_Matma_2019', NULL, NULL, NULL, 'pdf', '/documents/pdf/tergeo_matma_2019.pdf', NULL, 'application/pdf', 0.25, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(158, 'Termisztor_Ellenallasa_Feladatlap_Mb', NULL, NULL, NULL, 'pdf', '/documents/pdf/termisztor_ellenallasa_feladatlap_MB.pdf', NULL, 'application/pdf', 0.18, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(159, 'Termodinamika_10_2020_2', NULL, NULL, NULL, 'pdf', '/documents/pdf/termodinamika_10_2020_2.pdf', NULL, 'application/pdf', 0.43, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(160, 'Trigonometria_Egyenletek_11_2018_Var2', NULL, NULL, NULL, 'pdf', '/documents/pdf/trigonometria_egyenletek_11_2018_var2.pdf', NULL, 'application/pdf', 0.30, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(161, 'Whiting_Inga', NULL, NULL, NULL, 'pdf', '/documents/pdf/whiting_inga.pdf', NULL, 'application/pdf', 0.52, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(162, 'Zsebizzo_Ellenallasa_Feladatlap_Mb', NULL, NULL, NULL, 'pdf', '/documents/pdf/zsebizzo_ellenallasa_feladatlap_MB.pdf', NULL, 'application/pdf', 0.18, 0, '2025-12-12 19:30:37', '2025-12-12 19:30:37'),
(163, 'Interactive Physics Simulations', NULL, NULL, NULL, 'link', 'http://ngsir.netfirms.com/englishVersion.htm', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(164, 'Interactív szimulációk', NULL, NULL, NULL, 'link', 'https://phet.colorado.edu/', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:47:38'),
(165, 'Fizika Animációk/Szimulációk', NULL, NULL, NULL, 'link', 'https://www.vascak.cz/physicsanimations.php?l=hu', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(166, 'Áramkörépítő egyenfeszültségre', NULL, NULL, NULL, 'link', 'https://phet.colorado.edu/hu/simulations/circuit-construction-kit-dc-virtual-lab', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(167, 'PhET Simulations', NULL, NULL, NULL, 'link', 'https://phet.colorado.edu/en/simulations/filter?subjects=physics&type=html', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(168, 'Interactive Physics Simulations', NULL, NULL, NULL, 'link', 'https://ngsir.netfirms.com/index.htm#HS', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(169, 'Animations for Physics and Astronomy', NULL, NULL, NULL, 'link', 'https://phys23p.sl.psu.edu/phys_anim/Phys_anim.htm', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(170, 'Prezi Video Tanároknak', NULL, NULL, NULL, 'link', 'https://prezi.com/v/aq0j173voslo/prezi-video-tanaroknak/', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(171, 'Mit mond a fizikáról a NAT?', NULL, NULL, NULL, 'link', 'https://momentum.blog.hu/2020/02/28/mit_mond_a_fizikarol_a_nat?fbclid=IwAR07srwG06A9_yAvQCSmvQ2E-NN-NGo42wTnaGx1nsqInqP87vWrMmJ_2uQ', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(172, 'Tanárblog - Tanítás korona idején', NULL, NULL, NULL, 'link', 'http://www.tanarblog.hu/cikk/tanitas-korona-idejen-digialalis-pedagogiai-utmutato?fbclid=IwAR3Zf_gns5zCQeK4vEcRYAihxDoBO1PVkGTiO7ScrLGvAQmsqrxqs1miL0M', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(173, 'Hogyan tartsunk meg egy tanórát az otthon lévő gyerekeknek?', NULL, NULL, NULL, 'link', 'https://www.youtube.com/watch?v=ub-Br-c8VKw&feature=share&fbclid=IwAR2iBgnysol6kTb5iNbyUiWjxTZ6kSSHxvmR8aTm1lwHYZ8ajsY96HE8RZc', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(174, 'FizKapu', NULL, NULL, NULL, 'link', 'https://www.youtube.com/user/FizKapu/videos?fbclid=IwAR2TfMbCc2H6JJmi7MWRviy1VWx98hztGq2PB6_6cFbAbgkY3Y56Vo6npwU', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(175, 'MATEK EGYSZERŰEN', NULL, NULL, NULL, 'link', 'https://www.mateking.hu/', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(176, 'Plutonium 239', NULL, NULL, NULL, 'link', 'https://www.nuclear-power.net/nuclear-power-plant/nuclear-fuel/plutonium/plutonium-239/', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(177, 'kísérletezzünk otthon!', NULL, NULL, NULL, 'link', 'http://goliat.eik.bme.hu/~hartlein/otthon.html?fbclid=IwAR2EFh2I8pcmo440rCHDxcpWL-oHKFBRGZa7TZO2PU9in3wer3LD-3D7OuQ', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(178, 'Természettudományos Ismeretterjesztő Tartalmak Nagy Sándor magkémikus ajánlásával', NULL, NULL, NULL, 'link', 'http://nagysandor.eu/', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(179, 'Atommodellek', NULL, NULL, NULL, 'link', 'https://tferi.hu/atommodellek?showall=1&limitstart', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(180, 'Anyag,tér,idő', NULL, NULL, NULL, 'link', 'http://www.date.hu/~nasa/ati.html', NULL, NULL, NULL, 1, '2025-12-12 19:46:04', '2025-12-12 19:46:04'),
(181, 'Fizikakönyv', NULL, NULL, NULL, 'link', 'http://www.fizikakonyv.hu/?fbclid=IwAR2ZMkWn532kRUTwlcw1XfzuAYxlXzJK-1kfxqrpEQ8LNzD_cNTeBjjzXzE', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(182, 'Vízkémia I.', NULL, NULL, NULL, 'link', 'https://regi.tankonyvtar.hu/hu/tartalom/tamop412A/2010-0019_Vizkemia_I/ch06.html', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(183, 'Fizikakönyv', NULL, NULL, NULL, 'link', 'http://www.fizikakonyv.hu/?fbclid=IwAR11f0PZRbMR25akBm4VnbMuWwNfynQNMuQ_hmbY-56OelodumsNdCR3FK8', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(184, 'Miro Lite', NULL, NULL, NULL, 'link', 'https://miro.com/online-whiteboard/', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(185, 'Szakképzés', NULL, NULL, NULL, 'link', 'https://tudasbazis.sulinet.hu/hu/szakkepzes', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(186, 'Java alkalmazások a fizika tanításához', NULL, NULL, NULL, 'link', 'https://www.walter-fendt.de/html5/phhu/', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(187, 'Circuit Diagram Web Editor', NULL, NULL, NULL, 'link', 'https://www.circuit-diagram.org/editor/', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(188, 'Rezgések', NULL, NULL, NULL, 'link', 'https://fizipedia.bme.hu/index.php/Rezg%C3%A9sek', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(189, 'Ripple Tank Simulation', NULL, NULL, NULL, 'link', 'https://www.falstad.com/ripple/', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(190, 'Open Source Physics', NULL, NULL, NULL, 'link', 'https://www.compadre.org/osp/index.cfm', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(191, 'Acoustics and Vibration Animations', NULL, NULL, NULL, 'link', 'https://www.acs.psu.edu/drussell/demos.html', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(192, 'Physics Applets', NULL, NULL, NULL, 'link', 'https://galileoandeinstein.phys.virginia.edu/more_stuff/Applets/', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(193, 'Rutherford Scattering and Size of Nucleus', NULL, NULL, NULL, 'link', 'https://javalab.org/en/rutherford_scattering_and_size_of_nucleus_en/', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(194, 'Fizika, Kémia érettségi gyűjtemény', NULL, NULL, NULL, 'link', 'https://kemfiz.hu/#', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(195, 'Természet Világa', NULL, NULL, NULL, 'link', 'https://www.termvil.hu/archiv/szamok/tv2010/tv1005/ur.html', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(196, 'Természet Világa', NULL, NULL, NULL, 'link', 'https://www.termvil.hu/archiv/szamok/tv2015/tv1509/both.html', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(197, 'Természet Világa', NULL, NULL, NULL, 'link', 'https://www.termvil.hu/archiv/szamok/tv2010/tv1006/both.html', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(198, 'Természet Világa', NULL, NULL, NULL, 'link', 'https://www.termvil.hu/archiv/szamok/tv2011/tv1104/both.html', NULL, NULL, NULL, 1, '2025-12-12 19:46:05', '2025-12-12 19:46:05'),
(199, '10_Ismetlo_2025', NULL, NULL, NULL, 'pdf', '/documents/pdf/10_ismetlo_2025.pdf', NULL, 'application/pdf', 0.22, 0, '2025-12-14 19:37:53', '2025-12-14 19:37:53'),
(200, '11_Ismetlo_2025', NULL, NULL, NULL, 'pdf', '/documents/pdf/11_ismetlo_2025.pdf', NULL, 'application/pdf', 0.64, 0, '2025-12-14 19:37:53', '2025-12-14 19:37:53'),
(201, '9_Ismetlo_2025', NULL, NULL, NULL, 'pdf', '/documents/pdf/9_ismetlo_2025.pdf', NULL, 'application/pdf', 0.32, 0, '2025-12-14 19:37:53', '2025-12-14 19:37:53'),
(202, '11 Ismetlo Mego01', NULL, NULL, NULL, 'image', '/documents/images/11_ismetlo_mego01.jpg', NULL, 'image/jpeg', 1.30, 0, '2025-12-14 20:00:30', '2025-12-14 20:00:30'),
(203, '11 Ismetlo Mego02', NULL, NULL, NULL, 'image', '/documents/images/11_ismetlo_mego02.jpg', NULL, 'image/jpeg', 1.38, 0, '2025-12-14 20:00:30', '2025-12-14 20:00:30'),
(204, '11 Ismetlo Mego03', NULL, NULL, NULL, 'image', '/documents/images/11_ismetlo_mego03.jpg', NULL, 'image/jpeg', 1.15, 0, '2025-12-14 20:00:30', '2025-12-14 20:00:30'),
(205, 'Ismetles 09 Oszt Mego', NULL, NULL, NULL, 'image', '/documents/images/ismetles_09_oszt_mego.jpg', NULL, 'image/jpeg', 1.30, 0, '2025-12-14 20:00:30', '2025-12-14 20:00:30'),
(206, 'Ismetles 10 Oszt Mego', NULL, NULL, NULL, 'image', '/documents/images/ismetles_10_oszt_mego.jpg', NULL, 'image/jpeg', 1.35, 0, '2025-12-14 20:00:30', '2025-12-14 20:00:30');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `documents_videos`
--

CREATE TABLE `documents_videos` (
  `documents_videos_id` int(11) NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL,
  `video_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `documents_videos`
--

INSERT INTO `documents_videos` (`documents_videos_id`, `document_id`, `video_id`) VALUES
(1, 35, 61),
(22, 36, 60),
(34, 37, 58),
(46, 38, 56),
(49, 39, 55),
(50, 40, 54),
(51, 41, 53),
(52, 42, 43),
(2, 43, 42),
(3, 44, 41),
(4, 45, 40),
(5, 46, 34),
(6, 47, 33),
(8, 48, 31),
(7, 48, 32),
(9, 49, 24),
(10, 50, 23),
(12, 51, 20),
(11, 51, 21),
(13, 52, 18),
(14, 53, 16),
(16, 54, 12),
(15, 54, 13),
(17, 55, 9),
(18, 56, 8),
(19, 57, 4),
(20, 58, 3),
(21, 59, 1),
(23, 60, 59),
(24, 61, 57),
(25, 62, 46),
(26, 63, 45),
(27, 64, 44),
(28, 65, 39),
(29, 66, 38),
(30, 67, 38),
(31, 68, 37),
(32, 69, 36),
(33, 70, 35),
(35, 71, 30),
(36, 72, 29),
(37, 73, 27),
(38, 74, 28),
(39, 75, 26),
(40, 76, 25),
(41, 77, 22),
(42, 78, 19),
(43, 79, 17),
(44, 80, 15),
(45, 81, 14),
(47, 82, 11),
(48, 83, 10),
(54, 199, 5),
(55, 200, 2),
(56, 200, 7),
(53, 201, 6),
(59, 202, 7),
(60, 203, 2),
(61, 204, 2),
(62, 205, 6),
(63, 206, 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(5) NOT NULL,
  `feedback_type` varchar(20) NOT NULL,
  `feedback_hun` mediumtext NOT NULL,
  `feedback_eng` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feedback_type`, `feedback_hun`, `feedback_eng`) VALUES
(1, 'error', 'Ezzel az emailcímmel már regisztrált felhasználó!', 'A customer already signed in with this email!'),
(2, 'error', 'Név megadása kötelező!', 'Name required!'),
(3, 'error', 'Email megadása kötelező!', 'Email is required!'),
(4, 'error', 'Jelszó megadása kötelező!', 'Password required!'),
(5, 'error', 'A jelszó megerősítés nem egyezik az eredetivel', 'Password confirmation failed!'),
(6, 'feedback', 'Hiba az űrlap kitöltésében:', 'Error filling out the form:'),
(7, 'feedback', 'Az adatokat elmentettük, kérem lépjen be!', 'The data has been saved, please log in!'),
(8, 'feedback', 'Hiba az adatok mentésében!', 'Data saving failure!'),
(9, 'feedback', 'Sikertelen belépés az oldalra!', 'Access denied!'),
(10, 'feedback', 'Sikeres bejelentkezés!', 'Succesful login!'),
(11, 'feedback', 'Sikertelen bejelentkezés!', 'Login fgailed!');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `forms`
--

CREATE TABLE `forms` (
  `label_id` int(5) NOT NULL,
  `container_id` varchar(30) NOT NULL,
  `container_type` varchar(20) NOT NULL,
  `label_hun` mediumtext NOT NULL,
  `label_eng` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `forms`
--

INSERT INTO `forms` (`label_id`, `container_id`, `container_type`, `label_hun`, `label_eng`) VALUES
(1, 'reg_button', 'html', 'Regisztráció', 'Sign in'),
(2, 'login_button', 'html', 'Belépés', 'Login'),
(3, 'category_menu_label', 'html', 'KATEGÓRIÁK', 'BRANCHES'),
(4, 'search_topic', 'input', 'A keresett fogalom…', 'Topic to find…'),
(5, 'classroom', 'html', 'Osztályterem', 'Classroom'),
(6, 'school_work', 'html', 'Tananyagok', 'School work'),
(7, 'regname', 'input', 'Név…', 'Name….'),
(8, 'regemail', 'input', 'Email…', 'Email….'),
(9, 'regpass', 'input', 'Jelszó…', 'Password..'),
(10, 'regpass2', 'input', 'Jelszó ismét…', 'Password check..'),
(11, 'regphone', 'input', 'Mobilszám…', 'Phone number…'),
(12, 'regsubmit', 'submit', 'Regisztráció', 'Sign In'),
(13, 'loginemail', 'input', 'Email…', 'Email….'),
(14, 'loginpass', 'input', 'Jelszó…', 'Password..'),
(15, 'loginsubmit', 'submit', 'Belépés', 'Login');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `glossary`
--

CREATE TABLE `glossary` (
  `glossary_id` int(11) NOT NULL,
  `term_name_hu` varchar(100) NOT NULL,
  `term_name_en` varchar(100) NOT NULL,
  `term_definition_hu` text NOT NULL,
  `term_definition_en` text DEFAULT NULL,
  `short_hu` varchar(500) DEFAULT NULL,
  `short_en` varchar(500) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `glossary`
--

INSERT INTO `glossary` (`glossary_id`, `term_name_hu`, `term_name_en`, `term_definition_hu`, `term_definition_en`, `short_hu`, `short_en`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'Pálya', 'Path', 'A pálya a mozgó test által térben leírt vonal.', '', 'A pálya alakja a vonatkoztatási rendszertől függően változik (relativitás).', '', 'fizika, kinematika, alapfogalom', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(2, 'Megtett út', 'Distance Travelled', 'Az út a mozgó test pályájának hossza, amelyet a mozgás során bejár. **Skalármennyiség** (csak nagysága van).', '', 'Alapvető, hogy megkülönböztessük az elmozdulástól. Az út-idő grafikon meredeksége adja az átlagsebességet.', '', 'fizika, kinematika, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(3, 'Elmozdulás', 'Displacement', 'Az elmozdulás a mozgás kiindulási pontját és a végpontját összekötő irányított szakasz. **Vektormennyiség** (nagysága és iránya is van).', '', 'Tudja alkalmazni az elmozdulás fogalmát egyenes vonalú mozgások leírására.', '', 'fizika, kinematika', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(4, 'Sebesség', 'Velocity', 'A sebesség a mozgó test elmozdulásának és az eltelt időnek a hányadosa. **Vektormennyiség** ($v = \\Delta r / \\Delta t$).', '', 'Ismerje az **átlagsebesség** és a **pillanatnyi sebesség** közötti különbséget.', '', 'fizika, kinematika, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(5, 'Gyorsulás', 'Acceleration', 'A gyorsulás a sebesség időbeli változása. **Vektormennyiség** ($a = \\Delta v / \\Delta t$).', '', 'A gyorsulás-idő grafikon alatti terület adja meg a sebességváltozást. Emelt szinten elvárt a grafikus kiszámítás.', '', 'fizika, kinematika, dinamika', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(6, 'Szabadesés', 'Free Fall', 'A szabadesés a test mozgása csak a gravitáció hatására. Egyenes vonalú, egyenletesen gyorsuló mozgás (a nehézségi gyorsulással, $g$).', '', 'Tudjon egyszerű számításokat végezni a szabadesés témájában. Ismerje a nehézségi gyorsulás ($g$) fogalmát.', '', 'fizika, gravitáció, kinematika', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(7, 'Függőleges hajítás', 'Vertical Throw', 'Az olyan mozgás, ahol a testre a gravitációs erő hat, de a mozgás kezdetén függőleges irányú kezdősebességet kap.', '', 'Tudjon egyszerű számításokat végezni a függőleges hajítás témájában.', '', 'fizika, kinematika, mozgás', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(8, 'Egyenletes körmozgás', 'Uniform Circular Motion', 'Az olyan periodikus mozgás, ahol a test sebességének nagysága állandó, de az iránya folyamatosan változik (a pálya kör).', '', 'Tudjon periódusidőt mérni. Emelt szinten: tudjon kinematikai és dinamikai feladatokat megoldani a témakörben.', '', 'fizika, dinamika, mozgás', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(9, 'Centripetális gyorsulás', 'Centripetal Acceleration', 'Az az eredőerő által okozott gyorsulás, amely az egyenletes körmozgást végző test sebességének irányát folyamatosan változtatja a kör középpontja felé mutatva.', '', 'Ismerje az egyenletes körmozgás dinamikai feltételét és jellemzői közötti összefüggéseket ($a_{cp} = v^2/r$).', '', 'fizika, dinamika', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(10, 'Harmonikus rezgőmozgás', 'Harmonic Motion', 'Az olyan rezgőmozgás, ahol az eltérítő erő arányos a kitéréssel, és mindig az egyensúlyi helyzet felé mutat.', '', 'Ismerje a csillapítatlan és csillapodó rezgőmozgást. Emelt szinten: a HRM kvantitatív leírása (függvények) elvárt.', '', 'fizika, rezgés, emelt szint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(11, 'Kényszerrezgés', 'Forced Oscillation', 'Olyan rezgés, amit külső, periodikus erő tart fenn, nem hagyja a rendszert a sajátfrekvenciáján rezegni.', '', 'Ismerje a kényszerrezgés jelenségét. Kapcsolat a rezonancia jelenségével.', '', 'fizika, rezgés', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(12, 'Rezonancia', 'Resonance', 'Az a jelenség, amikor a gerjesztő frekvencia megegyezik a rendszer sajátfrekvenciájával, és a rezgés amplitúdója ugrásszerűen megnő.', '', 'Tudja mindennapi példákon keresztül megmagyarázni káros, illetve hasznos voltát. Tudjon vonatkozó kísérletet összeállítani.', '', 'fizika, rezgés', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(13, 'Newton I. törvénye (Tehetetlenség)', 'Newton\'s 1st Law (Inertia)', 'Minden test megtartja egyenes vonalú egyenletes mozgásállapotát (vagy nyugalmi állapotát), amíg azt külső erő meg nem változtatja.', '', 'A mozgásállapot-változások létrejöttének feltétele a külső erő.', '', 'fizika, dinamika, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(14, 'Newton II. törvénye (Dinamika)', 'Newton\'s 2nd Law (Dynamics)', 'A test gyorsulása egyenesen arányos a testre ható eredő erővel, és fordítottan arányos a tömeggel ($F=ma$).', '', 'Értelmezze a tömeg fogalmát e törvény segítségével. Emelt szinten: a törvény alkalmazása a mozgásfajták dinamikai feltételére.', '', 'fizika, dinamika, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(15, 'Newton III. törvénye (Kölcsönhatás)', 'Newton\'s 3rd Law (Action-Reaction)', 'Két test kölcsönhatásakor a testek egymásra egyenlő nagyságú, ellentétes irányú erővel hatnak.', '', 'Ismerje fel és ábrázolja az egy kölcsönhatásban fellépő erőket. Értelmezze a mindennapos mechanikai jelenségeknél az ok-okozati kapcsolatokat.', '', 'fizika, dinamika', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(16, 'Lendület', 'Momentum', 'A lendület (impulzus) a test tömegének és sebességének szorzata. **Vektormennyiség** ($I = m \\cdot v$).', '', 'Ismerje a lendület fogalmát. A lendületváltozás megegyezik a mozgás időtartama alatt ható eredő erő impulzusával.', '', 'fizika, lendület, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(17, 'Lendületmegmaradás törvénye', 'Law of Conservation of Momentum', 'Zárt rendszerben (ahol nincs külső eredő erő) a teljes lendület összege állandó.', '', 'Konkrét, mindennapi példákban (ütközések, közlekedésbiztonság) ismerje fel a törvény érvényesülését.', '', 'fizika, lendület, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(18, 'Csúszási és tapadási súrlódás', 'Sliding and Static Friction', 'A **csúszási súrlódás** a mozgó testet fékezi. A **tapadási súrlódás** megakadályozza a nyugalomban lévő test elindulását.', '', 'Emelt szinten: Ismerje a gördülés során fellépő tapadási súrlódást. Tudjon összetett feladatokat megoldani súrlódási erőkre vonatkozóan.', '', 'fizika, erők, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(19, 'Közegellenállás', 'Air/Fluid Resistance', 'A közeg (levegő, folyadék) által a mozgó testre gyakorolt fékező erő. Nagysága függ a sebességtől, a test alakjától és a közeg sűrűségétől.', '', 'Ismerje a közegellenállás jelenségét, és tudja, hogy mitől függ a közegellenállási erő.', '', 'fizika, erők', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(20, 'Forgatónyomaték', 'Torque (Moment of Force)', 'Az erő forgatóhatását írja le. Nagysága az erő nagyságának, az erőkar hosszának és a köztük lévő szög szinuszának szorzata.', '', 'Tudja kiszámolni egy erő forgatónyomatékát általános esetben. Ismerje az erő forgatóhatását.', '', 'fizika, forgómozgás, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(21, 'Munka (Mechanika)', 'Work (Mechanical)', 'A munka az energiaváltozás mértéke. A munkát állandó nagyságú és irányú erőhatás esetén az erő és az elmozdulás szorzatának skaláris mennyiségeként számoljuk.', '', 'Tudja kiszámolni a munkát $F-s$ diagram alapján is. Emelt szinten: tudjon feladatokat megoldani rugóerő munkája, emelési munka témakörében.', '', 'fizika, munka, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(22, 'Teljesítmény', 'Power', 'A teljesítmény a munkavégzés sebessége, az egységnyi idő alatt végzett munka ($P=W/t$).', '', 'Ismerje és alkalmazza egyszerű feladatokban a teljesítmény és a hatásfok fogalmát. Emelt szinten: konzervatív erő fogalma.', '', 'fizika, munka, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(23, 'Mechanikai energia', 'Mechanical Energy', 'A mechanikai energia két fajtája a mozgási (kinetikus) és a helyzeti (potenciális) energia.', '', 'Tudja megkülönböztetni a különféle mechanikai energiafajtákat. Emelt szinten: kvantitatív jellemzés és munka számolása egyenletesen változó erőhatás esetén.', '', 'fizika, energia, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(24, 'Munkatétel', 'Work-Energy Theorem', 'A munkatétel szerint a test mozgási energiájának megváltozása egyenlő a rajta végzett eredő erő munkájával.', '', 'Tudja alkalmazni a munkatételt és a mechanikai energiamegmaradás törvényét egyszerű feladatokban.', '', 'fizika, energia, középszint', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(25, 'Hatásfok', 'Efficiency', 'A hatásfok a kinyert hasznos munka és a befektetett összes munka aránya (nincs mértékegysége).', '', 'Értelmezze a hatásfokot, mint a folyamatok gazdaságosságának jellemzőjét. Ismerje a megújuló és nem megújuló energiaforrások használatának kérdéseit.', '', 'fizika, energia', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(26, 'Hőtágulás', 'Thermal Expansion', 'Az anyagok méretének növekedése a hőmérséklet emelkedésével. A víz rendhagyó hőtágulása a környezetvédelem szempontjából fontos.', '', 'Ismerje a Celsius- és Kelvin-skálákat. Emelt szinten: alkalmazza a hőtágulást leíró összefüggést feladatok megoldásakor.', '', 'fizika, hőtan', '2025-12-10 09:35:00', '2025-12-10 09:35:00'),
(46, 'Feszültség', 'Voltage (Potential Difference)', 'A feszültség két pont közötti elektromos potenciálkülönbség. A feszültségforrás (pl. elem) tartja fenn a töltések mozgását az áramkörben.', '', 'Ismerje a feszültség, áramerősség fogalmát. A feszültségforrás, mint áramforrás elve.', '', 'fizika, elektromosság, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(47, 'Fajlagos ellenállás', 'Resistivity', 'A fajlagos ellenállás ($\\rho$) az anyag minőségére jellemző állandó, amely megmutatja, mennyire gátolja az anyag az elektromos áram áramlását. ($R = \\rho \\cdot l/A$).', '', 'Tudja megkülönböztetni a vezetőkre vonatkozó ellenállás ($R$) és a fajlagos ellenállás ($\\rho$) fogalmakat. Ismerje a fémek ellenállásának hőmérsékletfüggését.', '', 'fizika, elektromosság, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(48, 'Elektromos áram hatásai', 'Effects of Electric Current', 'Az elektromos áram hatásai a **biológiai** (élettani), **hő** (Joule-hő), **mágneses** és **vegyi** (elektrolízis) hatás.', '', 'Ismerje az áram hatásait és alkalmazásukat az elektromos eszközökben. Ismerje az áram élettani hatásait, a baleset-megelőzési és érintésvédelmi szabályokat.', '', 'fizika, elektromosság', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(49, 'Effektív feszültség és áramerősség', 'Effective Voltage and Current (RMS)', 'A váltakozó áram (AC) effektív értékei azok a DC értékek, amelyek az ellenálláson azonos hőhatást fejtenek ki.', '', 'Rendelkezzen szemléletes képpel a váltakozó áramról. Ismerje az effektív feszültség és áramerősség jelentését.', '', 'fizika, elektromosság, emelt szint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(50, 'Induktív és kapacitív ellenállás', 'Inductive and Capacitive Resistance', 'A tekercs (induktív) és a kondenzátor (kapacitív) a váltakozó árammal szemben viselkednek eltérően az ohmos ellenállástól.', '', 'Értse, hogy a tekercs és a kondenzátor eltérő módon viselkedik egyenárammal és váltakozó árammal szemben (pl. fáziskésés, fázissietés).', '', 'fizika, elektromosság, emelt szint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(51, 'Félvezető', 'Semiconductor', 'Olyan anyagok, amelyek elektromos vezetőképessége a vezetők és a szigetelők között helyezkedik el, és külső hatásokkal (pl. hőmérséklet) befolyásolható.', '', 'Ismerje a félvezető fogalmát, tulajdonságait. Tudjon példákat mondani a félvezetők gyakorlati alkalmazására (dióda, tranzisztor, napelemek).', '', 'fizika, elektromosság, atomfizika', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(52, 'Mágneses mező, indukcióvonalak', 'Magnetic Field, Field Lines', 'A mágneses mező a mozgó töltések (áram) vagy a mágnesek közötti kölcsönhatást közvetíti. Jellemzésére az indukcióvektor és az indukcióvonalak (zárt görbék) szolgálnak.', '', 'Ismerje a Föld mágneses mezőjét és az iránytű használatát. Emelt szinten: ismerje az indukciófluxus fogalmát.', '', 'fizika, elektromágnesség, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(53, 'Lorentz-erő', 'Lorentz Force', 'A mozgó töltésre (pl. elektronra) ható mágneses erő. Nagysága függ a töltés nagyságától, sebességétől és a mágneses indukciótól.', '', 'Ismerje a Lorentz-erő fogalmát, hatását a mozgó töltésre. Tudjon a Lorentz-erővel kapcsolatos feladatokat megoldani. Ismerje a ciklotron működési elvét.', '', 'fizika, elektromágnesség, emelt szint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(54, 'Faraday-féle indukciós törvény', 'Faraday\'s Law of Induction', 'A mágneses mező időbeli változása feszültséget indukál egy vezetőben (nyugalmi és mozgási indukció jelensége).', '', 'Ismerje a nyugalmi és mozgási indukció alapjelenségét. Ismerje és alkalmazza a törvényt, valamint a Lenz-törvényt egyszerű kísérletek és jelenségek magyarázatára.', '', 'fizika, elektromágnesség, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(55, 'Transzformátor, önindukció', 'Transformer, Self-Induction', 'A transzformátor feszültséget és áramerősséget alakít át váltakozó árammal (energiaátvitel). Az önindukció az áram változása által a tekercsben indukált feszültség.', '', 'Ismerje a generátor, a motor és a transzformátor működési elvét és szerepét az energiaszállításban. Emelt szinten: az önindukció szerepe az áram ki-, és bekapcsolásánál.', '', 'fizika, elektromágnesség', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(56, 'Mechanikai hullámok', 'Mechanical Waves', 'A hullámok a közeg részecskéinek periodikus rezgése útján terjedő zavarok. Lehetnek **longitudinális** (a részecskék a terjedési irányban rezegnek) vagy **transzverzális** (merőlegesen) hullámok.', '', 'Ismerje a mechanikai hullám fogalmát, fajtáit. Értse, hogyan alakulnak ki és terjednek. Emelt szinten: tudja alkalmazni a hullámjelenségeket leíró összefüggéseket.', '', 'fizika, hullámok, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(57, 'Hullámok jellemzői', 'Wave Characteristics', 'A hullámmozgást leíró fizikai mennyiségek: **amplitúdó**, **hullámhossz** ($\\lambda$), **frekvencia** ($f$), **terjedési sebesség** ($v$). A köztük lévő kapcsolat: $v = \\lambda \\cdot f$.', '', 'Ismerje a hullámmozgást leíró fizikai mennyiségeket és a köztük levő kapcsolatokat.', '', 'fizika, hullámok, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(58, 'Interferencia (hullámok)', 'Interference (Waves)', 'Két vagy több hullám találkozásakor létrejövő hullámerősödés vagy gyengülés. Létrejöttének feltétele a koherencia.', '', 'Ismerje az interferencia jelenségét, létrejöttének feltételeit. Emelt szinten: tudjon egyszerű számításokat végezni az interferencia jelenségére vonatkozóan.', '', 'fizika, hullámok, emelt szint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(59, 'Állóhullám', 'Standing Wave', 'Két, ellentétes irányban terjedő, azonos hullámhosszúságú hullám találkozásával létrejövő hullám, amelyen fix **csomópontok** és **duzzadóhelyek** figyelhetők meg.', '', 'Ismerje az állóhullám kialakulásának feltételeit (pl. húrokon, sípokban). Emelt szinten: tudjon feladatokat megoldani húros hangszerekre és sípokra vonatkozóan.', '', 'fizika, hullámok', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(60, 'Fénytörés és visszaverődés', 'Refraction and Reflection of Light', 'A visszaverődés során a fény a felületről visszaverődik. A fénytörés (refrakció) során a fény útja megtörik, amikor egyik közegből a másikba lép.', '', 'Ismerje a fény visszaverődésével és törésével kapcsolatos természeti jelenségeket. Ismerje a törési törvényt (Snellius-Descartes).', '', 'fizika, optika, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(61, 'Teljes visszaverődés, határszög', 'Total Internal Reflection, Critical Angle', 'A teljes visszaverődés akkor következik be, ha a fény sűrűbb optikai közegből ritkábbba lép, és a beesési szög nagyobb, mint a **határszög**.', '', 'Ismerje a törésmutató, a diszperzió, a határszög fogalmát. A száloptika jelenségének ismerete.', '', 'fizika, optika', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(62, 'Fény polarizációja', 'Polarization of Light', 'A fény polarizációja a fény transzverzális hullám jellegét mutatja: a rezgés csak egy síkban történik.', '', 'Ismerje az interferenciát, és a polarizációt a fény esetében, és ismerje fel ezeket egyszerű jelenségekben. Értse a fény transzverzális hullám jellegét.', '', 'fizika, optika, emelt szint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(63, 'Geometriai optikai leképezés (tükrök, lencsék)', 'Geometrical Optics Imaging (Mirrors, Lenses)', 'A képalkotás fogalma sík- és gömbtükrök, valamint vékony lencsék (gyűjtő, szóró) esetén. A kép lehet valódi vagy látszólagos.', '', 'Tudjon képszerkesztést végezni tükrökre, lencsékre a nevezetes sugármenetek segítségével. Ismerje a leképezési törvényt és a nagyítást.', '', 'fizika, optika, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(64, 'Planck-formula, energiakvantum', 'Planck\'s Formula, Energy Quantum', 'A Planck-formula ($E=h \\cdot f$) adja meg a foton energiáját, ahol $h$ a Planck-állandó. Az energia kvantált, diszkrét egységekből áll.', '', 'Ismerje Planck alapvetően új gondolatát az energia kvantáltságáról. Emelt szinten: a foton lendületére és energiájára vonatkozó összefüggések.', '', 'fizika, atomfizika, kvantumfizika', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(65, 'Fényelektromos jelenség', 'Photoelectric Effect', 'A fény hatására elektronok lépnek ki a fémek felületéről (a fotonok energiája túllépi a kilépési munkát).', '', 'Tudja megfogalmazni az einsteini felismerést a fénysugárzás energiájának kvantumosságáról. Értelmezze a fényelektromos jelenséget.', '', 'fizika, atomfizika', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(66, 'Kilépési munka', 'Work Function', 'Az a minimális energia, ami ahhoz szükséges, hogy az elektron elhagyja a fém felületét a fényelektromos jelenség során.', '', 'Emelt szinten: Tudja a kilépési munka és a Planck-állandó méréssel való meghatározását. Ismerje a digitális fényképezőgép működésének elvét.', '', 'fizika, atomfizika, emelt szint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(67, 'Bohr-féle atommodell', 'Bohr\'s Atomic Model', 'Az atommodell magyarázza az atom vonalas színképét, feltételezve, hogy az elektronok csak meghatározott, kvantált energiaszinteken (pályákon) mozoghatnak.', '', 'Ismerje az atomról alkotott elképzelések változásait (Rutherford szórási kísérlet). Ismerje az alap- és gerjesztett állapot, valamint az ionizációs energia fogalmát.', '', 'fizika, atomfizika', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(68, 'Elektron hullámtermészete, de Broglie-hullámhossz', 'Wave Nature of Electron, de Broglie Wavelength', 'A **de Broglie-hullámhossz** a részecskék (pl. elektron) hullámtermészetét írja le, és a részecske impulzusával fordítottan arányos.', '', 'Tudja megfogalmazni a fény, illetve az anyag kettős természetét. Emelt szinten: ismerjen az elektron hullámtermészetét bizonyító kísérletet.', '', 'fizika, kvantumfizika, emelt szint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(69, 'Atommag, nukleon, izotóp', 'Nucleus, Nucleon, Isotope', 'Az **atommag** (protonok és neutronok, azaz nukleonok) és az elektronok alkotják az atomot. Az **izotópok** azonos rendszámú, de eltérő tömegszámú atomok.', '', 'Ismerje az atommag felépítését, a nukleonok fajtáit, a rendszám és a tömegszám fogalmát. Emelt szinten: fajlagos kötési energia fogalma.', '', 'fizika, magfizika, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(70, 'Tömeghiány, kötési energia', 'Mass Defect, Binding Energy', 'A **tömeghiány** az atommag tömegének és a benne lévő nukleonok tömegeinek összegének különbsége. Ez a tömegkülönbség a **kötési energiának** felel meg ($E=\\Delta m \\cdot c^2$).', '', 'Értse, hogy a maghasadás és magfúzió miért alkalmas energiatermelésre. Emelt szinten: tudja meghatározni a fajlagos kötési energia fogalmát, nagyságrendjét.', '', 'fizika, magfizika, emelt szint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(71, 'Radioaktivitás (alfa, béta, gamma)', 'Radioactivity (Alpha, Beta, Gamma)', 'Instabil atommagok spontán bomlása, amely során sugárzások ($\\alpha$, $\\beta$, $\\gamma$) lépnek ki.', '', 'Ismerje a radioaktív sugárzások típusait, leírását és tulajdonságait. Tudja értelmezni a bomlás során átalakuló atommagok rendszám- és tömegszám-változását.', '', 'fizika, magfizika', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(72, 'felezési idő, aktivitás', 'Decay Law, Half-Life, Activity', 'A **felezési idő** ($T_{1/2}$) az az idő, amely alatt a radioaktív izotóp atommagjainak fele elbomlik. A **bomlási törvény** leírja, hogyan csökken az idő múlásával a még el nem bomlott atommagok száma.', '', 'az az idő, amely alatt a radioaktív izotóp atommagjainak fele elbomlik.', '', 'fizika, magfizika', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(73, 'Bomlási törvény', 'null', 'A radioaktív atommagok bomlását leíró törvény, mely szerint azonos időtartam alatt a radioaktív atommagoknak mindig azonos hányada bomlik el', 'term_definition_en', 'A radioaktív atommagok bomlását leíró törvény', 'short_en', 'atommag\r\nradioaktivitás', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Magfúzió', 'Nuclear Fusion', 'Könnyű atommagok egyesülése nehezebbé (pl. a Napban lejátszódó energiatermelő folyamat).', '', 'Értse, hogy a magfúzió miért alkalmas energiatermelésre. Ismerje a szabályozott magfúzió jövőbeli lehetőségeit.', '', 'fizika, magfizika, energia', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(75, 'Gravitációs mező', 'Gravitational Field', 'A gravitációs mező a tömegek közötti kölcsönhatást közvetítő erőtér. Jellemzésére a **gravitációs térerősség** (vagy gravitációs gyorsulás) szolgál.', '', 'Ismerje az általános tömegvonzás törvényét. Feladatokban tudja alkalmazni a homogén gravitációs mezőre vonatkozó összefüggéseket.', '', 'fizika, csillagászat, gravitáció', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(76, 'Kepler-törvények', 'Kepler\'s Laws', 'A bolygók mozgását írják le a Naprendszerben. (I. Ellipszis pálya, II. Területek törvénye, III. Keringési idők és nagytengelyek aránya).', '', 'Értelmezze a Kepler-törvényeket a bolygómozgásokra és a Föld körül keringő műholdak mozgására.', '', 'fizika, csillagászat, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(77, 'Súly és súlytalanság', 'Weight and Weightlessness', 'A **súly** az az erő, amellyel a test a felfüggesztést vagy alátámasztást nyomja/húzza. A **súlytalanság** az az állapot, amikor ez az erő nulla (pl. szabadon eső mozgás).', '', 'Értelmezze a súly és súlytalanság fogalmát. Emelt szinten: a gravitációs gyorsulás tömeg- és távolságfüggésének figyelembevétele.', '', 'fizika, gravitáció, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(78, 'Fényév', 'Light-Year', 'A fényév a távolságegység: az a távolság, amit a fény egy év alatt tesz meg vákuumban.', '', 'Ismerje a fényév távolságegységet. Ismerje a Naprendszer méretét, a bolygókat.', '', 'fizika, csillagászat', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(79, 'Ősrobbanás elmélete', 'Big Bang Theory', 'Az Univerzum keletkezésének és tágulásának fő elmélete.', '', 'Ismerje az Ősrobbanás-elmélet lényegét, az ebből adódó következtetéseket a Világegyetem korára és kiinduló állapotára vonatkozóan.', '', 'fizika, csillagászat, világegyetem', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(80, 'Radioaktív sugárterhelés, háttérsugárzás', 'Radioactive Exposure, Background Radiation', 'A **sugárterhelés** a szervezetbe jutó sugárzás hatása. A **háttérsugárzás** a természetes forrásokból (talaj, kozmikus sugárzás) származó állandó sugárterhelés.', '', 'Ismerje a sugárvédelem lehetőségeit. Emelt szinten: az elnyelt sugárdózis és az egyenérték dózis fogalmának ismerete.', '', 'fizika, magfizika, környezet', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(81, 'Halmazok egyenlősége', 'Equality of Sets', 'Két halmaz egyenlő, ha pontosan ugyanazokat az elemeket tartalmazzák.', '', 'Ismerje és alkalmazza a fogalmat gyakorlati és matematikai feladatokban.', '', 'matematika, halmazelmélet, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(82, 'Részhalmaz', 'Subset', 'Az $A$ halmaz $B$ halmaznak részhalmaza, ha $A$ minden eleme egyben $B$-nek is eleme ($A \\subseteq B$).', '', 'Tudja definiálni és alkalmazni a részhalmaz, üres halmaz, véges és végtelen halmaz fogalmát.', '', 'matematika, halmazelmélet, középszint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(83, 'De Morgan azonosságok', 'De Morgan\'s Laws', 'Azonosságok, amelyek az unió és a metszet komplementerének kapcsolatát írják le. Pl.: $\\overline{A \\cup B} = \\overline{A} \\cap \\overline{B}$.', '', 'Emelt szinten ismerje és alkalmazza a de Morgan azonosságokat.', '', 'matematika, halmazelmélet, emelt szint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(84, 'Szükséges és elégséges feltétel', 'Necessary and Sufficient Condition', 'A $B$ feltétel akkor **szükséges** az $A$-hoz, ha $A \\implies B$. Akkor **elégséges**, ha $B \\implies A$. **Szükséges és elégséges** (ekvivalens feltétel), ha $A \\iff B$.', '', 'Használja és alkalmazza feladatokban helyesen a szükséges, az elégséges, és a szükséges és elégséges feltétel fogalmát.', '', 'matematika, logika, emelt szint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(85, 'Kombináció (ismétlés nélkül)', 'Combination (without repetition)', 'A kiválasztás módja, amikor az elemek sorrendje nem számít. Az $n$ elemből $k$ elem kiválasztásának száma $\\binom{n}{k}$.', '', 'Tudjon egyszerű kombinatorikai feladatokat megoldani. Emelt szinten: ismerje és alkalmazza a permutációk, variációk és kombinációk kiszámítására vonatkozó képleteket.', '', 'matematika, kombinatorika, emelt szint', '2025-12-10 09:50:00', '2025-12-10 09:50:00'),
(86, 'Permutáció (ismétlés nélkül)', 'Permutation (without repetition)', 'A permutáció az $n$ különböző elem sorbarendezése, ahol minden elemet felhasználunk. A lehetséges sorrendek száma $n!$ (n faktoriális).', '', 'Ismerje, bizonyítsa és alkalmazza a permutációk kiszámítására vonatkozó képletet.', '', 'matematika, kombinatorika, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(87, 'Permutáció (ismétléssel)', 'Permutation (with repetition)', 'Azon $n$ elem sorbarendezése, amelyek között vannak megegyezőek. A képlet a megkülönböztethetetlen elemek számával osztja el az $n!$-t.', '', 'Ismerje, bizonyítsa és alkalmazza a permutációk kiszámítására vonatkozó képletet.', '', 'matematika, kombinatorika, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(88, 'Variáció (ismétlés nélkül)', 'Variation (without repetition)', '$n$ különböző elemből $k$ elem kiválasztása, ahol a sorrend számít. A kiválasztás után az elemet nem tesszük vissza.', '', 'Ismerje, bizonyítsa és alkalmazza a variációk kiszámítására vonatkozó képletet.', '', 'matematika, kombinatorika, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(89, 'Binomiális együttható', 'Binomial Coefficient', 'A $\\binom{n}{k}$ jelöli a binomiális együtthatót, amely megadja, hányféleképpen választható ki $n$ elemből $k$ elem a sorrendtől függetlenül.', '', 'Tudja kiszámolni a binomiális együtthatókat. Ismeri és alkalmazza a Pascal-háromszöget és alapvető tulajdonságait.', '', 'matematika, kombinatorika, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(90, 'Binomiális tétel', 'Binomial Theorem', 'A tétel leírja egy kéttagú összeg hatványozásának módját: $(a+b)^n$ kifejtését. A kifejtés együtthatói a binomiális együtthatók.', '', 'Ismerje és alkalmazza a binomiális tételt.', '', 'matematika, kombinatorika, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(91, 'Gráf (út, kör, fa)', 'Graph (Path, Cycle, Tree)', 'A **gráf** pontokból és élekből áll. Az **út** olyan séta, amelyben élek és pontok nem ismétlődnek. A **kör** olyan út, amely a kiinduló pontba visszatér. A **fa** olyan összefüggő gráf, amely nem tartalmaz kört.', '', 'Definiálja és alkalmazza a következő fogalmakat: többszörös él, hurokél, séta, körséta, út, kör, összefüggő gráf, egyszerű gráf, teljes gráf, fa, komplementer gráf, izomorf gráfok.', '', 'matematika, gráfok, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(92, 'Gráf fokszámösszege', 'Graph Degree Sum', 'A gráf pontjainak fokszámösszege egyenlő a gráf éleinek számának kétszeresével.', '', 'Ismerje és alkalmazza gyakorlati feladatokban a gráf pontjainak fokszámösszege és éleinek száma közötti összefüggést. Ismerje az $n$ pontú teljes gráf éleinek a számát.', '', 'matematika, gráfok, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(93, 'Oszthatóság alaptételei', 'Basic Divisibility Theorems', 'Az oszthatóság alapvető fogalmai: osztó, többszörös, prímszám, összetett szám.', '', 'Tudjon természetes számokat prímtényezőkre bontani. Tudja meghatározni a legnagyobb közös osztót (lnko) és a legkisebb közös többszöröst (lkkt). Emelt szinten: a számelmélet alaptétele.', '', 'matematika, számelmélet, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(94, 'Számrendszerek', 'Number Systems', 'A helyiértékes írásmód, amelyben az alapszám hatványaival fejezzük ki a számot (pl. 10-es, 2-es alapú számrendszer).', '', 'Tudja a számokat átírni 10-es alapú számrendszerből $n$ alapú ($n \\le 9$) számrendszerbe és viszont. Emelt szinten: összeadás és kivonás $n$ alapú számrendszerben.', '', 'matematika, számelmélet, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(95, 'Hatványozás azonosságai', 'Power Identities', 'A hatványozás azonosságai a racionális kitevőjű hatványok kezelését segítik. Pl.: $a^n \\cdot a^m = a^{n+m}$.', '', 'Bizonyítsa a hatványozás azonosságait egész kitevő esetén. Tudja értelmezni a hatványozást racionális kitevő esetén.', '', 'matematika, algebra, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(96, 'Logaritmus (fogalom)', 'Logarithm (Concept)', 'Az $a$ alapú $b$ szám logaritmusa az a kitevő, amelyre $a$-t emelve $b$-t kapunk.', '', 'Definiálja és használja feladatok megoldásában a logaritmus fogalmát. Ismerje a logaritmus alapvető azonosságait.', '', 'matematika, algebra, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(97, 'Nevezetes azonosságok (Algebra)', 'Notable Identities (Algebra)', 'Alapvető azonosságok betűs kifejezések egyszerűsítéséhez: $(a+b)^{2}$, $(a-b)^{2}$, $a^{2}-b^{2}$.', '', 'Tudjon algebrai kifejezésekkel egyszerű műveleteket végrehajtani. Emelt szinten: az $a^{n}-b^{n}$ és $a^{2n+1}+b^{2n+1}$ kifejezések szorzattá alakítása.', '', 'matematika, algebra, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(98, 'Egyenlőtlenségek', 'Inequalities', 'Az egyenlőtlenség két kifejezés közötti viszonyt ír le (pl. $>$, $\\le$). A megoldáshalmaz általában intervallum, vagy ponthalmaz.', '', 'Tudjon egyszerű első- és másodfokú egyenlőtlenségeket megoldani. Emelt szinten: tudjon törtes, gyökös, exponenciális, logaritmusos és trigonometrikus egyenlőtlenségeket megoldani.', '', 'matematika, algebra, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(99, 'Számított középértékek', 'Calculated Means', 'A két pozitív szám számított középértékei: számtani, mértani, négyzetes és harmonikus közép.', '', 'Ismerje a nagyságrendi viszonyaikra vonatkozó tételeket. Tudjon megoldani feladatokat a számtani és mértani közép közötti összefüggés ($\\frac{a+b}{2}\\ge\\sqrt{ab}$) alapján.', '', 'matematika, algebra, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(100, 'Függvénytani alapfogalmak', 'Basic Function Concepts', 'Alapvető fogalmak: értelmezési tartomány (É.T.), képhalmaz, helyettesítési érték, értékkészlet (É.K.).', '', 'Ismerje a függvény matematikai fogalmát. Tudjon szövegesen megfogalmazott függvényt képlettel megadni.', '', 'matematika, függvények, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(101, 'Függvények összetétele', 'Composition of Functions', 'Két vagy több függvény egymás utáni alkalmazása, amelynek eredménye egy összetett függvény.', '', 'Emelt szinten: Ismerje és alkalmazza a függvények összegének, különbségének, szorzatának és hányadosának a fogalmát. Ismerje és alkalmazza az inverzfüggvény fogalmát.', '', 'matematika, függvények, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(102, 'Függvények jellemzése (Periodicitás, Paritás)', 'Function Characteristics (Periodicity, Parity)', 'A függvények jellemzése a grafikon alapján: **periodicitás** (ismétlődés), **paritás** (páros/páratlan), **korlátosság**.', '', 'Emelt szinten: tudja jellemezni a függvényeket periodicitás, paritás, korlátosság szempontjából, és ismerje a konvexitás és konkavitás fogalmát.', '', 'matematika, függvények, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(103, 'Sorozat (általános tag, rekurzív definíció)', 'Sequence (General Term, Recursive Definition)', 'A számsorozat megadási módjai: utasítás (szöveges leírás), képlet (általános tag, $a_n$), rekurzív definíció (az előző tagokból).', '', 'Ismerje a számtani és a mértani sorozat általános tagjára és összegképletére vonatkozó összefüggéseket.', '', 'matematika, sorozatok, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(104, 'Sorozat jellemzése (monotonitás, korlátosság)', 'Sequence Characterization (Monotonicity, Boundedness)', 'A sorozat jellemzése: **monotonitás** (növekvő, csökkenő), **korlátosság** (értéke két szám között marad).', '', 'Emelt szinten: tudjon sorozatot jellemezni (korlátosság, monotonitás). Ismerje a konvergencia szemléletes fogalmát, valamint a konvergens sorozat definícióját.', '', 'matematika, sorozatok, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(105, 'Kamatos kamat', 'Compound Interest', 'A pénzösszeg növekedése, amikor a kamat a már megkeresett kamatra is kamatozik. Képlet: $T_n = T_0 \\cdot (1+r)^n$.', '', 'Tudja a kamatos kamat számítására vonatkozó képletet használni, s abból bármelyik ismeretlen adatot kiszámolni. Tudjon gyűjtőjáradékot és törlesztőrészletet számolni.', '', 'matematika, sorozatok, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(106, 'Határérték (Analízis)', 'Limit (Analysis)', 'A függvény határértéke (végesben vett véges, végtelenben vett véges, tágabb értelemben vett) szemléletes fogalma.', '', 'Ismerje a határérték szemléletes fogalmát. Ismerje a folytonosság szemléletes fogalmát.', '', 'matematika, analízis, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(107, 'Differenciálhányados (Definíció)', 'Differential Quotient (Definition)', 'A differenciálhányados (derivált) egy függvény pillanatnyi változási sebességét írja le egy adott pontban.', '', 'Ismerje a differencia- és differenciálhányados definícióját. Alkalmazza az alapvető deriválási szabályokat (összeg, szorzat, hányados).', '', 'matematika, analízis, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(108, 'Deriválási szabályok', 'Differentiation Rules', 'Az összeg-, a különbség-, a konstansszoros, a szorzat- és a hányadosfüggvény deriválási szabályai.', '', 'Alkalmazza a deriválási szabályokat. Emelt szinten: az összetett függvény deriválási szabályát, valamint a differenciálszámítás alkalmazása szélsőérték-feladatok megoldására és függvényvizsgálatra.', '', 'matematika, analízis, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(109, 'Integrálszámítás (Határozott integrál)', 'Integral Calculus (Definite Integral)', 'A határozott integrál folytonos függvények esetén a függvény grafikonja alatti területet adja meg egy adott intervallumon.', '', 'Ismerje folytonos függvényekre a határozott integrál szemléletes fogalmát. Ismerje a primitív függvény fogalmát és a Newton-Leibniz-tételt.', '', 'matematika, analízis, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(110, 'Geometria alapfogalmak, axióma, tétel', 'Geometric Basic Concepts, Axiom, Theorem', 'Az axióma olyan alapvető állítás, amit igaznak fogadunk el bizonyítás nélkül. A tétel az, ami axiómák és definíciók alapján logikai úton levezetett.', '', 'Ismerje és használja megfelelően az alapfogalom, axióma, definiált fogalom, bizonyított tétel fogalmát.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(111, 'Távolságfogalom (térelemek)', 'Distance Concept (Spatial Elements)', 'A távolságfogalom meghatározásai a térelemekre vonatkoznak (pont és egyenes, pont és sík, párhuzamos egyenesek, párhuzamos síkok).', '', 'Tudja a térelemek távolságára és szögére vonatkozó meghatározásokat. Emelt szinten: tudja kitérő egyenesek távolságát és hajlásszögét meghatározni.', '', 'matematika, geometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(112, 'Egybevágósági transzformációk', 'Congruence Transformations', 'Azok a geometriai transzformációk (eltolás, tengelyes tükrözés, középpontos tükrözés, pont körüli forgatás), amelyek megőrzik a távolságot és a szöget.', '', 'Ismerje és tudja alkalmazni feladatokban a háromszögek egybevágósági alapeseteit. Ismerje fel és használja feladatokban a különböző alakzatok szimmetriáit.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(113, 'Hasonlósági transzformációk', 'Similarity Transformations', 'A hasonlósági transzformáció megőrzi a szögeket, de a távolságokat adott arányban (hasonlósági arány) megváltoztatja. Példája a középpontos hasonlósági transzformáció.', '', 'Ismerje és tudja alkalmazni feladatokban a háromszögek hasonlósági alapeseteit. Ismerje és alkalmazza a hasonló síkidomok területének arányáról és a hasonló testek felszínének és térfogatának arányáról szóló tételeket.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(114, 'Párhuzamos szelők tétele', 'Parallel Secants Theorem', 'A tétel a hasonló alakzatok arányainak meghatározásánál játszik kulcsszerepet. Kimondja, hogy ha egy szög szárait párhuzamos egyenesekkel metszük, akkor a szög szárain keletkezett szakaszok aránya megegyezik.', '', 'Emelt szinten: bizonyítsa és alkalmazza a párhuzamos szelők tételét, a tétel megfordítását és a párhuzamos szelőszakaszok tételét.', '', 'matematika, geometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(115, 'Szögfelező tétel', 'Angle Bisector Theorem', 'A tétel a háromszög oldalait érintő arányokra vonatkozik. Egy belső szögfelező a szemközti oldalt a szomszédos oldalak arányában osztja.', '', 'Emelt szinten: bizonyítsa és alkalmazza a belső szögfelező tételt.', '', 'matematika, geometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(116, 'Háromszög nevezetes vonalai', 'Notable Lines of Triangles', 'Nevezetes vonalak: oldalfelező merőleges, szögfelező, magasságvonal, súlyvonal, középvonal.', '', 'Ismerje és alkalmazza a definíciókat és tételeket. Emelt szinten elvárás a nevezetes vonalakra és pontokra vonatkozó tételek **bizonyítása**.', '', 'matematika, geometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(117, 'Pitagorasz-tétel', 'Pythagorean Theorem', 'Derékszögű háromszögben a két befogó hosszának négyzetösszege megegyezik az átfogó hosszának négyzetével ($a^2 + b^2 = c^2$).', '', 'Ismerje és alkalmazza a Pitagorasz-tételt és megfordítását. Tudja bizonyítani a Pitagorasz-tételt.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(118, 'Magasság- és befogótétel', 'Altitude and Leg Theorems', 'A **magasságtétel** a derékszögű háromszög magasságát és az átfogón lévő szeleteit kapcsolja össze. A **befogótétel** a befogót kapcsolja össze az átfogóval és az átfogón lévő szelettel.', '', 'Emelt szinten: ismerje, bizonyítsa és alkalmazza a magasság- és a befogótételt.', '', 'matematika, geometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(119, 'Húrnégyszög', 'Cyclic Quadrilateral', 'Olyan négyszög, amely köré kör írható. A húrnégyszög szemközti szögeinek összege 180°.', '', 'Emelt szinten: bizonyítsa a húrnégyszögek tételét, ismerje a tétel megfordítását. Ismereteit alkalmazza feladatokban.', '', 'matematika, geometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(120, 'Érintőnégyszög', 'Tangential Quadrilateral', 'Olyan négyszög, amelybe kör írható. Az érintőnégyszög szemközti oldalainak összege egyenlő.', '', 'Emelt szinten: bizonyítsa az érintőnégyszögek tételét, ismerje a tétel megfordítását. Ismereteit alkalmazza feladatokban.', '', 'matematika, geometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(121, 'Kerületi és Középponti Szögek Tétele', 'Inscribed and Central Angle Theorem', 'Az azonos ívhez tartozó középponti szög kétszerese a kerületi szögnek.', '', 'Bizonyítsa és alkalmazza feladatokban a kerületi és középponti szögek tételét. Ismerje a **Thalész-tételt** és megfordítását.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(122, 'Thalész-tétel', 'Thales\' Theorem', 'Minden, a kör átmérője fölé rajzolt kerületi szög derékszög.', '', 'Ismerje és alkalmazza feladatokban a Thalész-tételt és megfordítását. Tudja bizonyítani a Thalész-tételt.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(123, 'Vektor (fogalom)', 'Vector (Concept)', 'A vektor a kezdő- és a végpontjával értelmezett irányított szakasz, amelyet nagysága (hossza) és iránya jellemez.', '', 'Ismerje a nullvektor, ellentett vektor fogalmát. Ismerje és alkalmazza feladatokban a vektorok összege, különbsége, skalárszorosa definíciókat, tételeket.', '', 'matematika, koordinátageometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(124, 'Vektorok skaláris szorzata', 'Scalar Product of Vectors', 'Két vektor között definiált művelet, amelynek eredménye egy skalár mennyiség.', '', 'Emelt szinten: ismerje és alkalmazza a skaláris szorzat definícióját, tulajdonságait. Tudja koordinátáikkal adott vektorok hajlásszögét meghatározni.', '', 'matematika, koordinátageometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(125, 'Szakasz felezőpontja és távolsága (koordináták)', 'Midpoint and Distance of Segment (Coordinates)', 'Tudja kiszámítani $\\vec{AB}$ vektor koordinátáit, abszolútértékét, két pont távolságát, valamint szakasz felezőpontjának koordinátáit.', '', 'Emelt szinten: igazolja a szakasz felezőpontja és harmadoló pontjai koordinátáinak kiszámítására vonatkozó összefüggéseket, valamint a háromszög súlypontjának koordinátáira vonatkozó összefüggést.', '', 'matematika, koordinátageometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(126, 'Egyenes egyenletei (koordinátageometria)', 'Equations of a Line (Coordinate Geometry)', 'Tudja felírni egyenesek egyenletét $y=mx+b$ illetve $x=c$ alakban. Tudja kiszámítani egyenesek metszéspontjának koordinátáit.', '', 'Emelt szinten: tudja többféle alakban felírni és levezetni az egyenes egyenletét a síkban különböző kiindulási adatokból (pl. irányvektor, normálvektor).', '', 'matematika, koordinátageometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(127, 'Kör egyenlete', 'Equation of a Circle', 'A kör egyenlete adott középpont ($C(u, v)$) és sugár ($r$) esetén: $(x-u)^2 + (y-v)^2 = r^2$.', '', 'Emelt szinten: tudja levezetni a kör egyenletét, és ismeri a kör és a kétismeretlenes másodfokú egyenlet kapcsolatát. Tudja meghatározni a kör és egyenes metszéspontját.', '', 'matematika, koordinátageometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(128, 'Háromszög területképletei', 'Triangle Area Formulas', 'Tudja kiszámítani a háromszög területét különböző adatokból: $t=\\frac{a\\cdot m}{2}$ vagy $t=\\frac{ab\\cdot \\sin{\\gamma}}{2}$.', '', 'Emelt szinten: bizonyítsa a területképleteket, továbbá ismerje és alkalmazza a $t=sr$ és a Hérón-képletet ($t=\\sqrt{s(s-a)(s-b)(s-c)}$).', '', 'matematika, geometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(129, 'Felszín és térfogat (Testek)', 'Surface Area and Volume (Solids)', 'Ismerje a felszín és a térfogat szemléletes fogalmát. Tudja kiszámítani hasáb, gúla, henger, kúp, gömb, csonkagúla és csonkakúp felszínét és térfogatát egyszerű esetekben.', '', 'Emelt szinten: bizonyítsa a csonkagúla és a csonkakúp térfogatképletét.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(130, 'Leíró statisztika', 'Descriptive Statistics', 'Statisztikai adatok gyűjtése, rendszerezése, és különböző ábrázolásai (táblázat, kör-, oszlopdiagram, sodrófa/box-plot diagram).', '', 'Tudjon adathalmazt táblázatba rendezni és táblázattal megadott adatokat feldolgozni. Tudjon választani megfelelő diagramtípust egy adathalmaz ábrázolásához.', '', 'matematika, statisztika, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(131, 'Statisztikai mutatók', 'Statistical Indicators', 'A nagy adathalmazok jellemzői: átlag (számtani közép), kvartilisek, medián, módusz, terjedelem, szórás.', '', 'Tudja kiszámítani a szórást adott adathalmaz esetén. Emelt szinten: súlyozott számtani közép, átlagos abszolút eltérés. Tudjon választani az adathalmazt jól jellemző középértéket.', '', 'matematika, statisztika, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(132, 'Valószínűség klasszikus modellje (Laplace)', 'Classical Probability Model (Laplace)', 'A valószínűség az esemény bekövetkezésének számszerű mértéke. A **klasszikus modell** szerint az esemény valószínűsége a kedvező esetek számának és az összes elemi esemény számának hányadosa.', '', 'Ismerje és alkalmazza a klasszikus modellt. Ismerje a szemléletes kapcsolatot a relatív gyakoriság és a valószínűség között.', '', 'matematika, valószínűség, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(133, 'Eseménytér, Esemény, Komplementer esemény', 'Sample Space, Event, Complementary Event', 'Az **eseménytér** az összes lehetséges kimenetel halmaza. Az **esemény** az eseménytér egy részhalmaza. A **komplementer esemény** a vizsgált esemény tagadása.', '', 'Ismerje és alkalmazza a következő fogalmakat: eseménytér, elemi esemény, események összege és szorzata, esemény komplementere, egymást kizáró események, független események.', '', 'matematika, valószínűség, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(134, 'Geometriai valószínűség', 'Geometrical Probability', 'Valószínűség-számítási modell, ahol a lehetséges kimenetelek halmaza egy geometriai alakzat, és a valószínűség a területek (hosszak, térfogatok) arányával számolható.', '', 'Ismerje és alkalmazza a geometriai valószínűség modelljét. Tudjon valószínűséget számítani visszatevéses és visszatevés nélküli mintavétel esetén.', '', 'matematika, valószínűség, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(135, 'Binomiális eloszlás', 'Binomial Distribution', 'A visszatevéses mintavételi modellhez kapcsolódik. Leírja annak valószínűségét, hogy $n$ független kísérlet során egy esemény $k$ alkalommal következik be.', '', 'Emelt szinten: tudja értelmezni a binomiális eloszlást (visszatevéses modell) és a hipergeometriai eloszlást (visszatevés nélküli modell). Tudjon ezek alkalmazásával konkrét valószínűségeket kiszámítani.', '', 'matematika, valószínűség, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(136, 'Hipergeometriai eloszlás', 'Hypergeometric Distribution', 'A visszatevés nélküli mintavételi modellhez kapcsolódik. Leírja annak valószínűségét, hogy $N$ elemből $n$ elemet kiválasztva, $M$ tulajdonságú elemek közül $k$ darab lesz a mintában.', '', 'Emelt szinten: tudja értelmezni a hipergeometriai eloszlást. Tudjon ezek alkalmazásával konkrét valószínűségeket kiszámítani.', '', 'matematika, valószínűség, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(137, 'Várható érték', 'Expected Value', 'A véletlen esemény számszerű kimenetelének hosszú távú átlaga.', '', 'Ismerje és alkalmazza a várható érték fogalmát.', '', 'matematika, valószínűség, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(138, 'Elemi geometria alapfogalmak', 'Basic Elementary Geometry Concepts', 'Ismerje és használja az alapfogalom, axióma, definiált fogalom, bizonyított tétel fogalmát. Ismerje a térelemeket (pont, egyenes, sík) és a szög fogalmát.', '', 'Ismerje a szögek nagyság szerinti osztályozását és a nevezetes szögpárokat.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(139, 'Háromszög-egyenlőtlenség', 'Triangle Inequality', 'Bármely háromszögben két oldal hosszának összege mindig nagyobb, mint a harmadik oldal hossza.', '', 'Ismerje és alkalmazza az alapvető összefüggéseket háromszögek oldalai, szögei, oldalai és szögei között (pl. belső, illetve külső szögek összege, nagyobb oldallal szemben nagyobb szög van).', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(140, 'Négyszögek (speciális fajták)', 'Quadrilaterals (Special Types)', 'Ismerje a speciális négyszögek fajtáit (trapéz, paralelogramma, deltoid, rombusz, téglalap, négyzet) és tulajdonságaikat.', '', 'Ismerje a konvex négyszög belső és külső szögeinek összegére vonatkozó tételeket.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(141, 'Sokszögek (átlók száma, szögösszeg)', 'Polygons (Number of Diagonals, Angle Sum)', 'Ismerje, bizonyítsa és alkalmazza konvex sokszögeknél az átlók számára, a belső és külső szögösszegre vonatkozó tételeket.', '', 'Ismerje a szabályos sokszögek definícióját.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00');
INSERT INTO `glossary` (`glossary_id`, `term_name_hu`, `term_name_en`, `term_definition_hu`, `term_definition_en`, `short_hu`, `short_en`, `tags`, `created_at`, `updated_at`) VALUES
(142, 'Kör (érintő, szögmérés)', 'Circle (Tangent, Angle Measurement)', 'A kör érintője merőleges az érintési pontba húzott sugárra. Külső pontból húzott érintőszakaszok egyenlő hosszúak.', '', 'Tudjon szöget mérni fokban és radiánban. Tudja és alkalmazza feladatokban, hogy a kerületi és középponti szög arányos a körívvel.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(143, 'Vektorok összegének, skalárszorosának koordinátái', 'Coordinates of Vector Sum and Scalar Multiple', 'Ismerje és alkalmazza feladatokban a vektor koordinátái, vektorok összegének, különbségének, skalárral való szorzatának koordinátái tételeket.', '', 'Ismerje az egyértelmű vektorfelbontás tételét. Emelt szinten: ismerje és alkalmazza a vektor $90^\\circ$-os elforgatottjának koordinátáit.', '', 'matematika, koordinátageometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(144, 'Trigonometria (szögfüggvények)', 'Trigonometry (Trigonometric Functions)', 'Tudja hegyesszögek szögfüggvényeit derékszögű háromszög oldalarányaival definiálni.', '', 'Tudja származtatni tompaszögek szögfüggvényeit a kiegészítő szögek szögfüggvényeiből. Ismerje és alkalmazza a szögfüggvényekre vonatkozó alapvető összefüggéseket (pl. $\\sin^2{\\alpha} + \\cos^2{\\alpha} = 1$).', '', 'matematika, trigonometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(145, 'Szinusztétel', 'Sine Rule', 'Bármely háromszögben az oldalak hossza arányos a velük szemközti szögek szinuszával.', '', 'Ismerje és alkalmazza feladatokban a szinusz- és a koszinusztételt. Bizonyítsa a szinusztételt.', '', 'matematika, trigonometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(146, 'Koszinusztétel', 'Cosine Rule', 'Egy háromszög egyik oldalának négyzete megegyezik a másik két oldal négyzetösszegével, csökkentve a két oldal és a közbezárt szög koszinuszának kétszeres szorzatával.', '', 'Emelt szinten: bizonyítsa a koszinusztételt. Tudja alkalmazni az addíciós összefüggéseket ($\\sin(\\alpha+\\beta)$, $\\cos(\\alpha+\\beta)$ stb.).', '', 'matematika, trigonometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(147, 'Koordinátageometriai alapfeladatok', 'Coordinate Geometry Basic Tasks', 'Tudja kiszámítani két pont távolságát, szakasz felezőpontjának koordinátáit, és alkalmazza ezt feladatokban.', '', 'Emelt szinten: igazolja a szakasz felezőpontja és harmadoló pontjai koordinátáinak kiszámítására vonatkozó összefüggéseket. Igazolja és alkalmazza a háromszög súlypontjának koordinátáira vonatkozó összefüggést.', '', 'matematika, koordinátageometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(148, 'Egyenesek párhuzamossága és merőlegessége', 'Parallelism and Perpendicularity of Lines', 'Ismerje meredekséggel megadott egyenesek párhuzamosságának ($m_1=m_2$) és merőlegességének ($m_1 \\cdot m_2 = -1$) koordinátageometriai feltételeit.', '', 'Emelt szinten: tudja síkbeli egyenesek hajlásszögét meghatározni.', '', 'matematika, koordinátageometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(149, 'Kör egyenlete', 'Equation of a Circle', 'Tudja felírni adott középpontú és sugarú kör egyenletét.', '', 'Emelt szinten: tudja levezetni a kör egyenletét. Ismerje a kör és a kétismeretlenes másodfokú egyenlet kapcsolatát. Tudja meghatározni kör és egyenes metszéspontját.', '', 'matematika, koordinátageometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(150, 'Parabola egyenlete', 'Equation of a Parabola', 'A parabola egy olyan pontok halmaza, amelyek egy adott ponttól (fókusztól) és egy adott egyenestől (vezéregyenestől) egyenlő távolságra vannak.', '', 'Emelt szinten: tudja levezetni a parabola $x^2=2py$ alakú egyenletét. Tudjon feladatokat megoldani az $y$ tengellyel párhuzamos tengelyű parabolákkal.', '', 'matematika, koordinátageometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(151, 'Háromszög területképletei', 'Triangle Area Formulas', 'Tudja kiszámítani a háromszög területét $t=\\frac{a\\cdot m}{2}$ vagy $t=\\frac{ab\\cdot \\sin{\\gamma}}{2}$ képletekkel.', '', 'Emelt szinten: bizonyítsa a területképleteket, továbbá ismerje és alkalmazza a $t=sr$ és a Hérón-képletet ($t=\\sqrt{s(s-a)(s-b)(s-c)}$).', '', 'matematika, geometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(152, 'Felszín és térfogat (Testek)', 'Surface Area and Volume (Solids)', 'Ismerje a felszín és a térfogat szemléletes fogalmát. Tudja kiszámítani hasáb, gúla, henger, kúp, gömb, csonkagúla és csonkakúp felszínét és térfogatát egyszerű esetekben.', '', 'Emelt szinten: bizonyítsa a csonkagúla és a csonkakúp térfogatképletét.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(153, 'Sodrófa (box-plot) diagram', 'Box-Plot Diagram', 'Statisztikai diagram, amely az adatok eloszlását mutatja a kvartilisek (medián, alsó és felső kvartilis) segítségével.', '', 'Tudjon kördiagramot, oszlopdiagramot és sodrófa (box-plot) diagramot készíteni. Emelt szinten: adathalmazok összehasonlítása sodrófa-diagramok alapján.', '', 'matematika, statisztika, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(154, 'Szórás', 'Standard Deviation', 'A szórás egy statisztikai mutató, amely azt jellemzi, hogy az adatok átlagosan mennyire térnek el a számtani átlagtól.', '', 'Tudja kiszámítani a szórást adott adathalmaz esetén a definíció alkalmazásával vagy számológéppel.', '', 'matematika, statisztika, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(155, 'Súlyozott számtani közép (Emelt)', 'Weighted Arithmetic Mean (Advanced)', 'Olyan átlag, ahol az egyes adatokat súlyokkal (gyakorisággal) szorozzuk.', '', 'Ismerje és alkalmazza a súlyozott számtani közép, átlagos abszolút eltérés fogalmát. Tudjon választani az adathalmazt jól jellemző középértéket.', '', 'matematika, statisztika, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(156, 'Eseménytér, elemi esemény', 'Sample Space, Elementary Event', 'Az **eseménytér** az összes lehetséges kimenetel halmaza. Az **elemi esemény** az eseménytér egyetlen kimenetele.', '', 'Ismerje és alkalmazza a következő fogalmakat: eseménytér, elemi esemény, események összege és szorzata, esemény komplementere, egymást kizáró események, független események.', '', 'matematika, valószínűség, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(157, 'Klasszikus valószínűségi modell (Laplace)', 'Classical Probability Model (Laplace)', 'A modell szerint az esemény valószínűsége a kedvező esetek számának és az összes elemi esemény számának hányadosa. Csak egyenlő valószínűségű elemi eseményekre alkalmazható.', '', 'Ismerje és alkalmazza a klasszikus (Laplace-féle) valószínűségi modellt. Tudja meghatározni esemény komplementerének a valószínűségét.', '', 'matematika, valószínűség, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(158, 'Geometriai valószínűség', 'Geometrical Probability', 'Valószínűség-számítási modell, ahol a valószínűség a geometriai méretek (hosszak, területek, térfogatok) arányával számolható.', '', 'Ismerje és alkalmazza a geometriai valószínűség modelljét. Tudjon valószínűséget számítani visszatevéses és visszatevés nélküli mintavétel esetén.', '', 'matematika, valószínűség, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(159, 'Feltételes valószínűség', 'Conditional Probability', 'Egy esemény bekövetkezésének valószínűsége, feltéve, hogy egy másik esemény már bekövetkezett. ($P(A|B)$).', '', 'Emelt szinten: definiálja és alkalmazza a feltételes valószínűség fogalmát.', '', 'matematika, valószínűség, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(160, 'Binomiális eloszlás (visszatevéses modell)', 'Binomial Distribution (with replacement)', 'A visszatevéses mintavételi modellhez kapcsolódik. Leírja annak valószínűségét, hogy $n$ független kísérlet során egy esemény $k$ alkalommal következik be.', '', 'Emelt szinten: tudja értelmezni a binomiális eloszlást (visszatevéses modell) és a hipergeometriai eloszlást (visszatevés nélküli modell).', '', 'matematika, valószínűség, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(161, 'Hipergeometriai eloszlás (visszatevés nélküli modell)', 'Hypergeometric Distribution (without replacement)', 'A visszatevés nélküli mintavételi modellhez kapcsolódik.', '', 'Emelt szinten: tudjon a binomiális és hipergeometriai eloszlások alkalmazásával konkrét valószínűségeket kiszámítani.', '', 'matematika, valószínűség, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(162, 'Várható érték', 'Expected Value', 'A véletlen esemény számszerű kimenetelének hosszú távú átlaga.', '', 'Ismerje és alkalmazza a várható érték fogalmát.', '', 'matematika, valószínűség, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(163, 'Csillagászat (alapfogalmak)', 'Astronomy (Basic Concepts)', 'A csillagászat az égitestek és a Világegyetem egészének tanulmányozása.', '', 'Ismerje a Naprendszer méretét, a bolygókat. Ismerje a Nap Földtől vett távolságát, a Földre gyakorolt legfontosabb hatásait.', '', 'fizika, csillagászat, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(164, 'Űrkutatás', 'Space Exploration', 'Az űrkutatás történetének főbb fejezetei, jövőbeli lehetőségei, tervezett irányai.', '', 'Ismerje az űrkutatás ipari-technikai civilizációra gyakorolt hatását.', '', 'fizika, csillagászat', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(165, 'Naprendszer (bolygók, üstökösök)', 'Solar System (Planets, Comets)', 'A Naprendszer a Napból és a körülötte keringő égitestekből (bolygók, üstökösök, aszteroidák) áll.', '', 'Ismerje a Naprendszer méretét, ismerje a bolygókat, a főtípusok jellegzetességeit, mozgásukat. Ismerje az üstökösök összetételét, mozgásának jellegzetességeit.', '', 'fizika, csillagászat, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(166, 'Holdfázisok, fogyatkozások', 'Moon Phases, Eclipses', 'A **holdfázisok** a Hold megvilágított részének változásai a Földről nézve. Ismerje a **nap- és holdfogyatkozásokat**.', '', 'Tudja jellemezni a Hold felszínét, anyagát, méretét, mozgását.', '', 'fizika, csillagászat, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(167, 'Csillagok, Tejútrendszer, galaxisok', 'Stars, Milky Way, Galaxies', 'A **csillagok** saját fénnyel világító gázgömbök. A **Tejútrendszer** a saját galaxisunk. A **galaxisok** csillagok milliárdjaiból álló hatalmas rendszerek.', '', 'Jellemezze a csillagok Naphoz viszonyított méretét, tömegét. Ismerje a Tejútrendszer szerkezetét.', '', 'fizika, csillagászat, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(168, 'Fekete lyuk, szupernóva, vörös óriás', 'Black Hole, Supernova, Red Giant', 'Égitestek fejlődésének extrém végállomásai.', '', 'Emelt szinten: ismerje a vörös óriás, a neutroncsillag, a fekete-lyuk, a szupernovarobbanás fogalmát. Legyen tájékozott a Nap, mint csillag várható jövőjével kapcsolatban.', '', 'fizika, csillagászat, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(169, 'Matematikai logika', 'Mathematical Logic', 'A matematika azon ága, ami a kijelentések igazságértékével, az összekapcsolással és a következtetésekkel foglalkozik.', '', 'Legyen képes kijelentéseket szabatosan megfogalmazni, azokat összekapcsolni, kijelentések igazságtartalmát megállapítani.', '', 'matematika, logika, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(170, 'Kombinatorikus gondolkodásmód', 'Combinatorial Thinking', 'A kombinatorikus gondolatmenetek alkalmazása gyakorlati sorbarendezési és kiválasztási feladatok megoldására.', '', 'Legyen jártas alapvető kombinatorikus gondolatmenetek alkalmazásában.', '', 'matematika, kombinatorika, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(171, 'Betűs kifejezések', 'Algebraic Expressions', 'Betűket (változókat), számokat és matematikai műveleteket tartalmazó kifejezések.', '', 'Ismerje fel használatuk szükségességét, tudja azokat kezelni, lássa, hogy mi van a betűk mögött.', '', 'matematika, algebra, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(172, 'Egyenlet, egyenlőtlenség fogalma', 'Equation, Inequality Concept', 'Az **egyenlet** két kifejezés egyenlőségét írja le, az **egyenlőtlenség** a két kifejezés közötti viszonyt ($<, >$).', '', 'Ismerje az egyenlet és az egyenlőtlenség fogalmát, megoldási módszereit (pl. algebrai, grafikus, közelítő).', '', 'matematika, algebra, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(173, 'Egyenletrendszer, egyenlőtlenségrendszer', 'System of Equations, System of Inequalities', 'Két vagy több egyenlet/egyenlőtlenség együttes megoldása.', '', 'Legyen képes egy adott probléma megoldására felírni egyenleteket, egyenletrendszereket, egyenlőtlenségeket, egyenlőtlenség-rendszereket.', '', 'matematika, algebra, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(174, 'Algebrai átalakítások (összetett)', 'Algebraic Transformations (Complex)', 'Összetettebb algebrai átalakításokat igénylő feladatok megoldása.', '', 'Az emelt szinten érettségiző vizsgázónak legyen jártassága az összetettebb algebrai átalakításokat igénylő feladatok megoldásában is.', '', 'matematika, algebra, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(175, 'Függvények (analízis elemei)', 'Functions (Elements of Analysis)', 'A függvények segítségével modellezhető a körülöttünk levő világ egyszerűbb összefüggései.', '', 'Legyen képes a változó mennyiségek közötti kapcsolat felismerésére, a függés értelmezésére. Értse, hogy a függvény matematikai fogalom, két halmaz elemeinek egymáshoz rendelése.', '', 'matematika, analízis, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(176, 'Sorozat (diszkrét folyamatok)', 'Sequence (Discrete Processes)', 'A sorozat diszkrét folyamatok megjelenítésére alkalmas matematikai eszköz, a pozitív egész számok halmazán értelmezett függvény.', '', 'Ismerje a számtani és mértani sorozatot.', '', 'matematika, sorozatok, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(177, 'Függvényvizsgálat (analízis)', 'Function Analysis (Advanced)', 'Függvényvizsgálat elvégzése az analízis elemeinek segítségével (deriválás, integrálás).', '', 'Az emelt szinten érettségiző vizsgázó ismerje az analízis néhány alapelemét. Ezek segítségével tudjon függvényvizsgálatokat végezni, szélsőértéket, görbe alatti területet számolni.', '', 'matematika, analízis, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(178, 'Geometriai tájékozódás (sík, tér)', 'Geometric Orientation (Plane, Space)', 'Tudjon síkban, illetve térben tájékozódni, térbeli viszonyokat elképzelni, tudja a háromdimenziós valóságot - alkalmas síkmetszetekkel - két dimenzióban vizsgálni.', '', 'Vegye észre a szimmetriákat és az arányokat, tudja ezek egyszerűsítő hatásait problémák megfogalmazásában, bizonyításokban, számításokban kihasználni.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(179, 'Mérési pontosság', 'Measurement Accuracy', 'A mérések megbízhatóságának mértéke.', '', 'Tudjon hosszúságot, területet, felszínt, térfogatot mérni és számolni, legyen tisztában a mérési pontosság fogalmával.', '', 'matematika, geometria, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(180, 'Geometriai bizonyítások', 'Geometric Proofs', 'A geometriai állítások logikai úton történő levezetése axiómák és tételek alapján.', '', 'Az emelt szinten érettségiző vizsgázó tudja szabatosan megfogalmazni a geometriai bizonyítások gondolatmenetét.', '', 'matematika, geometria, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(181, 'Statisztikai kijelentések természete', 'Nature of Statistical Statements', 'Értse a statisztikai kijelentések és gondolatmenetek sajátos természetét.', '', 'Ismerje a statisztikai állítások igazolására felhasználható adatok gyűjtésének lehetséges formáit.', '', 'matematika, statisztika, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(182, 'Véletlenszerű jelenségek modellezése', 'Modeling Random Phenomena', 'Tudjon egyszerűbb véletlenszerű jelenségeket modellezni és a valószínűségi modellben számításokat végezni.', '', 'Az emelt szinten érettségiző vizsgázó ismerje a véletlen szerepét egyszerű statisztikai mintavételi eljárásokban.', '', 'matematika, valószínűség, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(183, 'Valós számok (Intervallum, Abszolútérték)', 'Real Numbers (Interval, Absolute Value)', 'Ismerje és használja a nyílt és zárt intervallum fogalmát és jelölését. Az **abszolútérték** a szám távolsága a nullától.', '', 'Ismerje az abszolútérték definícióját. Ismerje adott szám normálalakjának felírási módját, tudjon számolni a normálalakkal.', '', 'matematika, számhalmazok, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(184, 'Normálalak', 'Scientific Notation', 'Egy nagyon nagy vagy nagyon kicsi szám felírási módja $a \\cdot 10^k$ alakban, ahol $1 \\le |a| < 10$ és $k$ egész szám.', '', 'Tudjon számolni a normálalakkal. Tudjon adott helyiértékre vonatkozóan helyesen kerekíteni.', '', 'matematika, algebra, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(185, 'Polinom fokszáma', 'Polynomial Degree', 'A polinom egy tagokból álló algebrai kifejezés, ahol a változó kitevője nem negatív egész szám. A fokszám a legmagasabb fokszámú tag kitevője.', '', 'Ismerje a polinom fokszámát, fokszám szerint rendezett alakját.', '', 'matematika, algebra, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(186, 'Arányosság, százalékszámítás', 'Proportionality, Percentage Calculation', 'Az arányosság két mennyiség közötti kapcsolatot ír le (egyenes/fordított). A százalékszámítás az arányosság speciális esete.', '', 'Ismerje és tudja feladatokban alkalmazni az arányosság és a százalék fogalmát.', '', 'matematika, algebra, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(187, 'Egyenletmegoldási módszerek (következményegyenlet)', 'Equation Solving Methods (Consequence Equations)', 'A következményegyenletre vezető átalakítások (pl. négyzetre emelés) során a megoldáshalmaz bővülhet, ezért a kapott gyököket ellenőrizni kell az eredeti egyenletben.', '', 'Ismerje a mérlegelv, grafikus megoldás, ekvivalens átalakítások, következményegyenletre vezető átalakítások módszereit.', '', 'matematika, algebra, középszint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(188, 'Abszolútértékes egyenletek', 'Absolute Value Equations', 'Olyan egyenletek, amelyekben az ismeretlen az abszolút érték jelén belül szerepel.', '', 'Tudjon egyszerű abszolútértékes egyenleteket algebrai úton megoldani.', '', 'matematika, algebra, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(189, 'Exponenciális és logaritmusos egyenletek', 'Exponential and Logarithmic Equations', 'Olyan egyenletek, ahol az ismeretlen az exponenciális kitevőben vagy a logaritmus argumentumában szerepel.', '', 'Tudjon definíciók és azonosságok közvetlen alkalmazását igénylő exponenciális és logaritmusos egyenleteket megoldani.', '', 'matematika, algebra, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00'),
(190, 'Trigonometrikus egyenletek', 'Trigonometric Equations', 'Olyan egyenletek, amelyekben az ismeretlen a szögfüggvények argumentumában szerepel.', '', 'Tudjon definíciók és azonosságok közvetlen alkalmazását igénylő, és másodfokúra visszavezethető trigonometrikus egyenleteket megoldani.', '', 'matematika, algebra, emelt szint', '2025-12-10 10:00:00', '2025-12-10 10:00:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `header_menu`
--

CREATE TABLE `header_menu` (
  `header_menu_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `header_class` varchar(50) NOT NULL,
  `header_div_id` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `is_ready` int(11) NOT NULL,
  `menu_type` varchar(10) NOT NULL,
  `header_name_hu` varchar(200) NOT NULL,
  `hearder_name_en` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `header_menu`
--

INSERT INTO `header_menu` (`header_menu_id`, `position`, `header_class`, `header_div_id`, `type`, `is_ready`, `menu_type`, `header_name_hu`, `hearder_name_en`) VALUES
(1, 1, 'site-header__logo', 'site-header__logo', 'logo', 1, 'general', 'logo2.svg', 'laboratory_en.jpg'),
(2, 2, 'site-header_search', 'site-header_search', 'search_bar', 1, 'general', 'Téma kereső', 'Search topic'),
(3, 3, 'site-header__navbar header-button', 'site-header__navbar', 'navbar', 1, 'general', 'Oldal felfedezése', 'Site-map'),
(4, 4, 'header-button', 'contact-button', 'button', 1, 'general', 'Kapcsolat', 'Contact'),
(5, 5, 'header-button', 'logout-button', 'button', 1, 'inside', 'Kilépés', 'Logout'),
(6, 6, 'header-button', 'login-button', 'button', 1, 'outside', 'Belépés', 'Login'),
(7, 7, 'header-button', 'reg-button', 'button', 1, 'outside', 'Regisztrálok', 'Registry');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `subtopics`
--

CREATE TABLE `subtopics` (
  `subtopic_id` int(11) NOT NULL,
  `subtopic_class` varchar(50) NOT NULL DEFAULT 'subtopic',
  `subtopic_name_hu` varchar(100) NOT NULL,
  `subtopic_name_en` varchar(100) DEFAULT NULL,
  `topic_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `subtopics`
--

INSERT INTO `subtopics` (`subtopic_id`, `subtopic_class`, `subtopic_name_hu`, `subtopic_name_en`, `topic_id`, `sort_order`) VALUES
(1, 'subtopic', 'Mozgás', 'Motion', 1, 1),
(2, 'subtopic', 'Egyenletes mozgás', 'Uniform motion', 1, 2),
(3, 'subtopic', 'Változó mozgás', 'Accelerating motion', 1, 3),
(4, 'subtopic', 'Hajítások', 'Projectile motion', 2, 1),
(5, 'subtopic', 'Newton törvények', 'Newton\'s  laws', 4, 1),
(6, 'subtopic', 'Tömegvonzási  erő', 'Gravity force', 5, 1),
(7, 'subtopic', 'Súly', 'Weight', 5, 2),
(8, 'subtopic', 'Rugalmas erő', 'Elastic force', 5, 3),
(9, 'subtopic', 'Súrlódási erő', 'Friction force', 5, 4),
(10, 'subtopic', 'Közegellenállási erő', 'Fluid resistance', 5, 5),
(11, 'subtopic', 'Mechanikai munka', 'Mechanical work', 6, 1),
(12, 'subtopic', 'Konzervatív erők', 'Conservative forces', 6, 2),
(13, 'subtopic', 'Helyzeti energia', 'Potential energy', 6, 3),
(14, 'subtopic', 'Mozgási energia', 'Kinetic energy', 6, 4),
(15, 'subtopic', 'Rugalmas energia', 'Elastic potential energy', 6, 5),
(16, 'subtopic', 'Munkatétel', 'Work and Energy', 6, 6),
(17, 'subtopic', 'Energia megmaradás', 'Conservation of energy', 6, 7),
(18, 'subtopic', 'Lendület', 'Momentum', 7, 1),
(19, 'subtopic', 'Tömegpont rendszer', 'Point of mass system', 7, 2),
(20, 'subtopic', 'Lendület megmaradás', 'Conservation of momentum', 7, 3),
(21, 'subtopic', 'Ütközések', 'Collisions', 7, 4),
(22, 'subtopic', 'Egyenletes körmozgás', 'Uniform circular motion', 3, 1),
(23, 'subtopic', 'A körmozgás dinamikája', 'Dynamics of circular motion', 3, 2),
(24, 'subtopic', 'Bolygók mozgása', 'Orbital motion', 3, 3),
(25, 'subtopic', 'Forgatónyomaték', 'Torque', 8, 1),
(26, 'subtopic', 'Merev test egyensúlya', 'Rigid body equilibrium', 8, 2),
(27, 'subtopic', 'Gyorsuló forgómozgás', 'Accelerating rotational motion', 8, 3),
(28, 'subtopic', 'Harmonikus rezgőmozgás', 'Harmonic oscillation', 3, 4),
(29, 'subtopic', 'Mechanikai hullámok', 'Mechanical waves', 9, 1),
(30, 'subtopic', 'Hangtan', 'Physics of sound', 9, 2),
(31, 'subtopic', 'Nyomás', 'Pressure', 10, 1),
(32, 'subtopic', 'Pascal törvény', 'Pascal Law', 10, 2),
(33, 'subtopic', 'Hidrosztatikai nyomás', 'Hydrostatic pressure', 10, 3),
(34, 'subtopic', 'Molekuláris erők folyadékokban', 'Intermolecular Forces in Liquids', 10, 4),
(35, 'subtopic', 'Áramló közeg', 'Flowing medium', 10, 5),
(36, 'subtopic', 'Hőmérséklet', 'Temperature', 11, 1),
(37, 'subtopic', 'Hőtágulás', 'Thermal expansion', 11, 2),
(38, 'subtopic', 'Hőcsere folyamatok', 'Heat transfer', 12, 1),
(39, 'subtopic', 'Hőkapacitás', 'Heat capacity', 12, 2),
(40, 'subtopic', 'Halmazállapot-változások', 'Physical state changes', 13, 1),
(41, 'subtopic', 'Gáztörvények', 'Gas laws', 14, 1),
(42, 'subtopic', 'Gázok kinetikus modellje', 'Kinetic model of gases', 14, 2),
(43, 'subtopic', 'Belső energia', 'Internal energy', 15, 1),
(44, 'subtopic', 'A termodinamika 1. főtétele', 'Law 1 of thermodynamics', 15, 2),
(45, 'subtopic', 'Hőerőgépek, 2. főtétel', 'Heat Engines', 15, 3),
(46, 'subtopic', 'Elektromos alapjelenségek', 'Basic electrical phenomena', 16, 1),
(47, 'subtopic', 'Elektrosztatikus tér', 'Electrostatic field', 16, 2),
(48, 'subtopic', 'Vezetők elektromos térben', 'Electric charge on conductors', 16, 3),
(49, 'subtopic', 'Elektromos áram', 'Electric current', 17, 1),
(50, 'subtopic', 'Áramforrások', 'Sources of electricity', 17, 2),
(51, 'subtopic', 'Elektromos ellenállás', 'Electrical resistance', 17, 3),
(52, 'subtopic', 'Áramkörök, kapcsolások', 'Electric circuit patterns', 17, 4),
(53, 'subtopic', 'Mágneses tér, Gerjesztés', 'Magnetic field, Excitation', 18, 1),
(54, 'subtopic', 'Elektromos indukció', 'Electrical induction', 18, 2),
(55, 'subtopic', 'Elektromosság a háztartásban', 'Electricity at home', 17, 5),
(56, 'subtopic', 'Maxwell egyenletek', 'Maxwell equations', 18, 3),
(57, 'subtopic', 'Elektromágneses hullámok', 'Electromagnetic waves', 19, 1),
(58, 'subtopic', 'A látható fény, a fény hullám', 'The wave nature of light', 19, 2),
(59, 'subtopic', 'A fény részecsketermészete', 'Particle nature of light', 21, 1),
(60, 'subtopic', 'Sugármenetek', 'Light rays path', 20, 1),
(61, 'subtopic', 'Leképező eszközök', 'Optical Devices', 20, 2),
(62, 'subtopic', 'Optikai eszközök', 'Optical Instruments', 20, 3),
(63, 'subtopic', 'Atommodellek', 'Atomic models', 22, 1),
(64, 'subtopic', 'Speciális relativitás', 'Special relativity', 19, 3),
(65, 'subtopic', 'Elektronfizika, anyaghullámok', 'Electron physics, matter wave', 22, 2),
(66, 'subtopic', 'Erős kölcsönhatás', 'Strong interaction', 23, 1),
(67, 'subtopic', 'Radioaktivitás', 'Radioactivity', 23, 2),
(68, 'subtopic', 'Nukleáris energia,  erőmű', 'Nuclear energy, power plant', 23, 3),
(69, 'subtopic', 'Energia és Fenntarthatóság', 'Energy sources and Sustainability', 26, 1),
(70, 'subtopic', 'Csillagászat, Űrkutatás', 'Astronomy, Space exploration', 24, 1),
(71, 'subtopic', 'Naprendszer', 'Solar system', 24, 2),
(72, 'subtopic', 'Fizikatörténet', 'History of Physics', 27, 1),
(73, 'subtopic', 'Modellalkotás', 'Modelling', 25, 1),
(74, 'subtopic', 'Ismeretelmélet', 'Epistemology ', 28, 1),
(75, 'subtopic', 'Halmazok megadása, relációk', 'eng', 29, 1),
(76, 'subtopic', 'Halmaz műveletek', 'eng', 29, 2),
(77, 'subtopic', 'Halmazok elemszáma, szita', 'eng', 29, 3),
(78, 'subtopic', 'Intervallumok', 'eng', 29, 4),
(79, 'subtopic', 'Logikai műveletek', 'eng', 30, 1),
(80, 'subtopic', 'Tagadás, megfordítás', 'eng', 30, 2),
(81, 'subtopic', 'Variációk, permutáció', 'eng', 31, 1),
(82, 'subtopic', 'Kombináciő, binomiális e.h.', 'eng', 31, 2),
(83, 'subtopic', 'Esetszétválasztás', 'eng', 31, 3),
(84, 'subtopic', 'Gráfok', 'eng', 32, 1),
(85, 'subtopic', 'Prímszámok', 'eng', 33, 1),
(86, 'subtopic', 'Számelmélet Alaptétele', 'eng', 33, 2),
(87, 'subtopic', 'Oszthatósági szabályok', 'eng', 34, 1),
(88, 'subtopic', 'Közös osztó, közös többszörös', 'eng', 34, 2),
(89, 'subtopic', 'Maradék osztályok', 'eng', 34, 3),
(90, 'subtopic', 'Polinomok rendezése', 'eng', 35, 1),
(91, 'subtopic', 'Polinomok szorzattá alakítása', 'eng', 35, 2),
(92, 'subtopic', 'Racionális törtek', 'eng', 35, 3),
(93, 'subtopic', 'Hatványozás pozitív kitevőre', 'eng', 36, 1),
(94, 'subtopic', 'Hatványozás kiterjesztése, gyökvonás', 'eng', 36, 2),
(95, 'subtopic', 'Exponenciális függvény', 'eng', 37, 1),
(96, 'subtopic', 'Exponenciális egyenletek', 'eng', 37, 2),
(97, 'subtopic', 'Exponenciális egyenlőtlenségek', 'eng', 37, 3),
(98, 'subtopic', 'Logaritmus függvény', 'eng', 37, 4),
(99, 'subtopic', 'Logaritmus azonosságai', 'eng', 37, 5),
(100, 'subtopic', 'Logaritmikus egyenletek', 'eng', 37, 6),
(101, 'subtopic', 'Logaritmikus egyenlőtlenségek', 'eng', 37, 7),
(102, 'subtopic', 'Százalékszámítás', 'eng', 38, 1),
(103, 'subtopic', 'Elsőfokú egyenletek, egyenlőtlenségek', 'eng', 39, 1),
(104, 'subtopic', 'Lineáris egyenletrendszerek', 'eng', 39, 2),
(105, 'subtopic', 'Másodfokú egyenletek, egyenlőtlenségek', 'eng', 39, 3),
(106, 'subtopic', 'Gyökös egyenletek', 'eng', 39, 4),
(107, 'subtopic', 'Trigonometrikus egyenletek', 'eng', 39, 5),
(108, 'subtopic', 'Exponenciális, logaritmikus egyenletek', 'eng', 39, 6),
(109, 'subtopic', 'Lineáris függvény', 'eng', 40, 1),
(110, 'subtopic', 'Másodfokú- és gyökfüggvény', 'eng', 40, 2),
(111, 'subtopic', 'Trigonometrikus függvény', 'eng', 40, 3),
(112, 'subtopic', 'Logaritmus/Exponenciális függvény', 'eng', 40, 4),
(113, 'subtopic', 'Grafikonnal megadott függvény jellemzése', 'eng', 41, 1),
(114, 'subtopic', 'Másodfokú- és gyökfüggvény jellemzése', 'eng', 41, 2),
(115, 'subtopic', 'Trigonometrikus függvény jellemzése', 'eng', 41, 3),
(116, 'subtopic', 'Logaritmus/Exponenciális függvény jellemzése', 'eng', 41, 4),
(117, 'subtopic', 'Számsorozatok', 'eng', 42, 1),
(118, 'subtopic', 'Rekurzív sorozatok', 'eng', 42, 2),
(119, 'subtopic', 'Számtani sorozatok megadása', 'eng', 43, 1),
(120, 'subtopic', 'Számtani sorozat összege', 'eng', 43, 2),
(121, 'subtopic', 'Mértani sorozatok', 'eng', 44, 1),
(122, 'subtopic', 'Mértani sorozatok összege', 'eng', 44, 2),
(123, 'subtopic', 'Sík- és térelemek', 'eng', 45, 1),
(124, 'subtopic', 'Háromszögek', 'eng', 45, 2),
(125, 'subtopic', 'Négyszögek', 'eng', 45, 3),
(126, 'subtopic', 'Sokszögek', 'eng', 45, 4),
(127, 'subtopic', 'Kör', 'eng', 45, 5),
(128, 'subtopic', 'Egybevágósági transzformációk', 'eng', 46, 1),
(129, 'subtopic', 'Hasonlóság', 'eng', 46, 2),
(130, 'subtopic', 'Hegyesszög szögfüggvényei', 'eng', 47, 1),
(131, 'subtopic', 'Forgásszög szögfüggvényei', 'eng', 47, 2),
(132, 'subtopic', 'Szinusz- koszinusztétel', 'eng', 47, 3),
(133, 'subtopic', 'Alapműveletek vektorokkal', 'eng', 48, 1),
(134, 'subtopic', 'Vektorok és koordináták', 'eng', 48, 2),
(135, 'subtopic', 'Vektorok skaláris és vektoriális szorzata', 'eng', 48, 3),
(136, 'subtopic', 'Egyenes egyenlete', 'eng', 49, 1),
(137, 'subtopic', 'Távolság, szög', 'eng', 49, 2),
(138, 'subtopic', 'Kör egyenlete', 'eng', 49, 3),
(139, 'subtopic', 'Parabola egyenlete', 'eng', 49, 4),
(140, 'subtopic', 'Hasábok', 'eng', 50, 1),
(141, 'subtopic', 'Gömb, gúla, kúp', 'eng', 50, 2),
(142, 'subtopic', 'Térbeli távolságok, szögek', 'eng', 50, 3),
(143, 'subtopic', 'Csonkagúla, csonkakúp', 'eng', 50, 4),
(144, 'subtopic', 'Minta jellemzése', 'eng', 51, 1),
(145, 'subtopic', 'Grafikonok statisztikában', 'eng', 51, 2),
(146, 'subtopic', 'Kombinatorikus valószínűség', 'eng', 52, 1),
(147, 'subtopic', 'Véges eloszlások', 'eng', 52, 2),
(148, 'subtopic', 'A fizika középszintű érettségi dokumentumai', 'eng', 53, 3),
(149, 'subtopic', 'Hogyan készüljünk fizika középszintű érettségire', 'eng', 53, 4),
(150, 'subtopic', 'A fizika emeltszintű érettségi dokumentumai', 'eng', 54, 1),
(151, 'subtopic', 'A matematika középszintű érettségi dokumentumai', 'eng', 55, 1),
(152, 'subtopic', 'Hogyan készüljünk matematika középszintű érettségire', 'eng', 55, 2),
(153, 'subtopic', 'A matematika emeltszintű érettségi dokumentumai', 'eng', 56, 1),
(154, 'subtopic', 'Fizika animációk', 'eng', 57, 1),
(155, 'subtopic', 'Fizika tananyagok', 'eng', 57, 2),
(156, 'subtopic', 'Matematika tananyagok', 'eng', 58, 1),
(157, 'subtopic', 'Saját fizika videók', 'eng', 59, 1),
(158, 'subtopic', 'Fizika videók', 'eng', 59, 2),
(159, 'subtopic', 'Saját matematika videók', 'eng', 60, 1),
(160, 'subtopic', 'Matematika videók', 'eng', 60, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `subtopic_documents`
--

CREATE TABLE `subtopic_documents` (
  `subtopic_document_id` int(10) UNSIGNED NOT NULL,
  `subtopic_id` int(11) NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `subtopic_documents`
--

INSERT INTO `subtopic_documents` (`subtopic_document_id`, `subtopic_id`, `document_id`, `created_at`) VALUES
(1, 18, 1, '2025-12-12 23:39:00'),
(2, 19, 2, '2025-12-12 23:39:00'),
(3, 29, 3, '2025-12-12 23:39:00'),
(4, 37, 4, '2025-12-12 23:39:00'),
(5, 41, 5, '2025-12-12 23:39:00'),
(6, 37, 6, '2025-12-12 23:39:00'),
(7, 41, 6, '2025-12-12 23:39:00'),
(8, 43, 7, '2025-12-12 23:39:00'),
(9, 44, 7, '2025-12-12 23:39:00'),
(10, 42, 7, '2025-12-12 23:39:00'),
(11, 38, 8, '2025-12-12 23:39:00'),
(12, 39, 8, '2025-12-12 23:39:00'),
(13, 46, 9, '2025-12-12 23:39:00'),
(14, 47, 9, '2025-12-12 23:39:00'),
(15, 48, 9, '2025-12-12 23:39:00'),
(16, 49, 10, '2025-12-12 23:39:00'),
(17, 50, 10, '2025-12-12 23:39:00'),
(18, 51, 10, '2025-12-12 23:39:00'),
(19, 52, 10, '2025-12-12 23:39:00'),
(20, 55, 10, '2025-12-12 23:39:00'),
(21, 53, 11, '2025-12-12 23:39:00'),
(22, 54, 11, '2025-12-12 23:39:00'),
(23, 56, 11, '2025-12-12 23:39:00'),
(24, 55, 12, '2025-12-12 23:39:00'),
(25, 52, 12, '2025-12-12 23:39:00'),
(26, 51, 12, '2025-12-12 23:39:00'),
(27, 56, 13, '2025-12-12 23:39:00'),
(28, 57, 13, '2025-12-12 23:39:00'),
(29, 58, 13, '2025-12-12 23:39:00'),
(30, 58, 14, '2025-12-12 23:39:00'),
(31, 57, 14, '2025-12-12 23:39:00'),
(32, 64, 14, '2025-12-12 23:39:00'),
(33, 1, 15, '2025-12-12 23:39:00'),
(34, 2, 15, '2025-12-12 23:39:00'),
(35, 3, 15, '2025-12-12 23:39:00'),
(36, 4, 15, '2025-12-12 23:39:00'),
(37, 60, 16, '2025-12-12 23:39:00'),
(38, 61, 16, '2025-12-12 23:39:00'),
(39, 62, 16, '2025-12-12 23:39:00'),
(40, 63, 17, '2025-12-12 23:39:00'),
(41, 64, 17, '2025-12-12 23:39:00'),
(42, 65, 17, '2025-12-12 23:39:00'),
(43, 66, 18, '2025-12-12 23:39:00'),
(44, 67, 18, '2025-12-12 23:39:00'),
(45, 68, 18, '2025-12-12 23:39:00'),
(46, 70, 19, '2025-12-12 23:39:00'),
(47, 71, 19, '2025-12-12 23:39:00'),
(48, 72, 20, '2025-12-12 23:39:00'),
(49, 18, 21, '2025-12-12 23:39:00'),
(50, 19, 21, '2025-12-12 23:39:00'),
(51, 20, 21, '2025-12-12 23:39:00'),
(52, 21, 21, '2025-12-12 23:39:00'),
(53, 5, 22, '2025-12-12 23:39:00'),
(54, 6, 22, '2025-12-12 23:39:00'),
(55, 7, 22, '2025-12-12 23:39:00'),
(56, 8, 22, '2025-12-12 23:39:00'),
(57, 9, 22, '2025-12-12 23:39:00'),
(58, 10, 22, '2025-12-12 23:39:00'),
(59, 22, 23, '2025-12-12 23:39:00'),
(60, 23, 23, '2025-12-12 23:39:00'),
(61, 24, 23, '2025-12-12 23:39:00'),
(62, 6, 24, '2025-12-12 23:39:00'),
(63, 24, 24, '2025-12-12 23:39:00'),
(64, 27, 24, '2025-12-12 23:39:00'),
(65, 25, 25, '2025-12-12 23:39:00'),
(66, 26, 25, '2025-12-12 23:39:00'),
(67, 11, 26, '2025-12-12 23:39:00'),
(68, 12, 26, '2025-12-12 23:39:00'),
(69, 13, 26, '2025-12-12 23:39:00'),
(70, 14, 26, '2025-12-12 23:39:00'),
(71, 15, 26, '2025-12-12 23:39:00'),
(72, 16, 26, '2025-12-12 23:39:00'),
(73, 17, 26, '2025-12-12 23:39:00'),
(74, 31, 27, '2025-12-12 23:39:00'),
(75, 32, 27, '2025-12-12 23:39:00'),
(76, 33, 27, '2025-12-12 23:39:00'),
(77, 34, 27, '2025-12-12 23:39:00'),
(78, 35, 27, '2025-12-12 23:39:00'),
(79, 28, 28, '2025-12-12 23:39:00'),
(80, 28, 29, '2025-12-12 23:39:00'),
(81, 5, 30, '2025-12-12 23:39:00'),
(82, 6, 30, '2025-12-12 23:39:00'),
(83, 7, 30, '2025-12-12 23:39:00'),
(84, 8, 30, '2025-12-12 23:39:00'),
(85, 9, 30, '2025-12-12 23:39:00'),
(86, 10, 30, '2025-12-12 23:39:00'),
(87, 5, 31, '2025-12-12 23:39:00'),
(88, 6, 31, '2025-12-12 23:39:00'),
(89, 7, 31, '2025-12-12 23:39:00'),
(90, 8, 31, '2025-12-12 23:39:00'),
(91, 9, 31, '2025-12-12 23:39:00'),
(92, 10, 31, '2025-12-12 23:39:00'),
(93, 2, 32, '2025-12-12 23:39:00'),
(94, 46, 33, '2025-12-12 23:39:00'),
(95, 47, 33, '2025-12-12 23:39:00'),
(96, 48, 33, '2025-12-12 23:39:00'),
(97, 46, 34, '2025-12-12 23:39:00'),
(98, 47, 34, '2025-12-12 23:39:00'),
(99, 48, 34, '2025-12-12 23:39:00'),
(100, 73, 35, '2025-12-12 23:39:00'),
(101, 74, 35, '2025-12-12 23:39:00'),
(102, 73, 36, '2025-12-12 23:39:00'),
(103, 1, 37, '2025-12-12 23:39:00'),
(104, 2, 38, '2025-12-12 23:39:00'),
(105, 3, 39, '2025-12-12 23:39:00'),
(106, 2, 40, '2025-12-12 23:39:00'),
(107, 3, 40, '2025-12-12 23:39:00'),
(108, 4, 40, '2025-12-12 23:39:00'),
(109, 2, 41, '2025-12-12 23:39:00'),
(110, 3, 41, '2025-12-12 23:39:00'),
(111, 4, 41, '2025-12-12 23:39:00'),
(112, 5, 42, '2025-12-12 23:39:00'),
(113, 6, 43, '2025-12-12 23:39:00'),
(114, 8, 44, '2025-12-12 23:39:00'),
(115, 9, 44, '2025-12-12 23:39:00'),
(116, 9, 45, '2025-12-12 23:39:00'),
(117, 10, 45, '2025-12-12 23:39:00'),
(118, 11, 46, '2025-12-12 23:39:00'),
(119, 12, 46, '2025-12-12 23:39:00'),
(120, 13, 46, '2025-12-12 23:39:00'),
(121, 14, 46, '2025-12-12 23:39:00'),
(122, 15, 46, '2025-12-12 23:39:00'),
(123, 16, 46, '2025-12-12 23:39:00'),
(124, 17, 46, '2025-12-12 23:39:00'),
(125, 18, 47, '2025-12-12 23:39:00'),
(126, 19, 47, '2025-12-12 23:39:00'),
(127, 20, 47, '2025-12-12 23:39:00'),
(128, 21, 47, '2025-12-12 23:39:00'),
(129, 20, 48, '2025-12-12 23:39:00'),
(130, 21, 48, '2025-12-12 23:39:00'),
(131, 22, 49, '2025-12-12 23:39:00'),
(132, 23, 50, '2025-12-12 23:39:00'),
(133, 24, 50, '2025-12-12 23:39:00'),
(134, 25, 51, '2025-12-12 23:39:00'),
(135, 26, 51, '2025-12-12 23:39:00'),
(136, 27, 51, '2025-12-12 23:39:00'),
(137, 28, 52, '2025-12-12 23:39:00'),
(138, 28, 53, '2025-12-12 23:39:00'),
(139, 29, 54, '2025-12-12 23:39:00'),
(140, 30, 55, '2025-12-12 23:39:00'),
(141, 36, 56, '2025-12-12 23:39:00'),
(142, 37, 57, '2025-12-12 23:39:00'),
(143, 38, 58, '2025-12-12 23:39:00'),
(144, 39, 58, '2025-12-12 23:39:00'),
(145, 40, 59, '2025-12-12 23:39:00'),
(146, 41, 60, '2025-12-12 23:39:00'),
(147, 42, 61, '2025-12-12 23:39:00'),
(148, 43, 61, '2025-12-12 23:39:00'),
(149, 44, 62, '2025-12-12 23:39:00'),
(150, 45, 63, '2025-12-12 23:39:00'),
(151, 46, 64, '2025-12-12 23:39:00'),
(152, 47, 65, '2025-12-12 23:39:00'),
(153, 48, 66, '2025-12-12 23:39:00'),
(154, 48, 67, '2025-12-12 23:39:00'),
(155, 49, 68, '2025-12-12 23:39:00'),
(156, 50, 69, '2025-12-12 23:39:00'),
(157, 51, 70, '2025-12-12 23:39:00'),
(158, 52, 70, '2025-12-12 23:39:00'),
(159, 53, 71, '2025-12-12 23:39:00'),
(160, 54, 72, '2025-12-12 23:39:00'),
(161, 55, 73, '2025-12-12 23:39:00'),
(162, 52, 73, '2025-12-12 23:39:00'),
(163, 56, 74, '2025-12-12 23:39:00'),
(164, 57, 75, '2025-12-12 23:39:00'),
(165, 58, 76, '2025-12-12 23:39:00'),
(166, 58, 77, '2025-12-12 23:39:00'),
(167, 59, 78, '2025-12-12 23:39:00'),
(168, 60, 79, '2025-12-12 23:39:00'),
(169, 61, 80, '2025-12-12 23:39:00'),
(170, 62, 81, '2025-12-12 23:39:00'),
(171, 63, 82, '2025-12-12 23:39:00'),
(172, 64, 83, '2025-12-12 23:39:00'),
(173, 30, 84, '2025-12-12 23:39:00'),
(174, 74, 85, '2025-12-12 23:39:00'),
(175, 73, 85, '2025-12-12 23:39:00'),
(176, 5, 86, '2025-12-12 23:39:00'),
(177, 68, 89, '2025-12-12 23:39:00'),
(178, 20, 90, '2025-12-12 23:39:00'),
(179, 2, 92, '2025-12-12 23:39:00'),
(180, 3, 92, '2025-12-12 23:39:00'),
(181, 2, 93, '2025-12-12 23:39:00'),
(182, 3, 93, '2025-12-12 23:39:00'),
(183, 2, 94, '2025-12-12 23:39:00'),
(184, 3, 94, '2025-12-12 23:39:00'),
(185, 47, 97, '2025-12-12 23:39:00'),
(186, 48, 97, '2025-12-12 23:39:00'),
(187, 50, 98, '2025-12-12 23:39:00'),
(188, 52, 98, '2025-12-12 23:39:00'),
(189, 11, 99, '2025-12-12 23:39:00'),
(190, 12, 99, '2025-12-12 23:39:00'),
(191, 13, 99, '2025-12-12 23:39:00'),
(192, 14, 99, '2025-12-12 23:39:00'),
(193, 15, 99, '2025-12-12 23:39:00'),
(194, 16, 99, '2025-12-12 23:39:00'),
(195, 17, 99, '2025-12-12 23:39:00'),
(196, 18, 99, '2025-12-12 23:39:00'),
(197, 19, 99, '2025-12-12 23:39:00'),
(198, 20, 99, '2025-12-12 23:39:00'),
(199, 21, 99, '2025-12-12 23:39:00'),
(200, 11, 100, '2025-12-12 23:39:00'),
(201, 12, 100, '2025-12-12 23:39:00'),
(202, 13, 100, '2025-12-12 23:39:00'),
(203, 14, 100, '2025-12-12 23:39:00'),
(204, 15, 100, '2025-12-12 23:39:00'),
(205, 16, 100, '2025-12-12 23:39:00'),
(206, 17, 100, '2025-12-12 23:39:00'),
(207, 4, 101, '2025-12-12 23:39:00'),
(208, 3, 102, '2025-12-12 23:39:00'),
(209, 3, 105, '2025-12-12 23:39:00'),
(210, 31, 109, '2025-12-12 23:39:00'),
(211, 32, 109, '2025-12-12 23:39:00'),
(212, 33, 109, '2025-12-12 23:39:00'),
(213, 37, 110, '2025-12-12 23:39:00'),
(214, 29, 111, '2025-12-12 23:39:00'),
(215, 29, 112, '2025-12-12 23:39:00'),
(216, 29, 113, '2025-12-12 23:39:00'),
(217, 51, 114, '2025-12-12 23:39:00'),
(218, 73, 115, '2025-12-12 23:39:00'),
(219, 74, 115, '2025-12-12 23:39:00'),
(220, 39, 116, '2025-12-12 23:39:00'),
(221, 40, 116, '2025-12-12 23:39:00'),
(222, 28, 117, '2025-12-12 23:39:00'),
(223, 29, 118, '2025-12-12 23:39:00'),
(224, 30, 118, '2025-12-12 23:39:00'),
(225, 1, 119, '2025-12-12 23:39:00'),
(226, 2, 119, '2025-12-12 23:39:00'),
(227, 3, 119, '2025-12-12 23:39:00'),
(228, 4, 119, '2025-12-12 23:39:00'),
(229, 25, 120, '2025-12-12 23:39:00'),
(230, 26, 120, '2025-12-12 23:39:00'),
(231, 2, 121, '2025-12-12 23:39:00'),
(232, 3, 121, '2025-12-12 23:39:00'),
(233, 4, 121, '2025-12-12 23:39:00'),
(234, 2, 122, '2025-12-12 23:39:00'),
(235, 3, 122, '2025-12-12 23:39:00'),
(236, 4, 122, '2025-12-12 23:39:00'),
(237, 47, 124, '2025-12-12 23:39:00'),
(238, 22, 127, '2025-12-12 23:39:00'),
(239, 23, 127, '2025-12-12 23:39:00'),
(240, 22, 128, '2025-12-12 23:39:00'),
(241, 23, 128, '2025-12-12 23:39:00'),
(242, 22, 129, '2025-12-12 23:39:00'),
(243, 23, 129, '2025-12-12 23:39:00'),
(244, 10, 130, '2025-12-12 23:39:00'),
(245, 1, 138, '2025-12-12 23:39:00'),
(246, 2, 138, '2025-12-12 23:39:00'),
(247, 3, 138, '2025-12-12 23:39:00'),
(248, 4, 138, '2025-12-12 23:39:00'),
(249, 2, 139, '2025-12-12 23:39:00'),
(250, 2, 140, '2025-12-12 23:39:00'),
(251, 10, 141, '2025-12-12 23:39:00'),
(252, 52, 142, '2025-12-12 23:39:00'),
(253, 28, 144, '2025-12-12 23:39:00'),
(254, 28, 145, '2025-12-12 23:39:00'),
(255, 28, 146, '2025-12-12 23:39:00'),
(256, 8, 146, '2025-12-12 23:39:00'),
(257, 28, 147, '2025-12-12 23:39:00'),
(258, 8, 147, '2025-12-12 23:39:00'),
(259, 7, 151, '2025-12-12 23:39:00'),
(260, 25, 151, '2025-12-12 23:39:00'),
(261, 26, 151, '2025-12-12 23:39:00'),
(262, 9, 152, '2025-12-12 23:39:00'),
(263, 5, 152, '2025-12-12 23:39:00'),
(264, 51, 158, '2025-12-12 23:39:00'),
(265, 43, 159, '2025-12-12 23:39:00'),
(266, 44, 159, '2025-12-12 23:39:00'),
(267, 45, 159, '2025-12-12 23:39:00'),
(268, 6, 161, '2025-12-12 23:39:00'),
(269, 3, 161, '2025-12-12 23:39:00'),
(270, 28, 161, '2025-12-12 23:39:00'),
(271, 51, 162, '2025-12-12 23:39:00'),
(272, 52, 162, '2025-12-12 23:39:00'),
(273, 52, 166, '2025-12-12 23:39:00'),
(274, 66, 176, '2025-12-12 23:39:00'),
(275, 67, 176, '2025-12-12 23:39:00'),
(276, 68, 176, '2025-12-12 23:39:00'),
(277, 63, 179, '2025-12-12 23:39:00'),
(278, 73, 180, '2025-12-12 23:39:00'),
(279, 74, 180, '2025-12-12 23:39:00'),
(280, 29, 189, '2025-12-12 23:39:00'),
(281, 63, 193, '2025-12-12 23:39:00'),
(282, 28, 188, '2025-12-12 23:39:00'),
(283, 29, 191, '2025-12-12 23:39:00'),
(284, 30, 191, '2025-12-12 23:39:00'),
(285, 52, 187, '2025-12-12 23:39:00'),
(286, 103, 88, '2025-12-13 23:43:00'),
(287, 103, 95, '2025-12-13 23:43:00'),
(288, 104, 95, '2025-12-13 23:43:00'),
(289, 105, 95, '2025-12-13 23:43:00'),
(290, 103, 96, '2025-12-13 23:43:00'),
(291, 104, 96, '2025-12-13 23:43:00'),
(292, 105, 96, '2025-12-13 23:43:00'),
(293, 84, 103, '2025-12-13 23:43:00'),
(294, 106, 104, '2025-12-13 23:43:00'),
(295, 128, 106, '2025-12-13 23:43:00'),
(296, 128, 107, '2025-12-13 23:43:00'),
(297, 128, 108, '2025-12-13 23:43:00'),
(298, 81, 123, '2025-12-13 23:43:00'),
(299, 82, 123, '2025-12-13 23:43:00'),
(300, 83, 123, '2025-12-13 23:43:00'),
(301, 137, 125, '2025-12-13 23:43:00'),
(302, 137, 126, '2025-12-13 23:43:00'),
(303, 135, 131, '2025-12-13 23:43:00'),
(304, 104, 131, '2025-12-13 23:43:00'),
(305, 109, 131, '2025-12-13 23:43:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `subtopic_videos`
--

CREATE TABLE `subtopic_videos` (
  `subtopic_videos_id` int(10) UNSIGNED NOT NULL,
  `subtopic_id` int(11) NOT NULL,
  `video_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `subtopic_videos`
--

INSERT INTO `subtopic_videos` (`subtopic_videos_id`, `subtopic_id`, `video_id`) VALUES
(61, 1, 58),
(147, 1, 70),
(81, 2, 53),
(79, 2, 54),
(75, 2, 56),
(62, 2, 58),
(82, 3, 53),
(80, 3, 54),
(78, 3, 55),
(83, 4, 53),
(84, 5, 43),
(88, 5, 67),
(3, 6, 42),
(89, 6, 67),
(4, 7, 42),
(90, 7, 67),
(5, 8, 41),
(91, 8, 67),
(7, 9, 40),
(6, 9, 41),
(92, 9, 67),
(8, 10, 40),
(93, 10, 67),
(9, 11, 34),
(137, 11, 68),
(10, 12, 34),
(138, 12, 68),
(11, 13, 34),
(139, 13, 68),
(12, 14, 34),
(140, 14, 68),
(13, 15, 34),
(141, 15, 68),
(14, 16, 34),
(142, 16, 68),
(16, 17, 33),
(15, 17, 34),
(143, 17, 68),
(17, 18, 33),
(18, 19, 33),
(22, 20, 31),
(20, 20, 32),
(19, 20, 33),
(23, 21, 31),
(21, 21, 32),
(24, 22, 24),
(155, 22, 63),
(125, 22, 88),
(26, 23, 23),
(156, 23, 63),
(126, 23, 88),
(27, 24, 23),
(25, 24, 24),
(127, 24, 88),
(146, 24, 89),
(28, 25, 21),
(30, 26, 20),
(29, 26, 21),
(31, 27, 20),
(33, 28, 16),
(32, 28, 18),
(35, 29, 12),
(34, 29, 13),
(119, 29, 65),
(116, 29, 66),
(40, 30, 9),
(120, 30, 65),
(117, 30, 66),
(41, 36, 8),
(42, 37, 4),
(43, 38, 3),
(44, 39, 3),
(45, 40, 1),
(48, 41, 59),
(49, 42, 57),
(51, 43, 46),
(50, 43, 57),
(52, 44, 46),
(53, 45, 45),
(54, 46, 44),
(149, 46, 62),
(152, 46, 64),
(55, 47, 39),
(150, 47, 62),
(153, 47, 64),
(56, 48, 38),
(151, 48, 62),
(154, 48, 64),
(57, 49, 37),
(58, 50, 36),
(59, 51, 35),
(65, 52, 27),
(60, 52, 35),
(63, 53, 30),
(64, 54, 29),
(66, 55, 27),
(67, 56, 28),
(38, 57, 12),
(36, 57, 13),
(68, 57, 26),
(121, 57, 65),
(118, 57, 66),
(39, 58, 12),
(37, 58, 13),
(70, 58, 22),
(69, 58, 25),
(71, 59, 19),
(72, 60, 17),
(73, 61, 15),
(74, 62, 14),
(76, 63, 11),
(77, 64, 10),
(136, 66, 93),
(85, 67, 95),
(87, 68, 85),
(114, 69, 85),
(46, 73, 60),
(1, 73, 61),
(47, 74, 60),
(2, 74, 61),
(102, 75, 6),
(103, 76, 6),
(104, 78, 6),
(98, 84, 7),
(97, 84, 48),
(105, 90, 6),
(106, 91, 6),
(86, 103, 94),
(133, 105, 5),
(134, 106, 5),
(132, 108, 2),
(135, 110, 5),
(145, 123, 77),
(110, 124, 47),
(144, 124, 71),
(112, 124, 90),
(109, 124, 91),
(107, 129, 47),
(111, 129, 90),
(108, 129, 91),
(96, 129, 92),
(130, 130, 2),
(115, 130, 79),
(113, 130, 83),
(131, 132, 2),
(99, 133, 7),
(148, 133, 73),
(100, 134, 7),
(123, 134, 51),
(94, 136, 52),
(95, 136, 69),
(101, 137, 7),
(124, 137, 51),
(122, 138, 51),
(128, 144, 2),
(129, 145, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `topics`
--

CREATE TABLE `topics` (
  `topic_id` int(11) NOT NULL,
  `topic_class` varchar(50) NOT NULL,
  `topic_name_hu` varchar(100) NOT NULL,
  `topic_name_en` varchar(100) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `has_subtopic` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `topics`
--

INSERT INTO `topics` (`topic_id`, `topic_class`, `topic_name_hu`, `topic_name_en`, `branch_id`, `sort_order`, `has_subtopic`) VALUES
(1, 'topic physics-topic', 'Egyszerű mozgások', 'Simple motions', 1, 1, 1),
(2, 'topic physics-topic', 'Összetett mozgások', 'Complex motions', 1, 2, 1),
(3, 'topic physics-topic', 'Periodikus mozgások', 'Periodic motions', 1, 3, 1),
(4, 'topic physics-topic', 'Newton törvények', 'Newtonian laws', 1, 4, 1),
(5, 'topic physics-topic', 'Erők', 'Forces', 1, 5, 1),
(6, 'topic physics-topic', 'Munka/Mechanikai Energia', 'Work/Mechanical Energies', 1, 6, 1),
(7, 'topic physics-topic', 'Lendület/Ütközések', 'Momentum/Collisions', 1, 7, 1),
(8, 'topic physics-topic', 'Kiterjedt testek/Forgómozgás', 'Extended bodies/Rotary motion', 1, 8, 1),
(9, 'topic physics-topic', 'Hullámok', 'Waves', 1, 9, 1),
(10, 'topic physics-topic', 'Deformálható közegek mechanikája', 'Mechanics of fluids', 1, 10, 1),
(11, 'topic physics-topic', 'Hőmérséklet változása', 'Temperature change', 2, 1, 1),
(12, 'topic physics-topic', 'Hőcsere', 'Heat transfer', 2, 2, 1),
(13, 'topic physics-topic', 'Halmazállapot-változások', 'Change of state', 2, 3, 1),
(14, 'topic physics-topic', 'Gázok fizikája', 'Physics of gases', 2, 4, 1),
(15, 'topic physics-topic', 'Termodinamika főtételei', 'Laws of Themodinamics', 2, 5, 1),
(16, 'topic physics-topic', 'Elektrosztatika', 'Static electric fields', 3, 1, 1),
(17, 'topic physics-topic', 'Elektromos áram', 'Electric current', 3, 2, 1),
(18, 'topic physics-topic', 'Elektromágneses jelenségek', 'Electromagnetism', 3, 3, 1),
(19, 'topic physics-topic', 'Fizikai optika/Elektromágneses hullámok', 'Electromagnetic waves', 5, 1, 1),
(20, 'topic physics-topic', 'Geometriai optika', 'Optics', 5, 2, 1),
(21, 'topic physics-topic', 'A fény kettős természete', 'Dual nature of light', 5, 3, 1),
(22, 'topic physics-topic', 'Az atom szerkezete', 'Atomic structure', 4, 1, 1),
(23, 'topic physics-topic', 'Atommag fizika', 'Nuclear physics', 4, 2, 1),
(24, 'topic physics-topic', 'Csillagászat', 'Astronomy', 6, 1, 1),
(25, 'topic physics-topic', 'Modellalkotás', 'Modelling', 7, 1, 1),
(26, 'topic physics-topic', 'Fenntarthatóság', 'Sustainability', 7, 2, 1),
(27, 'topic physics-topic', 'Fizika-történet', 'History of Physics', 7, 3, 1),
(28, 'topic physics-topic', 'Ismeretelmélet', 'Epistemology ', 7, 4, 1),
(29, 'topic math-topic', 'Halmazok', 'Sets', 9, 1, 1),
(30, 'topic math-topic', 'Logika', 'Logic', 9, 2, 1),
(31, 'topic math-topic', 'Kombinatorika', 'eng', 9, 3, 1),
(32, 'topic math-topic', 'Gráfok', 'eng', 9, 4, 1),
(33, 'topic math-topic', 'Számelmélet', 'eng', 8, 1, 1),
(34, 'topic math-topic', 'Oszthatóság', 'eng', 8, 2, 1),
(35, 'topic math-topic', 'Algebrai kifejezések', 'eng', 8, 3, 1),
(36, 'topic math-topic', 'Hatványozás', 'eng', 8, 4, 1),
(37, 'topic math-topic', 'Exponenciális/logaritmus', 'eng', 8, 5, 1),
(38, 'topic math-topic', 'Százalékszámítás', 'eng', 8, 6, 1),
(39, 'topic math-topic', 'Egyenletek', 'eng', 8, 7, 1),
(40, 'topic math-topic', 'Alapfüggvények transzformációi', 'eng', 10, 1, 1),
(41, 'topic math-topic', 'Függvények jellemzése', 'eng', 10, 2, 1),
(42, 'topic math-topic', 'Sorozatok megadása', 'eng', 10, 3, 1),
(43, 'topic math-topic', 'Számtani sorozatok', 'eng', 10, 4, 1),
(44, 'topic math-topic', 'Mértani sorozatok', 'eng', 10, 5, 1),
(45, 'topic math-topic', 'Elemi geometria', 'eng', 11, 1, 1),
(46, 'topic math-topic', 'Geometriai transzformációk', 'eng', 11, 2, 1),
(47, 'topic math-topic', 'Trigonometria', 'eng', 11, 3, 1),
(48, 'topic math-topic', 'Vektorok', 'eng', 11, 4, 1),
(49, 'topic math-topic', 'Koordináta geometria', 'eng', 11, 5, 1),
(50, 'topic math-topic', 'Térgeometria', 'eng', 11, 6, 1),
(51, 'topic math-topic', 'Statisztika', 'eng', 12, 1, 1),
(52, 'topic math-topic', 'Valószínűségszámítás', 'Probability', 12, 2, 1),
(53, 'topic maturity-topic', 'Középszintű fizika érettségi', 'eng', 13, 1, 1),
(54, 'topic maturity-topic', 'Emeltszintű fizika érettségi', 'eng', 13, 2, 1),
(55, 'topic maturity-topic', 'Középszintű matematika érettségi', 'eng', 14, 1, 1),
(56, 'topic maturity-topic', 'Emeltszintű matematika érettségi', 'eng', 14, 2, 1),
(57, 'topic link-topic', 'Fizika linkek', 'eng', 15, 1, 1),
(58, 'topic link-topic', 'Matematika linkek', 'eng', 16, 2, 1),
(59, 'topic video-topic', 'Fizika videók', 'eng', 17, 1, 1),
(60, 'topic video-topic', 'Matematika videók', 'eng', 18, 1, 1),
(61, 'topic workshop-topic', 'A videókról', 'eng', 19, 1, 0),
(62, 'topic workshop-topic', 'Egyéb dokumentumok', 'eng', 19, 2, 0),
(63, 'topic workshop-topic', 'Az MB szertár célja', 'eng', 20, 1, 0),
(64, 'topic workshop-topic', 'A szertár fejlesztése', 'eng', 20, 2, 0),
(65, 'topic workshop-topic', 'Felhasználói támogatás', 'eng', 20, 3, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `topic_documents`
--

CREATE TABLE `topic_documents` (
  `topic_documents_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(11) NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `topic_documents`
--

INSERT INTO `topic_documents` (`topic_documents_id`, `topic_id`, `document_id`) VALUES
(1, 61, 85),
(2, 62, 85),
(3, 63, 85),
(4, 64, 85),
(5, 65, 85);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `topic_glossary`
--

CREATE TABLE `topic_glossary` (
  `topic_glossary_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `glossary_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `videos`
--

CREATE TABLE `videos` (
  `video_id` int(11) UNSIGNED NOT NULL,
  `video_title` varchar(255) NOT NULL,
  `curriculum_order` int(11) DEFAULT NULL,
  `youtube_id` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `duration_ms` int(11) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `playlist_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `videos`
--

INSERT INTO `videos` (`video_id`, `video_title`, `curriculum_order`, `youtube_id`, `description`, `published_date`, `duration_ms`, `thumbnail_url`, `playlist_id`, `created_at`, `updated_at`) VALUES
(1, 'A fizika világképe 29. rész A halmazállapotváltozások', 32, 'esVLW6MkOX0', 'A halmazállapot átmenetek áttekintése\nA víz fázisai a fázisdiagram alapján\nA víz olvadás- és forrráspontjának nyomásfüggése\nPárolgás\nSzárazjég\nSzublimáció\nRelatív páratartalom\nCsapadékok', '2025-10-03', 3072000, 'https://i.ytimg.com/vi/esVLW6MkOX0/hqdefault.jpg', NULL, '2025-12-09 11:30:55', '2025-12-16 11:27:12'),
(2, 'Logaritmus, Trigonometria, Statisztika ismétlés', NULL, 'S44RKA1dCc4', 'Válogatás a 2022-2025 (2020 NAT) érettségi feladatokból a 11. évfolyam tananyagát öszzefoglalva. Második rész.', '2025-09-26', 6559000, 'https://i.ytimg.com/vi/S44RKA1dCc4/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:53:49'),
(3, 'A fizika világképe 28. rész Kalorimetia', 31, 'ggzo12v9zfI', '(Ismert hiba: sajnos a kezdődiákon 27. rész felirat maradt)\nA hő mint fizikai mennyiség\nA hőközlés alaptípusai: hőáramlás, hősugárzás, hővezetés\nA hőszigetelő anyagok.\nA hőkapacitás, fajhő\nOlvadáshő, forráshő, párolgáshő, égéshő.', '2025-09-22', 4310000, 'https://i.ytimg.com/vi/ggzo12v9zfI/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:27:12'),
(4, 'A fizika világképe 27. rész A hőtágulás', 30, 'zY676r4beWc', 'A testek hőtágulásának elméleti és gyakorlati vonatkozásai.\nIsmert hiba: a 32. perc környékén a térfogat diagramon a \"sűrűség\" felirat szerepel. A sorozat befejezése után ki fogom javítani.', '2025-09-15', 3836000, 'https://i.ytimg.com/vi/zY676r4beWc/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:27:12'),
(5, 'Másodfokú függvény, másodfokú egyenlet, gyökös egyenlet, formális logika ismétlés', NULL, 'CsbEiYwvXdk', 'Válogatás a 2022-2025 (2020 NAT) érettségi feladatokból a 10. évfolyam tananyagának átismétlésére.', '2025-09-10', 4344000, 'https://i.ytimg.com/vi/CsbEiYwvXdk/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:53:51'),
(6, 'Halmazok, egyenletek, algebrai kifejezések ismétlés', NULL, 'D5dtgPLnzto', 'Válogatás a 2022-2025 (2020 NAT) érettségi feladatokból a 9. évfolyam tananyagát öszzefoglalva.', '2025-09-07', 3719000, 'https://i.ytimg.com/vi/D5dtgPLnzto/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:53:52'),
(7, 'Gráfok, Vektorok, Koordinátageometria ismétlés', NULL, '6zrX6Dnv6KY', 'Válogatás a 2022-2025 (2020 NAT) érettségi feladatokból a 11. évfolyam tananyagát öszzefoglalva. Első rész.', '2025-09-05', 4742000, 'https://i.ytimg.com/vi/6zrX6Dnv6KY/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:53:52'),
(8, 'A fizika világképe 26. rész A hőmérséklet', 29, 'HU00AsSpyI0', 'A hőmérséklet mérésének elméleti háttere.\nIsmert hiba: a 10 perc környékén a 0°F helyett 0°C van a dián. A sorozat elkészülése után ki fogom javítani.\nMilyen fizikai jelenségek segítségével mérhető a hőmérséklet: \n        Hőtágulás\n Elektromos ellenállás változása\n Termoelem\n Hőmérsékleti sugárzás\n Hőmérsékletre színeződő anyagok\n Olvadáspont', '2025-09-01', 2380000, 'https://i.ytimg.com/vi/HU00AsSpyI0/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:27:12'),
(9, 'A fizika világképe 22. rész A hang fizikai jellemzése', 25, 'Po3-U6jYatM', 'A hangokat (elsősorban a zenei hangokat) jellemző mennyiségek és minőségek kapcsolata: hangnyomás és hangosság, frekvencia és hangmagasság, felharmonikusok és a hangszín, burkológörbe és karakterisztika. \nA gitár felépítése, üveghangok.\nHang terjedés, hangszigetelés.\nHallásteszt: https://onlinetonegenerator.com/hearingtest.html', '2025-04-21', 4020000, 'https://i.ytimg.com/vi/Po3-U6jYatM/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:27:12'),
(10, 'A fizika világképe 52.rész A speciális relativitás elmélet', 55, 'ZoNVaidWo6I', 'Einstein 1905-ben megjelent speciális relativitáselméletének alapgondolatait és a fizika világképére gyakorolt hatását foglalom össze.', '2025-04-18', 4901000, 'https://i.ytimg.com/vi/ZoNVaidWo6I/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:31:44'),
(11, 'A fizika világképe 51. rész Az atommodellek (a Bohr- Sommerfeld modellig)', 54, 'HPszsb0UuhQ', 'A modern atommodell első formája az elemek kémiai tulajdonságait már jól magyarázó Bohr - Sommerfeld -féle modell volt. Ennek kialakulása a videó témája.', '2025-04-06', 3222000, 'https://i.ytimg.com/vi/HPszsb0UuhQ/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:31:44'),
(12, 'A fizika világképe 21/2. rész Hullám terjedése változó közegben', 24, 'tetpKz8G6bc', 'Ebben a részben:\nA hullámok elhajlása\nA hullámok törése\nA hullámok visszaverődése\nA teljes visszaverődés\nés az állóhullámok kialakulása szerepel.\nA videó első része: https://youtu.be/RFvCjrI6z2I', '2025-04-02', 3108000, 'https://i.ytimg.com/vi/tetpKz8G6bc/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:27:12'),
(13, 'A fizika világképe 21/1. rész Hullám terjedése homogén közegben', 23, 'RFvCjrI6z2I', 'Elsősorban mechanikai hullámokkal foglalkozó rész\nA hullámterjedés alapfogalmai, terjedés modellje, terjedési sebesség, hullámhossz.\nTranszverzális, longitudinális hullámok.\nHullám terjedése térben, síkban, lökéshullám, hullámfront, terjedés iránya.\nSzuperpozíció, interferencia. Két pontszerű hullámforrás interferenciaképe.\nDoppler-effektus, Mach kúp.\nAnimációk:\nhttps://www.vascak.cz/physicsanimations.php?l=hu \nhttps://www.falstad.com/ripple/', '2025-03-28', 4036000, 'https://i.ytimg.com/vi/RFvCjrI6z2I/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:27:12'),
(14, 'A fizika világképe 50. rész Optikai eszközök, A látás', 53, '1efa-RVyJwU', 'Nagyító, a szögnagyítás fogalma\nMikroszkóp\nTávcsövek: Kepler-, Galilei,- Newton-féle\nLeképezési hibák: Szférikus, kromatikus aberráció, kóma, torzítás, asztigmatizmus\nAz emberi szem optikai felépítése\nLátáshibák és korrigálásuk.\nAnimációk: https://www.vascak.cz/', '2025-03-26', 3146000, 'https://i.ytimg.com/vi/1efa-RVyJwU/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:31:44'),
(15, 'A fizika világképe 49. rész Az optikai képalkotás', 52, '5-7jomjEw0g', 'Az egyszerű optikai leképezések eszközei:\nsíktükör\nhomorú gömbtükör (forgási paraboloid)\ndomború gömbtükör\ngyűjtőlencse\nszórólencse\nSugármenetek, képalkotási esetek, gyakorlati felhasználás.\nAnimációk:\nhttps://www.vascak.cz/physicsanimations.php?l=hu', '2025-03-17', 3989000, 'https://i.ytimg.com/vi/5-7jomjEw0g/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:31:44'),
(16, 'A fizika világképe 20. rész A rezgések tulajdonságai', 22, 'xsWMAjowLa8', 'Csillapodó rezgések\nGerjesztett rezgés\nKényszerrezgés, rezonancia\nCsatolt rezgések\nRezgések párhuzamos és merőleges szuperpozíciója\nanimációk: https://www.vascak.cz/physicsanimations.php?l=hu', '2025-03-09', 2350000, 'https://i.ytimg.com/vi/xsWMAjowLa8/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:25:53'),
(17, 'A fizika világképe 48. rész A geometriai optikai modell', 51, 'lT0dIvdRE6U', 'A fény útjának geometriai optikai modellje\nfényerősség\nfény közeghatáron, törésmutató\nablak vagy tükör\nteljes visszaverődés\nszínszóródás: diszperzió\nprizma\nkép eltolódás jelenségek\n(A képalkotás, lencsék, tükrök a következő részben lesz!)', '2025-02-27', 2129000, 'https://i.ytimg.com/vi/lT0dIvdRE6U/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:30:30'),
(18, 'A fizika világképe 19. rész A harmonikus rezgőmozgás', 21, 'WPeCDnGybjM', 'A harmonikus rezgés mozgásfüggvényei az egyenletes körmozgás vetületéből:\nkitérés-idő\nsebesség-idő\ngyorsulás-idő függvény\nAnimációk: https://www.vascak.cz/\nA mozgásegyenlet és a rugó erőtörvény összevetése: a rugón rezgő test rezgésideje.\nA matemetikai inga lengésideje.', '2025-02-26', 2884000, 'https://i.ytimg.com/vi/WPeCDnGybjM/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:25:53'),
(19, 'A fizika világképe 47. rész A foton (a fény részecske természete)', 50, '52EMhal_s7o', 'Bemutatom a fény részecske modelljének kialakulásához vezető jelenségeket:\nA hőmérsékleti sugárzás\nA fotoeffektus\nA Compton szórás\nA napszél\nA gravitációs lencsehatás\nAnimációk: https://www.vascak.cz/', '2025-02-20', 2754000, 'https://i.ytimg.com/vi/52EMhal_s7o/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:30:30'),
(20, 'A fizika világképe 18/2. rész A kiterjedt test forgómozgása', 20, 'xs5FTky5wzc', 'Az egyenletes forgómozgás\nTehetetlenségi nyomaték\nPerdület (sajnos a giroszkóp nem fért bele, talán később....  de vannak fent jó videók:) https://www.youtube.com/watch?v=Sz-IGKjX_mI\nForgó vonatkoztatási rendszer: centripetális erő, Coriolis erő\nelső rész: https://youtu.be/YONGmHEbH8Q\nAnimációk: https://www.vascak.cz/', '2025-02-14', 3112000, 'https://i.ytimg.com/vi/xs5FTky5wzc/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:25:53'),
(21, 'A fizika világképe 18/1. rész  A kiterjedt merev test egyensúlya', 19, 'YONGmHEbH8Q', 'A forgatónyomaték\nMerev test egyensúlyának feltétele\nEmelő elv\nEgyensúlyi helyzetek\nmásodik rész: https://youtu.be/xs5FTky5wzc\nAnimációk: https://www.vascak.cz/\nIsmert hiba: A 22-25. percnél az egyoldalú emelőn a tengelyen ható erő helyesen felfelé mutatna, elnézést!', '2025-02-14', 2688000, 'https://i.ytimg.com/vi/YONGmHEbH8Q/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:25:53'),
(22, 'A fizika világképe 46. rész  A fény hullámtulajdonságai', 49, '0AtMvKM9IDk', 'A fény hullámtulajdonságait alátámasztó jelenségek:\n1. Fény terjedési sebesség egyezik az elektromágneses hulláméval\n2. Fény polarizálható: ez a transzverzális hullámra jellemző.\n3. Fény interferenciajelenségei\n4. A fényelhajlás jelensége\n5. A Rayleigh szóródás\n6. A fény Doppler effektusa\nAnimációk: https://www.vascak.cz/', '2025-02-10', 4432000, 'https://i.ytimg.com/vi/0AtMvKM9IDk/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:30:30'),
(23, 'A fizika világképe 17. rész A körmozgás dinamikája', 18, 'KQOP6gapOW8', 'A centripetális erő fogalma\nAz egyenletes körmozgás dinamika feltétele\nAlkalmazás néhány alapvető példában -ezúttal számolással\nTömegvonzás és körmozgás\nKepler-törvények\nGyorsuló körmozgás', '2025-02-07', 4395000, 'https://i.ytimg.com/vi/KQOP6gapOW8/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:25:53'),
(24, 'A fizika világképe 16. rész Az egyenletes kormozgas', 17, 'sOM8yGghKlw', 'A periodikus mozgás fogalmát, a körmozgást leíró fizikai mennyiségeket és az egyenletes körmozgás kinematikáját mutatom be.', '2025-02-06', 2916000, 'https://i.ytimg.com/vi/sOM8yGghKlw/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:25:53'),
(25, 'A fizika világképe 45. rész Színek, fényforrások', 48, 'osPy4uGMCHk', 'A videó első részében a látható fény színeiről, a színkeverésről lesz szó, a második részében a fénykibocsátás hátterében álló fizikai folyamatokról.', '2025-02-05', 3855000, 'https://i.ytimg.com/vi/osPy4uGMCHk/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:30:30'),
(26, 'A fizika világképe 44. rész Az elektromágneses hullámok spektruma', 47, 'TcRPHHDw3XQ', 'Bevezetés: röviden a hullámtejedésről általában\nAz elektromágneses hullámok frekvenciák szerinti kategóriái\nRádióhullám\nMikrohullám\nInfravörös\nLátható\nUV fény\nRöntgen sugárzás\nGamma sugárzás', '2025-02-03', 4919000, 'https://i.ytimg.com/vi/TcRPHHDw3XQ/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:30:30'),
(27, 'A fizika világképe 42. rész A váltóáram', 45, 'NQjJl95sb1c', 'A váltóáram termelése, szállítása, a háztartási hálózatok, és a tekercs illetve kondenzátor viselkedése váltóáramú körben a témája a videónak.', '2025-01-29', 4531000, 'https://i.ytimg.com/vi/NQjJl95sb1c/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:30:30'),
(28, 'A fizika világképe 43. rész A Maxwell egyenletek', 46, '5aWlXEdaGjE', 'Összefoglalom a Maxwell egyenleteket, (amennyire elemi matematika szintjén lehet) és az elektromágneses hullám keletkezését.', '2025-01-28', 2228000, 'https://i.ytimg.com/vi/5aWlXEdaGjE/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:30:30'),
(29, 'A fizika világképe 41. rész Elektromágneses indukció', 44, 'HXUDwm8B2gY', 'Az elektromágneses indukció jelensége:\n-mozgási indukció\n-nyugalmi indukció\n-örvényáramok\n-Lenz törvény\n-kölcsönös indukció\n-önindukció.', '2025-01-16', 3107000, 'https://i.ytimg.com/vi/HXUDwm8B2gY/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:29:24'),
(30, 'A fizika világképe 40. rész Sztatikus (időben állandó) mágneses tér', 43, '0YpAFmR795U', 'Mágneses tér szerkezete\nMágneses tér kialakulása\nAnyag mágneses tulajdonságai\nElektromágnes\nLorentz erő\nFöld, Nap mágneses tere', '2025-01-10', 3877000, 'https://i.ytimg.com/vi/0YpAFmR795U/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:29:24'),
(31, 'A fizika világképe 15/2. rész Ütközések (feladatok)', 16, 'CP88JN6u13U', 'Rugalmatlan ütközésekkel és szétlökésekkel kapcsolatos feladatok megoldása. Az elméleti rész a 15/1. videóban található.\nA \"Házi feladatokat\" persze nem kell beadni! :)', '2024-11-19', 2664000, 'https://i.ytimg.com/vi/CP88JN6u13U/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:25:53'),
(32, 'A fizika világképe 15/1. rész  Ütközések (elmélet)', 15, 'ChBv6-KjeUM', 'A rugalmatlan és rugalmas ütközések, szétlökések elméleti hátterét mutatja be ez a rész. Ennek a videónak a második részében lesznek majd a feladatok.', '2024-11-19', 2545000, '', NULL, '2025-12-09 11:30:56', '2025-12-16 11:18:31'),
(33, 'A fizika világképe 14. rész Pontrendszer dinamikája, A lendület fogalma', 14, 'U1-gLRThOIk', 'A lendületváltozás, erőlökés, lendület fogalmak bevezetése.\nLendületváltozások két test esetén.\nPontrendszer, tömegközéppont fogalma.\nNewton 1. 2. törvények megfogalmazása tömegpontok rendszerére.', '2024-11-18', 1652000, 'https://i.ytimg.com/vi/U1-gLRThOIk/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:18:31'),
(34, 'A fizika világképe 13. rész Munka, Energia', 13, 'TyZMH5Nnt6s', 'A munka mechanikai értelmezése\nEnergiafajták a mechanikában\nTeljesítmény\nMunkatétel, Energiamegmaradás tétel.\nEz a videó a 2020-as videómra épül. Lényegi változtatást nem tartalmaz.', '2024-11-17', 3651000, 'https://i.ytimg.com/vi/TyZMH5Nnt6s/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:18:30'),
(35, 'A fizika világképe 39. rész Elektromos ellenállás, Kapcsolások', 42, 'RbPKFN2Qopw', 'Állandó keresztmetszetű vezető ellenállása, fajlagos ellenállás, ellenállás hőmérsékletfüggése, elektrolitok ellenállása. Ellenállások soros és párhuzamos kapcsolása, feszültség- és áramerősségmérő műszerek bekötése áramkörbe.', '2024-11-17', 3497000, 'https://i.ytimg.com/vi/RbPKFN2Qopw/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:29:24'),
(36, 'A fizika világképe 38. rész Elektromos áram hatásai, Áram- és feszültségforrások', 41, 'smmTmFL-GIc', 'A videóban párba állítottam az elektromos áram hatásait azokkal a jelenségekkel amelyek segítségével áramforrás készíthető.', '2024-11-17', 2439000, 'https://i.ytimg.com/vi/smmTmFL-GIc/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:29:24'),
(37, 'A fizika világképe 37. rész Elektromos áram, egyenáram, Ohm-törvény', 40, 'WXi1j1ZcN8A', 'Az elektromos áram egyszerű modelljét, az egyenáram fogalmát, és Ohm törvényét ismerhetjük meg a videóból.', '2024-11-17', 1423000, 'https://i.ytimg.com/vi/WXi1j1ZcN8A/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:29:24'),
(38, 'A fizika világképe 36. rész Vezetők elektromos térben', 39, 'qO7UGEHGGDU', 'A videó egy összefoglalóval kezdődik, az elektromos tér leírásának lehetőségeiről, majd bemutatom az elektrosztatikusan töltött, vagy sztatikus  elektromos térbe helyezett vezető testek jellemzőit. Ennek alapján szóba kerülnek a \"csúcshatás\", Faraday-kalitka, és az elektrosztatikus árnyékolás jelenségek is. A videó második részében a kondenzátorokról lesz szó, ezen belül a síkkondenzátor kapacitását és a feltöltött kondenzátor energiáját vezetem le. Az ehhez szükséges Gauss-tétel is elhangzik, amely az elektromos tér forrásait írja le, és mint ilyen J.C. Maxwell egyik elektrodinamikai egyenletének egyszerűsített formája.', '2024-10-01', 3275000, 'https://i.ytimg.com/vi/qO7UGEHGGDU/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:29:24'),
(39, 'A fizika világképe 35. rész Az elektromos (elektrosztatikus) tér', 38, '967OyZ-m_XM', 'Az elektromos (elektrosztatikus) kölcsönhatás jellemzése a Coulomb törvényen túl: az elektromos térerősséggel, az elektromos fluxussal, az erővonalakkal és az elektomos potenciállal. Az elektromos potenciál különbségeként bevezetem a feszültség fogalmát is.', '2024-09-29', 2578000, 'https://i.ytimg.com/vi/967OyZ-m_XM/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:28:20'),
(40, 'A fizika világképe 12. rész A tapadási erő, a gördülési ellenállás, közegellenállás', 12, '0o8H80a1psU', 'A mechanika legfontosabb erőtövényeit bemutató harmadik videóban a címben is szereplő három erő hatásról van szó: a tapadási súrlódási erőről, a gördülési ellenállásról és a közegellenállási erőről.', '2024-09-28', 2441000, 'https://i.ytimg.com/vi/0o8H80a1psU/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:18:30'),
(41, 'A fizika világképe 11. rész A rugalmas erő, A csúszási súrlódás', 11, 'PWG3BTPma0U', 'Két erőtörvényt mutatok be a videóban, a hosszmenti rugalmas alakváltozás lineáris erőtörvényét és a csúszási súrlódási erőt.', '2024-09-27', 2217000, 'https://i.ytimg.com/vi/PWG3BTPma0U/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:18:30'),
(42, 'A fizika világképe 10. rész A tömegvonzási erő és a súly erő', 10, 'KuRhNLrteQ4', 'Ebben a részben a tömegvonzás Newton-féle erőtörvényét mutatom be, szó lesz továbbá néhány kényszererőről,  és a videó második felében a testek súlyának és a rendszer gyorsulásának viszonyát vizsgáljuk meg,  különböző módon gyorsuló rendszerekben. A videó elég hosszú, de még így sem fért bele minden...', '2024-09-27', 3726000, 'https://i.ytimg.com/vi/KuRhNLrteQ4/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:18:30'),
(43, 'A fizika világképe 9. rész Newton törvényei', 9, 'LMvyK0ymS84', 'A videóban a pontszerű testek mechanikáját megalapozó  Newton törvényeket mutatom be. A fizika logikájába többféle felépítés is belefér, én a törvényeknek nem az eredeti, lendületváltozással megfogalmazott változatát, hanem az erő fogalmát használó megfogalmazást mutatom be. \nEz a videó az elméleti alapjául szolgál a következő fejezeteknek.', '2024-09-26', 2442000, 'https://i.ytimg.com/vi/LMvyK0ymS84/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:31:44'),
(44, 'A fizika világképe 34. rész Az elektrosztatika alapjai', 37, 'p8WmjLg-3Pk', 'Az alapvető elektrosztatikai jelenségek megértéséhez szükséges modell leírása. Dörzselektromosség, megosztás, Coulomb-törvény.\nA videó mellett célszerű kísérleteket is megnézni esetleg otthon kipróbálni.', '2024-09-25', 2784000, 'https://i.ytimg.com/vi/p8WmjLg-3Pk/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:28:20'),
(45, 'A fizika világképe 33. rész Hőerőgépek, A hőtan 2. főtétele', 36, 'wZT5ULbOfJo', 'A körfolyamatok, a hatásfok,  a gőzgép , Otto- és Diesel motorok bemutatása, és a 2. főtétel intuitív leírása fért bele a 45 percbe.', '2024-09-24', 2864000, 'https://i.ytimg.com/vi/wZT5ULbOfJo/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:28:20'),
(46, 'A fizika világképe 32.rész A hőtan 1. főtétele', 25, 'xc50RgayzJk', 'A hőtani folyamatok (izobár, izocor, izoterm, adiabatikus) bemutatása a termodinamika 1. főtételének tükrében. A Robert Mayer egyenlet és a részecskemodell sikere.', '2024-09-23', 2664000, 'https://i.ytimg.com/vi/xc50RgayzJk/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:28:20'),
(47, 'Háromszögek hasonlósága, feladatok', NULL, 'tKa4Dvh-GQ8', 'A háromszögek hasonlósága összefoglaló feladatsor megoldása', '2024-09-23', 991000, 'https://i.ytimg.com/vi/tKa4Dvh-GQ8/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:17'),
(48, 'Gráfelméleti feladatok', NULL, 'LL5eYXFwoXY', 'Néhány gráfelméleti érettségi példa megoldása', '2024-09-23', 1358000, 'https://i.ytimg.com/vi/LL5eYXFwoXY/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:17'),
(49, 'Mértani sorozat első n elem összege: feladatok', NULL, '9HMN5p_769c', 'Mértani sorokra vonatkozó érettségi feladatok', '2024-09-23', 2414000, 'https://i.ytimg.com/vi/9HMN5p_769c/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:18'),
(50, 'Mértani sorozat alapfeladatok', NULL, 'm2QopEbLMSs', 'az érettségi feladatok alaptípusainak bemutatása', '2024-09-23', 2641000, 'https://i.ytimg.com/vi/m2QopEbLMSs/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:18'),
(51, 'Koordináta geometria gyakorló feladatsor.', NULL, 'wG0Mq5PCmeY', 'Érettségi feladatok, főleg kör egyenlete és vektorok \nFigyelem:jóval több, mint a 2020-as NAT. De azért használható.', '2024-09-23', 3611000, 'https://i.ytimg.com/vi/wG0Mq5PCmeY/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:19'),
(52, 'Egyenes egyenlete gyakorló feladatsor', NULL, 'uq2ZiHP058o', 'Sajnos ez nem a 2020-as NAT alapján készült, ott már a skaláris szorzat emelt szint. Szerintem még mindig ez a legjobb az egyenes egyenletére.', '2024-09-23', 911000, 'https://i.ytimg.com/vi/uq2ZiHP058o/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:20'),
(53, 'A fizika világképe 8. rész A mozgás grafikonjai', 8, 'ccRZ_Oez4XU', 'A pontszerű test mozgásának hely-idő, út-idő és sebesség -idő grafikonjai segítségével jutunk el képletekhez, számolunk ki feladatokat. Nem csak szemléltető eszköz a grafikon, hanem hatékony feladatmegoldő eszköz. Ha megtanuljuk a mozgás grafikonjait elemezni, akkor más folyamatok grafikonjaiból is könnyebben tudunk következtetéseket levonni.', '2024-09-23', 3868000, 'https://i.ytimg.com/vi/ccRZ_Oez4XU/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:31:44'),
(54, 'A fizika világképe 7. rész Mozgások körülöttünk', 7, 'g58fO8mLkoE', 'Néhány mindennapi életből vett mozgáson keresztül áttekintjem a mozgások típusait.', '2024-09-18', 1647000, 'https://i.ytimg.com/vi/g58fO8mLkoE/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:31:44'),
(55, 'A fizika világképe 6. rész A változó mozgás', 6, 'M5zRton31bk', 'A mozgás nem fizikai mennyiség, a mozgás változása a sebességvektor változását jelenti, a sebesség már fizikai mennyiség. A sebesség vektor változása ennek a videónak a témája.', '2024-09-18', 1880000, 'https://i.ytimg.com/vi/M5zRton31bk/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:31:44'),
(56, 'A fizika világképe 5. rész Egyenletes mozgás, EVEM', 5, 'c4BMZ0HXxKg', 'Az egyenletes mozgás, az átlagsebesség, az egyenes vonalú egyenletes mozgás (EVEM) kerül bemutatásra. Ennek kapcsán a hely-idő és út-idő függvények grafikonjának tulajdonságai és a kapcsolatuk a sebesség-idő grafikonnal. Ezekkel a grafikonokkal a sorozat 8. részében részletesen foglalkozom majd, és a képleteket is abban részben vezetem majd le.', '2024-09-17', 2399000, 'https://i.ytimg.com/vi/c4BMZ0HXxKg/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:31:44'),
(57, 'A fizika világképe 31. rész Kinetikus modell', 34, 'DjzpkfXHWOg', 'A gáz állapotváltozóinak értelmezése a kinetikus gázelméletben, azaz a részecskemodellben. Szabadsági fok fogalma. Ekvipartíció. Az eredmény a gázok belső energiájának értelmezése.\nAki nem bírja a levezetéseket nyugodtan ugorja át a 11:15-29:00 közötti részt. Azért, aki érettségizni szeretne, próbálja végigkövetni! :)', '2024-09-16', 2460000, 'https://i.ytimg.com/vi/DjzpkfXHWOg/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:28:20'),
(58, 'A fizika világképe 4. rész  A mozgas', 4, '4ODcEzVD3cM', 'Mit jelent a mozgás a fizikában? Milyen fizikai meghatározások, mennyiségek szerepelnek a testek mozgásának leírásában?', '2024-09-16', 2176000, 'https://i.ytimg.com/vi/4ODcEzVD3cM/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:29:24'),
(59, 'A fizika világképe 30. rész Gázok állapotváltozásai', 33, '7m29Fo9Zy00', 'A rövid anyagszerkezeti ismétlés után a gázok állapotváltozóit és az állapotváltozókat összekapcsoló állaptoegyenletet mutatom be.', '2024-09-12', 2691000, 'https://i.ytimg.com/vi/7m29Fo9Zy00/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:28:20'),
(60, 'A fizika világképe 3.rész Az anyag modellje', 3, 'ZqSft3t-nZw', 'A videó első felében az anyag egyszerűsített részecskemodelljét mutatom be a három fő halmazállapot tulajdonságai mentén.\nA második felében a Standard Modell bemutatása látható.', '2024-09-12', 2072000, 'https://i.ytimg.com/vi/ZqSft3t-nZw/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:28:20'),
(61, 'A fizika világképe 1. rész Bevezetés a modellalkotásba', 1, 'FrLDe4tGXFw', 'Az érettségi tananyagát feldolgozó videósorozat bevezető része, nem csak érettségizőknek.\nEz a rész a fizika modell alkotó szemléletét mutatja be.\nA 11. dián található ábra a Proxima Centauri-t hibásan galaxisként említi. A Proxima Centauri (latin proxima: legközelebbi) vörös törpe csillag. A Földtől 4,24 fényév (4·1013 km) távolságra helyezkedik el.', '2024-09-11', 1730000, 'https://i.ytimg.com/vi/FrLDe4tGXFw/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-16 11:18:30'),
(62, '10. évfolyam fizika 1. videó  2020. 03. 20.', NULL, 'pMmVHTI_zwo', 'Elektrosztatika tesztek ellenőrzése 0.-19. kérdés', '2023-05-02', 837000, 'https://i.ytimg.com/vi/pMmVHTI_zwo/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:26'),
(63, '9. évfolyam fizika 1. videó 2020. 03. 21.', NULL, 't7KBJgBy7yo', 'A házi feladat körmozgás tesztek első sorozatának megoldása', '2023-05-02', 1176000, 'https://i.ytimg.com/vi/t7KBJgBy7yo/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:26'),
(64, '10. évfolyam fizika 3. videó 2020. 04. 02.', NULL, 'MZeZqm4FopU', 'Az elektrosztatika ellenőrző kérdések (2. fizika feladatlap) válaszai', '2023-05-02', 1347000, 'https://i.ytimg.com/vi/MZeZqm4FopU/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:27'),
(65, 'Hullámtan, hangtan összefoglalás', NULL, 'VwhekFJ-N8A', 'Nem a teljes tananyag, inkább emlékeztető az összefoglaló kérdések mentén', '2023-05-02', 4960000, 'https://i.ytimg.com/vi/VwhekFJ-N8A/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:28'),
(66, 'Hullámtan gyakorló teszt', NULL, 'GsqTl2PQH80', 'A tesztfeladatok megoldása magyarázatokkal', '2023-05-02', 1867000, 'https://i.ytimg.com/vi/GsqTl2PQH80/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:28'),
(67, 'Dinamika gyakorló tesz', NULL, 'elAjFpzkNOE', 'Középszintű érettségi tesztek megoldása magyarázatokkal, dinamika témakörében.', '2023-05-02', 2640000, 'https://i.ytimg.com/vi/elAjFpzkNOE/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:29'),
(68, 'Munka, energia, teljesítmény tesztek megoldása', NULL, '-DV1QpiXDqw', 'Érettség jellegű tesztek megoldása a címben szereplő témakörből. Az elméleti videó  https://youtu.be/xIpebzn-wF8  kiegészítése.', '2023-05-02', 4028000, 'https://i.ytimg.com/vi/-DV1QpiXDqw/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:29'),
(69, 'Egyenes illesztése grafikonra Microsoft Excel segítségével', NULL, 'vmts0muAStw', 'Egyenes arányos mennyiségek mérési adatainak ábrázolása és (origón átmenő) egyenes illesztése, a meredekség leolvasása a  Microsoft Excel segítségével.', '2020-10-13', 446000, 'https://i.ytimg.com/vi/vmts0muAStw/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:30'),
(70, 'Útmutató a Tracker videóelemző 5.1.5 verziójához', NULL, 'N0PpSw7pqls', 'Az alapvető videóelemzési lépések ismertetése. Az útmutatóban szereplő verzió a https://physlets.org/tracker/ helyről tölthető le.', '2020-10-01', 623000, 'https://i.ytimg.com/vi/N0PpSw7pqls/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:31'),
(71, 'Pitagorasz tétel alkalmazása: alapvető feladatok', NULL, 'GMdhkXU2pCI', 'A pitagorasz tétel használata a középszintű érettségi feladatokban.', '2020-05-31', 1885000, 'https://i.ytimg.com/vi/GMdhkXU2pCI/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:31'),
(72, 'Munka, energia értelmezése a mechanikában (elmélet)', NULL, 'xIpebzn-wF8', 'Ez a videó elméleti összefoglalás, a későbbiekben kiegészítem példa feladatokkal is.\n9. évfolyam fizika 9. videó 2020. 05. 29.', '2020-05-29', 3605000, 'https://i.ytimg.com/vi/xIpebzn-wF8/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:32'),
(73, 'Vektorok alapműveletei, felbontása', NULL, 'uzo1QQ6jPrk', 'Ezt kell tudni a vektorokról a 2020-as NAT szerint a középszintű érettségire.\nA skaláris szorzás már emelt szintű tananyag lett.....', '2020-05-24', 4205000, 'https://i.ytimg.com/vi/uzo1QQ6jPrk/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:33'),
(74, 'Az elektromos ellenállás', NULL, '15NkZtv3zuw', 'Vezetők, elektrolitok, félvezetők fajlagos ellenállása,  ellenállások kapcsolása \n10. évfolyam  fizika 6. videó', '2020-05-08', 2734000, 'https://i.ytimg.com/vi/15NkZtv3zuw/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:33'),
(75, 'Pontrendszer dinamikája, Newton törvényei pontrendszerekre, tömegközéppont', NULL, 'tabDXn0uTXM', 'Elméleti tananyag videókkal, szimulációkkal. Feladatok ebben a videóban nincsenek.\n9. évfolyam 8. videó 2020. 05. 06.', '2020-05-08', 1574000, 'https://i.ytimg.com/vi/tabDXn0uTXM/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:34'),
(76, 'További két feladat: szétlökés, rugalmatlan ütközés', NULL, '7Pltb86iZ78', '9. évfolyam 7. videó, a 2020. 04. 29-i házi feladatok megoldása', '2020-05-06', 278000, 'https://i.ytimg.com/vi/7Pltb86iZ78/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:34'),
(77, 'Szögek átváltása radián és fok között, ívperc és tizedfok között', NULL, 'C_17VYgNTYc', 'Rövid magyarázattal, csak az átváltásról. Segítség a trigonometriához és a fizikában a körmozgás, rezgések megértéséhez.', '2020-05-04', 950000, 'https://i.ytimg.com/vi/C_17VYgNTYc/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:35'),
(78, 'Rugalmatlan ütközés, szétlökés, lendületmegmaradás, néhány további feladat.', NULL, 'PmECBbT1Ey8', '9. évfolyam  fizika 6. videó', '2020-04-29', 872000, 'https://i.ytimg.com/vi/PmECBbT1Ey8/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:36'),
(79, 'Hegyesszög szögfüggvényeinek alkalmazása.', NULL, 'ox6D5JeuF_8', 'Háromszög területe szinusz függvénnyel, emelkedési, depresszió szög.\nKözépszintű érettségi jellegű feladatok megoldása.', '2020-04-28', 1345000, 'https://i.ytimg.com/vi/ox6D5JeuF_8/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:36'),
(80, 'Az elektromos áram hatásai, áram- és feszültségforrások', NULL, 'wbFMIN5AMYw', 'Kémiai-, mágneses-, piezo-, termoelektromos-, élettani hatás, fotoeffektus, dörzselektromosság.\n10. évfolyam 5. fizika videója', '2020-04-28', 2402000, 'https://i.ytimg.com/vi/wbFMIN5AMYw/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:37'),
(81, '11. évfolyam fizika 1. videó 2020. 03. 20.', NULL, 'yTp7eDYStVU', 'Az atommag nukleonjait összetartó kölcsönhatás', '2020-04-26', 1962000, 'https://i.ytimg.com/vi/yTp7eDYStVU/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:37'),
(82, '9. nyelvi előkészítő matematika 3. videó 2020. 03. 26.', NULL, 'ntE_UdPTeC8', 'Betűkifejezéses egyenletek, házi feladat ellenőrzése', '2020-04-26', 975000, 'https://i.ytimg.com/vi/ntE_UdPTeC8/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:38'),
(83, 'Hegyesszög szögfüggvényei, alapfeladatok', NULL, 'M-LnW_8s5ps', 'Háromszögek, sokszögek oldalainak, szögeinek meghatározása szögfüggvényekkel.\nKözépszintű érettségi jellegű feladatok.', '2020-04-23', 1306000, 'https://i.ytimg.com/vi/M-LnW_8s5ps/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:39'),
(84, 'Egyszerű feladatok lendületmegmaradásra 2', NULL, '-XdnTN1BDU4', 'Az előző videó folytatása, rugalmatlan ütközéses és szétlökéses feladatok megoldásával.', '2020-04-23', 1533000, 'https://i.ytimg.com/vi/-XdnTN1BDU4/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:39'),
(85, 'Atomenergia, atomreaktor', NULL, '96UiqILKKDQ', 'A nukleáris energiáról, ezen belül a hasadás energiájának felhasználásáról.\n11. évfolyam 03. videó', '2020-04-22', 2248000, 'https://i.ytimg.com/vi/96UiqILKKDQ/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:40'),
(86, 'Hegyesszög szögfüggvényei, bevezetés, az alapok', NULL, 'LtIDCBgBm4o', 'Elméleti alapok: a szögfüggvények bemutatása a derékszögű háromszögekben.\nKözépszintű érettségi tananyag.', '2020-04-20', 1059000, 'https://i.ytimg.com/vi/LtIDCBgBm4o/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:40'),
(87, 'Lendület fogalma, lendületváltozás, rugalmatlan ütközés, szétlökés', NULL, 'ESMgTi-iFv8', 'Lendület fogalma, bevezető előadás, alapfeladatok\n9. évfolyam fizika', '2020-04-20', 1287000, 'https://i.ytimg.com/vi/ESMgTi-iFv8/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:41'),
(88, 'Körmozgás fizika érettségi tesztek', NULL, 'AMwsWLmWNig', 'A 2. körmozgásos feladatlap tesztjeinek megoldása\n9. évfolyam fizika 2. videó 2020. 03. 26.', '2020-04-15', 945000, 'https://i.ytimg.com/vi/AMwsWLmWNig/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:42'),
(89, 'Tömegvonzás és körmozgás', NULL, 'KAnuUw9QF4k', 'A tömegvonzás hatására egyenletes körmozgást végző testekről\n9. évfolyam fizika 3. videó 2020. 03. 27.', '2020-04-15', 1552000, 'https://i.ytimg.com/vi/KAnuUw9QF4k/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:42'),
(90, 'Háromszögek hasonlóságának alkalmazása, magasságtétel, Thalesz tétel', NULL, 'rwI6MhEc3DQ', 'Háromszögek hasonlósága\nThalész tétel', '2020-04-14', 1025000, 'https://i.ytimg.com/vi/rwI6MhEc3DQ/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:43'),
(91, 'Háromszögek hasonlóságának alkalmazása, magasságtétéel', NULL, 'fE3_3Z-8R-M', 'Hasonlóság alkalmazása, magasságtétel alkalmazása feladatokban.\nKözépszintű érettségi jellegű feladatok', '2020-04-14', 1475000, 'https://i.ytimg.com/vi/fE3_3Z-8R-M/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:43'),
(92, 'Feladatok háromszögek hasonlóságának alkalmazására', NULL, '42fdFWPxU6w', 'Néhány középszintű érettségi jellegű feladat.', '2020-04-14', 956000, 'https://i.ytimg.com/vi/42fdFWPxU6w/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:44'),
(93, 'Mi tartja össze az atommagot? Erős kölcsönhatás.', NULL, 'Mtxy6QrkXRo', 'Az atommag részecskéit összetartó kölcsönhatás:erős kölcsönhatás rövid jellemzése.\nA videó bevezető része üzenet tanítványaimnak, nem a tananyag része.\n11. évfolyam fizika 1. videó csinosított változat 2020. 03. 21.', '2020-04-14', 2041000, 'https://i.ytimg.com/vi/Mtxy6QrkXRo/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:45'),
(94, 'Abszolút értékes egyenletek', NULL, 'osK1_skhJPo', 'Egy abszolút értéket tartalmazó egyenletek (középszintű érettségi tananyag). Két abszolút értéket tartalmazó egyenlet (Emelt szintű érettségi tananyag).', '2020-04-14', 1178000, 'https://i.ytimg.com/vi/osK1_skhJPo/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:45'),
(95, 'A radioaktivitásról a teljesség igénye nélkül, röviden', NULL, '4mWhObSx0DI', 'Milyen folyamatok eredménye a radioaktivitás, mi ennek az oka, milyen sugárzások jönnek létre, mi jellemzi ezeket a sugárzásokat.\n11. évfolyam 2. videó 2020. 04. 02.', '2020-04-14', 1749000, 'https://i.ytimg.com/vi/4mWhObSx0DI/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:46'),
(96, 'Egyenáram fogalma, Ohm törvény', NULL, 'TqcY3lnM0Zg', 'Az elektromos áram fogalma, az áramerősség fizikai mennyiség, az egyenáram fizikai mennyiség, és az Ohm törvény\n10. évfolyam 4. videó 2020. 04. 14.', '2020-04-14', 840000, 'https://i.ytimg.com/vi/TqcY3lnM0Zg/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:46'),
(97, 'A videók eléréséről', NULL, 'tVu4CL4h7_k', 'A Youtube csatornámon található videók elérési módjáról', '2020-03-21', 54000, 'https://i.ytimg.com/vi/tVu4CL4h7_k/hqdefault.jpg', NULL, '2025-12-09 11:30:56', '2025-12-12 10:54:47');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `fk_branches_category` (`category_id`);

--
-- A tábla indexei `category_bar`
--
ALTER TABLE `category_bar`
  ADD PRIMARY KEY (`category_id`);

--
-- A tábla indexei `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- A tábla indexei `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`);

--
-- A tábla indexei `documents_videos`
--
ALTER TABLE `documents_videos`
  ADD PRIMARY KEY (`documents_videos_id`),
  ADD UNIQUE KEY `uq_document_video` (`document_id`,`video_id`),
  ADD KEY `idx_sd_document` (`document_id`),
  ADD KEY `idx_sd_video` (`video_id`);

--
-- A tábla indexei `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- A tábla indexei `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`label_id`);

--
-- A tábla indexei `glossary`
--
ALTER TABLE `glossary`
  ADD PRIMARY KEY (`glossary_id`);

--
-- A tábla indexei `header_menu`
--
ALTER TABLE `header_menu`
  ADD PRIMARY KEY (`header_menu_id`);

--
-- A tábla indexei `subtopics`
--
ALTER TABLE `subtopics`
  ADD PRIMARY KEY (`subtopic_id`),
  ADD KEY `fk_subtopics_topics` (`topic_id`);

--
-- A tábla indexei `subtopic_documents`
--
ALTER TABLE `subtopic_documents`
  ADD PRIMARY KEY (`subtopic_document_id`),
  ADD UNIQUE KEY `uq_subtopic_document` (`subtopic_id`,`document_id`),
  ADD KEY `idx_sd_subtopic` (`subtopic_id`),
  ADD KEY `idx_sd_document` (`document_id`);

--
-- A tábla indexei `subtopic_videos`
--
ALTER TABLE `subtopic_videos`
  ADD PRIMARY KEY (`subtopic_videos_id`),
  ADD UNIQUE KEY `uq_subtopic_video` (`subtopic_id`,`video_id`),
  ADD KEY `idx_sd_subtopic` (`subtopic_id`),
  ADD KEY `idx_sd_video` (`video_id`);

--
-- A tábla indexei `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `fk_topics_branches` (`branch_id`);

--
-- A tábla indexei `topic_documents`
--
ALTER TABLE `topic_documents`
  ADD PRIMARY KEY (`topic_documents_id`),
  ADD UNIQUE KEY `uq_topic_documents` (`topic_id`,`document_id`),
  ADD KEY `idx_sd_topic` (`topic_id`),
  ADD KEY `idx_sd_document` (`document_id`);

--
-- A tábla indexei `topic_glossary`
--
ALTER TABLE `topic_glossary`
  ADD PRIMARY KEY (`topic_glossary_id`),
  ADD UNIQUE KEY `uq_topic_glossary` (`topic_id`,`glossary_id`),
  ADD KEY `glossary_id` (`glossary_id`);

--
-- A tábla indexei `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`video_id`),
  ADD UNIQUE KEY `youtube_id` (`youtube_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `category_bar`
--
ALTER TABLE `category_bar`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT a táblához `documents_videos`
--
ALTER TABLE `documents_videos`
  MODIFY `documents_videos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT a táblához `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `forms`
--
ALTER TABLE `forms`
  MODIFY `label_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `glossary`
--
ALTER TABLE `glossary`
  MODIFY `glossary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT a táblához `header_menu`
--
ALTER TABLE `header_menu`
  MODIFY `header_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `subtopics`
--
ALTER TABLE `subtopics`
  MODIFY `subtopic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT a táblához `subtopic_documents`
--
ALTER TABLE `subtopic_documents`
  MODIFY `subtopic_document_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT a táblához `subtopic_videos`
--
ALTER TABLE `subtopic_videos`
  MODIFY `subtopic_videos_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT a táblához `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT a táblához `topic_documents`
--
ALTER TABLE `topic_documents`
  MODIFY `topic_documents_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `topic_glossary`
--
ALTER TABLE `topic_glossary`
  MODIFY `topic_glossary_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `videos`
--
ALTER TABLE `videos`
  MODIFY `video_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `fk_branches_category` FOREIGN KEY (`category_id`) REFERENCES `category_bar` (`category_id`);

--
-- Megkötések a táblához `documents_videos`
--
ALTER TABLE `documents_videos`
  ADD CONSTRAINT `fk_sd_document2` FOREIGN KEY (`document_id`) REFERENCES `documents` (`document_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sd_video2` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `subtopics`
--
ALTER TABLE `subtopics`
  ADD CONSTRAINT `fk_subtopics_topics` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `subtopic_documents`
--
ALTER TABLE `subtopic_documents`
  ADD CONSTRAINT `fk_sd_document` FOREIGN KEY (`document_id`) REFERENCES `documents` (`document_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sd_subtopic` FOREIGN KEY (`subtopic_id`) REFERENCES `subtopics` (`subtopic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `subtopic_videos`
--
ALTER TABLE `subtopic_videos`
  ADD CONSTRAINT `fk_sd_subtopic2` FOREIGN KEY (`subtopic_id`) REFERENCES `subtopics` (`subtopic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sd_video` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `fk_topics_branches` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `topic_documents`
--
ALTER TABLE `topic_documents`
  ADD CONSTRAINT `fk_sd_document3` FOREIGN KEY (`document_id`) REFERENCES `documents` (`document_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sd_topic2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `topic_glossary`
--
ALTER TABLE `topic_glossary`
  ADD CONSTRAINT `topic_glossary_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`),
  ADD CONSTRAINT `topic_glossary_ibfk_2` FOREIGN KEY (`glossary_id`) REFERENCES `glossary` (`glossary_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

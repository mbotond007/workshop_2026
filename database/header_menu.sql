-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Jan 01. 17:43
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
-- Tábla szerkezet ehhez a táblához `header_menu`
--

CREATE TABLE `header_menu` (
  `header_menu_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `header_class` varchar(50) NOT NULL,
  `header_div_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `is_ready` tinyint(1) NOT NULL,
  `menu_type` varchar(10) NOT NULL,
  `header_name_hu` varchar(200) NOT NULL,
  `header_name_en` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `header_menu`
--

INSERT INTO `header_menu` (`header_menu_id`, `sort_order`, `header_class`, `header_div_id`, `action`, `is_ready`, `menu_type`, `header_name_hu`, `header_name_en`) VALUES
(1, 1, 'site-header__logo', 'site-header__logo', 'go-home', 1, 'general', 'logo2.svg', 'laboratory_en.jpg'),
(2, 2, 'site-header__search', 'site-header__search', 'open-search', 1, 'general', 'Téma kereső', 'Search topic'),
(3, 3, 'site-map_button header-button', 'site-map_button', 'open-sitemap', 1, 'general', 'Oldal felfedezése', 'Site-map'),
(4, 4, 'contact_button header-button', 'contact-button', 'open-contact', 0, 'general', 'Kapcsolat', 'Contact'),
(5, 5, 'logout_button header-button', 'logout-button', 'logout', 0, 'inside', 'Kilépés', 'Logout'),
(6, 6, 'login-button header-button', 'login-button', 'open-login', 0, 'outside', 'Belépés', 'Login'),
(7, 7, 'reg-button header-button', 'reg-button', 'open-register', 0, 'outside', 'Regisztrálok', 'Registry');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `header_menu`
--
ALTER TABLE `header_menu`
  ADD PRIMARY KEY (`header_menu_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `header_menu`
--
ALTER TABLE `header_menu`
  MODIFY `header_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 15, 2024 at 07:23 AM
-- Server version: 10.6.18-MariaDB
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lunaente_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `deletedAccounts`
--

CREATE TABLE `deletedAccounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `deletedAccounts`
--

INSERT INTO `deletedAccounts` (`id`, `user_id`, `name`, `email`, `password`, `deleted_at`) VALUES
(1, 4361, 0, 'anas80@gmail.com', 'e118217b59f9df25447a6042e1282a69', '2023-01-16 08:47:53'),
(2, 4361, 0, '', '', '2023-01-16 08:48:14'),
(3, 4361, 0, '', '', '2023-01-16 08:48:20'),
(4, 4361, 0, '', '', '2023-01-16 08:48:57'),
(5, 4357, 0, 'mustafaghouri22@gmail.com', '202cb962ac59075b964b07152d234b70', '2023-01-16 08:49:24'),
(6, 4364, 0, 'haris@gmail.com', 'c0ba88b8bca79ca3b50b96abdf431766', '2023-01-16 08:51:26'),
(7, 4366, 0, '', '', '2023-01-16 08:52:24'),
(8, 4356, 0, 'akhtarrashid71@gmail.com', '123', '2023-01-16 08:53:26'),
(9, 4373, 0, 'jessicachavez765@gmail.com', '68eacb97d86f0c4621fa2b0e17cabd8c', '2023-01-16 08:54:13'),
(10, 4389, 0, 'anas@gmail.com', 'e118217b59f9df25447a6042e1282a69', '2023-01-16 08:54:18'),
(11, 181187, 0, '', '', '2023-01-16 09:01:17'),
(12, 4373, 0, '', '', '2023-01-16 09:21:12'),
(13, 4373, 0, '', '', '2023-01-16 09:40:35'),
(14, 4373, 0, '', '', '2023-01-16 09:40:36'),
(15, 4373, 0, '', '', '2023-01-16 09:40:38'),
(16, 4373, 0, '', '', '2023-01-16 09:40:39'),
(17, 4373, 0, '', '', '2023-01-16 09:40:43'),
(18, 4373, 0, '', '', '2023-01-16 14:14:06'),
(19, 4390, 0, 'anas@gmail.com', 'e118217b59f9df25447a6042e1282a69', '2023-01-18 07:16:32'),
(20, 4391, 0, 'anas@gmail.com', 'e118217b59f9df25447a6042e1282a69', '2023-02-02 13:50:57'),
(21, 4398, 0, 'alishba@gmail.com', '202cb962ac59075b964b07152d234b70', '2023-02-09 07:03:30');

-- --------------------------------------------------------

--
-- Table structure for table `form_images`
--

CREATE TABLE `form_images` (
  `id` int(11) NOT NULL,
  `images` varchar(225) NOT NULL,
  `form_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `form_images`
--

INSERT INTO `form_images` (`id`, `images`, `form_id`) VALUES
(13, '16112022114423OutputFile_1668599058601.jpeg', 45),
(14, '16112022114423OutputFile_1668599058643.jpeg', 45),
(15, '16112022114423OutputFile_1668599058671.jpeg', 45),
(16, '16112022114423OutputFile_1668599058700.jpeg', 45),
(137, '14122022075929OutputFile_1671004764329.jpeg', 112),
(138, '14122022075929OutputFile_1671004764394.jpeg', 112),
(139, '14122022075929OutputFile_1671004764420.jpeg', 112),
(140, '14122022075929OutputFile_1671004764437.jpeg', 112),
(141, '14122022075929OutputFile_1671004764452.jpeg', 112),
(142, '14122022075929OutputFile_1671004764469.jpeg', 112),
(143, '14122022075929OutputFile_1671004764755.jpeg', 112),
(144, '14122022075929OutputFile_1671004764786.jpeg', 112),
(177, '01032024175302IMG_2344.HEIC', 121),
(178, '01032024175302IMG_2356.HEIC', 121),
(179, '01032024175302IMG_2353.HEIC', 121),
(180, '01032024175302IMG_2339.HEIC', 121),
(185, '21052024141714OutputFile_1716301030976.jpeg', 126),
(186, '21052024141714OutputFile_1716301031012.jpeg', 126),
(187, '21052024141714OutputFile_1716301031029.jpeg', 126),
(188, '21052024141714OutputFile_1716301031047.jpeg', 126),
(189, '21052024143732OutputFile_1716302249180.jpeg', 127),
(190, '21052024143732OutputFile_1716302249202.jpeg', 127),
(191, '21052024143732OutputFile_1716302249219.jpeg', 127),
(192, '21052024143732OutputFile_1716302249239.jpeg', 127),
(213, '14062024110556image_picker_B3FA14F0-5FA4-4348-A3AB-DD019BB67896-23715-0000004DA89F5219.png', 146),
(214, '14062024110556image_picker_9476A569-9D4D-4A7B-BC45-AD668D4FF4D1-23715-0000004DA87A20F9.png', 146),
(215, '14062024110556image_picker_2F130190-6651-4560-A047-2CA12A6D8397-23715-0000004DA8A59BD6.jpg', 146),
(216, '14062024110556image_picker_62C62A8A-BA41-480A-8A94-53389C5017F6-23715-0000004DA8A4908D.jpg', 146);

-- --------------------------------------------------------

--
-- Table structure for table `house_details`
--

CREATE TABLE `house_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `detailType` varchar(20) NOT NULL,
  `ownerName` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `bedrooms` varchar(50) NOT NULL,
  `bathrooms` varchar(50) NOT NULL,
  `areaSize` varchar(50) NOT NULL,
  `stories` varchar(50) NOT NULL,
  `squarefootage` varchar(50) NOT NULL,
  `location` varchar(200) NOT NULL,
  `propertyUnit` varchar(50) NOT NULL,
  `assiteNewHome` varchar(50) NOT NULL,
  `backedTaxowed` varchar(50) NOT NULL,
  `basement` varchar(50) NOT NULL,
  `dryer` varchar(50) NOT NULL,
  `existingMorgage` varchar(50) NOT NULL,
  `foundation` varchar(50) NOT NULL,
  `gasUtilityavail` varchar(50) NOT NULL,
  `helpmorgage` varchar(50) NOT NULL,
  `isProp` varchar(50) NOT NULL,
  `lockbox` varchar(50) NOT NULL,
  `lop` varchar(50) NOT NULL,
  `newHome` varchar(50) NOT NULL,
  `owfinance` varchar(50) NOT NULL,
  `userRange` varchar(50) NOT NULL,
  `sewer` varchar(50) NOT NULL,
  `survery` varchar(50) NOT NULL,
  `washer` varchar(50) NOT NULL,
  `waterOn` varchar(50) NOT NULL,
  `lopExplain` varchar(50) NOT NULL,
  `lockboxPlace` varchar(255) NOT NULL,
  `payMethod` varchar(50) NOT NULL,
  `rating` varchar(50) NOT NULL,
  `taxAmount` varchar(50) NOT NULL,
  `timeFrame` varchar(50) NOT NULL,
  `fastcash` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `house_details`
--

INSERT INTO `house_details` (`id`, `user_id`, `detailType`, `ownerName`, `phone`, `date`, `title`, `bedrooms`, `bathrooms`, `areaSize`, `stories`, `squarefootage`, `location`, `propertyUnit`, `assiteNewHome`, `backedTaxowed`, `basement`, `dryer`, `existingMorgage`, `foundation`, `gasUtilityavail`, `helpmorgage`, `isProp`, `lockbox`, `lop`, `newHome`, `owfinance`, `userRange`, `sewer`, `survery`, `washer`, `waterOn`, `lopExplain`, `lockboxPlace`, `payMethod`, `rating`, `taxAmount`, `timeFrame`, `fastcash`) VALUES
(45, 4360, '0', 'Anas', '09551255', '16th - Nov - 2022', 'Beautiful house', '5', '2', '200', '2', ' 8000', 'unknown street', '', 'true', '', '', 'true', 'true', '', '', '', '', '', '', '', '', 'true', '', '', '', 'false', '', '', '', '', '', '', ''),
(48, 4366, '0', 'New User', '03026294646', '14th - Nov - 2022', 'My house', '2', '2', '2500', '2', '', 'my house ', '', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'true', 'true', '', '', '', '', '', '', ''),
(53, 4366, '0', 'New User', '03026294646', '14th - Nov - 2022', 'My house', '2', '2', '2500', '2', '', 'my house ', '', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'true', 'true', '', '', '', '', '', '', ''),
(58, 4366, '0', 'New User', '03026294646', '14th - Nov - 2022', 'My house', '2', '2', '2500', '2', '', 'my house ', '', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'true', 'true', '', '', '', '', '', '', ''),
(63, 4366, '0', 'New User', '03026294646', '14th - Nov - 2022', 'My house', '2', '2', '2500', '2', '', 'my house ', '', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'true', 'true', '', '', '', '', '', '', ''),
(68, 4366, '0', 'New User', '03026294646', '14th - Nov - 2022', 'My house', '2', '2', '2500', '2', '', 'my house ', '', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'true', 'true', '', '', '', '', '', '', ''),
(73, 4366, '0', 'New User', '03026294646', '14th - Nov - 2022', 'My house', '2', '2', '2500', '2', '', 'my house ', '', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'true', 'true', '', '', '', '', '', '', ''),
(78, 4366, '0', 'New User', '03026294646', '14th - Nov - 2022', 'My house', '2', '2', '2500', '2', '', 'my house ', '', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'true', 'true', '', '', '', '', '', '', ''),
(112, 4370, '3', 'Anas', '03026248410', '14th - Dec - 2022', 'My villa', '2', '2', '2', '2', '800', 'Istiklal Street', '', 'true', 'true', 'true', 'false', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'I don&#039;t know ', 'In Bedroom', 'autoget', '4.0', '25', '16', 'true'),
(121, 4395, '0', 'Sharon agent ', '9729044779', '23rd - Jun - 2023', 'distressed house', '3', '1', '7274', '1', '1572', '1630 Bayside st, Dallas Tx 75212', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(122, 4404, '0', 'Raymundo ', '3', '14th - Jul - 2023', 'mas o menos ', '3', '2', '1127', '3', '4', '699 N 7000 w Rd ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(124, 4407, '0', 'Robert and Samantha Carter', '9362075658', '28th - Oct - 2023', 'our house ', '', '', '', '', '', '160 8th Street', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(126, 4414, '1', 'jh', '468654', '21st - May - 2024', 'vshdg', '66', '99', '9', '99', 'vvh', 'hshhd', '', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', '', '', 'autoget', '0.0', '', '', 'none'),
(127, 4414, '1', 'jh', '468654', '21st - May - 2024', 'vshdg', '66', '99', '99', '99', 'nk', 'hshhd', '', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', '', '', 'autoget', '0.0', '', '', 'none'),
(128, 4414, '0', 'Anas', '2131231231', '24th - May - 2024', 'Anum Blessing', '', '', '', '', '', 'Malir', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(129, 4414, '0', 'fidsaifoas', '5345235235', '1st - Jun - 2024', 'fdasfasdfasdf', '', '', '', '', '', 'asdfasdfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(134, 4416, '0', 'anas', '12321', '14th - Jun - 2024', 'Anum BB', '', '', '', '', '', 'baloch colony', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(146, 4414, '3', 'Anas Ayub', '3010221312', '14th - Jun - 2024', 'Anum Blessings', '4', '4', '120', '1', '1250', 'Baloch Colony PECHS', '', 'true', 'true', 'true', 'true', 'false', 'true', 'false', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'false', 'false', 'No', '', 'autoget', '4.0', '1200', '12', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'user'),
(3, 'expert');

-- --------------------------------------------------------

--
-- Table structure for table `seo`
--

CREATE TABLE `seo` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `page_link` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  `descc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seo`
--

INSERT INTO `seo` (`id`, `title`, `page_link`, `tag`, `descc`) VALUES
(1, 'Home', 'index', '', 'PCFET0NUWVBFIGh0bWw+XFxyXFxuPGh0bWw+XFxyXFxuPGhlYWQ+XFxyXFxuPC9oZWFkPlxcclxcbjxib2R5Pg0KDQo8L2JvZHk+XFxyXFxuPC9odG1sPg=='),
(6, 'About', 'about', '', ''),
(8, 'Blog', 'blogs', '', ''),
(9, 'Blog Detail', 'blog-details', '', ''),
(10, 'Contact', 'contact', '', 'PCFET0NUWVBFIGh0bWw+XHJcbjxodG1sPlxyXG48aGVhZD5cclxuPC9oZWFkPlxyXG48Ym9keT4NCg0KPC9ib2R5PlxyXG48L2h0bWw+'),
(12, 'Mentor', 'mentor', '', 'bWVudG9y'),
(13, 'About', 'about', '', 'PCFET0NUWVBFIGh0bWw+DQo8aHRtbD4NCjxoZWFkPg0KPC9oZWFkPg0KPGJvZHk+DQo8cD5BYm91dDwvcD4NCjwvYm9keT4NCjwvaHRtbD4=');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `website_name` varchar(255) NOT NULL,
  `website_email` varchar(255) NOT NULL,
  `website_favicon` varchar(255) NOT NULL,
  `website_logo` varchar(255) NOT NULL,
  `website_phone` varchar(50) NOT NULL,
  `website_address` text NOT NULL,
  `fb_link` varchar(255) NOT NULL,
  `ins_link` varchar(255) NOT NULL,
  `twitter_link` varchar(255) NOT NULL,
  `linkedin_link` varchar(255) NOT NULL,
  `youtube_link` varchar(255) NOT NULL,
  `pinterest_link` varchar(255) NOT NULL,
  `whatsapp_number` varchar(50) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `website_name`, `website_email`, `website_favicon`, `website_logo`, `website_phone`, `website_address`, `fb_link`, `ins_link`, `twitter_link`, `linkedin_link`, `youtube_link`, `pinterest_link`, `whatsapp_number`, `url`) VALUES
(1, 'Luna Enterprises', 'Lunaenterprises.jl@gmail.com', '111020221418106500664-min-min.png', 'logo.png', '8175011462', 'PK', 'https://www.facebook.com/Abs.shipping.and.Logistics', '', '', '', '', 'https://pinterest.com/', '+923329008884', 'https://abs.xiomstudio.com/');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(222) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(222) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `code` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `profile` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `phone`, `adress`, `country`, `role_id`, `code`, `status`, `profile`) VALUES
(1, 'Johnny Luna', 'Lunaenterprises.jl@gmail.com', '', '0f0ba563d92b71f831ca508d9a82d690', '8175011462', '', 'Pakistan', 1, '816014', 1, '13032023013634image_picker7905809975070290579.jpg'),
(3, 'Muhammad moiz', 'mohammad786moiz@gmail.com', 'M.Moiz', '1234', '23323232', 'Moin a bad Malir', 'Pakistan', 3, '0', 1, ''),
(4372, 'Johnny luna', 'donny.jluna@gmail.com', '', '482c811da5d5b4bc6d497ffa98491e38', '8175011462', NULL, NULL, 3, '', 1, 'default.png'),
(4374, 'jack ', 'jsuegeiwiw@gmail.com', '', '66cb87e4e66a825d10cf4227e0e82eee', '46900000000', NULL, NULL, 3, '', 1, 'default.png'),
(4377, 'sam smith', 'samsmoth@gmail.com', '', '36a5b0a699c1ec8bd66aeca744915faa', '2146789087', NULL, NULL, 3, '', 1, 'default.png'),
(4378, 'sam smith', 'stephanie@gmail.com', '', 'b41cb62ec6767f2e41f9df7a2d161515', '2146780963', NULL, NULL, 3, '', 1, 'default.png'),
(4380, 'Laura', 'laus1523@gmail.com', '', 'b25fb57dea6f023399dbf761b5f25937', '8177690259', NULL, NULL, 3, '561676', 1, 'default.png'),
(4381, 'Johana Garcia', 'johana.b4391@gmail.com', '', '25e4094426ccd96dc360c986626c3734', '6825616378', NULL, NULL, 3, '', 1, 'default.png'),
(4383, 'j luna', 'jonny@gmail.com', '', '202cb962ac59075b964b07152d234b70', '111111', NULL, NULL, 3, '', 1, 'default.png'),
(4384, 'New', 'new@gmail.com', '', 'e118217b59f9df25447a6042e1282a69', '030165965', NULL, NULL, 3, '', 1, 'default.png'),
(4385, 'zyta', 'kosciukzyta@gmail.com', '', 'ebf8459b2ff6fab0a28ed5f22033aec4', '123', NULL, NULL, 3, '338382', 1, 'default.png'),
(4386, 'Myriam ', 'myriamugc@gmail.com', '', 'f2dc4bc3929b36d013905c1af09619c3', '12', NULL, NULL, 3, '', 1, 'default.png'),
(4387, 'z', 'czarnyorzeszek@tlen.pl', '', 'f3abb86bd34cf4d52698f14c0da1dc60', '55', NULL, NULL, 3, '248037', 1, 'default.png'),
(4388, 'zyta', 'kosciukzyta@o2.pl', '', '320b5a1e14a9937bc5fc8912f4fc6c23', '555', NULL, NULL, 3, '', 1, 'default.png'),
(4392, 'Anas', 'anas80@gmail.com', '', 'e118217b59f9df25447a6042e1282a69', '03064664', NULL, NULL, 3, '', 1, 'default.png'),
(4393, 'Paul', 'paul@thursday-evening.com', '', 'fd54f7133784f1940ac3c9205fbfaf04', '9723752201', NULL, NULL, 3, '', 1, '07022023224208image_picker_4338E522-DC1D-4DBE-9988-F8D70671318E-3400-000001801DA1123A.jpg'),
(4394, 'Chayanun sriluksana ', 'tom@thursday-evening.com', '', 'ae06a7916eca000de400e9320a539574', '4696882329', NULL, NULL, 3, '', 1, 'default.png'),
(4395, 'Abraham Lozano', 'Abraham.lunaenterprises@gmail.com', '', '1822d05551a63b98dfc363f0bfa550e7', '4698598639', NULL, NULL, 3, '', 1, '07022023230820image_picker_05F1C863-522F-43DD-9BB8-87B3B4ADDC6E-401-000000044594B019.png'),
(4396, 'Minha Kweon', 'minhakweon@gmail.com', '', 'a633aa942fb1950961dc7e7872e3010a', '8167267318', NULL, NULL, 3, '', 1, 'default.png'),
(4399, 'Minha Kweon', 'minha.lunaenterprises@gmail.com', '', '1ca4e22cbd14f66584d9deb0a558cd36', '8167267318', NULL, NULL, 3, '', 1, 'default.png'),
(4400, 'David Dobbs', 'cyaholdings@gmail.com', '', 'e02cc83f3b38ba484f84898e6c28a975', '7065107071', NULL, NULL, 3, '', 1, 'default.png'),
(4401, 'Stephanie Ruiz', 'stephanie.lunaenterprises@gmail.com', '', '08e06912fdaa85ad76bc1e7c90f7123e', '2146736180', NULL, NULL, 3, '', 1, 'default.png'),
(4402, 'Julio Martinez ', 'jrm28820@gmail.com', '', '4ebd56e2477b17367b19f9813478283b', '8138099072', NULL, NULL, 3, '', 1, 'default.png'),
(4403, 'Kevin Caldwell', 'caldwellk32@gmail.com', '', '84c0b5c133e15d50813851b8e28834b4', '9045059065', NULL, NULL, 3, '', 1, 'default.png'),
(4404, 'yesy', 'bandida9131@hotmail.com', '', '4e4047cd2e0e6688eccaea88264f91eb', '3317035388', NULL, NULL, 3, '', 1, 'default.png'),
(4405, 'AnasAyub', 'm.anasayub80@gmail.com', '', 'e118217b59f9df25447a6042e1282a69', '03026248430', NULL, NULL, 3, '393329', 1, 'default.png'),
(4406, 'Jabarren Hansell ', 'FanFirxt@outlook.com', '', 'f054719d68fcc128112c3950825a5569', '9045870925', NULL, NULL, 3, '', 1, 'default.png'),
(4407, 'Jason Carter', 'dallas_4ever@yahoo.com', '', '235e39accd347c4360ac683b872d5bad', '9362075658', NULL, NULL, 3, '', 1, 'default.png'),
(4408, 'Eric L Jones Jr ', 'kjngsmurfblue@gmail.com', '', 'a7462bc96d69f39d0bfe585f8123da27', '8169082469', NULL, NULL, 3, '', 1, 'default.png'),
(4409, 'YungMfSmurf ', 'Kingsmurfblue@gmail.com', '', 'a7462bc96d69f39d0bfe585f8123da27', '18169082469', NULL, NULL, 3, '', 1, 'default.png'),
(4410, 'ali jawad', 'jawadsubhan7@gmail.com', '', '7411b3a7cac02ada5ee4694420322cd3', '03010824703', NULL, NULL, 3, '', 1, 'default.png'),
(4411, 'yasir azam ', 'azamyasira@gmail.com', '', '90505313d0991c7b55695c74100d56fd', '270695', NULL, NULL, 3, '', 1, 'default.png'),
(4412, 'Carolyn ', 'milan6929@gmail.com', '', 'b47ec599c695eaa30ce95369742190af', '8572498185', NULL, NULL, 3, '', 1, 'default.png'),
(4413, 'Esam Onela George ', 'gesam675@gmail.com', '', '85ced5d7ea6b2a20ec3249cc94f8d317', '0684349242', NULL, NULL, 3, '', 1, 'default.png'),
(4414, 'anas', 'anas@gmail.com', '', '81dc9bdb52d04dc20036dbd8313ed055', '12312312', NULL, NULL, 3, '', 1, '130620241221201000000018.jpg'),
(4416, 'Admin', 'admin@gmail.com', '', '81dc9bdb52d04dc20036dbd8313ed055', '1232131', NULL, NULL, 2, '', 1, '150620240654401000000018.jpg'),
(4417, 'Ali', 'm@m.com', '', '25d55ad283aa400af464c76d713c07ad', '25698022', NULL, NULL, 3, '', 1, 'default.png'),
(4418, 'alijawad', 'dsafas@email.com', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4419, 'sadf', 'asdf', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4420, 'sadf', 'adf', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4421, 'lojo', 'iuhi', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4422, 'lojo', 'asdfsafas', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4423, 'dfasf', 'saf', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4424, 'dfasf', 'sa1f', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4425, 'dfasf', 's11f', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4426, 'dfasf', 's11', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4427, 'asdfas', 'saf@email.com', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4428, 'dsfa', 'asdfa@email.com', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4429, 'dsfa', 'afsd@email.ocm', '', '202cb962ac59075b964b07152d234b70', '1231', NULL, NULL, 3, '', 1, 'default.png'),
(4430, 'asdfas', 'asf', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4431, 'dsab', 'dsaf', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4432, 'fasd', 'sadf@email.com', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4433, 'sad', 'asdfa', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4434, 'asf', 'asfsa', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4435, 'asdfasa', 'dfas', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png'),
(4436, 'ASFASDF', 'ASDFs', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deletedAccounts`
--
ALTER TABLE `deletedAccounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_images`
--
ALTER TABLE `form_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `house_details`
--
ALTER TABLE `house_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deletedAccounts`
--
ALTER TABLE `deletedAccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `form_images`
--
ALTER TABLE `form_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `house_details`
--
ALTER TABLE `house_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4437;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

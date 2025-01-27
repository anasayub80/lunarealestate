-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 27, 2025 at 11:10 AM
-- Server version: 10.6.20-MariaDB
-- PHP Version: 8.3.15

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
(21, 4398, 0, 'alishba@gmail.com', '202cb962ac59075b964b07152d234b70', '2023-02-09 07:03:30'),
(22, 4395, 0, 'Abraham.lunaenterprises@gmail.com', '1822d05551a63b98dfc363f0bfa550e7', '2024-08-29 19:31:41');

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
(185, '21052024141714OutputFile_1716301030976.jpeg', 126),
(186, '21052024141714OutputFile_1716301031012.jpeg', 126),
(187, '21052024141714OutputFile_1716301031029.jpeg', 126),
(188, '21052024141714OutputFile_1716301031047.jpeg', 126),
(213, '14062024110556image_picker_B3FA14F0-5FA4-4348-A3AB-DD019BB67896-23715-0000004DA89F5219.png', 146),
(214, '14062024110556image_picker_9476A569-9D4D-4A7B-BC45-AD668D4FF4D1-23715-0000004DA87A20F9.png', 146),
(215, '14062024110556image_picker_2F130190-6651-4560-A047-2CA12A6D8397-23715-0000004DA8A59BD6.jpg', 146),
(216, '14062024110556image_picker_62C62A8A-BA41-480A-8A94-53389C5017F6-23715-0000004DA8A4908D.jpg', 146),
(233, '29082024194355IMG_3774.HEIC', 149),
(234, '29082024194355FullSizeRender.jpg', 149),
(235, '29082024194355FullSizeRender.jpg', 149),
(236, '29082024194355FullSizeRender.jpg', 149),
(237, '29082024194355FullSizeRender.jpg', 149),
(238, '29082024194355FullSizeRender.jpg', 149),
(239, '29082024194355IMG_3693.PNG', 149),
(240, '29082024194355IMG_3694.PNG', 149),
(252, '30082024060358OutputFile_1724997830134.jpeg', 0),
(253, '30082024060358OutputFile_1724997830150.jpeg', 0),
(254, '30082024060358OutputFile_1724997830164.jpeg', 0),
(255, '30082024060359OutputFile_1724997830178.jpeg', 0),
(256, '30082024060359OutputFile_1724997830191.jpeg', 0),
(257, '30082024060359OutputFile_1724997830201.jpeg', 0),
(258, '30082024060359OutputFile_1724997830214.jpeg', 0),
(259, '30082024060359OutputFile_1724997830228.jpeg', 0),
(260, '30082024060359OutputFile_1724997830240.jpeg', 0),
(261, '30082024060400OutputFile_1724997830248.jpeg', 0),
(262, '30082024060400OutputFile_1724997830255.jpeg', 0),
(267, '180920240958011000011443.jpg', 151),
(268, '180920240958011000011442.jpg', 151),
(269, '180920240958011000011441.jpg', 151),
(270, '180920240958011000011571.jpg', 151),
(271, '180920240958011000011570.jpg', 151),
(272, '180920240958011000011444.jpg', 151),
(277, '180920242140061000011652.jpg', 153),
(278, '180920242140061000011641.jpg', 153),
(279, '180920242140061000011651.jpg', 153),
(280, '180920242140061000011628.jpg', 153),
(281, '180920242140061000011638.jpg', 153),
(282, '180920242140061000011627.jpg', 153),
(283, '180920242140061000011635.jpg', 153),
(284, '180920242140061000011643.jpg', 153),
(285, '180920242140061000011620.jpg', 153),
(286, '260920241317251000000020.jpg', 155),
(287, '260920241317251000000021.png', 155),
(288, '260920241317251000000022.jpg', 155),
(289, '260920241317251000000024.jpg', 155),
(290, '260920241317251000000025.jpg', 155),
(291, '260920241317261000000020.jpg', 155),
(292, '260920241317261000000021.png', 155),
(293, '260920241317261000000022.jpg', 155),
(294, '260920241317261000000024.jpg', 155),
(295, '260920241317261000000025.jpg', 155),
(296, '270920241441231000000020.jpg', 157),
(297, '270920241441231000000021.png', 157),
(298, '270920241441231000000022.jpg', 157),
(299, '270920241441231000000024.jpg', 157),
(300, '270920241441231000000025.jpg', 157),
(301, '270920241441231000000020.jpg', 157),
(302, '270920241441231000000021.png', 157),
(303, '270920241441231000000022.jpg', 157),
(304, '270920241441231000000024.jpg', 157),
(305, '270920241441231000000025.jpg', 157),
(306, '270920241519301000000020.jpg', 177),
(307, '270920241519301000000021.png', 177),
(308, '270920241519301000000022.jpg', 177),
(309, '270920241519301000000024.jpg', 177),
(310, '270920241519301000000025.jpg', 177),
(311, '270920241519301000000020.jpg', 177),
(312, '270920241519301000000021.png', 177),
(313, '270920241519301000000022.jpg', 177),
(314, '270920241519301000000024.jpg', 177),
(315, '270920241519301000000025.jpg', 177),
(316, '270920241521431000000020.jpg', 178),
(317, '270920241521431000000021.png', 178),
(318, '270920241521431000000022.jpg', 178),
(319, '270920241521431000000024.jpg', 178),
(320, '270920241521431000000025.jpg', 178),
(321, '270920241521431000000020.jpg', 178),
(322, '270920241521431000000021.png', 178),
(323, '270920241521431000000022.jpg', 178),
(324, '270920241521431000000024.jpg', 178),
(325, '270920241521431000000025.jpg', 178),
(326, '280920240735161000000020.jpg', 183),
(327, '280920240735161000000021.png', 183),
(328, '280920240735161000000022.jpg', 183),
(329, '280920240735161000000024.jpg', 183),
(330, '280920240735161000000025.jpg', 183),
(331, '280920240735161000000020.jpg', 183),
(332, '280920240735161000000021.png', 183),
(333, '280920240735161000000022.jpg', 183),
(334, '280920240735161000000024.jpg', 183),
(335, '280920240735161000000025.jpg', 183),
(346, '031020241232251000000022.jpg', 185),
(347, '031020241232251000000025.jpg', 185),
(348, '031020241232251000000020.jpg', 185),
(349, '031020241232251000000021.png', 185),
(350, '031020241232251000000022.jpg', 185),
(351, '031020241232251000000024.jpg', 185),
(352, '031020241232251000000025.jpg', 185),
(353, '031020241232251000000020.jpg', 185),
(354, '031020241232251000000021.png', 185),
(355, '031020241232251000000022.jpg', 185),
(356, '031020241232251000000024.jpg', 185);

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
(122, 4404, '0', 'Raymundo ', '3', '14th - Jul - 2023', 'mas o menos ', '3', '2', '1127', '3', '4', '699 N 7000 w Rd ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(126, 4414, '1', 'jh', '468654', '21st - May - 2024', 'vshdg', '66', '99', '9', '99', 'vvh', 'hshhd', '', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', '', '', 'autoget', '0.0', '', '', 'none'),
(128, 4414, '0', 'Anas', '2131231231', '24th - May - 2024', 'Anum Blessing', '', '', '', '', '', 'Malir', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(129, 4414, '0', 'fidsaifoas', '5345235235', '1st - Jun - 2024', 'fdasfasdfasdf', '', '', '', '', '', 'asdfasdfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(146, 4414, '3', 'Anas Ayub', '3010221312', '14th - Jun - 2024', 'Anum Blessings', '4', '4', '120', '1', '1250', 'Baloch Colony PECHS', '', 'true', 'true', 'true', 'true', 'false', 'true', 'false', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'false', 'false', 'No', '', 'autoget', '4.0', '1200', '12', 'true'),
(149, 4454, '1', 'a ', '4698598639', '29th - Aug - 2024', 'distressed ', '2', '3', '5', '2', '545455', '123 hu&iacute; ave dalla ', '', 'true', 'true', 'false', 'true', 'true', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true', 'true', 'false', 'true', 'true', 'true', '', '', 'autoget', '3.0', '', '', 'true'),
(151, 4405, '1', 'browser', '8189991234', '18th - Sep - 2024', 'single family ', '3', '2', '9200', '3', '1700', '8200 merrit rd Rowlett ', '', 'true', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', '', '', 'autoget', '2.0', '', '60', 'false'),
(153, 4405, '0', 'browser', '8189991234', '18th - Sep - 2024', 'single family ', '1', '1', '1', '1', '1', '8200 merrit rd Rowlett ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(154, 4405, '0', 'Anas', '123', '19th - Sep - 2024', 'Anas', '1', '1', '1', '1', '123', 'shah faisal', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(155, 4405, '1', 'Anas', '123', '26th - Sep - 2024', 'Anas', '1', '1', '1', '1', '123', 'shah faisal', '', 'none', 'none', 'none', 'false', 'false', 'none', 'false', 'none', 'none', 'none', 'none', 'none', 'none', 'false', 'true', 'false', 'false', 'false', '', '', 'autoget', '4.0', '', '1', 'true'),
(156, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'shah faisal', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(157, 4405, '1', 'Anas', '123', '27th - Sep - 2024', 'Anas', '4', '3', '1', '3', '42', 'shah faisal', '', 'none', 'none', 'none', 'none', 'true', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'true', 'true', 'true', '', '', 'autoget', '4.0', '', '1', 'true'),
(158, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'shah faisal', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(159, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(160, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(161, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(162, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(163, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(164, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(165, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(166, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(167, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(168, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(169, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(170, 4405, '0', 'Anas', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(171, 4405, '0', 'Anasa', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(172, 4405, '0', 'Anasa', '123', '27th - Sep - 2024', 'Anas', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(173, 4405, '0', 'Anasa', '123', '27th - Sep - 2024', 'Anasaa', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(174, 4405, '0', 'Anasa', '123', '27th - Sep - 2024', 'Anasaa', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(175, 4405, '0', 'Anasa', '123', '27th - Sep - 2024', 'Anasaa', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(176, 4405, '1', 'Anasa', '123', '27th - Sep - 2024', 'Anasaa', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'autoget', '0.0', '', '1', 'none'),
(177, 4405, '1', 'Anasa', '123', '27th - Sep - 2024', 'Anasaa', '213', '1234', '21', '1234', '2134142', 'fasdfasfasdf', '', 'none', 'none', 'none', 'none', 'true', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'false', 'true', 'true', '', '', 'autoget', '0.0', '', '1', 'true'),
(178, 4405, '0', 'Anasa', '123', '27th - Sep - 2024', 'Anasaa', '213', '1234', '21', '1234', '2134142', 'fasdfasfasdf', '', 'none', 'none', 'none', 'none', 'true', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'false', 'true', 'true', '', '', '', '', '', '', ''),
(179, 4405, '0', 'Anasa', '123', '27th - Sep - 2024', 'Anasaa', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(181, 4405, '0', 'Anasa', '123', '28th - Sep - 2024', 'Anasaa', '', '', '', '', '', 'fasdfasfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(183, 4405, '1', 'ANas', '132312132', '28th - Sep - 2024', 'Anum blessings', '2', '2', '2', '2', '1231', 'asdasda das das', '', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', '', '', 'autoget', '0.0', '', '1', 'none'),
(185, 4405, '1', 'awdsa', '123123', '3rd - Oct - 2024', 'asdas', '21312', '12312', '12321', '123', '3123', 'asda sdasd as', '', 'none', 'none', 'none', 'none', 'false', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'false', 'false', '', '', 'autoget', '0.0', '', '1', 'none'),
(186, 4405, '1', 'awdsa', '123123', '4th - Oct - 2024', 'asdas', '', '', '', '', '', 'asda sdasd as', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'autoget', '0.0', '', '1', 'none');

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
-- Table structure for table `survey_answers`
--

CREATE TABLE `survey_answers` (
  `id` int(11) NOT NULL,
  `survey_question_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `selectedAnswer` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `survey_answers`
--

INSERT INTO `survey_answers` (`id`, `survey_question_id`, `answer`, `selectedAnswer`) VALUES
(1, 1, 'Yes', 0),
(2, 1, 'No', 0),
(3, 2, 'Yes', 0),
(4, 2, 'No', 0),
(5, 3, 'Yes', 0),
(6, 3, 'No', 0),
(7, 4, 'Yes', 0),
(8, 4, 'No', 0),
(9, 5, 'Yes', 0),
(10, 5, 'No', 0),
(11, 6, 'Yes', 0),
(12, 6, 'No', 0),
(13, 7, 'Yes', 0),
(14, 7, 'No', 0),
(15, 8, 'Yes', 0),
(16, 8, 'No', 0),
(17, 9, 'Yes', 0),
(18, 9, 'No', 0),
(19, 10, 'Yes', 0),
(20, 10, 'No', 0),
(21, 11, 'Yes', 0),
(22, 11, 'No', 0),
(23, 12, 'Yes', 0),
(24, 12, 'No', 0),
(25, 13, 'Yes', 0),
(26, 13, 'No', 0),
(27, 14, 'Yes', 0),
(28, 14, 'No', 0),
(29, 15, 'Yes', 0),
(30, 15, 'No', 0),
(31, 16, 'Yes', 0),
(32, 16, 'No', 0),
(33, 17, 'Yes', 0),
(34, 17, 'No', 0),
(35, 18, 'Yes', 0),
(36, 18, 'No', 0),
(37, 19, 'Yes', 0),
(38, 19, 'No', 0),
(39, 20, 'Yes', 0),
(40, 20, 'No', 0),
(41, 21, 'Yes', 0),
(42, 21, 'No', 0),
(43, 22, 'Yes', 0),
(44, 22, 'No', 0),
(45, 23, 'Yes', 0),
(46, 23, 'No', 0),
(47, 24, 'Yes', 0),
(48, 24, 'No', 0),
(49, 25, 'Yes', 0),
(50, 25, 'No', 0),
(51, 26, 'Yes', 0),
(52, 26, 'No', 0),
(53, 27, 'Yes', 0),
(54, 27, 'No', 0),
(55, 28, 'Yes', 0),
(56, 28, 'No', 0),
(57, 29, 'Yes', 0),
(58, 29, 'No', 0),
(59, 30, 'Yes', 0),
(60, 30, 'No', 0),
(61, 31, 'Yes', 0),
(62, 31, 'No', 0),
(63, 32, 'Yes', 0),
(64, 32, 'No', 0),
(65, 33, 'Yes', 0),
(66, 33, 'No', 0),
(67, 34, 'Yes', 0),
(68, 34, 'No', 0),
(69, 35, 'Yes', 0),
(70, 35, 'No', 0),
(71, 36, 'Yes', 0),
(72, 36, 'No', 0),
(73, 37, 'Yes', 0),
(74, 37, 'No', 0),
(75, 38, 'Yes', 0),
(76, 38, 'No', 0),
(77, 39, 'Yes', 0),
(78, 39, 'No', 0),
(79, 40, 'Yes', 0),
(80, 40, 'No', 0),
(81, 41, 'Yes', 0),
(82, 41, 'No', 0),
(83, 42, 'Yes', 0),
(84, 42, 'No', 0),
(85, 43, 'Yes', 0),
(86, 43, 'No', 0),
(87, 44, 'Yes', 0),
(88, 44, 'No', 0),
(89, 45, 'Yes', 0),
(90, 45, 'No', 0),
(91, 46, 'Yes', 0),
(92, 46, 'No', 0),
(93, 47, 'Yes', 0),
(94, 47, 'No', 0),
(95, 48, 'Yes', 0),
(96, 48, 'No', 0),
(97, 49, 'Yes', 0),
(98, 49, 'No', 0),
(99, 50, 'Yes', 0),
(100, 50, 'No', 0),
(101, 51, 'Yes', 0),
(102, 51, 'No', 0),
(103, 52, 'Yes', 0),
(104, 52, 'No', 0),
(105, 53, 'Yes', 0),
(106, 53, 'No', 0),
(107, 54, 'Yes', 0),
(108, 54, 'No', 0),
(109, 55, 'Yes', 0),
(110, 55, 'No', 0),
(111, 56, 'Yes', 0),
(112, 56, 'No', 0),
(113, 57, 'Yes', 0),
(114, 57, 'No', 0),
(115, 58, 'Yes', 0),
(116, 58, 'No', 0),
(117, 59, 'Yes', 0),
(118, 59, 'No', 0),
(119, 60, 'Yes', 0),
(120, 60, 'No', 0);

-- --------------------------------------------------------

--
-- Table structure for table `survey_info`
--

CREATE TABLE `survey_info` (
  `id` int(11) NOT NULL,
  `formid` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `survey_info`
--

INSERT INTO `survey_info` (`id`, `formid`, `userid`, `created_at`) VALUES
(1, 'formID1737975711478950', 4405, '2025-01-27 11:01:52'),
(2, 'formID1737975727410416', 4405, '2025-01-27 11:02:08'),
(3, 'formID1737975775790576', 4405, '2025-01-27 11:02:56');

-- --------------------------------------------------------

--
-- Table structure for table `survey_questions`
--

CREATE TABLE `survey_questions` (
  `id` int(11) NOT NULL,
  `survey_info_id` int(11) NOT NULL,
  `question` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `survey_questions`
--

INSERT INTO `survey_questions` (`id`, `survey_info_id`, `question`) VALUES
(1, 1, 'Is the land currently zoned for the use you intend (residential, commercial, agricultural, etc.)?'),
(2, 1, 'Are there any existing liens or encumbrances on the property?'),
(3, 1, 'Has the land been surveyed recently?'),
(4, 1, 'Are there any easements that affect the property?'),
(5, 1, 'Is the land free of environmental hazards?'),
(6, 1, 'Has the property been involved in any legal disputes?'),
(7, 1, 'Is there access to utilities (water, electricity, sewage)?'),
(8, 1, 'Are there any restrictions on building or land use?'),
(9, 1, 'Is the land located in a flood zone?'),
(10, 1, 'Are there ongoing maintenance fees or association dues?'),
(11, 1, 'Has the property been appraised recently?'),
(12, 1, 'Is there clear title to the property?'),
(13, 1, 'Is the land accessible by a public road?'),
(14, 1, 'Are there any zoning changes expected in the near future?'),
(15, 1, 'Have you owned the land for more than five years?'),
(16, 1, 'Is the land serviced by a reliable internet provider?'),
(17, 1, 'Are there any known pests or wildlife issues on the property?'),
(18, 1, 'Is the property part of any conservation or preservation easement?'),
(19, 1, 'Have there been any recent property tax assessments?'),
(20, 1, 'Is the land suitable for any type of construction?'),
(21, 2, 'Is the land currently zoned for the use you intend (residential, commercial, agricultural, etc.)?'),
(22, 2, 'Are there any existing liens or encumbrances on the property?'),
(23, 2, 'Has the land been surveyed recently?'),
(24, 2, 'Are there any easements that affect the property?'),
(25, 2, 'Is the land free of environmental hazards?'),
(26, 2, 'Has the property been involved in any legal disputes?'),
(27, 2, 'Is there access to utilities (water, electricity, sewage)?'),
(28, 2, 'Are there any restrictions on building or land use?'),
(29, 2, 'Is the land located in a flood zone?'),
(30, 2, 'Are there ongoing maintenance fees or association dues?'),
(31, 2, 'Has the property been appraised recently?'),
(32, 2, 'Is there clear title to the property?'),
(33, 2, 'Is the land accessible by a public road?'),
(34, 2, 'Are there any zoning changes expected in the near future?'),
(35, 2, 'Have you owned the land for more than five years?'),
(36, 2, 'Is the land serviced by a reliable internet provider?'),
(37, 2, 'Are there any known pests or wildlife issues on the property?'),
(38, 2, 'Is the property part of any conservation or preservation easement?'),
(39, 2, 'Have there been any recent property tax assessments?'),
(40, 2, 'Is the land suitable for any type of construction?'),
(41, 3, 'Is the land currently zoned for the use you intend (residential, commercial, agricultural, etc.)?'),
(42, 3, 'Are there any existing liens or encumbrances on the property?'),
(43, 3, 'Has the land been surveyed recently?'),
(44, 3, 'Are there any easements that affect the property?'),
(45, 3, 'Is the land free of environmental hazards?'),
(46, 3, 'Has the property been involved in any legal disputes?'),
(47, 3, 'Is there access to utilities (water, electricity, sewage)?'),
(48, 3, 'Are there any restrictions on building or land use?'),
(49, 3, 'Is the land located in a flood zone?'),
(50, 3, 'Are there ongoing maintenance fees or association dues?'),
(51, 3, 'Has the property been appraised recently?'),
(52, 3, 'Is there clear title to the property?'),
(53, 3, 'Is the land accessible by a public road?'),
(54, 3, 'Are there any zoning changes expected in the near future?'),
(55, 3, 'Have you owned the land for more than five years?'),
(56, 3, 'Is the land serviced by a reliable internet provider?'),
(57, 3, 'Are there any known pests or wildlife issues on the property?'),
(58, 3, 'Is the property part of any conservation or preservation easement?'),
(59, 3, 'Have there been any recent property tax assessments?'),
(60, 3, 'Is the land suitable for any type of construction?');

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
  `profile` text NOT NULL,
  `phone_verified` int(11) NOT NULL DEFAULT 0 COMMENT '0 not verified, 1 verified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `phone`, `adress`, `country`, `role_id`, `code`, `status`, `profile`, `phone_verified`) VALUES
(1, 'Johnny Luna', 'Lunaenterprises.jl@gmail.com', '', '0f0ba563d92b71f831ca508d9a82d690', '8175011462', '', 'Pakistan', 1, '671012', 1, '13032023013634image_picker7905809975070290579.jpg', 0),
(3, 'Muhammad moiz', 'mohammad786moiz@gmail.com', 'M.Moiz', '1234', '23323232', 'Moin a bad Malir', 'Pakistan', 3, '0', 1, '', 0),
(4372, 'Johnny luna', 'donny.jluna@gmail.com', '', '482c811da5d5b4bc6d497ffa98491e38', '8175011462', NULL, NULL, 3, '972329', 1, 'default.png', 0),
(4374, 'jack ', 'jsuegeiwiw@gmail.com', '', '66cb87e4e66a825d10cf4227e0e82eee', '46900000000', NULL, NULL, 3, '', 1, 'default.png', 0),
(4377, 'sam smith', 'samsmoth@gmail.com', '', '36a5b0a699c1ec8bd66aeca744915faa', '2146789087', NULL, NULL, 3, '', 1, 'default.png', 0),
(4378, 'sam smith', 'stephanie@gmail.com', '', 'b41cb62ec6767f2e41f9df7a2d161515', '2146780963', NULL, NULL, 3, '', 1, 'default.png', 0),
(4380, 'Laura', 'laus1523@gmail.com', '', 'b25fb57dea6f023399dbf761b5f25937', '8177690259', NULL, NULL, 3, '561676', 1, 'default.png', 0),
(4381, 'Johana Garcia', 'johana.b4391@gmail.com', '', '25e4094426ccd96dc360c986626c3734', '6825616378', NULL, NULL, 3, '', 1, 'default.png', 0),
(4383, 'j luna', 'jonny@gmail.com', '', '202cb962ac59075b964b07152d234b70', '111111', NULL, NULL, 3, '', 1, 'default.png', 0),
(4384, 'New', 'new@gmail.com', '', 'e118217b59f9df25447a6042e1282a69', '030165965', NULL, NULL, 3, '', 1, 'default.png', 0),
(4385, 'zyta', 'kosciukzyta@gmail.com', '', 'ebf8459b2ff6fab0a28ed5f22033aec4', '123', NULL, NULL, 3, '338382', 1, 'default.png', 0),
(4386, 'Myriam ', 'myriamugc@gmail.com', '', 'f2dc4bc3929b36d013905c1af09619c3', '12', NULL, NULL, 3, '', 1, 'default.png', 0),
(4387, 'z', 'czarnyorzeszek@tlen.pl', '', 'f3abb86bd34cf4d52698f14c0da1dc60', '55', NULL, NULL, 3, '248037', 1, 'default.png', 0),
(4388, 'zyta', 'kosciukzyta@o2.pl', '', '320b5a1e14a9937bc5fc8912f4fc6c23', '555', NULL, NULL, 3, '', 1, 'default.png', 0),
(4392, 'Anas', 'anas80@gmail.com', '', 'e118217b59f9df25447a6042e1282a69', '3010227114', NULL, NULL, 3, '', 1, '1207202411132646aac09e-f607-430a-889e-bfa9c8d9a052-1_all_35.jpg', 1),
(4393, 'Paul', 'paul@thursday-evening.com', '', 'fd54f7133784f1940ac3c9205fbfaf04', '9723752201', NULL, NULL, 3, '', 1, '07022023224208image_picker_4338E522-DC1D-4DBE-9988-F8D70671318E-3400-000001801DA1123A.jpg', 0),
(4394, 'Chayanun sriluksana ', 'tom@thursday-evening.com', '', 'ae06a7916eca000de400e9320a539574', '4696882329', NULL, NULL, 3, '', 1, 'default.png', 0),
(4396, 'Minha Kweon', 'minhakweon@gmail.com', '', 'a633aa942fb1950961dc7e7872e3010a', '8167267318', NULL, NULL, 3, '', 1, 'default.png', 0),
(4399, 'Minha Kweon', 'minha.lunaenterprises@gmail.com', '', '1ca4e22cbd14f66584d9deb0a558cd36', '8167267318', NULL, NULL, 3, '', 1, 'default.png', 0),
(4400, 'David Dobbs', 'cyaholdings@gmail.com', '', 'e02cc83f3b38ba484f84898e6c28a975', '7065107071', NULL, NULL, 3, '', 1, 'default.png', 0),
(4401, 'Stephanie Ruiz', 'stephanie.lunaenterprises@gmail.com', '', '08e06912fdaa85ad76bc1e7c90f7123e', '2146736180', NULL, NULL, 3, '', 1, 'default.png', 0),
(4402, 'Julio Martinez ', 'jrm28820@gmail.com', '', '4ebd56e2477b17367b19f9813478283b', '8138099072', NULL, NULL, 3, '', 1, 'default.png', 0),
(4403, 'Kevin Caldwell', 'caldwellk32@gmail.com', '', '84c0b5c133e15d50813851b8e28834b4', '9045059065', NULL, NULL, 3, '', 1, 'default.png', 0),
(4404, 'yesy', 'bandida9131@hotmail.com', '', '4e4047cd2e0e6688eccaea88264f91eb', '3317035388', NULL, NULL, 3, '', 1, 'default.png', 0),
(4405, 'Anas Ayub', 'm.anasayub80@gmail.com', '', 'e118217b59f9df25447a6042e1282a69', '+923283567332', NULL, NULL, 3, '592085', 1, '180920242026311000011608.jpg', 1),
(4406, 'Jabarren Hansell ', 'FanFirxt@outlook.com', '', 'f054719d68fcc128112c3950825a5569', '9045870925', NULL, NULL, 3, '', 1, 'default.png', 0),
(4407, 'Jason Carter', 'dallas_4ever@yahoo.com', '', '235e39accd347c4360ac683b872d5bad', '9362075658', NULL, NULL, 3, '', 1, 'default.png', 0),
(4408, 'Eric L Jones Jr ', 'kjngsmurfblue@gmail.com', '', 'a7462bc96d69f39d0bfe585f8123da27', '8169082469', NULL, NULL, 3, '', 1, 'default.png', 0),
(4409, 'YungMfSmurf ', 'Kingsmurfblue@gmail.com', '', 'a7462bc96d69f39d0bfe585f8123da27', '18169082469', NULL, NULL, 3, '', 1, 'default.png', 0),
(4410, 'ali jawad', 'jawadsubhan7@gmail.com', '', '7411b3a7cac02ada5ee4694420322cd3', '03010824703', NULL, NULL, 3, '', 1, 'default.png', 0),
(4411, 'yasir azam ', 'azamyasira@gmail.com', '', '90505313d0991c7b55695c74100d56fd', '270695', NULL, NULL, 3, '', 1, 'default.png', 0),
(4412, 'Carolyn ', 'milan6929@gmail.com', '', 'b47ec599c695eaa30ce95369742190af', '8572498185', NULL, NULL, 3, '', 1, 'default.png', 0),
(4413, 'Esam Onela George ', 'gesam675@gmail.com', '', '85ced5d7ea6b2a20ec3249cc94f8d317', '0684349242', NULL, NULL, 3, '', 1, 'default.png', 0),
(4414, 'anas', 'anas@gmail.com', '', '81dc9bdb52d04dc20036dbd8313ed055', '+923010227114', NULL, NULL, 3, '', 1, '130620241221201000000018.jpg', 0),
(4416, 'Admin', 'admin@gmail.com', '', '81dc9bdb52d04dc20036dbd8313ed055', '+92 3010227114', NULL, NULL, 2, '438704', 1, '150620240654401000000018.jpg', 1),
(4417, 'Ali', 'm@m.com', '', '25d55ad283aa400af464c76d713c07ad', '25698022', NULL, NULL, 3, '', 1, 'default.png', 0),
(4418, 'alijawad', 'dsafas@email.com', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4419, 'sadf', 'asdf', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4420, 'sadf', 'adf', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4421, 'lojo', 'iuhi', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4422, 'lojo', 'asdfsafas', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4423, 'dfasf', 'saf', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4424, 'dfasf', 'sa1f', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4425, 'dfasf', 's11f', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4426, 'dfasf', 's11', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4427, 'asdfas', 'saf@email.com', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4428, 'dsfa', 'asdfa@email.com', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4429, 'dsfa', 'afsd@email.ocm', '', '202cb962ac59075b964b07152d234b70', '1231', NULL, NULL, 3, '', 1, 'default.png', 0),
(4430, 'asdfas', 'asf', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4431, 'dsab', 'dsaf', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4432, 'fasd', 'sadf@email.com', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4433, 'sad', 'asdfa', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4434, 'asf', 'asfsa', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4435, 'asdfasa', 'dfas', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4436, 'ASFASDF', 'ASDFs', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4437, 'uwu', 'uwu@email.com', '', '202cb962ac59075b964b07152d234b70', '123', NULL, NULL, 3, '', 1, 'default.png', 0),
(4438, 'alijawad', 'jawadsubhan@email.com', '', '202cb962ac59075b964b07152d234b70', '923010024703', NULL, NULL, 3, '907140', 1, 'default.png', 0),
(4439, 'Ali jawad', 'jawduwu@email.com', '', '202cb962ac59075b964b07152d234b70', '+92 3010024703', NULL, NULL, 3, '', 1, 'default.png', 0),
(4440, 'asda', 'asdfaa@email.com', '', '202cb962ac59075b964b07152d234b70', '+92 312 3456789', NULL, NULL, 3, '', 1, 'default.png', 0),
(4441, 'kawd', 'asda@email.com', '', '202cb962ac59075b964b07152d234b70', '+92 312 3456789', NULL, NULL, 3, '', 1, 'default.png', 0),
(4442, 'dfasfdas', 'fasfdsa', '', '202cb962ac59075b964b07152d234b70', '+92 312 3456789', NULL, NULL, 3, '', 1, 'default.png', 0),
(4443, 'dfasfdas', 'fasfdsaa', '', '202cb962ac59075b964b07152d234b70', '+92 312 3456789', NULL, NULL, 3, '', 1, 'default.png', 0),
(4447, 'Juicewlrd', 'juicewrld@gmail.com', '', 'e118217b59f9df25447a6042e1282a69', '+92 3010227114', NULL, NULL, 3, '', 1, 'default.png', 1),
(4450, 'john wick', 'johnwick@gmail.com', '', 'e118217b59f9df25447a6042e1282a69', '+92 3010227114', NULL, NULL, 3, '', 1, 'default.png', 1),
(4451, 'user', 'workdotclick@gmail.com', '', 'd2f44283f955c5d6d337e6ba32673f63', '+92 3010227114', NULL, NULL, 3, '', 1, '280620240658141000000018.jpg', 1),
(4452, 'Anas', 'anasayub80@gmail.com', '', 'e118217b59f9df25447a6042e1282a69', '+92 3283567332', NULL, NULL, 3, '', 1, 'default.png', 0),
(4453, 'Anas', 'anastechno@gmail.com', '', 'e118217b59f9df25447a6042e1282a69', '+92 3283567332', NULL, NULL, 3, '', 1, '290820240617181000000018.jpg', 1),
(4454, 'Abraham Lozano ', 'abraham@lunaent.io', '', '602f72c35d625df7c7308347ea3b3a03', '4698598639', NULL, NULL, 3, '247422', 1, '29082024194717image_picker_7592A09E-0D22-4FB9-8D66-62C376030D95-28003-0000060757ED9395.jpg', 0),
(4455, 'test', 'test.io', '', '81dc9bdb52d04dc20036dbd8313ed055', '1111111111', NULL, NULL, 3, '', 1, 'default.png', 0),
(4456, 'test', 'test.com', '', '81dc9bdb52d04dc20036dbd8313ed055', '1111111111', NULL, NULL, 3, '', 1, 'default.png', 0),
(4457, 'testing', '1234test.net', '', '81dc9bdb52d04dc20036dbd8313ed055', '1111111111', NULL, NULL, 3, '', 1, 'default.png', 0),
(4458, 'j luna', 'johnluna479@gmail.com', '', '6e04a7d7cb87cc436a4b4c8d92a8ff38', '8175011462', NULL, NULL, 3, '', 1, 'default.png', 0),
(4459, 'donny', 'donny@yahoo.com', '', 'ab750e47f9b1d944cbbf02a987758b75', '+1 8175011462', NULL, NULL, 3, '', 1, 'default.png', 1),
(4460, 'luna', 'luna@lunaent.io', '', 'c93ccd78b2076528346216b3b2f701e6', '+1 81750111462', NULL, NULL, 3, '', 1, 'default.png', 0);

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
-- Indexes for table `survey_answers`
--
ALTER TABLE `survey_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_question_id` (`survey_question_id`);

--
-- Indexes for table `survey_info`
--
ALTER TABLE `survey_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_info_id` (`survey_info_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `form_images`
--
ALTER TABLE `form_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT for table `house_details`
--
ALTER TABLE `house_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `survey_answers`
--
ALTER TABLE `survey_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `survey_info`
--
ALTER TABLE `survey_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `survey_questions`
--
ALTER TABLE `survey_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4461;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

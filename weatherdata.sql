-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2024 at 06:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weather123`
--

-- --------------------------------------------------------

--
-- Table structure for table `weatherdata`
--

CREATE TABLE `weatherdata` (
  `id` int(11) NOT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `humidity` float DEFAULT NULL,
  `wind_speed` float DEFAULT NULL,
  `pressure` float DEFAULT NULL,
  `stats` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `timezone` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weatherdata`
--

INSERT INTO `weatherdata` (`id`, `city_name`, `temperature`, `humidity`, `wind_speed`, `pressure`, `stats`, `icon`, `country`, `timezone`, `timestamp`) VALUES
(1, 'Kathmandu', 24.12, 27, 1.03, 1014, 'few clouds', '02n', 'NP', 20700, '2024-04-28 11:31:39'),
(2, 'Bolton', 11.38, 57, 4.47, 1006, 'broken clouds', '04d', 'GB', 3600, '2024-04-28 11:38:27'),
(3, 'Pokhara', 24.02, 17, 3.31, 1008, 'few clouds', '02n', 'NP', 20700, '2024-04-28 11:38:32'),
(4, 'Kākināda', 32.26, 70, 2.51, 1009, 'clear sky', '01n', 'IN', 19800, '2024-04-28 11:47:13'),
(5, 'Innichen', 12, 54, 0.51, 1022, 'overcast clouds', '04d', 'IT', 7200, '2024-04-28 12:05:36'),
(6, 'Innichen', 12, 54, 0.51, 1022, 'overcast clouds', '04d', 'IT', 7200, '2024-04-28 12:05:40'),
(7, 'Innichen', 12, 54, 0.51, 1022, 'overcast clouds', '04d', 'IT', 7200, '2024-04-28 12:05:43'),
(8, 'Innichen', 12, 54, 0.51, 1022, 'overcast clouds', '04d', 'IT', 7200, '2024-04-28 12:05:46'),
(9, 'Delhi', 32.84, 21, 2.06, 1007, 'haze', '50n', 'IN', 19800, '2024-04-28 12:05:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `weatherdata`
--
ALTER TABLE `weatherdata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `weatherdata`
--
ALTER TABLE `weatherdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

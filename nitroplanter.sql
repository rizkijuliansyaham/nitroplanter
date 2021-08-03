-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2021 at 05:42 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nitroplanter`
--

-- --------------------------------------------------------

--
-- Table structure for table `plant_controller`
--

CREATE TABLE `plant_controller` (
  `id` int(11) NOT NULL,
  `plant` text NOT NULL,
  `schedule` text NOT NULL,
  `water_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plant_controller`
--

INSERT INTO `plant_controller` (`id`, `plant`, `schedule`, `water_amount`) VALUES
(1, 'Mawar', '2 Hari Sekali', 30),
(2, 'Melati', '3 Hari Sekali', 40);

-- --------------------------------------------------------

--
-- Table structure for table `plant_parameter`
--

CREATE TABLE `plant_parameter` (
  `id` int(11) NOT NULL,
  `plant` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plant_parameter`
--

INSERT INTO `plant_parameter` (`id`, `plant`) VALUES
(1, 'Anturioum'),
(2, 'Melati'),
(3, 'Mawar'),
(4, 'Anggrek');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_parameter`
--

CREATE TABLE `schedule_parameter` (
  `id` int(11) NOT NULL,
  `schedule` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_parameter`
--

INSERT INTO `schedule_parameter` (`id`, `schedule`) VALUES
(1, '2 x Sehari'),
(2, '1 x Sehari');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `plant_controller`
--
ALTER TABLE `plant_controller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plant_parameter`
--
ALTER TABLE `plant_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_parameter`
--
ALTER TABLE `schedule_parameter`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `plant_controller`
--
ALTER TABLE `plant_controller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `plant_parameter`
--
ALTER TABLE `plant_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedule_parameter`
--
ALTER TABLE `schedule_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

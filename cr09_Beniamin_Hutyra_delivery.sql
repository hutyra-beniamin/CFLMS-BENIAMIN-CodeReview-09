-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 12, 2020 at 04:40 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_Beniamin_Hutyra_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_Beniamin_Hutyra_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_Beniamin_Hutyra_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `pick_up`
--

CREATE TABLE `pick_up` (
  `pick_up_id` int(11) NOT NULL,
  `pick_up_address` varchar(55) DEFAULT NULL,
  `pick_up_date` date DEFAULT NULL,
  `pick_up_employee_id` int(11) DEFAULT NULL,
  `fk_sender_id` int(11) DEFAULT NULL,
  `element` enum('package','mail') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pick_up`
--

INSERT INTO `pick_up` (`pick_up_id`, `pick_up_address`, `pick_up_date`, `pick_up_employee_id`, `fk_sender_id`, `element`) VALUES
(1, 'pickupstreet 2', '2020-07-09', 1, 4, 'package'),
(3, 'pickupstreet 2', '2020-07-01', 4, 6, 'mail');

-- --------------------------------------------------------

--
-- Table structure for table `post_office`
--

CREATE TABLE `post_office` (
  `post_office_id` int(11) NOT NULL,
  `post_office_address` varchar(55) DEFAULT NULL,
  `post_office_employee_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `mail_id` int(11) DEFAULT NULL,
  `ORDER_date` date DEFAULT NULL,
  `fk_sender_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_office`
--

INSERT INTO `post_office` (`post_office_id`, `post_office_address`, `post_office_employee_id`, `package_id`, `mail_id`, `ORDER_date`, `fk_sender_id`) VALUES
(1, 'poststreet 1', 1, NULL, 1, '2020-07-07', 1),
(3, 'postoffice 1', 5, NULL, 2, '2020-07-06', 2),
(4, 'postoffice 1', 6, 1, NULL, '2020-07-16', 3),
(6, 'postoffice 1', 7, NULL, 4, '2020-07-05', 5);

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL,
  `date_receving_element_by_recipient` date DEFAULT NULL,
  `fk_recipient_post_office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `date_receving_element_by_recipient`, `fk_recipient_post_office_id`) VALUES
(1, '2020-07-23', 1),
(3, '2020-07-23', 2),
(5, '2020-07-23', 4),
(6, '2020-07-23', 3),
(8, '2020-07-23', 5),
(9, '2020-07-23', 6);

-- --------------------------------------------------------

--
-- Table structure for table `recipient_post_office`
--

CREATE TABLE `recipient_post_office` (
  `recipient_post_office_id` int(11) NOT NULL,
  `recipient_post_office_employee_id` int(11) DEFAULT NULL,
  `date_receiving_element` date DEFAULT NULL,
  `fk_transport_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient_post_office`
--

INSERT INTO `recipient_post_office` (`recipient_post_office_id`, `recipient_post_office_employee_id`, `date_receiving_element`, `fk_transport_id`) VALUES
(1, 1, '2020-07-18', 1),
(2, 1, '2020-07-18', 2),
(3, 1, '2020-07-18', 3),
(4, 1, '2020-07-18', 4),
(5, 2, '2020-07-18', 5),
(6, 1, '2020-07-18', 6);

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `sender_id` int(11) NOT NULL,
  `fist_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `sender_address` varchar(55) DEFAULT NULL,
  `element` enum('package','mail') DEFAULT 'mail'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`sender_id`, `fist_name`, `last_name`, `sender_address`, `element`) VALUES
(1, 'Alex', 'Wurschy', 'lolastreet 55/7', 'mail'),
(2, 'Rudolfo', 'Coco', 'Oberestreet 778', 'mail'),
(3, 'Andrei', 'Racuvicic', 'Newstreet 44/4', 'package'),
(4, 'Gabrielle', 'Deltoro', 'mariahilfe 2/1', 'package'),
(5, 'Erik', 'Rolando', 'Kärnetrstraße 1', 'mail'),
(6, 'Ronni', 'Graf', 'lolastreet 55/10', 'mail');

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `transport_id` int(11) NOT NULL,
  `start_delivery_date` date DEFAULT NULL,
  `transport_employee_id` int(11) DEFAULT NULL,
  `fk_warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`transport_id`, `start_delivery_date`, `transport_employee_id`, `fk_warehouse_id`) VALUES
(1, '2020-07-15', 1, 1),
(2, '2020-07-15', 1, 2),
(3, '2020-07-15', 1, 3),
(4, '2020-07-16', 2, 4),
(5, '2020-07-16', 2, 5),
(6, '2020-07-16', 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `warehouse_employee_id` int(11) DEFAULT NULL,
  `fk_post_office_id` int(11) DEFAULT NULL,
  `fk_pick_up_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouse_id`, `warehouse_employee_id`, `fk_post_office_id`, `fk_pick_up_id`) VALUES
(1, 1, 3, NULL),
(2, 1, 4, NULL),
(3, 4, 6, NULL),
(4, 1, 1, NULL),
(5, 1, NULL, 1),
(6, 4, NULL, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pick_up`
--
ALTER TABLE `pick_up`
  ADD PRIMARY KEY (`pick_up_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`);

--
-- Indexes for table `post_office`
--
ALTER TABLE `post_office`
  ADD PRIMARY KEY (`post_office_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD KEY `fk_recipient_post_office_id` (`fk_recipient_post_office_id`);

--
-- Indexes for table `recipient_post_office`
--
ALTER TABLE `recipient_post_office`
  ADD PRIMARY KEY (`recipient_post_office_id`),
  ADD KEY `fk_transport_id` (`fk_transport_id`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_id`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`transport_id`),
  ADD KEY `fk_warehouse_id` (`fk_warehouse_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_id`),
  ADD KEY `fk_post_office_id` (`fk_post_office_id`),
  ADD KEY `fk_pick_up_id` (`fk_pick_up_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pick_up`
--
ALTER TABLE `pick_up`
  MODIFY `pick_up_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `recipient_post_office`
--
ALTER TABLE `recipient_post_office`
  MODIFY `recipient_post_office_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sender`
--
ALTER TABLE `sender`
  MODIFY `sender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `transport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pick_up`
--
ALTER TABLE `pick_up`
  ADD CONSTRAINT `pick_up_ibfk_1` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`) ON DELETE CASCADE;

--
-- Constraints for table `post_office`
--
ALTER TABLE `post_office`
  ADD CONSTRAINT `post_office_ibfk_1` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`) ON DELETE CASCADE;

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_recipient_post_office_id`) REFERENCES `recipient_post_office` (`recipient_post_office_id`) ON DELETE CASCADE;

--
-- Constraints for table `recipient_post_office`
--
ALTER TABLE `recipient_post_office`
  ADD CONSTRAINT `recipient_post_office_ibfk_1` FOREIGN KEY (`fk_transport_id`) REFERENCES `transport` (`transport_id`) ON DELETE CASCADE;

--
-- Constraints for table `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `transport_ibfk_1` FOREIGN KEY (`fk_warehouse_id`) REFERENCES `warehouse` (`warehouse_id`) ON DELETE CASCADE;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`fk_post_office_id`) REFERENCES `post_office` (`post_office_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `warehouse_ibfk_2` FOREIGN KEY (`fk_pick_up_id`) REFERENCES `pick_up` (`pick_up_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

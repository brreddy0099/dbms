-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 05:41 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mining_stock`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ase` (IN `Added_date` YEAR(4))   BEGIN
SELECT mining_stock_info.Stock_name,mining_stock_holders.No_of_shares FROM mining_stock_info LEFT OUTER JOIN  mining_stock_holders ON mining_stock_info.Stock_id=mining_stock_holders.Stock_id WHERE YEAR(mining_stock_info.Added_date)= YEAR(Added_date);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mining_stock_history`
--

CREATE TABLE `mining_stock_history` (
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `Stck_id` int(50) NOT NULL,
  `No_of_shares` int(100) NOT NULL,
  `S_Value` int(50) NOT NULL,
  `Up_Down` tinyint(1) NOT NULL,
  `Stock_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mining_stock_history`
--

INSERT INTO `mining_stock_history` (`Date`, `Stck_id`, `No_of_shares`, `S_Value`, `Up_Down`, `Stock_name`) VALUES
('2022-11-19', 8, 10, 786, 0, 'ad'),
('2022-11-20', 15, 10, 12345, 0, 'ad'),
('2022-11-20', 5, 10, 12345, 0, 'ad'),
('2022-11-20', 7, 10, 12345, 0, 'ad');

-- --------------------------------------------------------

--
-- Table structure for table `mining_stock_holders`
--

CREATE TABLE `mining_stock_holders` (
  `user_id` int(50) NOT NULL,
  `Stock_id` int(50) NOT NULL,
  `No_of_shares` int(100) NOT NULL,
  `Value` int(50) NOT NULL,
  `Buy_Sell` tinyint(1) NOT NULL,
  `Time_date` datetime NOT NULL DEFAULT current_timestamp(),
  `Stock_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mining_stock_holders`
--

INSERT INTO `mining_stock_holders` (`user_id`, `Stock_id`, `No_of_shares`, `Value`, `Buy_Sell`, `Time_date`, `Stock_name`) VALUES
(1, 1, 10, 12345, 0, '2022-11-20 18:13:12', 'ad'),
(2, 7, 20, 12, 0, '2022-11-20 18:32:39', 'ad'),
(3, 5, 10, 12345, 1, '2022-11-20 18:31:38', 'ad'),
(15, 8, 10, 786, 1, '2022-11-19 16:47:54', 'ad');

--
-- Triggers `mining_stock_holders`
--
DELIMITER $$
CREATE TRIGGER `history` AFTER INSERT ON `mining_stock_holders` FOR EACH ROW INSERT INTO mining_stock_history (Stck_id,No_of_shares, S_Value,Stock_name) VALUES (new.Stock_id,new.No_of_shares,new.Value,new.Stock_name)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mining_stock_info`
--

CREATE TABLE `mining_stock_info` (
  `Stock_id` int(50) NOT NULL,
  `Stock_name` char(50) NOT NULL,
  `Total_stocks` bigint(11) NOT NULL,
  `Gain_loss` int(50) NOT NULL,
  `Added_date` year(4) NOT NULL,
  `open_time` datetime(6) NOT NULL,
  `close_time` datetime(6) NOT NULL,
  `value` double NOT NULL,
  `last_time_value` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='this table contains the information about , stock information of stock inform';

--
-- Dumping data for table `mining_stock_info`
--

INSERT INTO `mining_stock_info` (`Stock_id`, `Stock_name`, `Total_stocks`, `Gain_loss`, `Added_date`, `open_time`, `close_time`, `value`, `last_time_value`) VALUES
(1, 'Gold', 7566396, 0, 2016, '2022-11-15 08:45:20.000000', '2023-01-11 07:27:59.000000', 786.2, 1037),
(2, 'silver', 1312342, 1, 2020, '2022-02-21 11:50:33.000000', '2022-03-10 12:55:20.000000', 300, 841),
(3, 'silvers', 708434, 1, 2010, '2022-02-21 03:50:33.000000', '2022-03-08 12:55:54.000000', 400.55, 2209),
(4, 'reddys', 9, 0, 2023, '2022-01-12 11:26:42.000000', '2022-02-02 07:56:19.000000', 1887.7, 964),
(5, 'HOEC', 1104283, 1, 2019, '2022-01-15 07:11:14.000000', '2022-02-08 12:56:39.000000', 2435, 1743),
(6, 'Exxon Mobil', 8966396, 0, 2013, '2022-02-08 11:25:31.000000', '2022-03-11 07:56:56.000000', 745.98, 1012),
(7, 'Hindustan gold', 16700, 0, 2017, '2022-02-10 06:47:54.000000', '2022-03-17 10:57:16.000000', 5648.52, 1883),
(8, 'castrol mining', 1360600, 1, 2010, '2022-01-24 03:48:06.000000', '2022-02-09 04:57:50.000000', 400, 2627),
(9, 'Mango pvt', 210140, 0, 2022, '2022-11-26 10:48:29.000000', '2023-01-03 10:58:18.000000', 4563.6, 1830),
(10, 'Imperial gold mins', 708434, 1, 2017, '2022-11-09 08:48:54.000000', '2023-01-04 13:01:13.000000', 854.34, 810),
(11, 'Asian', 3, 1, 2012, '2022-02-14 09:49:02.000000', '2022-02-25 05:59:24.000000', 3773.662, 1644),
(12, 'Continent Petro', 1104283, 0, 2010, '2022-02-18 17:49:45.000000', '2022-02-19 07:00:01.000000', 476, 1516),
(13, 'Selan Explore', 8966396, 0, 2010, '2022-02-07 16:00:00.000000', '2022-02-23 08:00:19.000000', 4274.062, 2358),
(14, 'Jindal Drilling', 6543600, 1, 2019, '2022-03-19 09:50:14.000000', '2022-03-31 00:00:00.000000', 678, 2921),
(15, 'Aban Offshore', 1360600, 1, 2017, '2022-02-21 07:50:33.000000', '2022-02-25 02:00:51.000000', 4774.462, 1084);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(50) NOT NULL,
  `F_name` char(15) NOT NULL,
  `M_name` char(10) NOT NULL,
  `L_name` char(10) NOT NULL,
  `city` char(25) NOT NULL,
  `state` char(20) NOT NULL,
  `country` char(20) NOT NULL,
  `pincode` bigint(50) NOT NULL,
  `age` int(50) NOT NULL,
  `DOB` date NOT NULL,
  `password` int(11) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `F_name`, `M_name`, `L_name`, `city`, `state`, `country`, `pincode`, `age`, `DOB`, `password`, `email`) VALUES
(1, 'Emma', 'Peter', 'Mallory', 'Firozabad', 'Andaman And nicobar', 'india', 206987, 22, '2013-01-21', 123, ''),
(2, 'Davis', 'Ware', 'Rich', 'Navi Mumbai', 'Arunachal Pradesh', 'india', 144252, 26, '2022-08-24', 321, ''),
(3, 'Ivan', 'Tara', 'Jason', 'Bihar', 'gujarath', 'india', 818902, 43, '2017-09-09', 456, ''),
(4, 'Vega', 'Beasley', 'Richardson', 'Mira-Bhayandar', 'Chhattisgarh', 'india', 904953, 21, '2011-03-17', 0, ''),
(5, 'Melissa', 'Christophe', 'Shelly', 'Daman And diu', 'kerala', 'india', 462998, 23, '2022-10-27', 0, ''),
(6, 'Joseph', 'Russell', 'Santiago', 'Chennai', 'Goa', 'india', 289912, 20, '2010-05-18', 0, ''),
(7, 'Michael', 'Sean', 'Sara', 'Haryana', 'assam', 'india', 637662, 26, '2013-04-22', 0, ''),
(8, 'Bautista', 'Wong', 'Perez', 'Panchkula', 'Jammu And kashmir', 'india', 380853, 22, '2015-05-20', 0, ''),
(9, 'Richard', 'Steven', 'Victoria', 'Pune', 'Karnataka', 'india', 188239, 57, '2018-05-01', 0, ''),
(10, 'Brown', 'Harris', 'Mcguire', 'Meerut', 'Lakshadweep', 'india', 629188, 28, '2023-06-08', 0, ''),
(11, 'Katie', 'Christian', 'Destiny', 'Madanapalle', 'Maharashtra', 'india', 295486, 27, '2018-12-11', 0, ''),
(12, 'Hodges', 'Copeland', 'Galloway', 'Allahabad', 'Meghalaya', 'india', 878837, 21, '2021-07-30', 0, ''),
(13, 'Jeffrey', 'Sharon', 'Dawn', 'Kozhikode', 'Nagaland', 'india', 427868, 30, '2015-09-12', 0, ''),
(14, 'Bates', 'Oliver', 'Brown', 'Parbhani', 'Puducherry', 'india', 473236, 40, '2019-12-09', 0, ''),
(15, 'Bryce', 'Joshua', 'Krista', 'Ratlam', 'Rajasthan', 'india', 319194, 50, '2011-03-13', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`, `email`) VALUES
(4, 'sai', 'a01610228fe998f515a72dd730294d87', 'admin@gmail.com'),
(5, 'student1', '12e086066892a311b752673a28583d3f', 'ildev3086@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_stocks`
--

CREATE TABLE `user_has_stocks` (
  `user_ssn_id` int(50) NOT NULL,
  `stock_ssn_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_phone_no`
--

CREATE TABLE `user_phone_no` (
  `user_id` int(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_phone_no`
--

INSERT INTO `user_phone_no` (`user_id`, `phone_no`) VALUES
(1, '7022336654'),
(2, '9148125911'),
(3, '9148124321'),
(4, '9148126911'),
(5, '9148125911'),
(6, '9148127911'),
(7, '9148128911'),
(8, '9148129321'),
(9, '9148127321'),
(10, '9148120321'),
(11, '9148121321'),
(12, '9148122321'),
(13, '9148126321'),
(14, '9148120321'),
(15, '9184556677');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mining_stock_holders`
--
ALTER TABLE `mining_stock_holders`
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `stock_id` (`Stock_id`);

--
-- Indexes for table `mining_stock_info`
--
ALTER TABLE `mining_stock_info`
  ADD PRIMARY KEY (`Stock_id`),
  ADD UNIQUE KEY `Stock_name` (`Stock_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_has_stocks`
--
ALTER TABLE `user_has_stocks`
  ADD KEY `user_id` (`user_ssn_id`),
  ADD KEY `stk_id_fk` (`stock_ssn_id`);

--
-- Indexes for table `user_phone_no`
--
ALTER TABLE `user_phone_no`
  ADD KEY `phone_no` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mining_stock_holders`
--
ALTER TABLE `mining_stock_holders`
  ADD CONSTRAINT `stock_id` FOREIGN KEY (`Stock_id`) REFERENCES `mining_stock_info` (`Stock_id`),
  ADD CONSTRAINT `u_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user_has_stocks`
--
ALTER TABLE `user_has_stocks`
  ADD CONSTRAINT `stk_id_fk` FOREIGN KEY (`stock_ssn_id`) REFERENCES `mining_stock_info` (`Stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_ssn_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_phone_no`
--
ALTER TABLE `user_phone_no`
  ADD CONSTRAINT `phone_no` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

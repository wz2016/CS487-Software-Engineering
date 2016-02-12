-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 06, 2014 at 09:03 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `iRestaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `password`, `type`, `status`) VALUES
('david', 'fb1bf213589f024a257d8df4c42a1617', 'Kitchen Assistant', 'login'),
('jinyu', 'e10adc3949ba59abbe56e057f20f883e', 'manager', 'login'),
('ttt', 'ab13a9c08af64aeb81bac3815247d4b8', 'waiter', 'logout'),
('yjin', 'f379eaf3c831b04de153469d1bec345e', 'Waiter', 'login'),
('zhao111', '1592fe9869170b0317d1a3690e96f698', 'Waiter', 'login');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE IF NOT EXISTS `bills` (
`bill_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `tips` double DEFAULT NULL,
  `item_bill` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `bill_method` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_id`, `order_id`, `tax`, `tips`, `item_bill`, `total`, `time`, `bill_method`, `customer_name`) VALUES
(1, 9, 14.4, 21.6, 14.4, 180, '2014-10-12 20:28:08', '', 'credit card'),
(5, 25, 1.2, 1.8, 1.2, 15, '2014-10-17 19:36:40', 'cash', 'Yu JIn'),
(6, 26, 1, 1.5, 1, 12.5, '2014-10-20 17:07:26', 'cash', 'yu jin'),
(9, 10, 2.2, 1, 1, 2, '2014-10-20 17:26:47', 'cash', 'Yu Jin'),
(12, 27, 7.2, 10.8, 7.2, 90, '2014-10-20 19:29:23', 'cash', 'yu jin'),
(14, 24, 6, 9, 6, 75, '2014-10-20 19:31:20', 'cash', 'yu'),
(15, 30, 1, 2, 10, 13, '2014-11-02 14:26:41', '', 'yu jin'),
(17, 31, 11.5, 17.25, 115, 143.75, '2014-11-03 01:48:25', 'Cash', 'yu jin');

-- --------------------------------------------------------

--
-- Table structure for table `customer_review`
--

CREATE TABLE IF NOT EXISTS `customer_review` (
  `order_id` int(11) NOT NULL,
`id` int(11) NOT NULL,
  `rank` double NOT NULL,
  `review` text COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer_review`
--

INSERT INTO `customer_review` (`order_id`, `id`, `rank`, `review`, `time`) VALUES
(31, 2, 40, 'the food is OK.But the service is not very good.', '2014-11-04 17:31:59'),
(31, 3, 60, 'The food is pretty good.', '2014-11-04 17:34:06'),
(31, 4, 40, 'The food is not suitable to my taste', '2014-11-04 17:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE IF NOT EXISTS `ingredients` (
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cost_amount` double DEFAULT NULL,
  `menu_item_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`name`, `cost_amount`, `menu_item_name`) VALUES
('beef', 250, 'burger '),
('cheese', 1.2, 'Chicago dog '),
('cheese', 2, 'pizza'),
('cute', 1.5, 'Chicago dog '),
('gua', 1.3, 'Chicago dog '),
('rest', 5.4, 'Chicago dog '),
('Sausage', 100, 'pizza'),
('Tomato Sauce', 200, 'pizza'),
('yellow', 3.4, 'Chicago dog ');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_total_amout`
--

CREATE TABLE IF NOT EXISTS `ingredients_total_amout` (
  `ingredients_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total_amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
`id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `price`, `description`, `type`) VALUES
(1, 'pizza', 12, '', 'food '),
(2, 'hot dog', 5, '', 'food'),
(7, 'Chicago dog ', 7, '', 'food '),
(8, 'burger ', 5, '', 'none'),
(9, 'sanwich', 12, '', 'food');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`order_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `table_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `time`, `table_id`) VALUES
(1, '2014-10-12 11:03:00', 1),
(2, '2014-10-12 11:03:18', 1),
(3, '2014-10-12 11:19:44', 1),
(4, '2014-10-12 11:20:56', 1),
(5, '2014-10-12 11:21:44', 1),
(6, '2014-10-12 11:23:23', 1),
(7, '2014-10-12 16:59:13', 1),
(8, '2014-10-12 17:01:12', 1),
(9, '2014-10-12 17:04:24', 1),
(10, '2014-10-12 17:06:11', 2),
(11, '2014-10-12 17:08:52', 34),
(12, '2014-10-12 17:12:29', 1),
(13, '2014-10-12 17:19:11', 3),
(14, '2014-10-12 17:19:18', 1),
(15, '2014-10-12 17:20:05', 5),
(16, '2014-10-12 19:06:01', 2),
(17, '2014-10-12 20:31:46', 100),
(18, '2014-10-12 20:37:09', 12),
(19, '2014-10-12 20:37:19', 2),
(20, '2014-10-12 20:37:27', 3),
(21, '2014-10-12 20:52:28', 1),
(22, '2014-10-16 14:06:50', 6),
(23, '2014-10-16 14:06:58', 4),
(24, '2014-10-16 18:06:12', 7),
(25, '2014-10-17 19:35:52', 1),
(26, '2014-10-20 17:05:41', 9),
(27, '2014-10-20 17:39:37', 10),
(28, '2014-10-20 19:26:00', 11),
(29, '2014-10-20 19:26:20', 1),
(30, '2014-11-02 14:26:00', 2),
(31, '2014-11-02 17:06:43', 10),
(32, '2014-11-04 21:47:19', 10),
(33, '2014-11-04 22:16:47', 2),
(34, '2014-11-05 00:07:51', 7),
(35, '2014-11-05 13:42:25', 8);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
`order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `menu_item_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `menu_item_name`, `status`, `amount`) VALUES
(1, 9, 'pizza', 'paied', 12),
(2, 10, 'hot dog', 'paied', 23),
(3, 11, 'Chicago dog ', 'deliveried', 23),
(4, 12, 'hot dog', 'deliveried', 34),
(5, 15, 'hot dog', 'deliveried', 3),
(6, 16, 'hot dog', 'deliveried', 56),
(7, 20, 'hot dog', 'deliveried', 12),
(8, 21, 'hot dog', 'deliveried', 2),
(9, 24, 'pizza', 'paied', 5),
(10, 25, 'pizza', 'paied', 1),
(11, 26, 'hot dog', 'paied', 2),
(12, 27, 'Pizza', 'paied', 3),
(13, 27, 'Pizza', 'paied', 3),
(14, 28, 'burger ', 'deliveried', 2),
(15, 30, 'hot dog', 'paied', 2),
(16, 31, 'hot dog', 'paied', 23),
(17, 32, 'Chicago dog ', 'deliveried', 2),
(18, 33, 'burger ', 'done', 23),
(21, 34, 'burger ', 'done', 3),
(22, 34, 'sanwich', 'waiting', 4),
(23, 34, 'pizza', 'waiting', 3),
(24, 34, 'pizza', 'waiting', 3),
(25, 35, 'hot dog', 'waiting', 2),
(26, 35, 'pizza', 'waiting', 3);

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE IF NOT EXISTS `staffs` (
`s_id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salaries` double DEFAULT NULL,
  `account_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`s_id`, `first_name`, `last_name`, `type`, `salaries`, `account_name`) VALUES
(10, 'Yu', 'Jin', 'Waiter', 20, 'yjin'),
(13, 'Weilun', 'Zhao', 'Waiter', 18, 'zhao111'),
(15, 'david', 'silverman', 'Kitchen Assistant', 20, 'david'),
(16, 'a', 'a', 'waiter', 20, 'ttt');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE IF NOT EXISTS `tables` (
  `table_id` int(11) NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`table_id`, `status`) VALUES
(1, 'occupied'),
(2, 'occupied'),
(3, 'occupied'),
(5, 'occupied'),
(6, 'occupied'),
(7, 'occupied'),
(8, 'occupied'),
(9, 'vacant'),
(10, 'occupied'),
(11, 'occupied');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
 ADD PRIMARY KEY (`bill_id`), ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `customer_review`
--
ALTER TABLE `customer_review`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
 ADD PRIMARY KEY (`name`,`menu_item_name`);

--
-- Indexes for table `ingredients_total_amout`
--
ALTER TABLE `ingredients_total_amout`
 ADD PRIMARY KEY (`ingredients_name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`order_id`,`table_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
 ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
 ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
 ADD PRIMARY KEY (`table_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `customer_review`
--
ALTER TABLE `customer_review`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

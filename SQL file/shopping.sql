-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2023 at 04:15 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2017-01-24 16:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(7, 'Sarees', 'Handloom sarees with finest quality.', '2023-05-08 04:55:10', '08-05-2023 10:27:01 AM'),
(8, 'Fabrics', 'Handloom fabrics with finest quality.', '2023-05-08 04:55:53', NULL),
(9, 'Dupattas', 'Handloom dupattas with finest quality.', '2023-05-08 04:56:18', NULL),
(10, 'Woolens', 'Handloom woolen products with finest quality.', '2023-05-08 04:56:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', NULL),
(3, 1, '4', 1, '2017-03-10 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL),
(7, 4, '25', 1, '2023-05-08 06:23:17', 'Internet Banking', NULL),
(8, 4, '25', 5, '2023-05-08 07:54:28', 'COD', NULL),
(9, 4, '29', 1, '2023-05-08 07:54:28', 'COD', NULL),
(10, 5, '25', 1, '2023-05-08 08:53:53', 'COD', NULL),
(11, 5, '25', 3, '2023-05-08 09:16:11', 'COD', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19'),
(5, 25, 5, 4, 5, 'Gayathri Kangani', 'nice product', '9 out of 10', '2023-05-08 06:11:10'),
(6, 29, 4, 5, 5, 'sai sampath', 'nice product', 'value for the price', '2023-05-08 08:40:09'),
(7, 34, 5, 3, 5, 'sai sampath', 'wonderful product', '8 out of 10', '2023-05-08 08:42:26'),
(8, 37, 3, 4, 5, 'Gayathri Kangani', 'wonderful product', 'nice value given', '2023-05-08 08:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(25, 7, 13, 'Ajrakh Block Printing Cotton Saree with tessels', 'ITOKRI ENTERPRISES PVT. LTD.', 739, 749, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'Ajrakh Block Printing Cotton Saree with Tassels.webp', 'blouse piece 2.jpg', '2.jpg', 0, 'In Stock', '2023-05-08 05:38:50', NULL),
(26, 7, 14, 'Leheriya Tie-Dye Chanderi Silk Saree with Zari Border', 'ITOKRI ENTERPRISES PVT. LTD.', 349, 359, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'Leheriya Tie-Dye Chanderi Silk Saree with Zari Border.webp', 'blouse piece 3.jpg', '5.webp', 0, 'In Stock', '2023-05-08 05:40:18', NULL),
(27, 7, 15, 'Kutch Bandhani Tie-Dye Pure Banarasi Saree', 'ITOKRI ENTERPRISES PVT. LTD.', 879, 899, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'Kutch Bandhani Tie-Dye Pure Georgette Banarasi Neem Zari Jaal Saree.webp', 'blouse piece 1.jpg', 'Bandhani Sarees.webp', 0, 'Out of Stock', '2023-05-08 05:41:41', NULL),
(28, 7, 16, 'Nandana Indigo Hand Block Print Soft Cotton Saree', 'ITOKRI ENTERPRISES PVT. LTD.', 639, 649, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'Nandana Indigo Dabu Hand Block Print Soft Cotton Saree from Tarapur.webp', 'blouse piece 4.webp', '7.webp', 0, 'In Stock', '2023-05-08 05:43:02', NULL),
(29, 8, 17, 'Organic kala Cotton Pure Handloom Small Buti Fabric', 'ITOKRI ENTERPRISES PVT. LTD.', 899, 999, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'Organic Kala Cotton Pure Handloom Small Buti Fabric.jpg', '1.jpg', '2.jpg', 0, 'In Stock', '2023-05-08 05:45:42', NULL),
(30, 8, 18, 'Banarasi Weaving Brocade Zari with Meena Buti Silk Fabric', 'ITOKRI ENTERPRISES PVT. LTD.', 1199, 1299, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'Banarasi Weaving Brocade Zari with Meena Buti Silk Fabric.jpg', '4.jpg', '3.jpg', 0, 'In Stock', '2023-05-08 05:47:40', NULL),
(31, 8, 19, 'Banarasi Weaving Multi Brocade Silk Fabric', 'ITOKRI ENTERPRISES PVT. LTD.', 1299, 1399, 'Fine quality pure handloom organic made with 100% certified .Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure&nbsp; species remaining in India.<br>', 'Banarasi Weaving Multi Brocade Silk Fabric.jpg', '8.jpg', '7.jpg', 0, 'In Stock', '2023-05-08 05:49:36', NULL),
(32, 8, 20, 'Sanganeri Block Printing Cotton Fabric', 'ITOKRI ENTERPRISES PVT. LTD.', 799, 899, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'Sanganeri Block Printing Cotton Fabric 2.webp', '22.jpg', '11.jpg', 0, 'In Stock', '2023-05-08 05:50:49', NULL),
(33, 9, 25, 'Original pedana kalamkari block print naturak dyed cotton dupatta', 'ITOKRI ENTERPRISES PVT. LTD.', 349, 359, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'AP -Original Pedana Kalamkari Block Printing Natural Dyed Cotton Dupatta.webp', 'AP 2.webp', 'AP 3.webp', 0, 'Out of Stock', '2023-05-08 05:52:54', NULL),
(34, 9, 26, 'Banarasi silk handwoven zari buti dupatta ', 'ITOKRI ENTERPRISES PVT. LTD.', 499, 599, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'Banarasi Silk Handwoven Zari Buti Dupatta with Tassels.webp', 'Banaras 3.webp', 'Banaras 2.jpg', 0, 'In Stock', '2023-05-08 05:54:21', NULL),
(35, 9, 27, 'Handprinted chanderi silk', 'ITOKRI ENTERPRISES PVT. LTD.', 339, 359, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'Bihar-Godna Madhubani Handpainted Chanderi Silk Dupatta.webp', 'bihar 2.jpg', 'Bihar 3.webp', 0, 'In Stock', '2023-05-08 05:56:23', NULL),
(36, 9, 28, 'Leheriya Tie-Dye Mothra kota doria silk dupatta', 'ITOKRI ENTERPRISES PVT. LTD.', 1000, 1100, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'Rajasthan-Leheriya Tie-Dye Mothra Kota Doria Silk Dupatta with Tassels.webp', 'Rajasthan 3.jpg', 'Rajasthan 2.jpg', 0, 'In Stock', '2023-05-08 05:59:09', NULL),
(37, 10, 23, 'Kutch Ajrakh block printing stole', 'ITOKRI ENTERPRISES PVT. LTD.', 449, 459, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'Kutch Ajrakh Block Printing Handwoven Woolen Stole.jpg', 'kutch uttarakhand 3.jpg', 'kutch uttarakhand 2.jpg', 0, 'In Stock', '2023-05-08 06:01:34', NULL),
(38, 10, 22, 'Kullu woolen winter wear zipper hoodie', 'ITOKRI ENTERPRISES PVT. LTD.', 349, 359, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'kullu-Woolen Winter Wear ZIPPER HOODIE Jacket for MEN & Women WITH KULLU PATTI WORK.jpg', 'kullu hoodie 3.jpg', 'kullu hoodie 2.jpg', 0, 'In Stock', '2023-05-08 06:02:33', NULL),
(39, 10, 24, 'yak wool super soft pyjamas', 'ITOKRI ENTERPRISES PVT. LTD.', 779, 789, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'kullu-Yak Wool super Soft Warm Pyjamas WITH KULLU PATTI WORK HandLoomed Luxurious Light large Pyjama.jpg', 'kullu pyjama 3.jpg', 'kullu pyjama 2.jpg', 0, 'In Stock', '2023-05-08 06:04:47', NULL),
(40, 10, 21, 'Kumaun hand-knitted woolen socks for kids', 'ITOKRI ENTERPRISES PVT. LTD.', 229, 249, 'Fine quality pure handloom organic made with 100% certified and it is one of the few genetically pure cotton species remaining in India.<br>', 'uttarakhand-Kumaun Hand-knitted Woolen Socks - Kids.jpg', 'uttarakhand socks 2.jpg', 'uttarakhand socks 3.jpg', 0, 'In Stock', '2023-05-08 06:05:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(13, 7, 'Ajrakh Block Printing', '2023-05-08 05:00:23', NULL),
(14, 7, 'Leheriya Tie-Dye', '2023-05-08 05:00:57', NULL),
(15, 7, 'Kutch Bandhani', '2023-05-08 05:01:08', NULL),
(16, 7, 'Nandana Indigo', '2023-05-08 05:01:20', NULL),
(17, 8, 'Organic Kala', '2023-05-08 05:02:24', NULL),
(18, 8, 'Banarasi weaving (meena)', '2023-05-08 05:02:35', NULL),
(19, 8, 'Banarasi weaving (silk)', '2023-05-08 05:02:44', NULL),
(20, 8, 'Sanganeri fabric', '2023-05-08 05:02:55', NULL),
(21, 10, 'Kumaun Hand-knitted woolen socks', '2023-05-08 05:04:12', NULL),
(22, 10, 'Kullu Hoodie', '2023-05-08 05:04:21', NULL),
(23, 10, 'Kutch ajrakh woolen stole', '2023-05-08 05:05:30', NULL),
(24, 10, 'Kullu yak wool pyjamas', '2023-05-08 05:08:43', NULL),
(25, 9, 'Kalamkari Block Printing', '2023-05-08 05:09:31', NULL),
(26, 9, 'Banaras silk handwoven zari', '2023-05-08 05:10:16', NULL),
(27, 9, 'Chanderi Silk Dupattas', '2023-05-08 05:10:40', NULL),
(28, 9, 'Leheriya Tie-Dye silk dupatta', '2023-05-08 05:11:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1),
(24, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-02-09 22:23:13', NULL, 1),
(25, 'sampath@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-08 06:22:10', '08-05-2023 12:09:54 PM', 1),
(26, 'sampath@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-08 06:44:01', '08-05-2023 01:01:56 PM', 1),
(27, 'sampath@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-08 07:37:32', NULL, 1),
(28, 'gayathri.kangani@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-08 08:44:47', '08-05-2023 02:15:49 PM', 1),
(29, 'gayathri.kangani@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-08 08:52:22', NULL, 1),
(30, 'gayathri.kangani@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-08 09:15:32', '08-05-2023 02:47:07 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'NOWDEMY OFFICIAL', 'Nowdemy@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', 'karachi,khi', 'Sindh', 'Sindh', 110001, 'Sindh area', 'Sindh area', 'SIndh', 110092, '2017-02-04 19:30:50', ''),
(2, 'Amit ', 'amir@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-03-15 17:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2018-04-29 09:30:32', ''),
(4, 'Sai Sampath', 'sampath@gmail.com', 2009200212, '585a32b10bf63cc329536ed8dbcb006a', 'Visakhapatnam', 'Andhra Pradesh', 'Visakhapatnam', 530008, 'Visakhapatnam', 'Andhra Pradesh', 'Visakhapatnam', 530008, '2023-05-08 06:21:36', NULL),
(5, 'gayathri', 'gayathri.kangani@gmail.com', 7989344307, '25f9e794323b453885f5181f1b624d0b', 'Visakhapatnam', 'Andhra Pradesh', 'Visakhapatnam', 530008, 'Visakhapatnam\r\n', 'Andhra Pradesh', 'Visakhapatnam', 530008, '2023-05-08 08:44:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17'),
(3, 4, 26, '2023-05-08 06:39:41'),
(4, 5, 29, '2023-05-08 08:44:56'),
(5, 5, 29, '2023-05-08 08:45:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

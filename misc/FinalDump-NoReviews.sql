-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 28, 2019 at 12:26 AM
-- Server version: 5.7.24
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uptown_index_test`
--
CREATE DATABASE IF NOT EXISTS `uptown_index_test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uptown_index_test`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `accountType` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk`),
  UNIQUE KEY `pk` (`pk`),
  UNIQUE KEY `username` (`username`),
  KEY `accountType` (`accountType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `accounttype`
--

DROP TABLE IF EXISTS `accounttype`;
CREATE TABLE IF NOT EXISTS `accounttype` (
  `typeID` int(11) NOT NULL,
  `typeName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(30) DEFAULT NULL,
  `description` text,
  `beds` int(10) UNSIGNED DEFAULT '0',
  `baths` int(10) UNSIGNED DEFAULT '0',
  `managerName` varchar(30) DEFAULT 'unclaimed',
  `city` varchar(20) DEFAULT 'Oxford',
  `state` varchar(20) DEFAULT 'Ohio',
  `zipCode` varchar(5) DEFAULT '45056',
  `propertyType` enum('HOUSE','APARTMENT') DEFAULT 'HOUSE',
  `name` varchar(50) DEFAULT NULL,
  `occupancy` int(10) UNSIGNED DEFAULT NULL,
  `apt_number` varchar(5) DEFAULT 'NA',
  `photo` varchar(400) NOT NULL DEFAULT '../../uploads/default.png',
  `avgMaintenance` decimal(3,1) UNSIGNED DEFAULT '0.0',
  `avgNeighborhood` decimal(3,1) UNSIGNED DEFAULT '0.0',
  `avgOverall` decimal(3,1) UNSIGNED DEFAULT '0.0',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `pk` (`pk`),
  KEY `managerName` (`managerName`),
  KEY `address` (`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`pk`, `address`, `description`, `beds`, `baths`, `managerName`, `city`, `state`, `zipCode`, `propertyType`, `name`, `occupancy`, `apt_number`, `photo`, `avgMaintenance`, `avgNeighborhood`, `avgOverall`) VALUES
(1, '615 Ogden Court', 'Washer/Dryer in Unit,Cable, High-Speed Internet, Recycling, Trash Removal, Water/Sewer included,Off-Street Parking,Pets Allowed (Cats), Disability Accessible', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'Oxford West Apartments', 2, '0', 'http://img.offcampusimages.com/0EUCjF3kABrYIbTP8csGVqbYMDw=/660x440/left/top/smart/images/7ipjbtftnel7d5ggwkpgttlvn4yys_4ebd4fzijnh5y.jpeg', '5.0', '5.0', '5.0'),
(2, '5262 Brown Road', 'Washer/Dryer in Unit,Cable, High-Speed Internet, Trash Removal included,Off-Street Parking,Pets Allowed (Cats, Dogs)', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'Hawks Landing', 2, '0', 'http://img.offcampusimages.com/brMWlq9pWPjy9UO5Jt4UmLJ1zdc=/660x440/left/top/smart/images/xfxrivelaephjhtooycgihcb0icpc6fzatd5g9z_r7i.jpeg', '5.0', '4.5', '4.8'),
(3, '3770 Southpointe Parkway', 'Washer/Dryer in Unit,Cable, High-Speed Internet, Trash Removal, Water/Sewer included,Off-Street Parking,Pets Allowed (Cats, Dogs)', 2, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'Level 27 Apartments', 2, '0', '../../uploads/default.png', '4.0', '4.0', '4.0'),
(4, '610 Oxford Cmns', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Allowed (Cats, Dogs)', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'The Commons', 4, '0', 'http://img.offcampusimages.com/1yZP7VwZJLV-qfZCuuOxOI6lmOw=/660x440/left/top/smart/images/kyv9bo1vuyjhbglztaomstmu78kemjbx8ktwr1nsixw.jpeg', '3.0', '4.0', '3.5'),
(5, '945 Arrowhead Drive', 'Washer/Dryer in Unit,Cable, High-Speed Internet, Recycling, Trash Removal, Water/Sewer included,Off-Street Parking, On-Street Parking,Pets Not Allowed, Disability Accessible', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'The Verge Apartments', 4, '0', 'http://img.offcampusimages.com/BqGYPUZsAEUL4-bOmFtqU4ey6tw=/660x440/left/top/smart/images/eb1qkexqpazr0bfprbnvxs_9gjavja83ez0kdjiyv6s.jpeg', '3.0', '3.5', '3.3'),
(6, '325 Foxfire Drive', 'Laundry Room in Community,No utilities included in rent,Off-Street Parking,Pets Allowed (Cats, Dogs)', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'Fox & Hounds Apartments', 2, '201', 'http://img.offcampusimages.com/oPIa633IbE8jmZiEXm4cJfTKTH0=/660x440/left/top/smart/images/drmhnuymwwyajznuq_fjmimf2obnzai9ya_gvi24mpo.jpeg', '5.0', '3.0', '4.0'),
(8, '612 South College Avenue', 'Laundry Room in Community,No utilities included in rent,Off-Street Parking,Pets Considered', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'Oxford Square Apartments', 2, '0', 'http://img.offcampusimages.com/D1L6UERGX21vAboRGuzXe5rSLr0=/660x440/left/top/smart/images/warmqiqhgutopr2w1ozgus8jqxaxc0s_8mk9dwhmaja.jpeg', '5.0', '5.0', '5.0'),
(9, '312 N Poplar Street', 'Laundry Room in Community,No utilities included in rent,Off-Street Parking, On-Street Parking,Pets Not Allowed', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 1, '11', 'http://img.offcampusimages.com/fgMH595nblEh646SkN0ITCOfXHU=/660x440/left/top/smart/images/vxrhwqf9cqzpmlwr_vasiynnuaj5ar1oxkkj9loyi9w.jpeg', '2.0', '1.0', '1.5'),
(10, '314 S Poplar St.', 'Laundry Access, Laundry Room in Community,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', 'http://img.offcampusimages.com/4lXYVuhygP4htuynhtt4PNOZEzM=/660x440/left/top/smart/images/cgeittqpys0tk9uotsos4ry7z50aw0raqhoulkz6cw0.jpeg', NULL, NULL, NULL),
(11, '10 West Sycamore St', 'Laundry Access, Laundry Room in Community,Trash Removal included,Off-Street Parking, On-Street Parking,Pets Not Allowed', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 1, '0', 'http://img.offcampusimages.com/TRxrvE56UON2Dj557EoPiHQ4RtA=/660x440/left/top/smart/images/yopfkmmrxyg_5dyzzcjkyy49xi97asqirnx1v48zlts.jpeg', NULL, NULL, NULL),
(12, '717 McGuffey Avenue', 'Washer/Dryer in Unit,Recycling, Trash Removal, Water/Sewer included,Off-Street Parking, On-Street Parking,Pets Not Allowed, Disability Accessible', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 1, 'NA', 'http://img.offcampusimages.com/rx4t_DgWbb1ENxSrmckEtwvJXcc=/660x440/left/top/smart/images/lk8usbfouwc4u_oy_efj2l40qye6xvdr_nwc_1fmees.jpeg', NULL, NULL, NULL),
(13, '514 Brookview Court', 'Washer/Dryer in Unit,No utilities included in rent,Garage Parking, Off-Street Parking, On-Street Parking,Pets Not Allowed, Disability Accessible', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/XqiSyosRzkzgDiBanwiJprlO8h0=/660x440/left/top/smart/images/d8klt7ikf1kyiybs5eiuwet1ncpxe69jw4_fide8rqk.jpeg', NULL, NULL, NULL),
(14, '16 North Elm Street', 'No Laundry in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 1, 'NA', 'http://img.offcampusimages.com/Tgi6qs0gzBzLqzEynCmCpqXWCpw=/248x440/left/top/smart/images/9u3oqw104s3rzkssqvnmycupact9u0dztnbokz246tm.jpeg', NULL, NULL, NULL),
(15, '218 North Poplar Street', 'Laundry Room in Community,No utilities included in rent,Off-Street Parking (parking lot),Pets Not Allowed', 3, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 3, '0', 'http://img.offcampusimages.com/UT9ofLu1vKecXu1AfBm6_Q39KAA=/660x440/left/top/smart/images/ovy6hp1n2igprbptyil5h7gp7ev42k3ndtpb2yjqzcq.jpeg', NULL, NULL, NULL),
(19, '117.5 W High Street', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', 'Alligator Alley', 4, 'NA', '../../uploads/default.png', NULL, NULL, NULL),
(20, '98 W CENTRAL UNIT', 'Washer/Dryer in Unit,Trash Removal included,Off-Street Parking, On-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, 'A', 'http://img.offcampusimages.com/FmG0cyQkqLtFCq_Q-DweQPGAWSo=/660x440/left/top/smart/images/xbid3vlapcw8cloktx5_s636fky_4qwlzgkoo_3qi2k.jpeg', NULL, NULL, NULL),
(21, '212 North Main Street', 'Laundry Room in Community,No utilities included in rent,Off-Street Parking,Pets Allowed (Cats, Dogs)', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'Roberts Apartments', 4, '0', 'http://img.offcampusimages.com/YYbWNfvwDVORg10YCXBDEqhwg-4=/376x440/left/top/smart/images/ygjuwk62mbh41drzep_r5wdp_nkngfufy5szejmjwko.jpeg', NULL, NULL, NULL),
(22, '18 North Elm Street', 'No Laundry in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 1, 'NA', 'http://img.offcampusimages.com/JW5s0yrH5Y1pnUNG43dqBqK6Pog=/660x440/left/top/smart/images/nw7j1ehs51fzmnkdev0mtpx9jqmbvkynac1vzfro_og.jpeg', NULL, NULL, NULL),
(23, '315 South Poplar Street', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 2, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', 'http://img.offcampusimages.com/l5lQm7LNU6SEUA5Fab48mKkF_Rw=/660x440/left/top/smart/images/1_djc7mcovy_hvx2hmljrslvvqctnahv7lkbgsskhki.jpeg', NULL, NULL, NULL),
(24, '110 Wooster Place', 'Laundry Access,No utilities included in rent,Off-Street Parking, On-Street Parking,Pets Not Allowed, Disability Accessible', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 4, '0', 'http://img.offcampusimages.com/UktMk4zsHj4doJcM-qHwDY8-4wM=/660x440/left/top/smart/images/xnjn0wli_uqwxnc9xykbyohpxzg_oh_nomqybj5dsxa.jpeg', NULL, NULL, NULL),
(27, '113 Plum Street', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking (Carport),Pets Considered (Cats, Dogs)', 2, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'Plum Street Apartments', 2, '0', 'http://img.offcampusimages.com/x9LATWbgwRZV3BgT-VPwCWp78bA=/660x440/left/top/smart/images/pgo_jp_ecksk8vxi6yxgffufhlecraxgnug1ujokns4.jpeg', NULL, NULL, NULL),
(28, '216 North Beech Street', 'No Laundry in Unit,Electricity, Trash Removal, Water/Sewer included,On-Street Parking,Pets Not Allowed', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 1, 'NA', 'http://img.offcampusimages.com/eoCQ82i7JhxaZtVmUm8ZaG4iu2I=/660x440/left/top/smart/images/raqxqoyi6wvu2h3fhohnypxzueyield7swjzmmdonyk.jpeg', NULL, NULL, NULL),
(29, '114 West Central Rear Avenue', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/HsOxQKpdGfs9jUzH-knWhsddAHk=/660x440/left/top/smart/images/ztwxwkhfadihte4jfy58b9o8g954zojvhxxu8u_o8kk.jpeg', NULL, NULL, NULL),
(35, '5131 Red Cloud Court', 'Laundry Room in Community,Trash Removal, Water/Sewer included,Off-Street Parking,Pets Allowed (Cats, Dogs), Disability Accessible', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'Indian Trace Apartments', 4, '1', 'http://img.offcampusimages.com/13ZNGic-2jKpC3duMo0yJu3Gqjg=/660x440/left/top/smart/images/e1zrwcra3fc4imx8xpqhkug5u7y_bgcaorpd_rwoabm.jpeg', NULL, NULL, NULL),
(36, '112 West High Street', 'Laundry Access,No utilities included in rent,No Parking,Pets Not Allowed', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 1, '0', 'http://img.offcampusimages.com/U1p4qIXyt9gV2PgyHIXTvsXpDhU=/660x440/left/top/smart/images/kulpwac2x_l42x3mecgm9v29kqsbmtm19f2sybucjho.jpeg', NULL, NULL, NULL),
(37, '103 East Sycamore Street', 'No Laundry in Unit,No utilities included in rent,No Parking,Pets Not Allowed', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 1, 'NA', 'http://img.offcampusimages.com/lwSmr7sFDV8YWKRuWDNRgCscR-s=/376x440/left/top/smart/images/drfsyrcahvztcmguvpdsxqr04l8mvemx3pfmtyomkka.jpeg', NULL, NULL, NULL),
(38, '215 North Main Street', 'Laundry Room in Community,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', 'http://img.offcampusimages.com/MhDTXBzmohI7W0ymeGgMdRSH6KA=/660x440/left/top/smart/images/_uvpgnnmue5pijcaz3pqqyxgpbwpkasglvi_yycd_x8.jpeg', NULL, NULL, NULL),
(39, '311 South Poplar Street', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 2, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', 'http://img.offcampusimages.com/AjEJxMcrfFuWsPDxDk_qWr61-u4=/660x440/left/top/smart/images/_as_9hmwgvukre0msbbci8tewmv2_bgfw5nzauemgl8.jpeg', NULL, NULL, NULL),
(40, '101 East Sycamore Street', 'No Laundry in Unit,Trash Removal, Water/Sewer included,No Parking,Pets Not Allowed', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 1, 'NA', 'http://img.offcampusimages.com/ikNoU7Vjse-Wq9g9iPwvQ5DwIlk=/660x440/left/top/smart/images/mnakdnusop7lb3j3xhoh47n2kyj0wbulhcig3fooerm.jpeg', NULL, NULL, NULL),
(41, '119 East Sycamore Street', 'No Laundry in Unit,No utilities included in rent,No Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/C5mJik-X7-rYt0VghRLyQjshz-M=/660x440/left/top/smart/images/uadmpaivjzjfourbqsathv0kvjiotv_xg_oxpzqz93y.jpeg', NULL, NULL, NULL),
(42, '103 West Vine Street', 'No Laundry in Unit,Electricity, Trash Removal, Water/Sewer included,No Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/tz5EYXxIg-C7NKm-fHrnfK9SD0I=/660x440/left/top/smart/images/kwkylazrld9pen5sv1djxpx0yq1kcndvmyfrsexlc3e.jpeg', NULL, NULL, NULL),
(43, '23 East High Street', 'No Laundry in Unit,No utilities included in rent,No Parking,Pets Not Allowed', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 1, '1', 'http://img.offcampusimages.com/cffGGRjAgvLP3lWY8Ou2RaPGdyI=/290x440/left/top/smart/images/u_j59dgmzlblwqx4wzuuynawrazrwbff_nar1_t0bfw.jpeg', NULL, NULL, NULL),
(44, '699 Melissa Drive', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking, On-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/ZqYM_WqjsEgkzz56ZfwhVBYWKDI=/660x440/left/top/smart/images/a8nhrmau_a5vg2xn97qabap7ngm_qu1rdlgc96aa0xo.jpeg', NULL, NULL, NULL),
(45, '321 North Poplar Street', 'No Laundry in Unit,Trash Removal, Water/Sewer included,No Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/F9PiiXBMgU8phsERQlwlaNqpHg8=/660x440/left/top/smart/images/r_dulrjv96yfotaw_6fadz7tq0d0femgall11erfzfk.png', NULL, NULL, NULL),
(46, '125 Bern Street', 'Laundry Room in Community,Water/Sewer included,Off-Street Parking,Pets Not Allowed', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 4, '0', 'http://img.offcampusimages.com/mi1UEkooZZRowsM9Pa4PcqVRtJ0=/660x440/left/top/smart/images/dfgzwm4uz_g034yfkllkbjxrugzl7hoh1y_09haarhk.jpeg', NULL, NULL, NULL),
(47, '205 East Vine Street', 'Laundry Room in Community,Trash Removal, Water/Sewer included,Off-Street Parking, On-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', 'http://img.offcampusimages.com/yhcp3sgavTFxZ_UezrxXXJiQI_8=/660x440/left/top/smart/images/wlsgyvoovdhjg8jur_mh85zxtn5ucpo35rc3ixuacki.jpeg', NULL, NULL, NULL),
(48, '101 West Vine Street', 'No Laundry in Unit,Electricity, Trash Removal, Water/Sewer included,No Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/AV52MXKk3w61cwoq4hYb-Ov602s=/660x440/left/top/smart/images/h49a_aihmcudvwzmy65kgelvwxvheun0r2ikjnqgrmu.jpeg', NULL, NULL, NULL),
(49, '200 C Foxfire Drive', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/hGR1MGsZbsv0AnszNKKoDhh1maA=/660x440/left/top/smart/images/swddztnbxk0pvnyjogeljf3pr0j9lnilvvvyfp4me2w.jpeg', NULL, NULL, NULL),
(50, '201 South Elm Street', 'No Laundry in Unit,No utilities included in rent,On-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/pTn2nK5gxJY3qVBdyATmb7Tl2pw=/660x440/left/top/smart/images/xkdmacne4pjoxp75df4dpdptqomz0r8kszsr9x97mdu.jpeg', NULL, NULL, NULL),
(51, '410 Bouden Lane', 'No Laundry in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/8wRvRqHdyXQovbdroY889LQug-M=/660x440/left/top/smart/images/hd8bhssipe4fyveauqwevzdrlbkg2ccbqkfrlvk0j0y.jpeg', NULL, NULL, NULL),
(52, '930 Tollgate Drive', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking, On-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/YxuZVp_LV0hIdNmGyawhy6qAV6A=/660x440/left/top/smart/images/iukizzyvhon7jy3b2jkdju5ccvxvcfta75_btmqbspe.jpeg', NULL, NULL, NULL),
(53, '11 East High Street', 'Washer/Dryer in Unit,Trash Removal, Water/Sewer included,No Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', 'http://img.offcampusimages.com/yDdmGcjPOnIfAYhoY6uWu8_cG7k=/348x440/left/top/smart/images/kd_q_ktdivjvoeoucojtxxhk9zfnaeqeyzj3xcorzvo.png', NULL, NULL, NULL),
(54, '2 West Spring Street', 'Washer/Dryer in Unit,Trash Removal, Water/Sewer included,Garage Parking, Off-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '1', 'http://img.offcampusimages.com/q-ah1uic8C_3AQT6Crjo08mZu8I=/660x440/left/top/smart/images/20xafn4nvoagewlkxcagrsiwe95ksyryjvt1ne51kdy.jpeg', NULL, NULL, NULL),
(55, '540 South Campus Avenue', 'Laundry Room in Community, Washer/Dryer in Unit (Remodeled Units Only),Water/Sewer included,Off-Street Parking,Pets Not Allowed', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 4, '0', 'http://img.offcampusimages.com/AFX63bRG1yofRt4UgWOXFsFJbtQ=/660x440/left/top/smart/images/vpzvksbx3u1mdil29nn3vv12tw5k0lhdwnepswugswq.jpeg', NULL, NULL, NULL),
(56, '3 East Spring Street', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', 'Ivy League', 2, 'NA', 'http://img.offcampusimages.com/kMOUQ9qwv6OldAvpf9p0AFZo9wo=/660x440/left/top/smart/images/nssy4cnzkyzjk8ex_abyr9_4ygmzhw2m6072lnvkdgk.jpeg', NULL, NULL, NULL),
(57, '818 South Campus Avenue', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/92XeCaVrO8S3RVwpFIB4853LJcg=/660x440/left/top/smart/images/9wbu1shgeh99xrpxhjqwiujl24eq4ugz84jkmsufbqs.jpeg', NULL, NULL, NULL),
(58, '35 West High Street', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking (1 assigned parking space),Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', 'http://img.offcampusimages.com/SYrNwdszuEtmPIuvziNAaYHrPk4=/660x440/left/top/smart/images/zsgguuko_u9lbzcjqoet8yrfoppwq8vdbqrkkmhdrfw.jpeg', NULL, NULL, NULL),
(59, '39 West High Street', 'No Laundry in Unit,No utilities included in rent,Off-Street Parking (1 assigned parking space),Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', 'http://img.offcampusimages.com/gpZ0YvCaf1966eLwD-0Z7TzTqaY=/660x440/left/top/smart/images/cfnjkxkgvv3dxpnudfe0l1_qjei6a47czoq7waueniu.jpeg', NULL, NULL, NULL),
(61, '930 Tollgate Drive', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking, On-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/YxuZVp_LV0hIdNmGyawhy6qAV6A=/660x440/left/top/smart/images/iukizzyvhon7jy3b2jkdju5ccvxvcfta75_btmqbspe.jpeg', NULL, NULL, NULL),
(69, '217 West Collins Street', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Considered (Cats, Dogs)', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 4, 'A', 'http://img.offcampusimages.com/FSQIpvmDg1oiOziD5bblH7VLRaM=/660x440/left/top/smart/images/zcto6vpmylvdbkwi2ykwjjdi_xmdxwfpxvu_on2haac.jpeg', NULL, NULL, NULL),
(70, '9 West Chestnut', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 2, 'NA', 'http://img.offcampusimages.com/36VQpW2OYmj5ArB5yZwu_k_DIYo=/660x440/left/top/smart/images/ksb7wnjdenk_fe8vtvcybdwwtxfjc_rnovw9rcb6yl0.jpeg', '0.0', '0.0', '0.0'),
(71, '627 South College Avenue', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking (drive way), On-Street Parking,Pets Not Allowed', 3, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 3, 'NA', 'http://img.offcampusimages.com/fLlcIAMgO4NxWPV92M49SxHaHIA=/440x330/left/top/smart/filters:rotate(-90)/images/okzmy48mpesox_ngzfrq8skwpgpw839mkn9le0aljok.jpeg', '0.0', '0.0', '0.0'),
(72, '364 Gaslight Avenue', 'Washer/Dryer in Unit,Trash Removal, Water/Sewer included,On-Street Parking (Newly created street parking),Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', 'http://img.offcampusimages.com/GDEDKQqkBBYT_5rOaMbzwByYCRs=/660x440/left/top/smart/images/5altzchjbzecshe_2tpm6ydgvmgnhg2x5ddgcyazwfk.jpeg', '0.0', '0.0', '0.0'),
(73, '2 West Spring Street', 'Washer/Dryer in Unit,Trash Removal, Water/Sewer included,Garage Parking, Off-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '3', 'http://img.offcampusimages.com/itZeqwELFNibcRshW17zh0iD_hE=/660x440/left/top/smart/images/6_z2q1lpznpbp4f4_oxb33i1ngmyg4ecem9byojobl4.jpeg', '0.0', '0.0', '0.0'),
(74, '416 South Main Street', 'Laundry Room in Community,No utilities included in rent,Off-Street Parking,Pets Considered (Cats, Dogs)', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 4, 'NA', 'http://img.offcampusimages.com/hivpF1H2htz5JGbwRuCeaJCLiZ0=/660x440/left/top/smart/images/eyc_kmwpxuqj15g9nmnfssudsok8gq_e9lmvnxqzj8i.jpeg', '0.0', '0.0', '0.0'),
(75, '136 Northridge Drive', 'Washer/Dryer in Unit,Gas, Local Phone, Recycling, Trash Removal, Water/Sewer included,Off-Street Parking, On-Street Parking,Pets Not Allowed, Disability Accessible', 4, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 4, 'NA', 'http://img.offcampusimages.com/iUZRaNaJKAqBi8RE41sjVvEeSOQ=/660x440/left/top/smart/images/vh1n_io2cmmga4fulfijedegrmhwzkkxia0x_qbthuu.jpeg', '0.0', '0.0', '0.0'),
(76, '612 South Main Street', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Allowed (Cats, Dogs)', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 4, 'NA', '../../uploads/default.png', '0.0', '0.0', '0.0'),
(77, '113 Ardmore Drive', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 3, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 3, 'NA', 'http://img.offcampusimages.com/Jvf8-wDdh6tbVPngSnx0e2i07CE=/660x440/left/top/smart/images/x3jat_hw4qggnom1ey4ribgywzksn4nzuukniifbgb8.jpeg', '0.0', '0.0', '0.0'),
(78, '631 South Locust Street', 'Laundry Access,Gas, Heat, Recycling, Trash Removal included,Off-Street Parking,Pets Not Allowed', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 4, 'NA', 'http://img.offcampusimages.com/lagBorxCZINNT6xyMVhJnbM3Ew4=/660x440/left/top/smart/images/kxutdysglgoqkejafyndzkp9zlxlw5ayuphljqwgesu.jpeg', '0.0', '0.0', '0.0'),
(79, '716 South College Avenue', 'Laundry Access, Laundry Room in Community,Trash Removal included,Garage Parking,Pets Allowed (Cats, Dogs)', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, 'NA', 'http://img.offcampusimages.com/q2YLJOneNq6phY9lh9WaRDf5pmI=/660x440/left/top/smart/images/jdwt4nmdhxf5jspy1umhccy4mfoqyqgjed6hym2r3r4.jpeg', '0.0', '0.0', '0.0'),
(80, '514 South Main Street', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking, On-Street Parking,Pets Not Allowed', 9, 3, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', 'The Great Fratsby', 9, 'NA', 'http://img.offcampusimages.com/FPRQzLw6jHLJ_VNSTr88B16vI88=/660x440/left/top/smart/images/u7j9sssueeqwyt4x4_7qak1p9aphgoviyk08laufals.jpeg', '0.0', '0.0', '0.0'),
(81, '5 East Central Avenue', 'Laundry Access, Laundry Room in Community (4 washers and 4 dryers),Gas, Heat, Recycling, Trash Removal, Water/Sewer included,Off-Street Parking (you will receive a sticker to park in the lot upon request!),Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', 'http://img.offcampusimages.com/p4R2j24z8b2egu6-9J_4hQs7BI0=/660x440/left/top/smart/images/qgofghg_pwqgxgx0bq2bei4k6efx7r_1w3b7xy_8n7m.jpeg', '0.0', '0.0', '0.0'),
(82, '209 Homestead Avenue', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking, On-Street Parking,Pets Not Allowed', 4, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 4, 'NA', 'http://img.offcampusimages.com/WE3K0i_oRcLo64sF9zoMfgCoGdM=/660x440/left/top/smart/images/cghartqetn97ji68z_71qpo_skspn1snakhblvqo9uu.jpeg', '0.0', '0.0', '0.0'),
(83, '714 South Locust Street', 'Washer/Dryer in Unit,Cable, Recycling, Trash Removal, Water/Sewer included,On-Street Parking,Pets Allowed (Cats)', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 1, '0', '../../uploads/default.png', '0.0', '0.0', '0.0'),
(84, '201 East Chestnut Street', 'Laundry Access, Washer/Dryer in Unit,Gas, Heat, High-Speed Internet, Recycling, Trash Removal, Water/Sewer included,Off-Street Parking, On-Street Parking,Pets Not Allowed', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 1, '0', 'http://img.offcampusimages.com/eVeFJeFksj_L9fAwd7eS18mO93A=/660x440/left/top/smart/images/dybfwtqrrr_fhvfky4oglxzka4tjcl9qxnhchnrkqsi.jpeg', '0.0', '0.0', '0.0'),
(85, '518 South Main Street', 'Laundry Room in Community,Gas, Heat, Recycling, Trash Removal, Water/Sewer included,Off-Street Parking,Pets Considered (Cats)', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', '../../uploads/default.png', '0.0', '0.0', '0.0'),
(86, '310 North Beech Street', 'Laundry Access,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 4, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 4, 'NA', 'http://img.offcampusimages.com/wrMPJAebiWULDhAWbgVRxniwzF0=/660x440/left/top/smart/images/ofrrbyo4rwdoaptkknb0uwmwm2liz00limkmjh_sou8.jpeg', '0.0', '0.0', '0.0'),
(87, '16 South Poplar Street', 'Washer/Dryer in Unit,Water/Sewer included,Garage Parking, No Parking, Off-Street Parking, On-Street Parking,Pets Considered', 3, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 3, '0', 'http://img.offcampusimages.com/nJ8C9NUDUe6EL9q5VtHa8_W2jRU=/660x440/left/top/smart/images/jtdri8rwhr_jd1dvhoajwmapt3p08sh9ejzoeavshxq.jpeg', '0.0', '0.0', '0.0'),
(88, '212 N University Ave', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 4, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 4, 'NA', 'http://img.offcampusimages.com/1V1-reR_nukjqA-RDAcmN6-ngrU=/660x440/left/top/smart/images/vojugiweit27bfb_em6g5nl5cuf9rip2ey2j_w7inc0.jpeg', '0.0', '0.0', '0.0'),
(89, '431 Churchill Trl', 'Washer/Dryer in Unit,Cable, Heat, High-Speed Internet, Trash Removal, Water/Sewer included,Off-Street Parking,Pets Allowed (Cats, Dogs)', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'Miami Preserve', 4, '0', 'http://img.offcampusimages.com/4XNbsCkBxm6Am3lxgdG1AVPoxyA=/660x440/left/top/smart/images/fuyjyliiegwfg6gggatvj27qlpenynsmlafjdtcltvy.png', '0.0', '0.0', '0.0'),
(90, '930 Arrowhead Drive', 'Washer/Dryer in Unit,Cable, Gas, Heat, High-Speed Internet, Recycling, Trash Removal, Water/Sewer included,Off-Street Parking, On-Street Parking,Pets Not Allowed', 3, 3, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 3, '0', 'http://img.offcampusimages.com/0BgGPfOo1ZlrxHSXIGHYdu8g-GE=/660x440/left/top/smart/images/ae3fvrce0iv1enqmzrq5v7ecselfwltlzjnkzxsffby.jpeg', '0.0', '0.0', '0.0'),
(91, '20 East Park Place', 'Washer/Dryer in Unit,High-Speed Internet, Recycling, Trash Removal, Water/Sewer included,Off-Street Parking,Pets Considered', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 4, '0', 'http://img.offcampusimages.com/xfbzXoQdydJ5CZ5BLQKjkR_M0sA=/660x440/left/top/smart/images/wu_hybh4bpw8kb3z6ayw5a8np61cevafnuc2utphqfi.png', '0.0', '0.0', '0.0'),
(92, '101 Plum Street', 'Washer/Dryer in Unit,No utilities included in rent,Garage Parking, Off-Street Parking, On-Street Parking,Pets Considered, Disability Accessible', 4, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', 'Liquid Logic', 4, 'NA', '../../uploads/default.png', '0.0', '0.0', '0.0'),
(93, '618 South College Avenue', 'Washer/Dryer in Unit,No utilities included in rent,On-Street Parking,Pets Not Allowed', 4, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 4, 'NA', '../../uploads/default.png', '0.0', '0.0', '0.0'),
(94, '112 East High Street', 'Laundry Access, Washer/Dryer in Unit,High-Speed Internet included,Off-Street Parking,Pets Not Allowed', 4, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'Calista Tower Flats', 4, '0', 'http://img.offcampusimages.com/7gCts7-B-U-Bs3ue0Zvog7kXE6Y=/440x330/left/top/smart/filters:rotate(-90)/images/bni_opeiefrsya21bd0qnq_udka7czys9oeqws_4nmg.jpeg', '0.0', '0.0', '0.0'),
(95, '7 East Spring Street', 'Washer/Dryer in Unit,No utilities included in rent,Off-Street Parking,Pets Not Allowed', 6, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, 11, 'NA', 'http://img.offcampusimages.com/OEwyL7_I-E0W5PWbWrA01VtqrQU=/440x330/left/top/smart/filters:rotate(-90)/images/xnqn_dbjelbyjnnzbiwtlvos0_oftdlwo164m5vnqlc.jpeg', '0.0', '0.0', '0.0'),
(96, '109 South Main Street', 'Laundry Access, Washer/Dryer in Unit,Electricity, Gas, Heat, High-Speed Internet, Recycling, Trash Removal, Water/Sewer included,Off-Street Parking,Pets Not Allowed', 5, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', 'Melee', 5, 'NA', 'http://img.offcampusimages.com/y-Sa-eyTJNQVn5iSsVjufqUHql0=/660x440/left/top/smart/images/qvpmmugleboggcfezmznhzwytguyswew0fqlevloj64.jpeg', '0.0', '0.0', '0.0'),
(97, '119 West Spring Street', 'Laundry Access,Trash Removal, Water/Sewer included,Garage Parking, Off-Street Parking,Pets Considered', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 4, '0', 'http://img.offcampusimages.com/8P7lmjbHxX0_ErSQfoeA09ScjI0=/660x440/left/top/smart/images/hvmusxdvstkblztci4nsi7ogusqz96it4_6wqh1homw.png', '0.0', '0.0', '0.0'),
(98, '1562 Magnolia Drive', 'Washer/Dryer in Unit,Cable, Trash Removal, Water/Sewer included,Off-Street Parking,Pets Allowed, Disability Accessible', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', 'Annex', 4, 'NA', 'http://img.offcampusimages.com/bw2hip3iNyKhhOdbsexZ5o2ZbC8=/660x440/left/top/smart/images/qkkp9av_tuek_5fhkuipcr1vgqdrjc53gdd1fl9this.png', '0.0', '0.0', '0.0'),
(99, '28 1/2 West High Street', 'Washer/Dryer in Unit,Recycling, Trash Removal included,No Parking,Pets Not Allowed', 3, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 4, 'A', 'http://img.offcampusimages.com/yMJxnQefeu56Vq6yUSPjCDSz7wo=/660x440/left/top/smart/images/xssujxs6bg2a_v_qngupimuunzae3fplxn78p6qzkqi.png', '0.0', '0.0', '0.0'),
(100, '11 South Beech Street', 'Laundry Access, Washer/Dryer in Unit,Cable, Electricity, Gas, Heat, High-Speed Internet, Recycling, Trash Removal, Water/Sewer included,Garage Parking, Off-Street Parking, On-Street Parking,Pets Considered, Disability Accessible', 2, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '0', 'http://img.offcampusimages.com/2UyeBlHe6OJNI4crrpQGYv_6kjE=/660x440/left/top/smart/images/a3byrrnuw5lyusgvly5oxmeu0tvmxqd0ivgvlxeucl8.jpeg', '0.0', '0.0', '0.0'),
(101, '329 South College Avenue', 'Washer/Dryer in Unit,No utilities included in rent,Garage Parking, On-Street Parking,Pets Not Allowed, Disability Accessible', 4, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 4, '0', '../../uploads/default.png', '0.0', '0.0', '0.0'),
(102, '35 East High Street', 'Washer/Dryer in Unit,Recycling, Trash Removal included,On-Street Parking,Pets Not Allowed', 4, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 4, 'A', 'http://img.offcampusimages.com/hx1Gj1cFbJFmD8yXBGQuVHnUncM=/327x440/left/top/smart/images/w2mrpy79kyx0wnbpaxfrxotey0qhhobkftikkpe1vk0.png', '0.0', '0.0', '0.0'),
(103, '131 West Spring Street', 'Laundry Access, Washer/Dryer in Unit,Electricity, Gas, Heat, High-Speed Internet, Recycling, Trash Removal, Water/Sewer included,Garage Parking, Off-Street Parking,Pets Not Allowed', 4, 4, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 4, '0', 'http://img.offcampusimages.com/jGNTUknt-cxuFS1fHZRutnWfWMw=/660x440/left/top/smart/images/mdotzhogqn0zgdimvf_rtqaxjodjndcnncp_hg2p6ks.jpeg', '0.0', '0.0', '0.0'),
(104, '21 West High Street', 'Washer/Dryer in Unit,No utilities included in rent,Garage Parking, On-Street Parking,Pets Not Allowed', 2, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, 2, '302', 'http://img.offcampusimages.com/kqfJHtUHwrjC8NNSdVa3Qldz6Z8=/660x440/left/top/smart/images/mzyt2bbj_p13zohqkg6d2fdoo6ynsyhuwylxkobt9ag.png', '0.0', '0.0', '0.0');

-- --------------------------------------------------------

--
-- Table structure for table `realestateagency`
--

DROP TABLE IF EXISTS `realestateagency`;
CREATE TABLE IF NOT EXISTS `realestateagency` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pk`),
  UNIQUE KEY `pk` (`pk`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `realestateagency`
--

INSERT INTO `realestateagency` (`pk`, `name`, `phone`, `url`, `address`, `email`) VALUES
(1, 'unclaimed', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `recommended` enum('Recommend','Do Not Recommend') DEFAULT 'Do Not Recommend',
  `rent` smallint(5) UNSIGNED DEFAULT NULL,
  `maintenance` enum('1','2','3','4','5') DEFAULT NULL,
  `neighborhood` enum('1','2','3','4','5') DEFAULT NULL,
  `body` varchar(300) DEFAULT NULL,
  `propertyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk`),
  KEY `propertyID` (`propertyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`accountType`) REFERENCES `accounttype` (`typeid`);

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `property_ibfk_1` FOREIGN KEY (`managerName`) REFERENCES `realestateagency` (`name`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`propertyID`) REFERENCES `property` (`pk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

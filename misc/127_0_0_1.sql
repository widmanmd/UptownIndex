-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 17, 2019 at 09:25 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

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
  `apt_number` int(10) UNSIGNED DEFAULT '0',
  `photo` varchar(100) NOT NULL DEFAULT 'uploads/default.png',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `pk` (`pk`),
  UNIQUE KEY `address` (`address`),
  KEY `managerName` (`managerName`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`pk`, `address`, `description`, `beds`, `baths`, `managerName`, `city`, `state`, `zipCode`, `propertyType`, `name`, `occupancy`, `apt_number`, `photo`) VALUES
(1, '615 Ogden Court', 'Oxford West Apartments is conveniently located less than one mile from the Miami University campus in Oxford, Ohio and is on two Miami University shuttle bus routes. We offer a variety of one, two, three, and four bedroom apartments and townhomes that can be leased by the bedroom or by the unit. With roommate matching services,  furnished apartment homes, and wonderful amenities, there is no reason to look anywhere else! Oxford West Apartments is a pet friendly community and has washer/dryers in each unit, ample parking, coffee area with WiFi, picnic area, and pool with sundeck.', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, NULL, NULL, 'uploads/default.png'),
(2, '5262 Brown Road', 'Apartments Near Miami University', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, NULL, NULL, 'uploads/default.png'),
(3, '3770 Southpointe Parkway', 'Don\'t miss out on the best deal in Oxford! Large 2 bedroom, 3 private bathroom units fully furnished with an additional room that can be used as a den/game room. Large square footage, washer & dryer included in the unit. Private patios, large parking lot, on site movie theatre, tanning, pool, hot tubs, business center with free color printing, study area, gym, sand volleyball court, large shuttle that runs to the university, Brick Street & Kroger, on site maintenance and much more! Stop in and take a tour to see what you are missing! Ask about our leasing specials for the month!', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(5, '945 Arrowhead Drive', 'N/A', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, NULL, NULL, 'uploads/default.png'),
(7, '325 Foxfire Drive #201', 'Please call for specific move-in dates.', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(8, '610 Oxford Cmns', 'At The Commons your monthly installment includes several extras! Each floor plan features a furniture package, high speed internet, cable and some of your utilities. Start your journey by selecting a floor plan below! Have questions? Call 513.523.7571.', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(10, '612 South College Avenue', 'N/A', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(11, '312 N Poplar Street #11', 'Simply incredible one bedroom.  Must see to believe.', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(12, '314 S Poplar St.', 'Immaculate 2 bedroom loft with hardwood floors.  Gorgeous kitchen with granite counters.  Located on Spring & Poplar just steps from Campus and Uptown.  Excellent Location, and genuinely one of the nicest homes in Oxford.  Each resident will receive one parking space.  Please call for a tour today.  ', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(13, '117.5 W High Street - Uptown', 'Group of female undergraduate students looking for a roommate to share their home for the fall semester. Roommate will have their own bedroom. Uptown Living with parking. Modern unit, updated throughout.  Great 1 semester opportunity. ', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(15, '98 W CENTRAL UNIT #A', 'N/A', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', 'APARTMENT', NULL, NULL, NULL, 'uploads/default.png'),
(17, '212 North Main Street', '2 Bed / 1.5 Bath $6000 per semester. Up to 4 occupants.', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(18, '18 North Elm Street', '1 Bedroom, 1 Bath Duplex', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(19, '10 West Sycamore', 'Large 1 bedroom, 1 bath apartments with walk-in closet, newly renovated kitchen, and fresh paint. Quiet building with laundry facilities and off-street parking. Great neighborhood close to', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(21, '717 McGuffey Avenue', 'Nice quiet building with great location close to Miami University campus. Large 1 bedroom, 1 bath units perfect for graduate students. Laundry facilities. Safe, off-street parking. Water, sewer, trash paid. No pets please.', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(22, '512 / 514 Brookview Court', 'Pretty duplex located in a quiet neighborhood perfect for Miami University graduate students.', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(23, '16 1 / 2 North Elm Street', '1 Bedroom, 1 Bath Cottage', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(24, '218 North Poplar Street', 'Location, location, location! Extremely spacious apartments that are within walking distance to campus and uptown. Furnished option available. One or two bathroom floor plans available.', 3, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(25, '315 South Poplar Street', 'Location, location, location!! Fantastic 2 bedroom/1 bath apartment only a block from campus! Just a few blocks to uptown.', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(26, '110 Wooster Place', 'I am sadly transferring schools to a school in Boston, so I am looking for someone to sublet or take over my lease for this amazing 4 bedroom house/apartments at Miami University. I listed the apartment in what you would be paying per month which is $675, but the payments are due per semester which is $4050 at the beginning of the fall and spring semester. You would be living with 3 other clean, nice, and sweet female junior Miami University student\'s, as well as our neighbors where the apartments are side by side with, are 4 more of our good girl-friends who are Seniors at Miami University. The address of this apartment is 110 Wooster Pl and is building G. As for pricing, per person the apartment is $4050 per semester, but if need be I am willing to negotiate if it means getting this sublet taken over. These houses are practically brand new with stainless steel appliances, an outdoor deck/patio, convenient parking, hardwood floors with carpeted bedrooms, and with pristine location right behind the rec. This location is a 5 minute walk uptown and barely a 3 minute walk to campus so you truly can not beat the location of this apartment! If you have any questions or want any more information please feel free to reach out to me with the contact information listed below.', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(27, '113 Plum Street', 'Across the street from campus!  Updated 2 bedroom/1 bath apartment that is pet-friendly!', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(28, '216 North Beech Street', '1 Bedroom, 1 Bath House', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(29, '114 West Central Rear Avenue', '2 Bedroom, 1 Bath House', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', 'HOUSE', NULL, NULL, NULL, 'uploads/default.png'),
(30, '5131 Red Cloud Court #1', 'Indian Trace offers affordable apartments for students looking for the perfect place to call home in the college town of Oxford. These spacious two- and three-bedroom apartments boast private balconies or patios and lots of windows to enjoy views of the tranquil country surroundings. On top of that, all apartments feature fully-equipped kitchens with dishwasher, lots of closet space, and an additional master vanity for even more added comfort. It\'s also a pet-friendly community, so your furry family member can come along with you.', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(31, '112 West High Street', '1 Bedroom, 1 Bath Apartment on High Street', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(32, '103 East Sycamore Street', '1 Bedroom, 1 Bath Garage Apartment', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(33, '215 North Main Street', 'Location, location, location! Extremely spacious apartments that are within walking distance to campus and uptown. Furnished option available. One or two bathroom floor plans available.', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(34, '311 South Poplar Street', 'Location, location, location! Fabulous 2 bedroom/1 bath apartment one block from campus and only a few blocks to uptown!', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(36, '101 East Sycamore Street', '1 Bedroom, 1 Bath Duplex', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(38, '119 East Sycamore Street', '2 Bedroom, 1 Bath House with lofts', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(39, '103 West Vine Street', '2 Bedroom, 1 Bath Triplex', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(41, '23 East High Street #1', '1 Bedroom, 1 Bath Apartment overlooking High Street!', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(42, '699 Melissa Drive', 'Pretty duplex located in a quiet neighborhood perfect for Miami University graduate students.', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(43, 'Oxford Cmns', 'N/A', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(44, '125 Bern Street', 'N/A', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(45, '205 East Vine Street', 'The Vines', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(46, '101 West Vine Street', '2 Bedroom, 1 Bath Triplex', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(47, '200 C Foxfire Drive', '2 Bedroom, 1 1/2 Bath Townhouse', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(48, '201 South Elm Street', 'Quiet and cozy!  For 1 or 2 people.  Rent is $4,500 per semester based on 1 or 2 occupants.', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(49, '410 Bouden Lane', '2 Bedroom, 1 Bath House', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(50, '930 And 932 Tollgate Drive', 'Pretty duplex located in a quiet neighborhood perfect for Miami University graduate students.', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(51, '11 East High Street', '11 East High Apartments Located Above Steinkeller and Bowtie Barber Club!', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(52, '2 West Spring Street', 'Rachel Apartments', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(53, '540 South Campus Avenue', 'N/A', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(54, '3 East Spring Street', '3 East Spring Street, Unit C. Three blocks to campus, Three blocks to uptown, and Three blocks to shopping. Entire Semester Rent is due at the beginning of each semester. ', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(55, '818 South Campus Avenue', '2 Bedroom, 1 Bath House', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(56, '35 West High Street', '1 Bedroom, 1 Bath Apartment', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(57, '39 West High Street', '1 Bedroom, 1 Bath Apartment', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(59, '217 West Collins Street', 'Large 2 BR unit permitted for 4 people.  Full Kitchen, laundry room, and parking.  Unit B is also available and can also house 4 people in 3 BR\'s for a total of 8 people.  ', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(60, '9 West Chestnut', '2 Bedroom, 1 Bath House', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(61, '627 South College Avenue', 'The house is located right on the miami bus line and is an easy walk to both uptown and the campus. We have a driveway and onstreet parking. We are paying for utilities ourselves, but we are willing to negotiate a lower price for you if it will help. There are three bedrooms, two on the main floor and one upstairs. You will get your own room and have extra storage space in the basement and upstairs closets. Each room can easily fit a queen bed, desk, and dressers with room to spare. We have two full bathrooms, a quaint living room and kitchen, and a porch complete with porch swing! There are hardwood floors in the house, carpeted bedrooms and a little bit of yard space. All the furniture has been purchased for the house and you can decide to furnish your own room or use the furniture provided. ', 3, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(62, '364 Gaslight Avenue', 'Study under the stars on your very own SKYDECK, only at the new Gaslight Avenue at Stewart Square neighborhood development. Every unit is furnished, including washer and dryer in each unit. This newest neighborhood brings its own street parking and plenty of green space. Enjoy the extension of Stewart Square mixed-use shopping center (Patterson\'s Cafe, Hampton Inn, CVS, Luna Blu Salon, Scotty\'s Brewhouse and more) located at the corner of Spring and College. Gaslight provides connectivity to Main Street, and Rose Avenue just blocks from Miami University and Uptown. ', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(64, '416 South Main Street', 'N/A', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(65, '136 Northridge Drive', 'N/A', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(66, '612 South Main Street', 'N/A', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(67, '113 Ardmore Drive', 'Awesome house so close to campus! 3 bedrooms, 1 bathroom, and you would get your own room! The house has a great front deck, fenced back yard, remodeled kitchen and bathroom, hardwood floors, off-street parking, dishwasher, washer & dryer, gas heat, and is right across the street from the rec center!', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(69, '631 South Locust Street', '3 minutes walk to the U3 bus stop; a quiet and safe place;', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(70, '716 South College Avenue', 'N/A', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(71, '514 South Main Street', 'Beautiful house with just a little walk to campus and near by the rec. The house has a beautiful porch area that is well lit and free parking in the driveway or on the street right in front of the house. The bedroom is spacious and the walk in closet is very large and you do not have to share it! The house is very clean, has all hard wood floors, and the kitchen was just refurbished. The house has 8 other very kind and very welcoming girls living in it as well. The price was reduced to $3,000, but is further negotiable! ', 8, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(72, '5 East Central Avenue', 'N/A', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(73, '209 Homestead Avenue', 'N/A', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(74, '714 South Locust Street', 'N/A', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(75, '201 East Chestnut Street', 'This apartment has parking passes available for parking spaces in the parking lot and along the street. The apartment is about a five minute walk to campus with a bus stop directly outside the apartments. Everything is included accept the electric, which is about $30-$40 a month depending. Residents receive a mailbox key and an electronic key that locks both the outer door and the bedroom door. Bathrooms are shared with one other roommate. Kitchen has lots of counter space with a two compartment sink and dishwasher. The dryer and washing machine come with the apartment and are shared with the other roommates in the unit. This is a four bedroom apartment. Currently, there are only two occupants besides myself.  I am looking for someone to fill half of my lease for the spring. There is another bedroom in this unit that hasn¨¹t been filled if you have a roommate you want to live with. Price is negotiable so please contact me with further questions!', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(77, '518 South Main Street', 'Spacious bedrooms with hardwood floors and personal bathrooms! Only utilities that need paid are electricity and Internet, everything else is included in rent. I walk to class daily, and uptown is even closer than campus. Quiet area and neighbors, extremely friendly landlords. Most of the apartment is already furnished, so only furniture for the bedroom and some small stuff for the bathroom will be necessary. The living room and kitchen are furnished and ready to go. The roommate (Justin) is one of my best friends, very easy to get along with. Check out the First Class LLC Properties website for a video tour of an identical apartment!', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(78, 'West Withrow Street', 'N/A', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(79, '310 North Beech Street', 'Four bedroom house looking for one sub leaser for the spring 2019 semester', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(80, '16 South Poplar Street', 'This apartment is a lot like a condo with a great location to uptown Oxford and is completely furnished. This apartment features a contemporary design and a comfortable living space, making your uptown living experience memorable. Appliances are all new and all you have to bring is the stuff for your bedroom/toiletries. ', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(81, '212 N University Ave', 'It is the A Unit of 212 N University. It\'s a 4 bedroom, 1 bathroom house with a living room and a kitchen. There is a private parking lot in the back and a nice lawn in the front. There is also on street parking. There\'s a washer and dryer in the unit, along with stainless steel appliances. The bathroom has both a shower and bath. The house has central air and heat. We are looking for 1 person to sublet for the fall. It\'s in a great location as it is only a short walk to both campus and Uptown.', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(82, '431 Churchill Trl', 'This four bed, four bath apartment is part of the new Miami Preserve apartment complex. It includes laundry, a parking spot, tanning bed, gym and your own bathroom and pantry space. This location is within walking distance of Kroger, Tim Horton\'s and other shopping areas. There is a bus stop nearby and it is within walking distance of uptown. You could be sharing your space with three great female college students and I am willing to provide a discount!', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(83, '322 South Main Street', 'Completely renovated last summer, brand new bathrooms and kitchen', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(84, '930 Arrowhead Drive', 'This is a very nice and recently built apartment with hardwood floors in the main area and carpet in the bedrooms. This unit has four bedrooms and four bathrooms, but only one bedroom/bathroom is available. Each bedroom/bathroom has its own keyed entrance so only you can get in there if you wish. If you are looking to live at The Verge with friends, you are able to transfer this lease to a different unit with the same floor plan. All utilities included except for electric.', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(85, '20 East Park Place', 'A 4 bedroom, 4.5 bath with 3 stories of living space located above Fridge and Pantry and overlooks Oxford\'s uptown east park. Looking to sublet to one student for Fall 2018. Tenant would get their own bedroom and bathroom, including many other amenities: spacious living room, steel appliances, dishwasher, garbage disposal, microwave, central air, washer/dryer, built in closet, ceiling fan, and windows in all bedrooms. Friendly neighbors and roommates - 3 junior year female students! Please reach out if interested - Willing to negotiate!', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(86, '101 Plum Street', 'The house is 4 bed, 2 bath with an unfinished basement and fenced yard with private parking.', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(87, '618 South College Avenue', '618 S College Avenue, or The Beehive, is a four person home set in a quiet and safe neighborhood. Three female housemates will be staying in The Beehive in the 2019 spring semester while the fourth studies abroad. If you are in need of a sublease, this is a great and inexpensive option. Two common rooms, a full kitchen, and a dining room compliment the four bedrooms and two baths. The interior is very clean, fully furnished, and well taken care of. The exterior boasts a covered front porch, large backyard, and firepit. The home is less than a mile from campus and right across the street from a U3 bus stop. The three remaining housemates are kind, respectful people that take pride in taking care of their home and fellow housemates. You will be welcomed and respected if you would like to live at the Beehive.', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(88, '112 East High Street', 'Really good location, close to uptown and campus! Rent Negotiable!! ', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(89, '501 South Poplar Street', 'Emotional support dog lives here, realtors have approved. ', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(90, '7 East Spring Street', 'N/A', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(91, '109 South Main Street', 'This house is located right by Bdubs and 2 blocks from King Library. It is a large, 5 bedroom home with 2 kitchens and 2 bathrooms. There is a large front porch and a small back porch along with a drive way that is shared with the other tenants.', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(92, '119 West Spring Street', 'Secured entrance, granite counter tops, 4 bedrooms each with their own full bathroom, walkable to campus and close to metro stop. Fully furnished, including full size beds.', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(93, '1562 Magnolia Drive', 'Annex is the ultimate, service-driven student living community located less than a mile from campus on 37 sprawling acres with internal walking trails, biking paths and private courtyards. At Annex, our student residents have access to a level of service unparalleled in the market. We provide luxury and convenience from the minute they step foot on the property throughout their residence at our community. ', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(94, '28 West High Street', 'This Uptown apartment is perfect for your spring semester! With it being right on High street, steps away from the action of uptown and only a few blocks from campus. Included is a washer/ dryer, private bedroom, full kitchen, and the best location in Oxford! This apartment is carpeted, each bedroom is filled with natural light, and feels like home. If you\'re looking for a nice apartment with a perfect location, this is just the place for you!', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(95, '11 South Beech Street', 'N/A', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(97, '329 South College Avenue', 'Apartment is fully furnished with all necessary needs. Has parking spot for all 4 teneants. Share bathroom with one person.', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(101, '118 East High Street', 'Tenants: 4', 1, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(103, '109 Bern Street', 'Campus Commons duplexes offer contemporary modern living spaces, ideal for living and entertaining. These spacious units feature open floor plans, private decks and patios, fully equipped kitchens with stainless steel appliances, and generous parking. It has a very convenient location in the quarter, beautiful architectural design, and affordable pricing. ', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(105, '35 East High Street', 'New unit, right across the street from Brick Street Bar and right above Wild Bistro. Large living space with high ceilings, kitchen with a lot of counter space, two full bathrooms, laundry machine, and medium sized bedrooms.', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(106, '131 West Spring Street', 'N/A', 4, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(107, '21 West High Street', 'Great apartment right in Uptown!', 2, NULL, NULL, 'Oxford', 'Ohio', '45056', NULL, NULL, NULL, NULL, 'uploads/default.png'),
(110, '100 Imaginary Lane', 'asdfgh', 4, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', 'A Fake House', 4, 0, 'uploads/default.png'),
(111, '104 Imaginary Lane', 'asdfghjuytredvbhytr', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'A Fake Apartment', 1, 0, 'uploads/default.png'),
(112, '110 Somewhere Ave', 'qwertyuiop', 3, 2, 'unclaimed', 'Oxford', 'Ohio', '45056', 'HOUSE', 'Does This Place Exist?', 4, 0, 'uploads/default.png'),
(130, '10 W Sycamore St', 'qwerty', 1, 1, 'unclaimed', 'Oxford', 'Ohio', '45056', 'APARTMENT', 'Hello', 1, 0, 'uploads/1552846183apple.png');

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
  `recommended` tinyint(1) DEFAULT NULL,
  `rent` smallint(5) UNSIGNED DEFAULT NULL,
  `maintenance` enum('1','2','3','4','5') DEFAULT NULL,
  `neighborhood` enum('1','2','3','4','5') DEFAULT NULL,
  `body` varchar(300) DEFAULT NULL,
  `propertyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk`),
  KEY `propertyID` (`propertyID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`pk`, `recommended`, `rent`, `maintenance`, `neighborhood`, `body`, `propertyID`) VALUES
(1, 0, 500, '5', '5', 'Great property!', 3),
(2, 0, 9999, '1', '1', 'Too Expensive!', 3),
(3, 0, 4, '5', NULL, 'Incredibly Cheap!', 3),
(4, 0, 4, '5', '5', 'Incredibly cheap!', 3),
(5, NULL, 0, NULL, NULL, '', 3);

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

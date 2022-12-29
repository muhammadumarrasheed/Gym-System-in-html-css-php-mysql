-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 03:41 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gymsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `mobile`, `password`) VALUES
(1, 'gym', 'gym@gmail.com', '03453456234', 'gym');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `classid` int(11) NOT NULL,
  `classname` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`classid`, `classname`) VALUES
(1, 'Zumba'),
(2, 'UPPER BODY BLAST'),
(3, 'FLEXI-STRETCH');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `name`) VALUES
(1, 'Dumbbells'),
(2, 'Treadmill'),
(3, 'Cycle'),
(4, 'Weight plates'),
(5, 'Storage racks');

-- --------------------------------------------------------

--
-- Table structure for table `fitness`
--

CREATE TABLE `fitness` (
  `userEmail` varchar(50) NOT NULL,
  `fitnessstatus` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fitness`
--

INSERT INTO `fitness` (`userEmail`, `fitnessstatus`) VALUES
('khan@gmail.com', 'Unavailabe'),
('muneeb@gmail.com', 'Weak muscles'),
('umar@gmail.com', 'Unavailabe'),
('zain@gmail.com', 'Unavailabe');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `packageid` int(11) NOT NULL,
  `packagename` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`packageid`, `packagename`) VALUES
(1, '6 month: Rs. 8000'),
(2, '3 month: Rs. 4500'),
(3, '1 month: Rs. 2000');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `userEmail` varchar(50) NOT NULL,
  `planname` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`userEmail`, `planname`) VALUES
('khan@gmail.com', 'Unavailabe'),
('muneeb@gmail.com', 'FISH LIKE SALMON, TUNA AND TILAPIA.'),
('umar@gmail.com', 'Fruits and vegetables, whole grains, healthy (unsaturated) fats, and healthy protein'),
('zain@gmail.com', 'Unavailabe');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `sessionid` int(11) NOT NULL,
  `sessionname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`sessionid`, `sessionname`) VALUES
(1, 'Morning 9AM-2PM'),
(2, 'Evening 4PM-12AM');

-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `traineremail` varchar(50) NOT NULL,
  `trainername` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneNum` varchar(50) NOT NULL,
  `postacode` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `streetID` varchar(50) NOT NULL,
  `houseNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trainer`
--

INSERT INTO `trainer` (`traineremail`, `trainername`, `password`, `phoneNum`, `postacode`, `city`, `streetID`, `houseNum`) VALUES
('ishaq@gmail.com', 'ishaq', 'ishaq', '3338389', '435', 'isbfg', '12', 1),
('none@gmail.com', 'None', 'none', 'none', 'none', 'none', 'none', 0),
('saad@gmail.com', 'Saad', 'saaad123', '03427823789', '5600', 'Rawalpindi', 'Sadar, lane 10, street 6', 9);

-- --------------------------------------------------------

--
-- Table structure for table `trainerpayment`
--

CREATE TABLE `trainerpayment` (
  `trainerEmail` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userEmail` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneNum` varchar(50) NOT NULL,
  `postacode` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `streetID` int(11) NOT NULL,
  `houseNum` int(11) NOT NULL,
  `sessionid` int(11) NOT NULL,
  `packageid` int(11) NOT NULL,
  `classid` int(11) NOT NULL,
  `trainerEmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userEmail`, `name`, `password`, `phoneNum`, `postacode`, `city`, `streetID`, `houseNum`, `sessionid`, `packageid`, `classid`, `trainerEmail`) VALUES
('khan@gmail.com', 'khan', '0000000000', '9999999999999', '4444', 'kashir', 3, 3, 2, 2, 1, 'none@gmail.com'),
('muneeb@gmail.com', 'Muneeb Arshad', '42389', '03457823674', '5600', 'Rawalpindi', 0, 21, 1, 3, 3, 'saad@gmail.com'),
('umar@gmail.com', 'Umar', '12345', '03452378453', '4500', 'Sialkot', 7, 12, 1, 3, 2, 'none@gmail.com'),
('zain@gmail.com', 'Zain', '12313', '03457834567', '5500', 'RWP', 34, 12, 1, 1, 1, 'none@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `userpayment`
--

CREATE TABLE `userpayment` (
  `userEmail` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userpayment`
--

INSERT INTO `userpayment` (`userEmail`, `status`, `date`) VALUES
('umar@gmail.com', 'Done', '2022-06-14'),
('muneeb@gmail.com', 'UnDone', '2022-06-16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`classid`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fitness`
--
ALTER TABLE `fitness`
  ADD PRIMARY KEY (`userEmail`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`packageid`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`userEmail`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sessionid`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`traineremail`);

--
-- Indexes for table `trainerpayment`
--
ALTER TABLE `trainerpayment`
  ADD KEY `Fk4` (`trainerEmail`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userEmail`),
  ADD KEY `Fk8` (`classid`),
  ADD KEY `fk9` (`packageid`),
  ADD KEY `fk7` (`sessionid`),
  ADD KEY `fk6` (`trainerEmail`);

--
-- Indexes for table `userpayment`
--
ALTER TABLE `userpayment`
  ADD KEY `fk3` (`userEmail`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fitness`
--
ALTER TABLE `fitness`
  ADD CONSTRAINT `Fk2` FOREIGN KEY (`userEmail`) REFERENCES `user` (`userEmail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `Fk1` FOREIGN KEY (`userEmail`) REFERENCES `user` (`userEmail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trainerpayment`
--
ALTER TABLE `trainerpayment`
  ADD CONSTRAINT `Fk4` FOREIGN KEY (`trainerEmail`) REFERENCES `trainer` (`traineremail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `Fk8` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk6` FOREIGN KEY (`trainerEmail`) REFERENCES `trainer` (`traineremail`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk7` FOREIGN KEY (`sessionid`) REFERENCES `session` (`sessionid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk9` FOREIGN KEY (`packageid`) REFERENCES `package` (`packageid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userpayment`
--
ALTER TABLE `userpayment`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`userEmail`) REFERENCES `user` (`userEmail`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

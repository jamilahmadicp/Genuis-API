-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2021 at 09:01 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `geniusdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookid` int(11) NOT NULL,
  `book_name` varchar(20) NOT NULL,
  `book_class` int(11) NOT NULL,
  `book_edition` int(11) NOT NULL,
  `book_price` int(11) NOT NULL,
  `book_pdf` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `corrections`
--

CREATE TABLE `corrections` (
  `userid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `date` date NOT NULL,
  `correction` varchar(100) NOT NULL,
  `page_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `home_delivery`
--

CREATE TABLE `home_delivery` (
  `requestid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` float NOT NULL,
  `house_no` varchar(5) NOT NULL,
  `street` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `questions_bank`
--

CREATE TABLE `questions_bank` (
  `questionid` int(11) NOT NULL,
  `question` varchar(150) NOT NULL,
  `option_a` varchar(30) NOT NULL,
  `option_b` varchar(30) NOT NULL,
  `option_c` varchar(30) NOT NULL,
  `option_d` varchar(30) NOT NULL,
  `correct_option` int(11) NOT NULL,
  `solution` varchar(300) NOT NULL,
  `subject` varchar(10) NOT NULL,
  `grade` int(11) NOT NULL,
  `chapter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `Role` varchar(10) NOT NULL,
  `institute` varchar(30) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `uname`, `user_name`, `password`, `gender`, `grade`, `Role`, `institute`, `contact`) VALUES
(2, 'ahmad', 'Jamil_Ahmad', 'abc123', 'male', '12', 'student', 'Islamia College', '0310-8841574');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookid`);

--
-- Indexes for table `corrections`
--
ALTER TABLE `corrections`
  ADD KEY `userid` (`userid`,`bookid`),
  ADD KEY `bookid` (`bookid`);

--
-- Indexes for table `home_delivery`
--
ALTER TABLE `home_delivery`
  ADD PRIMARY KEY (`requestid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `userid_2` (`userid`,`bookid`),
  ADD KEY `bookid` (`bookid`);

--
-- Indexes for table `questions_bank`
--
ALTER TABLE `questions_bank`
  ADD PRIMARY KEY (`questionid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_delivery`
--
ALTER TABLE `home_delivery`
  MODIFY `requestid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `questions_bank`
--
ALTER TABLE `questions_bank`
  MODIFY `questionid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `corrections`
--
ALTER TABLE `corrections`
  ADD CONSTRAINT `corrections_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `corrections_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`);

--
-- Constraints for table `home_delivery`
--
ALTER TABLE `home_delivery`
  ADD CONSTRAINT `home_delivery_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `home_delivery_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

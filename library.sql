-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2018 at 12:03 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_ID` int(11) NOT NULL,
  `author_first_name` varchar(25) NOT NULL,
  `author_last_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_ID`, `author_first_name`, `author_last_name`) VALUES
(101, 'paolo', 'coelho'),
(102, 'salman', 'rushdi'),
(103, 'fyodor', 'Dostoyevsky'),
(104, 'leo', 'tolstoy'),
(105, ' Ernest', 'Hemingway');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_ID` int(11) NOT NULL,
  `book_title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_ID`, `book_title`) VALUES
(1, 'alchemist'),
(2, 'satanic verses'),
(3, 'the idiot'),
(4, 'war and peace'),
(5, 'the old man and the sea');

-- --------------------------------------------------------

--
-- Table structure for table `book_author`
--

CREATE TABLE `book_author` (
  `book_author_ID` int(11) NOT NULL,
  `book_ID` int(11) NOT NULL,
  `author_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_author`
--

INSERT INTO `book_author` (`book_author_ID`, `book_ID`, `author_ID`) VALUES
(201, 1, 101),
(202, 2, 102),
(203, 3, 103),
(204, 4, 104),
(205, 5, 105);

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

CREATE TABLE `chapter` (
  `book_ID` int(11) NOT NULL,
  `chapter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`book_ID`, `chapter`) VALUES
(1, 12),
(2, 16),
(3, 11),
(4, 10),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `book_ID` int(11) NOT NULL,
  `genre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`book_ID`, `genre`) VALUES
(1, 'adventure'),
(2, 'Magical Realism'),
(3, 'Philosophical fiction'),
(4, 'Historical Fiction'),
(5, 'Literary fiction');

-- --------------------------------------------------------

--
-- Table structure for table `page_number`
--

CREATE TABLE `page_number` (
  `book_ID` int(11) NOT NULL,
  `page_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page_number`
--

INSERT INTO `page_number` (`book_ID`, `page_number`) VALUES
(1, 200),
(2, 300),
(3, 700),
(4, 1000),
(5, 150);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_ID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_ID`);

--
-- Indexes for table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`book_author_ID`),
  ADD KEY `author_ID` (`author_ID`),
  ADD KEY `book_ID` (`book_ID`);

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
  ADD KEY `book_ID` (`book_ID`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD KEY `book_ID` (`book_ID`);

--
-- Indexes for table `page_number`
--
ALTER TABLE `page_number`
  ADD KEY `book_ID` (`book_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_ID` FOREIGN KEY (`book_ID`) REFERENCES `book` (`book_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`book_ID`) REFERENCES `book` (`book_ID`),
  ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_ID`) REFERENCES `author` (`author_ID`);

--
-- Constraints for table `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`book_ID`) REFERENCES `book` (`book_ID`);

--
-- Constraints for table `genre`
--
ALTER TABLE `genre`
  ADD CONSTRAINT `genre_ibfk_1` FOREIGN KEY (`book_ID`) REFERENCES `book` (`book_ID`);

--
-- Constraints for table `page_number`
--
ALTER TABLE `page_number`
  ADD CONSTRAINT `page_number_ibfk_1` FOREIGN KEY (`book_ID`) REFERENCES `book` (`book_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

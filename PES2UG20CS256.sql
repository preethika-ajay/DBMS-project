-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2022 at 04:27 PM
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
-- Database: `dbms_proj_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `Doctor_ID` int(11) NOT NULL,
  `Doctor_Name` varchar(20) NOT NULL,
  `organization_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`Doctor_ID`, `Doctor_Name`, `organization_ID`) VALUES
(1, 'Doctor-1', 12),
(2, 'Doctor-2', 10),
(3, 'Doctor-3', 1),
(4, 'Doctor-4', 6),
(5, 'Doctor-5', 11),
(6, 'Doctor-6', 9),
(7, 'Doctor-7', 5),
(8, 'Doctor-8', 4),
(9, 'Doctor-9', 7),
(10, 'Doctor-10', 3),
(11, 'Doctor-11', 8),
(12, 'Doctor-12', 2),
(13, 'Doctor-13', 13),
(14, 'Doctor-14', 15),
(15, 'Doctor-15', 14);

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `Donor_ID` int(11) NOT NULL,
  `organ_donated` varchar(20) NOT NULL,
  `reason_of_donation` varchar(20) DEFAULT NULL,
  `Organization_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`Donor_ID`, `organ_donated`, `reason_of_donation`, `Organization_ID`, `User_ID`) VALUES
(1, 'Heart', 'Reason-1', 7, 8),
(2, 'Pancreas', 'Reason-2', 9, 6),
(3, 'Pancreas', 'Reason-3', 1, 14),
(4, 'Intestine', 'Reason-4', 6, 9),
(5, 'Kidney', 'Reason-5', 8, 7),
(6, 'Pancreas', 'Reason-6', 2, 13),
(7, 'Kidney', 'Reason-7', 5, 10),
(8, 'Kidney', 'Reason-8', 3, 12),
(9, 'Heart', 'Reason-9', 15, 15),
(10, 'Heart', 'Reason-10', 4, 11),
(11, 'Kidney', 'Reason-11', 11, 4),
(12, 'Pancreas', 'Reason-12', 4, 12),
(13, 'Pancreas', 'Reason-13', 12, 3),
(14, 'Pancreas', 'Reason-14', 10, 5),
(15, 'Heart', 'Reason-15', 5, 4),
(16, 'Intestine', 'Reason-16', 14, 1),
(17, 'Intestine', 'Reason-17', 13, 2),
(18, 'Intestine', 'Reason-18', 2, 7),
(19, 'Pancreas', 'Reason-19', 9, 9),
(20, 'Intestine', 'Reason-20', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `Organization_ID` int(11) NOT NULL,
  `Organization_name` varchar(20) NOT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `Government_approved` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`Organization_ID`, `Organization_name`, `Location`, `Government_approved`) VALUES
(1, 'Organization-1', 'New Delhi', 1),
(2, 'Organization-2', 'Mumbai', 0),
(3, 'Organization-3', 'Kolkata', 0),
(4, 'Organization-4', 'Kolkata', 1),
(5, 'Organization-5', 'Ahmedabad', 1),
(6, 'Organization-6', 'Kolkata', 0),
(7, 'Organization-7', 'Kolkata', 0),
(8, 'Organization-8', 'Ahmedabad', 0),
(9, 'Organization-9', 'Kolkata', 1),
(10, 'Organization-10', 'Ahmedabad', 1),
(11, 'Organization-11', 'Ahmedabad', 1),
(12, 'Organization-12', 'Mumbai', 0),
(13, 'Organization-13', 'Kolkata', 0),
(14, 'Organization-14', 'Ahmedabad', 1),
(15, 'Organization-15', 'Ahmedabad', 0);

-- --------------------------------------------------------

--
-- Table structure for table `organ_available`
--

CREATE TABLE `organ_available` (
  `Organ_ID` int(11) NOT NULL,
  `Organ_name` varchar(20) NOT NULL,
  `Donor_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organ_available`
--

INSERT INTO `organ_available` (`Organ_ID`, `Organ_name`, `Donor_ID`) VALUES
(1, 'Heart', 9),
(2, 'Pancreas', 4),
(3, 'Pancreas', 5),
(4, 'Intestine', 6),
(5, 'Kidney', 12),
(6, 'Pancreas', 8),
(7, 'Kidney', 3),
(8, 'Kidney', 11),
(9, 'Heart', 1),
(10, 'Heart', 10),
(11, 'Kidney', 13),
(12, 'Pancreas', 2),
(13, 'Pancreas', 7),
(14, 'Pancreas', 14),
(15, 'Heart', 15),
(16, 'Intestine', 3),
(17, 'Intestine', 9),
(18, 'Intestine', 7),
(19, 'Pancreas', 6);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `Patient_ID` int(11) NOT NULL,
  `organ_req` varchar(20) NOT NULL,
  `reason_of_procurement` varchar(20) DEFAULT NULL,
  `Doctor_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`Patient_ID`, `organ_req`, `reason_of_procurement`, `Doctor_ID`, `User_ID`) VALUES
(1, 'Heart', 'Reason-1', 3, 12),
(2, 'Kidney', 'Reason-2', 2, 13),
(3, 'Pancreas', 'Reason-3', 7, 8),
(4, 'Kidney', 'Reason-4', 8, 7),
(5, 'Heart', 'Reason-5', 4, 11),
(6, 'Lung', 'Reason-6', 1, 14),
(7, 'Intestine', 'Reason-7', 10, 5),
(8, 'Intestine', 'Reason-8', 12, 3),
(9, 'Lung', 'Reason-9', 11, 4),
(10, 'Kidney', 'Reason-13', 6, 9),
(11, 'Kidney', 'Reason-11', 9, 6),
(12, 'Pancreas', 'Reason-12', 5, 10),
(13, 'Intestine', 'Reason-13', 13, 2),
(14, 'Heart', 'Reason-14', 14, 1),
(15, 'Kidney', 'Reason-15', 15, 15);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `Medical_insurance` int(11) DEFAULT NULL,
  `Medical_history` varchar(20) DEFAULT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Phno_user` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `Name`, `Date_of_Birth`, `Medical_insurance`, `Medical_history`, `Street`, `City`, `State`, `Phno_user`) VALUES
(1, 'Name-1', '1978-08-21', 1, 'NIL', 'Street-1', 'New Delhi', 'Delhi', '1212121212'),
(2, 'Name-2', '1975-12-10', 0, 'NIL', 'Street-2', 'Mumbai', 'Maharashtra', '2121212121'),
(3, 'Name-3', '1976-06-04', 0, 'NIL', 'Street-3', 'Mumbai', 'Maharashtra', '2323232323'),
(4, 'Name-4', '1985-10-13', 1, 'NIL', 'Street-4', 'Ahmedabad', 'Gujarat', '3232323232'),
(5, 'Name-5', '1983-10-12', 1, 'NIL', 'Street-5', 'Kolkata', 'West Bengal', '3434343434'),
(6, 'Name-6', '1977-01-18', 1, 'NIL', 'Street-6', 'Kolkata', 'West Bengal', '4343434343'),
(7, 'Name-7', '1976-02-26', 0, 'NIL', 'Street-7', 'New Delhi', 'Delhi', '4545454545'),
(8, 'Name-8', '1973-04-12', 1, 'NIL', 'Street-8', 'Mumbai', 'Maharashtra', '5454545454'),
(9, 'Name-9', '1976-11-01', 0, 'NIL', 'Street-9', 'Mumbai', 'Maharashtra', '5656565656'),
(10, 'Name-10', '1978-11-18', 1, 'NIL', 'Street-10', 'New Delhi', 'Delhi', '6565656565'),
(11, 'Name-11', '1975-01-06', 1, 'NIL', 'Street-11', 'Mumbai', 'Maharashtra', '6767676767'),
(12, 'Name-12', '1983-11-01', 1, 'NIL', 'Street-12', 'Mumbai', 'Maharashtra', '7676767676'),
(13, 'Name-13', '1983-01-09', 1, 'NIL', 'Street-13', 'New Delhi', 'Delhi', '7878787878'),
(14, 'Name-14', '1975-10-12', 1, 'NIL', 'Street-14', 'Mumbai', 'Maharashtra', '8787878787'),
(15, 'Name-15', '1977-09-23', 0, 'NIL', 'Street-15', 'Ahmedabad', 'Gujarat', '8989898989');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doctor_ID`),
  ADD KEY `organization_ID` (`organization_ID`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`Donor_ID`,`organ_donated`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Organization_ID` (`Organization_ID`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`Organization_ID`);

--
-- Indexes for table `organ_available`
--
ALTER TABLE `organ_available`
  ADD PRIMARY KEY (`Organ_ID`),
  ADD KEY `Donor_ID` (`Donor_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_ID`,`organ_req`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Doctor_ID` (`Doctor_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `organ_available`
--
ALTER TABLE `organ_available`
  MODIFY `Organ_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`organization_ID`) REFERENCES `organization` (`Organization_ID`) ON DELETE CASCADE;

--
-- Constraints for table `donor`
--
ALTER TABLE `donor`
  ADD CONSTRAINT `donor_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `donor_ibfk_2` FOREIGN KEY (`Organization_ID`) REFERENCES `organization` (`Organization_ID`) ON DELETE CASCADE;

--
-- Constraints for table `organ_available`
--
ALTER TABLE `organ_available`
  ADD CONSTRAINT `organ_available_ibfk_1` FOREIGN KEY (`Donor_ID`) REFERENCES `donor` (`Donor_ID`) ON DELETE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctor` (`Doctor_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

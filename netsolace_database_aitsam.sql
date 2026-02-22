-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2025 at 11:56 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `netsolace_database_aitsam`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `AttendanceID` varchar(50) NOT NULL,
  `EmployeeID` varchar(50) NOT NULL,
  `DeviceID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time_IN` time NOT NULL,
  `Time_OUT` time DEFAULT NULL,
  `Verification_Type` varchar(50) DEFAULT NULL CHECK (`Verification_Type` in ('RFID','PIN','Fingerprint'))
) ;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`AttendanceID`, `EmployeeID`, `DeviceID`, `Date`, `Time_IN`, `Time_OUT`, `Verification_Type`) VALUES
('ATT-001', 'EMP-001', 1, '2025-11-01', '08:55:00', '17:05:00', 'Fingerprint'),
('ATT-002', 'EMP-001', 1, '2025-11-02', '09:00:00', '17:10:00', 'RFID'),
('ATT-003', 'EMP-001', 3, '2025-11-03', '08:45:00', '17:00:00', 'PIN'),
('ATT-004', 'EMP-002', 1, '2025-11-01', '09:15:00', '17:30:00', 'PIN'),
('ATT-009', 'EMP-006', 1, '2025-11-01', '08:50:00', '17:00:00', 'RFID'),
('ATT-010', 'EMP-006', 1, '2025-11-02', '08:55:00', '17:05:00', 'RFID'),
('ATT-011', 'EMP-007', 2, '2025-11-01', '07:45:00', '16:15:00', 'Fingerprint'),
('ATT-012', 'EMP-007', 2, '2025-11-02', '07:50:00', '16:00:00', 'Fingerprint'),
('ATT-013', 'EMP-008', 1, '2025-11-01', '09:00:00', '17:30:00', 'PIN'),
('ATT-014', 'EMP-009', 3, '2025-11-01', '10:00:00', '19:00:00', 'Fingerprint'),
('ATT-015', 'EMP-010', 1, '2025-11-01', '10:15:00', '17:00:00', 'RFID');

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `DeviceID` int(11) NOT NULL,
  `DeviceName` varchar(100) NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL CHECK (`Status` in ('Active','Maintenance','Offline'))
) ;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`DeviceID`, `DeviceName`, `Location`, `Status`) VALUES
(1, 'Main Entrance Unit', 'Reception', 'Active'),
(2, 'Warehouse Gate 1', 'Warehouse A', 'Active'),
(3, 'Server Room Scanner', 'IT Dept', 'Maintenance'),
(4, 'Rear Exit Unit', 'Parking Lot', 'Active'),
(5, 'Main Entrance Unit', 'Reception', 'Active'),
(6, 'Warehouse Gate 1', 'Warehouse A', 'Active'),
(7, 'Server Room Scanner', 'IT Dept', 'Maintenance'),
(8, 'Rear Exit Unit', 'Parking Lot', 'Active'),
(9, 'Main Entrance Unit', 'Reception', 'Active'),
(10, 'Warehouse Gate 1', 'Warehouse A', 'Active'),
(11, 'Server Room Scanner', 'IT Dept', 'Maintenance'),
(12, 'Rear Exit Unit', 'Parking Lot', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Department` varchar(50) DEFAULT NULL
) ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `FirstName`, `LastName`, `Email`, `Department`) VALUES
('EMP-001', 'Hamza', 'Khursheed', 'hamza@netsolace.com', 'IT'),
('EMP-002', 'Sarah', 'Virk', 'sarah@netsolace.com', 'HR'),
('EMP-003', 'Michael', 'Andrew', 'm.andrew@netsolace.com', 'Operations'),
('EMP-004', 'Annashia', 'Mahmood', 'annashia@netsolace.com', 'Finance'),
('EMP-005', 'Aitsam', 'Mahmood', 'aitsam@netsolace.com', 'IT'),
('EMP-006', 'Ali', 'Kaif', 'ali.k@netsolace.com', 'Marketing'),
('EMP-007', 'Rajab', 'Ishfaq', 'rajab@netsolace.com', 'Operations'),
('EMP-008', 'Sobia', 'Asghar', 'jannat@netsolace.com', 'Finance'),
('EMP-009', 'Zoha', 'Farooq', 'zoha.f@netsolace.com', 'IT'),
('EMP-010', 'Mir', 'Wajid', 'm.wajid@netsolace.com', 'HR');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `SalaryID` varchar(50) NOT NULL,
  `EmployeeID` varchar(50) NOT NULL,
  `Month_Year` varchar(20) NOT NULL,
  `TotalDaysWorked` int(11) DEFAULT 0,
  `Hourly_Rate` decimal(10,2) NOT NULL,
  `Final_CalculatedSalary` decimal(10,2) DEFAULT NULL
) ;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`SalaryID`, `EmployeeID`, `Month_Year`, `TotalDaysWorked`, `Hourly_Rate`, `Final_CalculatedSalary`) VALUES
('SAL-001', 'EMP-003', 'Nov-2025', 20, 25.00, 4400.00),
('SAL-002', 'EMP-002', 'Nov-2025', 20, 22.50, 3600.00),
('SAL-003', 'EMP-003', 'Nov-2025', 23, 20.00, 3680.00),
('SAL-004', 'EMP-004', 'Nov-2025', 21, 30.00, 5040.00),
('SAL-005', 'EMP-005', 'Nov-2025', 13, 25.00, 3000.00),
('SAL-006', 'EMP-006', 'Nov-2025', 22, 28.00, 4928.00),
('SAL-007', 'EMP-007', 'Nov-2025', 24, 20.00, 3840.00),
('SAL-008', 'EMP-008', 'Nov-2025', 20, 35.00, 5600.00),
('SAL-009', 'EMP-009', 'Nov-2025', 21, 30.00, 5040.00),
('SAL-010', 'EMP-010', 'Nov-2025', 18, 25.00, 3600.00),
('SAL001', 'EMP-001', 'Nov-2025', 22, 25.00, 5500.00);

-- --------------------------------------------------------

--
-- Table structure for table `users_credentials`
--

CREATE TABLE `users_credentials` (
  `CredentialID` varchar(50) NOT NULL,
  `EmployeeID` varchar(50) NOT NULL,
  `RFID_Tag` varchar(100) NOT NULL,
  `PIN_Code` varchar(255) NOT NULL,
  `Fingerprint_Data` text DEFAULT NULL
) ;

--
-- Dumping data for table `users_credentials`
--

INSERT INTO `users_credentials` (`CredentialID`, `EmployeeID`, `RFID_Tag`, `PIN_Code`, `Fingerprint_Data`) VALUES
('CRED-001', 'EMP-001', 'RFID-1001', 'A1B2', 'FP_DATA_001'),
('CRED-002', 'EMP-002', 'RFID-1002', 'X9Y8', 'FP_DATA_002'),
('CRED-003', 'EMP-003', 'RFID-1003', 'P5Q4', 'FP_DATA_003'),
('CRED-004', 'EMP-004', 'RFID-1004', 'L1M2', 'FP_DATA_004'),
('CRED-005', 'EMP-005', 'RFID-1005', 'H5J6', 'FP_DATA_005'),
('CRED-006', 'EMP-006', 'RFID-2001', '9988', 'FP_DATA_006'),
('CRED-007', 'EMP-007', 'RFID-2002', '5544', 'FP_DATA_007'),
('CRED-008', 'EMP-008', 'RFID-2003', '1122', 'FP_DATA_008'),
('CRED-009', 'EMP-009', 'RFID-2004', '6677', 'FP_DATA_009'),
('CRED-010', 'EMP-010', 'RFID-2005', '0000', 'FP_DATA_010');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`AttendanceID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `DeviceID` (`DeviceID`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`DeviceID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `uq_email` (`Email`),
  ADD KEY `Email_2` (`Email`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`SalaryID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `users_credentials`
--
ALTER TABLE `users_credentials`
  ADD PRIMARY KEY (`CredentialID`),
  ADD UNIQUE KEY `EmployeeID` (`EmployeeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `DeviceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`DeviceID`) REFERENCES `device` (`DeviceID`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`);

--
-- Constraints for table `users_credentials`
--
ALTER TABLE `users_credentials`
  ADD CONSTRAINT `users_credentials_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

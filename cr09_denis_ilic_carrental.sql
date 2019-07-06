-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Jul 2019 um 13:41
-- Server-Version: 10.3.16-MariaDB
-- PHP-Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_denis_ilic_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `agency`
--

CREATE TABLE `agency` (
  `agency_ID` int(11) NOT NULL,
  `fk_customer_ID` int(11) NOT NULL,
  `fk_car_ID` int(11) NOT NULL,
  `fK_reservation_ID` int(11) NOT NULL,
  `agency_name` varchar(10) DEFAULT NULL,
  `agency_phone` int(11) NOT NULL,
  `customer_adress` varchar(10) DEFAULT NULL,
  `agency_employees` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `agency`
--

INSERT INTO `agency` (`agency_ID`, `fk_customer_ID`, `fk_car_ID`, `fK_reservation_ID`, `agency_name`, `agency_phone`, `customer_adress`, `agency_employees`) VALUES
(1, 1, 1, 1, 'SIXX', 202555, 'cansas air', 3),
(2, 2, 2, 2, 'Rent', 2025550171, 'Avenue', 5),
(3, 3, 3, 3, 'willo', 1948210, 'willo-stre', 3),
(4, 4, 4, 4, 'Skye', 1948215, 'skye-stree', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_ID` int(11) NOT NULL,
  `fk_customer_ID` int(11) NOT NULL,
  `fk_repair_ID` int(11) NOT NULL,
  `license_plate_number` int(11) NOT NULL,
  `production_year` int(11) NOT NULL,
  `car_horsepower` int(11) NOT NULL,
  `car_mileage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`car_ID`, `fk_customer_ID`, `fk_repair_ID`, `license_plate_number`, `production_year`, `car_horsepower`, `car_mileage`) VALUES
(1, 1, 1, 583894, 2001, 100, 12789),
(2, 2, 2, 11489, 2005, 90, 120560),
(3, 3, 3, 41528, 2010, 200, 120565),
(4, 4, 4, 41521, 2011, 220, 120561);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `fk_car_ID` int(11) NOT NULL,
  `customer_name` varchar(10) DEFAULT NULL,
  `customer_surname` varchar(10) DEFAULT NULL,
  `customer_adress` varchar(10) DEFAULT NULL,
  `customer_birth` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_ID`, `fk_car_ID`, `customer_name`, `customer_surname`, `customer_adress`, `customer_birth`) VALUES
(1, 1, 'John', 'Doe', 'Avenue', 1985),
(2, 2, 'Denis', 'Ilic', 'cansas air', 1995),
(3, 3, 'Skye', 'willo', 'skye-stree', 1990),
(4, 4, 'willo', 'skye', 'willo-stre', 1980);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `employees_ID` int(11) NOT NULL,
  `fk_agency_ID` int(11) NOT NULL,
  `employees_name` varchar(20) DEFAULT NULL,
  `employees_salary` int(11) NOT NULL,
  `employees_phone` int(11) NOT NULL,
  `employees_hire_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employees`
--

INSERT INTO `employees` (`employees_ID`, `fk_agency_ID`, `employees_name`, `employees_salary`, `employees_phone`, `employees_hire_date`) VALUES
(1, 1, 'John', 3000, 1234567, 1970),
(2, 2, 'Doe', 3000, 1234561, 1975),
(3, 3, 'Colt', 3000, 1234569, 2000),
(4, 4, 'Snow', 3000, 1234564, 1995);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mechanics`
--

CREATE TABLE `mechanics` (
  `mechanics_ID` int(11) NOT NULL,
  `fk_employees_ID` int(11) NOT NULL,
  `fk_agency_ID` int(11) NOT NULL,
  `mechanics_name` varchar(10) DEFAULT NULL,
  `mechanics_phone` int(11) NOT NULL,
  `mechanics_salary` int(11) NOT NULL,
  `mechanics_hire_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `mechanics`
--

INSERT INTO `mechanics` (`mechanics_ID`, `fk_employees_ID`, `fk_agency_ID`, `mechanics_name`, `mechanics_phone`, `mechanics_salary`, `mechanics_hire_date`) VALUES
(1, 1, 1, 'John', 1234123, 2000, 1980),
(2, 2, 2, 'Mirela', 1234126, 1990, 1989),
(3, 3, 3, 'Johaness', 1234121, 1500, 2001),
(4, 4, 4, 'Johanna', 1234124, 2000, 1990);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `repair`
--

CREATE TABLE `repair` (
  `repair_ID` int(11) NOT NULL,
  `fk_mechanics_ID` int(11) NOT NULL,
  `repair_date` int(11) NOT NULL,
  `repair_fee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `repair`
--

INSERT INTO `repair` (`repair_ID`, `fk_mechanics_ID`, `repair_date`, `repair_fee`) VALUES
(1, 1, 2019, 600),
(2, 2, 2019, 100),
(3, 3, 2019, 900),
(4, 4, 2015, 1000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservation_ID` int(11) NOT NULL,
  `fk_customer_ID` int(11) NOT NULL,
  `reservation_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`reservation_ID`, `fk_customer_ID`, `reservation_date`) VALUES
(1, 1, 2019),
(2, 2, 2019),
(3, 3, 2019),
(4, 4, 2015);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `returned`
--

CREATE TABLE `returned` (
  `return_ID` int(11) NOT NULL,
  `fk_customer_ID` int(11) NOT NULL,
  `fk_agency_ID` int(11) NOT NULL,
  `return_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `returned`
--

INSERT INTO `returned` (`return_ID`, `fk_customer_ID`, `fk_agency_ID`, `return_date`) VALUES
(1, 1, 3, 2019),
(2, 2, 1, 2019),
(3, 3, 4, 2015),
(4, 4, 2, 2019);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`),
  ADD KEY `fk_car_ID` (`fk_car_ID`),
  ADD KEY `fK_reservation_ID` (`fK_reservation_ID`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`),
  ADD KEY `fk_repair_ID` (`fk_repair_ID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`),
  ADD KEY `fk_car_ID` (`fk_car_ID`);

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employees_ID`),
  ADD KEY `fk_agency_ID` (`fk_agency_ID`);

--
-- Indizes für die Tabelle `mechanics`
--
ALTER TABLE `mechanics`
  ADD PRIMARY KEY (`mechanics_ID`),
  ADD KEY `fk_employees_ID` (`fk_employees_ID`),
  ADD KEY `fk_agency_ID` (`fk_agency_ID`);

--
-- Indizes für die Tabelle `repair`
--
ALTER TABLE `repair`
  ADD PRIMARY KEY (`repair_ID`),
  ADD KEY `fk_mechanics_ID` (`fk_mechanics_ID`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`);

--
-- Indizes für die Tabelle `returned`
--
ALTER TABLE `returned`
  ADD PRIMARY KEY (`return_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`),
  ADD KEY `fk_agency_ID` (`fk_agency_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `agency`
--
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `agency_ibfk_2` FOREIGN KEY (`fk_car_ID`) REFERENCES `car` (`car_ID`),
  ADD CONSTRAINT `agency_ibfk_3` FOREIGN KEY (`fK_reservation_ID`) REFERENCES `reservation` (`reservation_ID`);

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`fk_repair_ID`) REFERENCES `repair` (`repair_ID`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_car_ID`) REFERENCES `car` (`car_ID`);

--
-- Constraints der Tabelle `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`fk_agency_ID`) REFERENCES `agency` (`agency_ID`);

--
-- Constraints der Tabelle `mechanics`
--
ALTER TABLE `mechanics`
  ADD CONSTRAINT `mechanics_ibfk_1` FOREIGN KEY (`fk_employees_ID`) REFERENCES `employees` (`employees_ID`),
  ADD CONSTRAINT `mechanics_ibfk_2` FOREIGN KEY (`fk_agency_ID`) REFERENCES `agency` (`agency_ID`);

--
-- Constraints der Tabelle `repair`
--
ALTER TABLE `repair`
  ADD CONSTRAINT `repair_ibfk_1` FOREIGN KEY (`fk_mechanics_ID`) REFERENCES `mechanics` (`mechanics_ID`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`);

--
-- Constraints der Tabelle `returned`
--
ALTER TABLE `returned`
  ADD CONSTRAINT `returned_ibfk_1` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `returned_ibfk_2` FOREIGN KEY (`fk_agency_ID`) REFERENCES `agency` (`agency_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

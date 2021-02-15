-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Feb 06, 2021 alle 12:01
-- Versione del server: 10.4.14-MariaDB
-- Versione PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `videogamesAwards`
--
CREATE DATABASE IF NOT EXISTS `videogamesAwards` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `videogamesAwards`;

-- --------------------------------------------------------

--
-- Struttura della tabella `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'horror'),
(2, 'adventure'),
(3, 'tps');

-- --------------------------------------------------------

--
-- Struttura della tabella `platform`
--

CREATE TABLE `platform` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `platform`
--

INSERT INTO `platform` (`id`, `name`) VALUES
(1, 'Xbox 360'),
(2, 'PlayStation 3');

-- --------------------------------------------------------

--
-- Struttura della tabella `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `videogame` int(11) NOT NULL,
  `worker` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `review`
--

INSERT INTO `review` (`id`, `videogame`, `worker`, `score`) VALUES
(1, 1, 1, 9),
(2, 2, 1, 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `vgG`
--

CREATE TABLE `vgG` (
  `id` int(11) NOT NULL,
  `videogame` int(11) NOT NULL,
  `genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `vgG`
--

INSERT INTO `vgG` (`id`, `videogame`, `genre`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `vgP`
--

CREATE TABLE `vgP` (
  `id` int(11) NOT NULL,
  `videogame` int(11) NOT NULL,
  `platform` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `vgP`
--

INSERT INTO `vgP` (`id`, `videogame`, `platform`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 1),
(4, 2, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `videogame`
--

CREATE TABLE `videogame` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `releaseDate` datetime NOT NULL,
  `averageRatingExpert` float NOT NULL,
  `averageRatingVideogamer` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `videogame`
--

INSERT INTO `videogame` (`id`, `title`, `releaseDate`, `averageRatingExpert`, `averageRatingVideogamer`) VALUES
(1, 'Hellblade: Senua\'s Sacrifice', '2008-10-14 00:00:00', 8.8, 7.7),
(2, 'Kingdom Come: Deliverance', '2017-07-21 00:00:00', 8.6, 5.3);

-- --------------------------------------------------------

--
-- Struttura della tabella `worker`
--

CREATE TABLE `worker` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `worker`
--

INSERT INTO `worker` (`id`, `username`) VALUES
(1, 'Gianfranco');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videogame` (`videogame`),
  ADD KEY `worker` (`worker`);

--
-- Indici per le tabelle `vgG`
--
ALTER TABLE `vgG`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videogame` (`videogame`),
  ADD KEY `genre` (`genre`);

--
-- Indici per le tabelle `vgP`
--
ALTER TABLE `vgP`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videogame` (`videogame`),
  ADD KEY `platform` (`platform`);

--
-- Indici per le tabelle `videogame`
--
ALTER TABLE `videogame`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`id`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`videogame`) REFERENCES `videogame` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`worker`) REFERENCES `worker` (`id`);

--
-- Limiti per la tabella `vgG`
--
ALTER TABLE `vgG`
  ADD CONSTRAINT `vgG_ibfk_1` FOREIGN KEY (`videogame`) REFERENCES `videogame` (`id`),
  ADD CONSTRAINT `vgG_ibfk_2` FOREIGN KEY (`genre`) REFERENCES `genre` (`id`);

--
-- Limiti per la tabella `vgP`
--
ALTER TABLE `vgP`
  ADD CONSTRAINT `vgP_ibfk_1` FOREIGN KEY (`videogame`) REFERENCES `videogame` (`id`),
  ADD CONSTRAINT `vgP_ibfk_2` FOREIGN KEY (`platform`) REFERENCES `platform` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 11, 2024 alle 14:22
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bibliotecaadi`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autore`
--

CREATE TABLE `autore` (
  `ID_autore` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `autore`
--

INSERT INTO `autore` (`ID_autore`, `Nome`, `Cognome`) VALUES
(7, 'Francesco', 'Toppi'),
(8, 'Randy', 'Hurst'),
(9, 'Kyle', 'Idleman'),
(10, 'Vernon', 'Howard'),
(11, 'Augusto', 'Glardon'),
(12, 'Dwight L.', 'Moody'),
(13, 'René', 'Pache'),
(14, 'Tim', 'Challies'),
(15, 'Oswald J.', 'Smith'),
(16, 'Francesco', 'Caldaralo'),
(17, 'Vittorio', 'Brigida'),
(18, 'Luigi', 'Borelli'),
(19, 'Angelo', 'Gargano'),
(20, 'Manuale -', 'Programma per il servizio cristiano');

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `ID_categoria` int(11) NOT NULL,
  `Descrizione` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`ID_categoria`, `Descrizione`) VALUES
(1, 'Romanzo'),
(2, 'Saggio'),
(3, 'Manuale');

-- --------------------------------------------------------

--
-- Struttura della tabella `copia`
--

CREATE TABLE `copia` (
  `ID_copia` int(11) NOT NULL,
  `ID_libro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `libro`
--

CREATE TABLE `libro` (
  `ID_libro` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Titolo` varchar(100) NOT NULL,
  `Numero_pagine` int(11) NOT NULL,
  `Casa_editrice` varchar(100) NOT NULL,
  `copertina` varchar(200) DEFAULT NULL,
  `quantita` int(11) NOT NULL,
  `prezzo` decimal(10,2) DEFAULT NULL,
  `Prestato` tinyint(1) DEFAULT NULL,
  `Data_inizio_prestito` date DEFAULT NULL,
  `Data_fine_prestito` date DEFAULT NULL,
  `ID_utente` int(11) DEFAULT NULL,
  `ID_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `libro`
--

INSERT INTO `libro` (`ID_libro`, `ISBN`, `Titolo`, `Numero_pagine`, `Casa_editrice`, `copertina`, `quantita`, `prezzo`, `Prestato`, `Data_inizio_prestito`, `Data_fine_prestito`, `ID_utente`, `ID_categoria`) VALUES
(19, '9788886085748', 'E mi sarete testimoni', 256, 'ADI MEDIA', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(20, '9788886085984', 'Vincenzo Federico', 192, 'ADI MEDIA', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(21, '9788886085922', 'Umberto Gorietti', 120, 'ADI MEDIA', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(22, '9788889698082', 'Luigi Francescon', 144, 'ADI MEDIA', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(23, '9788886085847', 'Madri in Israele', 180, 'ADI MEDIA', '', 1, 7.50, 0, NULL, NULL, 0, NULL),
(24, '--', 'Annunciare L\'evangelo', 215, 'Istituto per corrispondenza internazionale', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(25, '--', 'Cercate', 87, 'nessuno', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(26, '9788889698440', 'Una chiesa di qualità', 126, 'Adi Media', '', 1, 5.00, 1, '2024-06-26', '2024-12-26', 5, NULL),
(27, '9788833060446', 'La grazia è grande', 200, 'Adi Media', '', 1, 13.00, 1, '2024-06-26', '2024-12-26', 5, NULL),
(28, '9788889698372', 'Evangelizzare', 77, 'Adi Media', '', 1, 5.00, 1, '2024-06-26', '2024-12-26', 5, NULL),
(29, '9788886085977', 'L\'uomo di Dio', 125, 'Adi Media', '', 1, 7.50, 1, '2024-06-26', '2024-12-26', 5, NULL),
(30, '9788886085458', 'Passione per le anime', 126, 'Adi Media', '', 1, 5.00, 1, '2024-06-26', '2024-12-26', 5, NULL),
(31, '--', 'Vinci adesso', 96, 'Adi Media', '', 1, 7.00, 1, '2024-06-26', '2024-12-26', 5, NULL),
(32, '9788899990398', 'Difendi la tua proprietà', 112, 'MultiMedia Editore', '', 1, 10.00, 1, '2024-06-26', '2024-12-26', 5, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `libroautore`
--

CREATE TABLE `libroautore` (
  `ID_libro` int(11) NOT NULL,
  `ID_autore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `libroautore`
--

INSERT INTO `libroautore` (`ID_libro`, `ID_autore`) VALUES
(8, 1),
(9, 1),
(10, 3),
(11, 3),
(12, 1),
(13, 1),
(14, 1),
(15, 3),
(16, 1),
(17, 6),
(18, 1),
(19, 7),
(20, 7),
(21, 7),
(22, 7),
(23, 7),
(24, 20),
(25, 18),
(26, 19),
(27, 9),
(28, 8),
(29, 15),
(30, 15),
(31, 16),
(32, 17);

-- --------------------------------------------------------

--
-- Struttura della tabella `prestito`
--

CREATE TABLE `prestito` (
  `ID_prestito` int(11) NOT NULL,
  `ID_copia` int(11) DEFAULT NULL,
  `ID_utente` int(11) DEFAULT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Data_inizio` date NOT NULL,
  `Data_scadenza` date NOT NULL,
  `Data_restituzione` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `prestito`
--

INSERT INTO `prestito` (`ID_prestito`, `ID_copia`, `ID_utente`, `ISBN`, `Data_inizio`, `Data_scadenza`, `Data_restituzione`) VALUES
(3, NULL, 2, '9788833065045', '2024-06-11', '2024-06-30', NULL),
(5, NULL, 3, '9788833065045', '2024-06-11', '2024-06-20', '2024-06-15'),
(6, NULL, 1, '9788833064963', '2024-06-12', '2024-07-31', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `ID_utente` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(50) NOT NULL,
  `Indirizzo` varchar(100) NOT NULL,
  `Data_nascita` date NOT NULL,
  `Numero_telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`ID_utente`, `Nome`, `Cognome`, `Indirizzo`, `Data_nascita`, `Numero_telefono`) VALUES
(4, 'Giuseppe', 'Conserva', 'Viale Virgilio 81', '1960-01-01', '3289145500'),
(5, 'Dario', 'Scaringella', 'Via Ospedaletto', '2006-06-20', '3505117556');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autore`
--
ALTER TABLE `autore`
  ADD PRIMARY KEY (`ID_autore`);

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_categoria`);

--
-- Indici per le tabelle `copia`
--
ALTER TABLE `copia`
  ADD PRIMARY KEY (`ID_copia`),
  ADD KEY `ID_libro` (`ID_libro`);

--
-- Indici per le tabelle `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`ID_libro`) USING BTREE,
  ADD KEY `ID_categoria` (`ID_categoria`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `ID_utente` (`ID_utente`);

--
-- Indici per le tabelle `libroautore`
--
ALTER TABLE `libroautore`
  ADD PRIMARY KEY (`ID_libro`,`ID_autore`),
  ADD KEY `ID_autore` (`ID_autore`),
  ADD KEY `ID_libro` (`ID_libro`);

--
-- Indici per le tabelle `prestito`
--
ALTER TABLE `prestito`
  ADD PRIMARY KEY (`ID_prestito`),
  ADD KEY `ID_copia` (`ID_copia`),
  ADD KEY `ID_utente` (`ID_utente`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`ID_utente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `autore`
--
ALTER TABLE `autore`
  MODIFY `ID_autore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `copia`
--
ALTER TABLE `copia`
  MODIFY `ID_copia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `libro`
--
ALTER TABLE `libro`
  MODIFY `ID_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT per la tabella `prestito`
--
ALTER TABLE `prestito`
  MODIFY `ID_prestito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `ID_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

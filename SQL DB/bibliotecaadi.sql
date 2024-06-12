-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 13, 2024 alle 01:29
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
(1, 'J.R.R.', 'Tolkien'),
(2, 'Marco', 'Porro'),
(3, 'D. Martyn', 'Lloyd Jones'),
(4, 'John', 'MacNeil'),
(5, 'Dario', 'Scaringella');

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
  `copertina` varchar(200) NOT NULL,
  `quantita` int(11) NOT NULL,
  `ID_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `libro`
--

INSERT INTO `libro` (`ID_libro`, `ISBN`, `Titolo`, `Numero_pagine`, `Casa_editrice`, `copertina`, `quantita`, `ID_categoria`) VALUES
(8, '9788833065045', 'COME POSSO AFFRONTARE LE MIE PROVE?', 611, 'ADI MEDIA', '', 2, 1),
(9, '9788833064963', 'VIVERE PER LO SPIRITO', 612, 'ADI MEDIA', '', 3, 2),
(13, '1001000041122', '2 Pietro', 344, 'Adi Media', '', 5, 2);

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
(9, 4),
(10, 3),
(11, 3),
(12, 1),
(13, 2);

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
(4, NULL, 1, '9788833064963', '2024-06-12', '2024-06-30', NULL),
(5, NULL, 3, '9788833065045', '2024-06-12', '2024-06-19', NULL),
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
(1, 'Mario', 'Rossi', 'Via Roma 1, Milano', '1980-01-01', '1234567890'),
(2, 'Marco', 'Porro', 'Via G. Giolitti, 7/G', '2024-06-11', '3272295408'),
(3, 'Lucia', 'Porcelli', 'Via G. Giolitti', '2024-06-03', '3405754778');

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
  ADD PRIMARY KEY (`ID_libro`,`ISBN`) USING BTREE,
  ADD KEY `ID_categoria` (`ID_categoria`),
  ADD KEY `ISBN` (`ISBN`);

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
  MODIFY `ID_autore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `ID_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `prestito`
--
ALTER TABLE `prestito`
  MODIFY `ID_prestito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `ID_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

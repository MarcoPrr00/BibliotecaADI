-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 26, 2024 alle 18:31
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
(20, 'Manuale -', 'Programma per il servizio cristiano'),
(21, 'Walter', 'Trobisch'),
(22, 'Thom', 'Rainer'),
(23, 'Charles', 'Spurgeon'),
(24, 'Campbell', 'Morgan'),
(25, 'Jerry', 'Bridges'),
(26, 'John', 'Wesley'),
(27, 'Ubaldo', 'Braida'),
(28, 'Doreen', 'Irvine'),
(29, 'Mary', 'Martin'),
(30, 'Arthur', 'Pierson'),
(31, 'Ruben', 'Torrey'),
(32, 'Alexander', 'Mclaren'),
(33, 'Nessun', 'Autore'),
(34, 'Robert e Evelin', 'Bolton'),
(35, 'Worner', 'Kaller'),
(36, 'Bruno', 'Maggioni'),
(37, 'Magdi', 'Allam'),
(38, 'Alister', 'McGrath'),
(39, 'Tim', 'La Haye'),
(40, 'Fred', 'Grob'),
(41, 'John', 'Cheeseman'),
(42, 'Robert', 'Dale'),
(43, 'Adian e Steve', 'Rogers'),
(44, 'Jascques', 'Blocher'),
(45, 'Oswald', 'Chambers'),
(46, 'Autori', 'Vari (AA. VV.)'),
(47, 'Myer', 'Pearlman'),
(48, 'Jonathan', 'Lamb'),
(49, 'Roy', 'Hession'),
(50, 'Elio', 'Marrocco'),
(51, 'Miriam', 'Tambone'),
(52, 'Henri', 'Rossièr'),
(53, 'Peter', 'Haile'),
(54, 'Phillip', 'Keller'),
(55, 'Bernie', 'May'),
(56, 'Chiese', 'ADI'),
(57, 'Norman', 'Grubb'),
(58, 'J. E.', 'Van Den Brink'),
(59, 'Donald', 'Guthrie'),
(60, 'Goerges', 'Andrè'),
(61, 'Germano', 'Giuliani'),
(62, 'Leon', 'Morris'),
(63, 'Corrado', 'Primavera'),
(64, 'Francesco', 'Rauti'),
(65, 'Yvonne', 'Schwengeler'),
(66, 'Marilyn', 'Kunz'),
(67, 'Wolfgang', 'Bunnie'),
(68, 'Basil', 'Miller'),
(69, 'Gary W.', 'Kuhne'),
(70, 'Daniele', 'Costanza'),
(71, 'Max', 'Lucado'),
(72, 'Henry H.', 'Halley'),
(73, 'George', 'Cutting'),
(74, 'Giuseppe', 'Di Biagio'),
(75, 'Istituto Biblico Italiano', '(I.B.I)');

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
(19, '9788886085748', 'E mi sarete testimoni', 256, 'ADI MEDIA', '', 7, 3.00, 0, NULL, NULL, 0, NULL),
(20, '9788886085984', 'Vincenzo Federico', 192, 'ADI MEDIA', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(21, '9788886085922', 'Umberto Gorietti', 120, 'ADI MEDIA', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(22, '9788889698082', 'Luigi Francescon', 144, 'ADI MEDIA', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(23, '9788886085847', 'Madri in Israele', 180, 'ADI MEDIA', '', 1, 7.50, 0, NULL, NULL, 0, NULL),
(24, '--', 'Annunciare L\'evangelo', 215, 'Istituto per corrispondenza internazionale', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(25, '--', 'Cercate', 87, 'nessuno', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(26, '9788889698440', 'Una chiesa di qualità', 126, 'Adi Media', '', 1, 5.00, 1, '2024-06-30', '2024-12-30', 5, NULL),
(27, '9788833060446', 'La grazia è grande', 200, 'Adi Media', '', 1, 13.00, 1, '2024-06-30', '2024-12-30', 5, NULL),
(28, '9788889698372', 'Evangelizzare', 77, 'Adi Media', '', 1, 5.00, 1, '2024-06-30', '2024-12-30', 5, NULL),
(29, '9788886085977', 'L\'uomo di Dio', 125, 'Adi Media', '', 1, 7.50, 1, '2024-06-30', '2024-12-30', 5, NULL),
(30, '9788886085458', 'Passione per le anime', 126, 'Adi Media', '', 1, 5.00, 1, '2024-06-30', '2024-12-30', 5, NULL),
(31, '--', 'Vinci adesso', 96, 'Adi Media', '', 1, 7.00, 1, '2024-06-30', '2024-12-30', 5, NULL),
(32, '9788899990398', 'Difendi la tua proprietà', 112, 'MultiMedia Editore', '', 1, 10.00, 1, '2024-06-30', '2024-12-30', 5, NULL),
(42, '9788886085663', 'La Via della salvezza', 88, 'Adi Media', '', 1, 4.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(43, '9788880770251', 'Ama te stesso', 0, 'Editrice Uomini Nuovi', '', 1, 6.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(44, '9788886085205', 'Potenza dall\'alto', 120, 'Adi Media', '', 1, 7.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(45, '9788898846702', 'Sono un membro di chiesa', 80, 'Adi Media', '', 1, 7.50, 1, '2024-06-30', '2025-06-30', 6, NULL),
(46, '9788833060217', 'Promesse della grazia', 371, 'Adi Media', '', 1, 13.50, 1, '2024-06-30', '2025-06-30', 6, NULL),
(47, '9788889698679', 'Le risposte di Gesu a Giobbe', 112, 'Adi Media', '', 1, 4.50, 1, '2024-06-30', '2025-06-30', 6, NULL),
(48, '--', 'Che induci? Levati, e si battezzato', 0, 'Adi Media', '', 1, 5.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(49, '9788889698594', 'Trasformati dalla Grazia', 260, 'Adi Media', '', 1, 6.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(50, '9788889698365', 'La pratica della pietà', 224, 'Adi Media', '', 1, 3.50, 1, '2024-06-30', '2025-06-30', 6, NULL),
(51, '--', 'Sermoni sullo Spirito Santo', 0, 'nessuno', '', 1, 5.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(52, '9788886085762', 'Sermone sul monte', 208, 'Adi Media', '', 1, 3.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(53, '--', 'Alberi di vita', 0, 'nessuno', '', 1, 5.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(54, '9788879000000', 'Dalla magia nera a Cristo', 160, 'Adi Media', '', 1, 10.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(55, '9788880773429', 'Saro un Mafioso ', 0, 'Editrice Uomini Nuovi', '', 1, 10.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(56, '9788886085939', 'In Cristo Gesu', 144, 'Adi Media', '', 1, 6.50, 1, '2024-06-30', '2025-06-30', 6, NULL),
(57, '9788889698297', 'La ricerca della Santita', 168, 'Adi Media', '', 1, 13.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(58, '9788898846030', 'Preghiera e risveglio', 101, 'Adi Media', '', 1, 3.50, 1, '2024-06-30', '2025-06-30', 6, NULL),
(59, '9788886085816', 'Gemme di grazia', 97, 'Adi Media', '', 1, 5.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(60, '9788886085847', 'Madri in Israele', 180, 'Adi Media', '', 1, 7.50, 1, '2024-06-30', '2025-06-30', 6, NULL),
(61, '--', 'Fonte inesauribile ', 0, 'nessuno', '', 1, 5.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(62, '9788889698440', 'Una chiesa di qualita', 0, 'Adi Media', '', 1, 7.50, 1, '2024-06-30', '2025-06-30', 6, NULL),
(63, '9788886085137', 'Osea, l\'amore e la santita di Dio', 111, 'Adi Media', '', 1, 3.00, 1, '2024-06-30', '2025-06-30', 6, NULL),
(64, '9788886085977', 'L\'uomo di Dio', 152, 'Adi Media', '', 1, 7.50, 1, '2024-06-30', '2025-06-30', 6, NULL),
(65, '9788895602158', 'Il ritorno di Cristo Gesu', 0, 'Adi Media', '', 1, 20.00, 0, NULL, NULL, 0, NULL),
(66, '9788889698334', 'La disciplina del discernimento spirituale', 192, 'Adi Media', '', 1, 7.50, 0, NULL, NULL, 0, NULL),
(67, '9788886085205', 'Potenza dall\'alto', 120, 'Adi Media', '', 1, 7.50, 0, NULL, NULL, 0, NULL),
(68, '9788880773672', 'Carlo Finney', 112, 'Editrice Uomini Nuovi', '', 1, 12.00, 0, NULL, NULL, 0, NULL),
(69, '9788870540758', 'Eroi Missionari', 0, 'Edizioni Centro Biblico', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(70, '9788886085441', 'Il dono di Dio', 128, 'Adi Media', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(71, '9788811673071', 'La Bibbia aveva ragione', 0, 'GARZANTI', '', 1, 10.00, 0, NULL, NULL, 0, NULL),
(72, '9788830809376', 'L\'Apocalisse per una lettura profetica del tempo presente', 248, 'Cittadella', '', 1, 10.00, 0, NULL, NULL, 0, NULL),
(73, '9788804567776', 'Viva Israele', 206, 'Mondadori', '', 1, 15.00, 0, NULL, NULL, 0, NULL),
(74, '9788849814545', 'Dio e l\' evoluzione ', 206, 'Rubbettino', '', 1, 15.00, 0, NULL, NULL, 0, NULL),
(75, '9788870540796', 'Il tuo temperamento controllato dallo Spirito Santo', 176, 'Centro Biblico', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(76, '1001000064084', 'Amore per i non amati', 0, 'Soli Deo Gloria', '', 1, 5.00, 1, '2024-07-03', '2026-07-03', 10, NULL),
(77, '9788889698365', 'La pratica della pietà ', 224, 'Adi Media', '', 1, 5.00, 1, '2024-07-03', '2026-07-03', 10, NULL),
(78, '9788886085144', 'Le sette parole della croce', 127, 'Adi Media', '', 1, 8.00, 1, '2024-07-03', '2025-07-03', 11, NULL),
(79, '9788898846078', 'Elia uomo di fuoco, uomo di fede', 120, 'Adi Media', '', 1, 8.00, 1, '2024-07-03', '2025-07-03', 11, NULL),
(80, '9788889698402', 'Barnaba, uomo buono primo di spirito Santo ', 96, 'Adi Media', '', 1, 7.00, 1, '2024-07-03', '2025-07-03', 11, NULL),
(81, '9788833060224', 'La fine dei tempi le profezie dell\' Apocalisse ', 416, 'Adi Media', '', 1, 18.00, 1, '2024-07-03', '2025-07-03', 11, NULL),
(82, '9788886085168', 'Il battesimo perché?', 64, 'Adi Media', '', 2, 4.00, 0, NULL, NULL, 0, NULL),
(83, '9788870541588', 'Chiesa romana allo specchio ', 0, 'Centro Biblico', '', 1, 7.00, 0, NULL, NULL, 0, NULL),
(84, '9788896441039', 'L\'impegno per l\'altissimo ', 395, 'Edizione GBU', '', 1, 20.00, 0, NULL, NULL, 0, NULL),
(85, '9788886085953', 'Lo Spirito Santo Dio in azione ', 234, 'Adi Media', '', 1, 10.00, 0, NULL, NULL, 0, NULL),
(86, '9788889698181', 'Le dottrine della Bibbia ', 344, 'Adi Media', '', 1, 15.00, 0, NULL, NULL, 0, NULL),
(87, '9788888270012', 'Verità + Amore', 171, 'Edizione GBU', '', 2, 8.00, 0, NULL, NULL, 0, NULL),
(88, '9788879000017', 'La via del calvario', 86, 'Edizione CLC', '', 1, 7.00, 0, NULL, NULL, 0, NULL),
(89, '9788886085663', 'La Via della salvezza', 88, 'Adi Media', '', 1, 4.00, 0, NULL, NULL, 0, NULL),
(90, '9788880773917', 'Che vedi?', 128, 'Editrice Uomini Nuovi', '', 4, 11.00, 0, NULL, NULL, 0, NULL),
(91, '9788886085991', 'L\'apostolo Paolo', 96, 'Adi Media', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(92, '1001000027188', 'La stella del mattino', 0, ' Edizioni Il Messaggero Cristiano', '', 1, 4.00, 0, NULL, NULL, 0, NULL),
(93, '9788886085069', 'Guida per i monitori di scuole domenicali', 112, 'Adi Media', '', 3, 4.00, 0, NULL, NULL, 0, NULL),
(94, '9788888270524', 'Siate ciò che siete', 0, 'Edizione GBU', '', 2, 3.00, 0, NULL, NULL, 0, NULL),
(95, '--', 'Il buon pastore e le sue pecore', 0, 'Nessuno', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(96, '9788870541939', 'Sotto le Sue ali', 96, 'Centro Biblico', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(97, '9788886085618', 'Lineamenti dottrinali', 64, 'Adi Media', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(98, '9788886085335', 'Charles T. Studd', 176, 'Adi Media', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(99, '--', 'Il fondamento della fede', 0, 'Nessuno', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(100, '9788888270470', 'Le epistole pastorali', 0, 'Edizione GBU', '', 1, 10.00, 0, NULL, NULL, 0, NULL),
(101, '--', 'Il secondo sermone sul monte', 0, 'Nessuno', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(102, '1001000026877', 'Il cammino nel deserto', 0, 'Edizioni Il Messaggero Cristiano', '', 1, 4.00, 0, NULL, NULL, 0, NULL),
(103, '--', '\"Al mio vero figliolo…\"', 0, 'Nessuno', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(104, '9788888270050', 'La prima epistola di Paolo ai Corinzi', 332, 'Edizione GBU', '', 1, 10.00, 0, NULL, NULL, 0, NULL),
(105, '1001000023555', 'Da vescovo cattolico a vescovo di Cristo', 0, 'Istituto Biblico Evangelico', '', 1, 8.00, 0, NULL, NULL, 0, NULL),
(106, '--', 'La scelta migliore', 0, 'Nessuno', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(107, '9788870541557', 'Nuovo dizionario Biblico', 890, 'Centro Biblico', '', 1, 40.00, 0, NULL, NULL, 0, NULL),
(108, '1001000012375', 'Una scoperta meravigliosa', 0, 'Diffusione Letteratura Cristiana DLC', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(109, '9788870541472', 'Studi biblici sul vangelo di Giovanni', 0, 'Centro Biblico', '', 1, 3.00, 0, NULL, NULL, 0, NULL),
(110, '1001000053910', 'La luce in fondo al tunnel', 0, 'Diffusione Letteratura Cristiana DLC', '', 3, 4.00, 0, NULL, NULL, 0, NULL),
(111, '--', 'Il mondo invisibile in parabole', 0, 'Nessuno', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(112, '9788886085182', 'William Carey', 164, 'Adi Media', '', 1, 4.50, 0, NULL, NULL, 0, NULL),
(113, '1001000020080', 'Le dinamiche della vita di fede', 0, 'Editrice Uomini Nuovi', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(114, '9780646408187', 'Un italiano vero con la Bibbia in mano', 221, 'Parole di vita Australia', '', 2, 8.00, 0, NULL, NULL, 0, NULL),
(115, '1001000052876', 'Un avventura di fede', 0, 'Nessuno', '', 2, 6.00, 0, NULL, NULL, 0, NULL),
(116, '9788880772064', 'E gli angeli rimasero in silenzio', 0, 'Editrice Uomini Nuovi', '', 1, 12.00, 0, NULL, NULL, 0, NULL),
(117, '9788870541403', 'Commentario biblico abbreviato', 700, 'Centro Biblico', '', 1, 20.00, 0, NULL, NULL, 0, NULL),
(118, '9788886085410', 'La guarigione divina', 76, 'Adi Media', '', 1, 6.00, 0, NULL, NULL, 0, NULL),
(119, '9788870541298', 'Studi biblici sul vangelo di Marco', 0, 'Centro Biblico', '', 1, 2.00, 0, NULL, NULL, 0, NULL),
(120, '1001000051985', 'Salvezza Certezza Gioia', 32, 'Edizioni Il Messaggero Cristiano', '', 3, 3.00, 0, NULL, NULL, 0, NULL),
(121, '9788880772859', 'Affronta i tuoi giganti', 160, 'Editrice Uomini Nuovi', '', 1, 12.00, 0, NULL, NULL, 0, NULL),
(122, '1001000012092', 'Educazione: piacere o frustrazione?', 0, 'Diffusione Letteratura Cristiana DLC', '', 1, 8.00, 0, NULL, NULL, 0, NULL),
(123, '--', 'Sintesi di grandi avvenimenti del \"tempo della fine\"', 0, 'Nessuno', '', 1, 5.00, 0, NULL, NULL, 0, NULL),
(124, '--', 'Le dottrine della Bibbia', 0, 'Istituto Biblico Evangelico', '', 1, 10.00, 0, NULL, NULL, 0, NULL),
(125, '9788886085977', 'L\'uomo di Dio', 152, 'Adi Media', '', 1, 8.00, 0, NULL, NULL, 0, NULL);

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
(0, 19),
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
(32, 17),
(33, 19),
(38, 7),
(40, 7),
(41, 18),
(42, 12),
(43, 21),
(44, 12),
(45, 22),
(46, 23),
(47, 24),
(48, 7),
(49, 25),
(50, 25),
(51, 23),
(52, 26),
(53, 27),
(54, 28),
(55, 29),
(56, 30),
(57, 25),
(58, 31),
(59, 32),
(60, 7),
(61, 33),
(62, 19),
(63, 24),
(64, 15),
(65, 13),
(66, 14),
(67, 12),
(68, 11),
(69, 10),
(70, 12),
(71, 35),
(72, 43),
(73, 37),
(74, 38),
(75, 39),
(76, 40),
(77, 25),
(78, 23),
(79, 41),
(80, 42),
(81, 43),
(82, 7),
(83, 44),
(84, 45),
(85, 46),
(86, 47),
(87, 48),
(88, 49),
(89, 12),
(90, 50),
(91, 51),
(92, 52),
(93, 47),
(94, 53),
(95, 54),
(96, 55),
(97, 56),
(98, 57),
(99, 58),
(100, 59),
(101, 58),
(102, 60),
(103, 61),
(104, 62),
(105, 63),
(106, 64),
(107, 13),
(108, 65),
(109, 66),
(110, 67),
(111, 58),
(112, 68),
(113, 43),
(114, 50),
(115, 70),
(116, 71),
(117, 72),
(118, 7),
(119, 66),
(120, 73),
(121, 71),
(122, 65),
(123, 74),
(124, 75),
(125, 15);

-- --------------------------------------------------------

--
-- Struttura della tabella `prestito`
--

CREATE TABLE `prestito` (
  `ID_prestito` int(11) NOT NULL,
  `ID_copia` int(11) DEFAULT NULL,
  `ID_utente` int(11) DEFAULT NULL,
  `ID_libro` int(11) NOT NULL,
  `Data_inizio` date NOT NULL,
  `Data_scadenza` date NOT NULL,
  `Data_restituzione` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `prestito`
--

INSERT INTO `prestito` (`ID_prestito`, `ID_copia`, `ID_utente`, `ID_libro`, `Data_inizio`, `Data_scadenza`, `Data_restituzione`) VALUES
(8, NULL, 13, 67, '2024-06-30', '2024-07-30', NULL),
(9, NULL, 14, 27, '2024-06-30', '2024-09-30', NULL),
(10, NULL, 16, 30, '2024-06-30', '2024-07-30', '2024-07-24'),
(11, NULL, 15, 74, '2024-06-30', '2024-07-30', NULL),
(12, NULL, 17, 125, '2024-07-12', '2024-10-12', NULL),
(13, NULL, 16, 64, '2024-07-24', '2024-08-24', NULL);

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
(5, 'Dario', 'Scaringella', 'Via Ospedaletto', '2006-06-20', '3505117556'),
(6, 'Francesca', 'Leone', 'Via Santa Lucia', '1971-07-14', '3208258521'),
(7, 'Agostino', 'Porro', 'Via G. Giolitti, 7/G', '1959-06-03', '3405754778'),
(8, 'Maria ', 'Lorusso', '--', '1900-01-01', '--'),
(9, 'Michele', 'Mastrodonati', '--', '1900-01-01', '--'),
(10, 'Caterina', 'Matera', '--', '1900-01-01', '3293829933'),
(11, 'Giuseppe', 'Lorusso', 'Largo Budapest', '1900-01-01', '3491522315'),
(12, 'Gaetano', 'Bisceglie', '--', '1900-01-01', '--'),
(13, 'Lucia', 'Porcelli', 'Via G. Giolitti', '1962-07-17', '3405754778'),
(14, 'Luca', 'Porro', 'Via G. Giolitti, 7/G', '1998-09-15', '3888947627'),
(15, 'Stefano', 'Porro', 'Via G. Giolitti, 7/G', '1996-01-23', '3409211855'),
(16, 'Sefora', 'Bozzon', 'Via G. Paisiello', '2000-07-15', '3914138725'),
(17, 'Christian', 'Siclari', '--', '1900-01-01', '3456091479');

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
  ADD KEY `ISBN` (`ID_libro`);

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
  MODIFY `ID_autore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
  MODIFY `ID_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT per la tabella `prestito`
--
ALTER TABLE `prestito`
  MODIFY `ID_prestito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `ID_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

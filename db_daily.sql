-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Okt 2019 pada 09.17
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_daily`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_notes`
--

CREATE TABLE `ms_notes` (
  `NotesID` varchar(32) NOT NULL,
  `TugasID` varchar(32) NOT NULL,
  `Notes` text NOT NULL,
  `Progress` int(3) NOT NULL,
  `AddedBy` varchar(32) NOT NULL,
  `AddedTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_notes`
--

INSERT INTO `ms_notes` (`NotesID`, `TugasID`, `Notes`, `Progress`, `AddedBy`, `AddedTime`) VALUES
('20191023155146', '20191023155045', 'Finish', 100, 'dede', '2019-10-23 15:51:46'),
('20191023163740', '20191023162613', 'sudah diselesaikan', 100, 'adi', '2019-10-23 16:37:40'),
('20191023163803', '20191023162651', 'sudah diselesaikan ', 100, 'adi', '2019-10-23 16:38:03'),
('20191023163822', '20191023162736', 'sudah diselesaikan', 100, 'adi', '2019-10-23 16:38:22'),
('20191023163846', '20191023162820', 'baru testing internal IT', 30, 'adi', '2019-10-23 16:38:46'),
('20191023170603', '20191023162820', 'sudah di test oleh marketing', 50, 'adi', '2019-10-23 17:06:03'),
('20191023170706', '20191023162820', 'sudah sebagian test', 90, 'adi', '2019-10-23 17:07:06'),
('20191023170729', '20191023162820', 'done', 100, 'adi', '2019-10-23 17:07:29'),
('20191024091402', '20191023162651', 'perubahan', 50, 'adi', '2019-10-24 09:14:02'),
('20191024091742', '20191023162736', 'perubahan', 50, 'adi', '2019-10-24 09:17:42'),
('20191024093933', '20191023162651', 'finish', 100, 'adi', '2019-10-24 09:39:33'),
('20191024094159', '20191023162736', 'masih ada perbaikan', 80, 'adi', '2019-10-24 09:41:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_notes_files`
--

CREATE TABLE `ms_notes_files` (
  `File` varchar(128) NOT NULL,
  `NotesID` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_notifikasi`
--

CREATE TABLE `ms_notifikasi` (
  `UserID` varchar(32) NOT NULL,
  `TugasID` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_notifikasi`
--

INSERT INTO `ms_notifikasi` (`UserID`, `TugasID`) VALUES
('adiyanto', '20191023173304'),
('ali', '20191023173304'),
('andika', '20191023155045'),
('andika', '20191023162613'),
('andika', '20191023162651'),
('andika', '20191023162736'),
('andika', '20191023162820'),
('andika', '20191023173304'),
('dede', '20191023173304'),
('doni', '20191023173304'),
('harsanto', '20191023173304'),
('komara', '20191023173304'),
('rini', '20191023173304'),
('rony', '20191023162651'),
('rony', '20191023162736');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_project`
--

CREATE TABLE `ms_project` (
  `ProjectID` varchar(32) NOT NULL,
  `NamaProject` varchar(128) DEFAULT NULL,
  `Keterangan` text DEFAULT NULL,
  `ParentID` varchar(32) DEFAULT '0',
  `AnggotaInduk` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_project`
--

INSERT INTO `ms_project` (`ProjectID`, `NamaProject`, `Keterangan`, `ParentID`, `AnggotaInduk`) VALUES
('20191023145748', 'PROJECT', '', '0', 0),
('20191023150911', 'BURNING', '', '20191023145748', 0),
('20191023151003', 'RELAY', '', '20191023145748', 0),
('20191023151209', 'RETUR', '', '20191023145748', 0),
('20191023151511', 'IMPROVMENT', '', '20191023145748', 0),
('20191023151608', 'SPLU', '', '20191023145748', 0),
('20191023151713', 'UJI CONTAINER', '', '20191023145748', 0),
('20191023152824', 'PRODUKSI', '', '20191023151713', 0),
('20191023152846', 'QC', '', '20191023151713', 1),
('20191023153008', 'RND', '', '20191023151713', 1),
('20191023153029', 'TS', '', '20191023151713', 1),
('20191023153340', 'UST', '', '20191023145748', 0),
('20191023153835', 'MAINTENANCE', '', '0', 0),
('20191023153910', 'AREA DIPPING', '', '20191023153835', 1),
('20191023153930', 'EXHAUST', '', '20191023153835', 1),
('20191023153953', 'PERBAIKAN UNIT AC', '', '20191023153835', 1),
('20191023154039', 'IT', '', '0', 0),
('20191023154053', 'SOFTWARE', '', '20191023154039', 0),
('20191023154118', 'HARDWARE', '', '20191023154039', 0),
('20191023154255', 'NETWORK', '', '20191023154039', 0),
('20191023162157', 'RND', '', '0', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_project_anggota`
--

CREATE TABLE `ms_project_anggota` (
  `UserID` varchar(32) NOT NULL,
  `ProjectID` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_project_anggota`
--

INSERT INTO `ms_project_anggota` (`UserID`, `ProjectID`) VALUES
('adi', '20191023154039'),
('adi', '20191023154053'),
('adi', '20191023154118'),
('adi', '20191023154255'),
('adiyanto', '20191023145748'),
('adiyanto', '20191023151209'),
('adiyanto', '20191023151511'),
('adiyanto', '20191023151713'),
('adiyanto', '20191023152824'),
('adiyanto', '20191023152846'),
('adiyanto', '20191023153008'),
('adiyanto', '20191023153029'),
('agus', '20191023145748'),
('agus', '20191023150911'),
('agus', '20191023151003'),
('agus', '20191023151209'),
('agus', '20191023151511'),
('agus', '20191023151608'),
('agus', '20191023153340'),
('ali', '20191023145748'),
('ali', '20191023151209'),
('ali', '20191023151511'),
('ali', '20191023151713'),
('ali', '20191023152824'),
('ali', '20191023152846'),
('ali', '20191023153008'),
('ali', '20191023153029'),
('ananda', '20191023145748'),
('ananda', '20191023162157'),
('andhie', '20191023145748'),
('andhie', '20191023151209'),
('andhie', '20191023151608'),
('andhie', '20191023153340'),
('andika', '20191023145748'),
('andika', '20191023150911'),
('andika', '20191023151003'),
('andika', '20191023151209'),
('andika', '20191023151511'),
('andika', '20191023151608'),
('andika', '20191023151713'),
('andika', '20191023152824'),
('andika', '20191023152846'),
('andika', '20191023153008'),
('andika', '20191023153029'),
('andika', '20191023153340'),
('andika', '20191023153835'),
('andika', '20191023153910'),
('andika', '20191023153930'),
('andika', '20191023153953'),
('andika', '20191023154039'),
('andika', '20191023154053'),
('andika', '20191023154118'),
('andika', '20191023154255'),
('andika', '20191023162157'),
('anggun', '20191023145748'),
('arsyil', '20191023145748'),
('arsyil', '20191023162157'),
('dede', '20191023145748'),
('dede', '20191023150911'),
('dede', '20191023151003'),
('dede', '20191023151511'),
('dede', '20191023151608'),
('dede', '20191023151713'),
('dede', '20191023152824'),
('dede', '20191023152846'),
('dede', '20191023153008'),
('dede', '20191023153029'),
('dede', '20191023153340'),
('dede', '20191023162157'),
('denny', '20191023145748'),
('denny', '20191023150911'),
('denny', '20191023151608'),
('devi', '20191023145748'),
('devi', '20191023151209'),
('devi', '20191023151511'),
('devi', '20191023151608'),
('devi', '20191023153340'),
('doni', '20191023145748'),
('doni', '20191023151209'),
('doni', '20191023151511'),
('doni', '20191023151713'),
('doni', '20191023152824'),
('doni', '20191023152846'),
('doni', '20191023153008'),
('doni', '20191023153029'),
('edwin', '20191023145748'),
('edwin', '20191023153835'),
('edwin', '20191023153910'),
('edwin', '20191023153930'),
('edwin', '20191023153953'),
('firdos', '20191023153835'),
('firdos', '20191023153910'),
('firdos', '20191023153930'),
('firdos', '20191023153953'),
('harsanto', '20191023145748'),
('harsanto', '20191023150911'),
('harsanto', '20191023151209'),
('harsanto', '20191023151713'),
('harsanto', '20191023152824'),
('harsanto', '20191023152846'),
('harsanto', '20191023153008'),
('harsanto', '20191023153029'),
('harsanto', '20191023153340'),
('jeniwaty', '20191023145748'),
('johan', '20191023145748'),
('johan', '20191023150911'),
('johan', '20191023151003'),
('johan', '20191023151209'),
('johan', '20191023151511'),
('johan', '20191023151608'),
('johan', '20191023153340'),
('komara', '20191023145748'),
('komara', '20191023151003'),
('komara', '20191023151209'),
('komara', '20191023151511'),
('komara', '20191023151608'),
('komara', '20191023151713'),
('komara', '20191023152824'),
('komara', '20191023152846'),
('komara', '20191023153008'),
('komara', '20191023153029'),
('komara', '20191023153340'),
('maftukhin', '20191023145748'),
('maftukhin', '20191023151209'),
('maftukhin', '20191023151511'),
('maftukhin', '20191023151608'),
('maftukhin', '20191023153340'),
('oki', '20191023153835'),
('oki', '20191023153910'),
('oki', '20191023153930'),
('oki', '20191023153953'),
('rini', '20191023145748'),
('rini', '20191023151209'),
('rini', '20191023151511'),
('rini', '20191023151608'),
('rini', '20191023151713'),
('rini', '20191023152824'),
('rini', '20191023152846'),
('rini', '20191023153008'),
('rini', '20191023153029'),
('rini', '20191023153340'),
('rony', '20191023154039'),
('rony', '20191023154053'),
('seli', '20191023145748'),
('seli', '20191023151209'),
('seli', '20191023153340'),
('septy', '20191023145748'),
('suyitno', '20191023153835'),
('suyitno', '20191023153910'),
('suyitno', '20191023153930'),
('suyitno', '20191023153953'),
('syahril', '20191023145748'),
('tami', '20191023145748'),
('tami', '20191023150911'),
('tomy', '20191023154039'),
('tomy', '20191023154118'),
('tomy', '20191023154255'),
('udin', '20191023145748'),
('udin', '20191023150911'),
('umi', '20191023145748'),
('umi', '20191023151209'),
('Urip', '20191023145748'),
('yuci', '20191023145748'),
('yusuf', '20191023145748'),
('yusuf', '20191023162157');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_tugas`
--

CREATE TABLE `ms_tugas` (
  `TugasID` varchar(32) NOT NULL,
  `ProjectID` varchar(32) NOT NULL,
  `Subject` varchar(128) NOT NULL,
  `Keterangan` text NOT NULL,
  `Dari` date NOT NULL,
  `Sampai` date NOT NULL,
  `ParentID` varchar(32) NOT NULL,
  `Progress` int(3) NOT NULL,
  `AddedBy` varchar(32) NOT NULL,
  `AddedTime` datetime NOT NULL,
  `Closed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_tugas`
--

INSERT INTO `ms_tugas` (`TugasID`, `ProjectID`, `Subject`, `Keterangan`, `Dari`, `Sampai`, `ParentID`, `Progress`, `AddedBy`, `AddedTime`, `Closed`) VALUES
('20191023162520', '20191023154053', 'Develope Redmine', '', '2019-10-15', '2019-10-31', '0', 95, 'adi', '2019-10-23 16:25:20', 0),
('20191023162613', '20191023154053', 'Create Database', '', '2019-10-15', '2019-10-16', '20191023162520', 100, 'adi', '2019-10-23 16:26:13', 0),
('20191023162651', '20191023154053', 'Create Desain', '', '2019-10-16', '2019-10-17', '20191023162520', 100, 'adi', '2019-10-23 16:26:51', 0),
('20191023162736', '20191023154053', 'Coding', '', '2019-10-18', '2019-10-28', '20191023162520', 80, 'adi', '2019-10-23 16:27:36', 0),
('20191023162820', '20191023154053', 'Testing Bug', '', '2019-10-28', '2019-10-31', '20191023162520', 100, 'adi', '2019-10-23 16:28:20', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_tugas_pic`
--

CREATE TABLE `ms_tugas_pic` (
  `UserID` varchar(32) NOT NULL,
  `TugasID` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_tugas_pic`
--

INSERT INTO `ms_tugas_pic` (`UserID`, `TugasID`) VALUES
('dede', '20191023155045'),
('rony', '20191023162520'),
('rony', '20191023162613'),
('rony', '20191023162651'),
('rony', '20191023162736'),
('rony', '20191023162820');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_user`
--

CREATE TABLE `ms_user` (
  `Password` varchar(32) DEFAULT NULL,
  `Admin` bigint(1) DEFAULT NULL,
  `UserID` varchar(32) NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_user`
--

INSERT INTO `ms_user` (`Password`, `Admin`, `UserID`, `Nama`, `Email`) VALUES
('123smi321', 1, 'adi', 'Adi Winata', 'adiwinata@smartmeterindo.com'),
('123smi321', NULL, 'adiyanto', 'Adiyanto TS', 'adhietyakirana97@gmail.com'),
('123smi321', NULL, 'agus', 'Agus Aripin', 'agusaripin@smartmeterindo.com'),
('123smi321', NULL, 'ali', 'Akhmad Ali Sadikin', 'akhmad.alisadikin@gmail.com'),
('123smi321', NULL, 'ananda', 'Muhamad Ananda', 'manandapradipta@gmail.com'),
('123smi321', NULL, 'andhie', 'Andhie Purbandoko', 'andi@smartmeterindo.com'),
('123smi321', 1, 'andika', 'Andika Sutedjo', 'standikast@gmail.com'),
('123smi321', NULL, 'anggun', 'Anggun Milasari', 'anggun@smartmeterindo.com'),
('123smi321', NULL, 'arsyil', 'Muhammad Arsyil', 'muhammadarsyil21@gmail.com'),
('123smi321', NULL, 'dede', 'Dede Tri', 'dedetri@smartmeterindo.com'),
('123smi321', NULL, 'denny', 'Denny Hartono', 'ctozdenny@gmail.com'),
('123smi321', NULL, 'devi', 'Devi Apriani', 'devi@smartmeterindo.com'),
('123smi321', NULL, 'doni', 'Doni Kurniawan', 'doni@smartmeterindo.com'),
('123smi321', NULL, 'edwin', 'edwin darnel', 'darneledwin.ed@gmail.com'),
('123smi321', NULL, 'firdos', 'firdos', 'firdos@gmail.com'),
('123smi321', NULL, 'harsanto', 'Agus Harsanto', 'agoesarsan@gmail.com'),
('123smi321', NULL, 'jeniwaty', 'Jeniwaty Karimun', 'jeniwatyk@hotmail.com'),
('123smi321', NULL, 'johan', 'Johan Toni', 'johan@smartmeterindo.com'),
('123smi321', NULL, 'komara', 'Adi Komara', 'adi@smartmeterindo.com'),
('123smi321', NULL, 'maftukhin', 'Maftukhin Taryo', 'm_uki1987@yahoo.co.id'),
('123smi321', NULL, 'oki', 'oki', 'oki@gmail.com'),
('123smi321', NULL, 'ria', 'Ria Herawati', 'ria@smartmeterindo.com'),
('123smi321', NULL, 'rini', 'Rini Sulastry', 'rini@smartmeterindo.com'),
('123smi321', NULL, 'rony', 'Rony Agung', 'ronyagungaribudiman@yahoo.com'),
('123smi321', NULL, 'seli', 'Seli Andini', 'seliandini29@gmail.com'),
('123smi321', NULL, 'septy', 'septyana eka', 'septy@smartmeterindo.com'),
('123smi321', NULL, 'suyitno', 'suyitno', 'suyitno@gmail.com'),
('123smi321', NULL, 'syahril', 'syahril sidiq', 'syahril@smartmeterindo.com'),
('123smi321', NULL, 'tami', 'Sri Utami  Ningrum', 'sriutaminingrum8@gmail.com'),
('123smi321', NULL, 'tomy', 'Tomy Ferdiansyah', 'tommy@smartmeterindo.com'),
('123smi321', NULL, 'udin', 'Muhamad Soprudin', 'soprudin@gmail.com'),
('123smi321', NULL, 'umi', 'Umi Khoiriyah', 'umi@smartmeterindo.com'),
('123smi321', NULL, 'Urip', 'Urip Patoni', 'urippatony@gmail.com'),
('123smi321', NULL, 'yuci', 'yuci Vantie', 'yucivantie@gmail.com'),
('123smi321', NULL, 'yusuf', 'Nuriyan Yusuf', 'masyan5335@gmail.com');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_log`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_log` (
`ID` varchar(32)
,`AddedBy` varchar(32)
,`AddedTime` datetime
,`Kategori` varchar(5)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_log`
--
DROP TABLE IF EXISTS `view_log`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_log`  AS  select `ms_tugas`.`TugasID` AS `ID`,`ms_tugas`.`AddedBy` AS `AddedBy`,`ms_tugas`.`AddedTime` AS `AddedTime`,'tugas' AS `Kategori` from `ms_tugas` union all select `ms_notes`.`NotesID` AS `ID`,`ms_notes`.`AddedBy` AS `AddedBy`,`ms_notes`.`AddedTime` AS `AddedTime`,'notes' AS `Kategori` from `ms_notes` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ms_notes`
--
ALTER TABLE `ms_notes`
  ADD PRIMARY KEY (`NotesID`),
  ADD UNIQUE KEY `TugasID` (`TugasID`,`Notes`,`Progress`) USING HASH;

--
-- Indeks untuk tabel `ms_notes_files`
--
ALTER TABLE `ms_notes_files`
  ADD PRIMARY KEY (`File`,`NotesID`);

--
-- Indeks untuk tabel `ms_notifikasi`
--
ALTER TABLE `ms_notifikasi`
  ADD PRIMARY KEY (`UserID`,`TugasID`);

--
-- Indeks untuk tabel `ms_project`
--
ALTER TABLE `ms_project`
  ADD PRIMARY KEY (`ProjectID`),
  ADD UNIQUE KEY `NamaProject` (`NamaProject`,`ParentID`);

--
-- Indeks untuk tabel `ms_project_anggota`
--
ALTER TABLE `ms_project_anggota`
  ADD PRIMARY KEY (`UserID`,`ProjectID`),
  ADD KEY `UserID` (`UserID`,`ProjectID`);

--
-- Indeks untuk tabel `ms_tugas`
--
ALTER TABLE `ms_tugas`
  ADD PRIMARY KEY (`TugasID`),
  ADD UNIQUE KEY `TugasID` (`TugasID`,`ProjectID`,`Subject`);

--
-- Indeks untuk tabel `ms_tugas_pic`
--
ALTER TABLE `ms_tugas_pic`
  ADD PRIMARY KEY (`UserID`,`TugasID`);

--
-- Indeks untuk tabel `ms_user`
--
ALTER TABLE `ms_user`
  ADD PRIMARY KEY (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

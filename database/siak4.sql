-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2019 at 03:40 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siak4`
--

-- --------------------------------------------------------

--
-- Table structure for table `det_keluarga`
--

CREATE TABLE `det_keluarga` (
  `id_keluarga` varchar(20) NOT NULL,
  `no_ktp` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keluarga`
--

CREATE TABLE `keluarga` (
  `id_keluarga` varchar(20) NOT NULL,
  `kepala_keluarga` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `dusun` varchar(30) NOT NULL,
  `rt` varchar(2) DEFAULT NULL,
  `rw` varchar(2) DEFAULT NULL,
  `ekonomi` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `keluarga`
--
DELIMITER $$
CREATE TRIGGER `hapus_detail_klg` AFTER DELETE ON `keluarga` FOR EACH ROW begin

delete  from det_keluarga where det_keluarga.id_keluarga = old.id_keluarga;

end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_warga`
--

CREATE TABLE `mutasi_warga` (
  `id_mutasi` mediumint(9) NOT NULL,
  `id_warga` varchar(20) NOT NULL,
  `jenis_mutasi` varchar(15) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `id_surat` int(8) NOT NULL,
  `jenis_surat` varchar(4) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `nama_surat` varchar(50) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `isi_surat` text,
  `tanda_tangan` varchar(50) NOT NULL,
  `id_warga` varchar(20) NOT NULL,
  `nama_warga` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Role_id` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `Role_id`, `created_at`) VALUES
(1, 'admin1234', '$2y$10$kQUeUWQmr2iJPuGkly1h3OYiFKAkM7He6au.1zChHtKndE8UHHC4u', 0, '2019-05-26 23:36:24'),
(2, 'gilang', '$2y$10$Tr21kisj0foXAgCjd5MKO.vWZi7xWxZKuY2pBOLnOukO8psFpzsTS', 0, '2019-06-28 01:11:23'),
(3, 'addmin', '$2y$10$jgj.AgIKuqE7UFwVIwIuIevzdWEmfHJ9cHKu5KlnEavp28BTY8AA2', 0, '2019-06-28 01:12:20'),
(4, 'sevene', '$2y$10$QMi3Muou/6dx2azxyh2DIezHIHxSkTw23xiCoM6GbuamcejGvz72m', 0, '2019-06-28 01:14:46'),
(5, 'tes1', '$2y$10$bTp9FyJzh624FyGR.hXFH.TejeSZZlhedTKZaVtKQFcK1GbdzcqVC', 0, '2019-06-28 02:01:23'),
(6, 'tes2', '$2y$10$hG9BKT8ZhrOrsEt4U8GwnelZqBEHxGIjgRbpJdAL65TPFHMGq2CYq', 0, '2019-06-28 02:01:48'),
(7, 'tes3', '$2y$10$g.aawDdGqJ.5/l9UU5Pt7uV1fgBMxn/4Udthv/GfnIcSF0hB00zaC', 0, '2019-06-28 02:03:46'),
(8, 'tes5', '$2y$10$2qYs4qJ6uR0VQtbzO47YXuVM86y8mV.JLq7X6KnOCegQj9behF.Wq', 0, '2019-06-28 02:08:48'),
(9, 'tes6', '$2y$10$gtbACb2UoTa2bHMfWKSmYO0YSR2HLexbZSgfCyW3SmxZPtAmMh47S', 0, '2019-06-28 02:21:40'),
(10, 'tes7', '$2y$10$Dk8WPeqpGz/wKp6bFqS8gevOA0k8xp7qd1QANR.u.M.08MLO0EOXK', 0, '2019-06-28 17:36:26'),
(11, 'tes8', '$2y$10$/I60Juc18txuZVAjrEkq5OMx1fQtqqzu2pXOHuaT/ruAp07PXLa56', 0, '2019-06-28 17:39:04'),
(12, 'tes9', '$2y$10$EdKyKu.UlxZNslMUUGsVk.YDwCiQbkIXFe9NoWDji3ZE49diJNr7e', 1, '2019-06-28 19:58:03');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_detail_warga`
-- (See below for the actual view)
--
CREATE TABLE `v_detail_warga` (
`id_keluarga` varchar(20)
,`no_ktp` varchar(20)
,`nama` varchar(50)
,`agama` varchar(20)
,`t_lahir` varchar(20)
,`tgl_lahir` varchar(10)
,`j_kel` varchar(11)
,`gol_darah` varchar(2)
,`w_negara` varchar(20)
,`pendidikan` varchar(10)
,`pekerjaan` varchar(30)
,`s_nikah` varchar(20)
,`alamat` text
,`rt` varchar(2)
,`rw` varchar(2)
,`dusun` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_mutasi_warga`
-- (See below for the actual view)
--
CREATE TABLE `v_mutasi_warga` (
`id_warga` varchar(20)
,`j_kel` enum('L','W')
,`jenis_mutasi` varchar(15)
,`periode` varchar(7)
,`keterangan` text
);

-- --------------------------------------------------------

--
-- Table structure for table `warga`
--

CREATE TABLE `warga` (
  `no_ktp` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `t_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `j_kel` enum('L','W') NOT NULL,
  `gol_darah` varchar(2) NOT NULL,
  `w_negara` varchar(20) NOT NULL,
  `pendidikan` varchar(10) DEFAULT NULL,
  `pekerjaan` varchar(30) NOT NULL,
  `s_nikah` varchar(20) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warga`
--

INSERT INTO `warga` (`no_ktp`, `nama`, `agama`, `t_lahir`, `tgl_lahir`, `j_kel`, `gol_darah`, `w_negara`, `pendidikan`, `pekerjaan`, `s_nikah`, `status`) VALUES
('3174011207991003', 'Sal', 'Islam', 'Jakarta', '2019-03-05', 'L', 'A', 'Indonesia', 'SMK', 'Free', 'belum_nikah', '1'),
('63123876821875', 'Damianus ggg', 'Kristen_Katolik', 'Bekasi', '2019-06-04', 'L', 'AB', 'Indonesia', 'z,kcbkjabc', 'MAgang', 'janda/duda', '1'),
('32456t8908', 'Medialogy Digital Indonesia', 'Kristen_Protestan', 'Kota Jakarta Timur', '2019-06-12', 'W', 'AB', ',wcIndonesiacdqa', 'mqnjcvjwav', 'kcbkjabcwkw', 'janda/duda', '1'),
('12837451872459134931', 'Damianus Gemilang', 'Islam', 'Kota Jakarta Timur', '2019-06-08', 'L', 'AB', 'Indonesia', 'as.kblSBc', ',lkcblabclsbalsc', 'nikah', '1'),
('82364826739826849', 'Damianus ggg', 'Hindhu', 'Bekasi', '2019-06-07', 'W', 'A', 'Indonesia', 'kbciquciqw', 'efcwcavav', 'lainnya', '1'),
('8217538725e8712587', 'ihbciakubva]', 'Budha', 'Bekasi', '1998-05-14', 'L', 'A', 'Indonesia', 'kjbdvladnv', 'lvdnalknv', 'belum_nikah', '1'),
('8137487143814', 'shevfiakbcfaf', 'Islam', 'Kota Jakarta Timur', '2019-06-05', 'L', 'A', 'Indonesia', 'skjjv lsnv', 'alsnclanv', 'belum_nikah', '1'),
('983259832958y23958', 'sjkvlsnv', 'Islam', 'Bekasi', '2019-06-25', 'L', 'A', 'alcnac', 'alcn', 'alscn', 'belum_nikah', '1'),
('87456826735', 'kjcaca', 'Islam', 'Kota Jakarta Timur', '2019-06-28', 'L', 'A', 'lkanc;a', ';alcmlamc', 'alcknaqc', 'belum_nikah', '1'),
('98346592652', 'aknc;ansc', 'Islam', 'Kota Jakarta Timur', '2019-06-28', 'L', 'A', 'Indonesia', 'kajbclac', 'akvcbalc', 'belum_nikah', '1');

-- --------------------------------------------------------

--
-- Structure for view `v_detail_warga`
--
DROP TABLE IF EXISTS `v_detail_warga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail_warga`  AS  select `a`.`id_keluarga` AS `id_keluarga`,`c`.`no_ktp` AS `no_ktp`,`c`.`nama` AS `nama`,`c`.`agama` AS `agama`,`c`.`t_lahir` AS `t_lahir`,date_format(`c`.`tgl_lahir`,'%d-%m-%Y') AS `tgl_lahir`,if((`c`.`j_kel` = 'L'),'Laki - laki','Wanita') AS `j_kel`,`c`.`gol_darah` AS `gol_darah`,`c`.`w_negara` AS `w_negara`,`c`.`pendidikan` AS `pendidikan`,`c`.`pekerjaan` AS `pekerjaan`,`c`.`s_nikah` AS `s_nikah`,`a`.`alamat` AS `alamat`,`a`.`rt` AS `rt`,`a`.`rw` AS `rw`,`a`.`dusun` AS `dusun` from ((`keluarga` `a` join `det_keluarga` `b`) join `warga` `c`) where ((`a`.`id_keluarga` = `b`.`id_keluarga`) and (`b`.`no_ktp` = `c`.`no_ktp`) and (`c`.`status` = '1')) ;

-- --------------------------------------------------------

--
-- Structure for view `v_mutasi_warga`
--
DROP TABLE IF EXISTS `v_mutasi_warga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mutasi_warga`  AS  select `mutasi_warga`.`id_warga` AS `id_warga`,`warga`.`j_kel` AS `j_kel`,`mutasi_warga`.`jenis_mutasi` AS `jenis_mutasi`,date_format(`mutasi_warga`.`tanggal`,'%m-%Y') AS `periode`,`mutasi_warga`.`keterangan` AS `keterangan` from (`mutasi_warga` join `warga` on((`warga`.`no_ktp` = `mutasi_warga`.`id_warga`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `det_keluarga`
--
ALTER TABLE `det_keluarga`
  ADD KEY `id_warga` (`no_ktp`,`id_keluarga`);

--
-- Indexes for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD PRIMARY KEY (`id_keluarga`);

--
-- Indexes for table `mutasi_warga`
--
ALTER TABLE `mutasi_warga`
  ADD PRIMARY KEY (`id_mutasi`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`no_ktp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mutasi_warga`
--
ALTER TABLE `mutasi_warga`
  MODIFY `id_mutasi` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat`
--
ALTER TABLE `surat`
  MODIFY `id_surat` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

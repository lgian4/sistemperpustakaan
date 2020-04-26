-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2020 at 04:26 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `idpenulis` int(11) NOT NULL,
  `idpenerbit` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `nama`, `idpenulis`, `idpenerbit`, `tahun`, `idkategori`, `keterangan`) VALUES
(1, 'buku judul sdfsf', 1, 1, 2015, 1, 'test'),
(2, 'buku judul', 1, 1, 2017, 1, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'horors'),
(2, 'sfasfd');

-- --------------------------------------------------------

--
-- Table structure for table `peminjam`
--

CREATE TABLE `peminjam` (
  `id` int(11) NOT NULL,
  `idbuku` int(11) NOT NULL,
  `tanggalpinjam` date NOT NULL,
  `tanggalkembali` date NOT NULL,
  `tanggalbatas` date NOT NULL,
  `iduser` int(11) NOT NULL,
  `petugaspinjam` int(11) NOT NULL,
  `petugaskembali` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peminjamdenda`
--

CREATE TABLE `peminjamdenda` (
  `id` int(11) NOT NULL,
  `idpinjam` int(11) NOT NULL,
  `nilaidenda` int(11) NOT NULL,
  `tanggalbayar` date NOT NULL,
  `petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id`, `nama`, `alamat`) VALUES
(1, 'linar', 'asdfas'),
(2, 'linar sfs', 'asdfass s sdfsf');

-- --------------------------------------------------------

--
-- Table structure for table `penulis`
--

CREATE TABLE `penulis` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penulis`
--

INSERT INTO `penulis` (`id`, `nama`, `alamat`) VALUES
(1, 'linar', 'benkong ss'),
(2, 'linar sdfa', 'benkong ss');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id`, `nama`, `alamat`, `username`, `password`) VALUES
(1, 'linargian', 'batam', 'admin', 'admin'),
(2, 'hendro', 'bengkong', ' s admin', '1111');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `tanggalmasuk` date NOT NULL,
  `notelp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `alamat`, `tanggalmasuk`, `notelp`) VALUES
(1, 'linar', 'batam', '2020-04-02', '081364252165');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idkategori` (`idkategori`),
  ADD KEY `idpenerbit` (`idpenerbit`),
  ADD KEY `idpenulis` (`idpenulis`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idbuku` (`idbuku`),
  ADD KEY `iduser` (`iduser`),
  ADD KEY `petugaskembali` (`petugaskembali`),
  ADD KEY `petugaspinjam` (`petugaspinjam`);

--
-- Indexes for table `peminjamdenda`
--
ALTER TABLE `peminjamdenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpinjam` (`idpinjam`),
  ADD KEY `petugas` (`petugas`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `peminjam`
--
ALTER TABLE `peminjam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peminjamdenda`
--
ALTER TABLE `peminjamdenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penulis`
--
ALTER TABLE `penulis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`idpenerbit`) REFERENCES `penerbit` (`id`),
  ADD CONSTRAINT `buku_ibfk_3` FOREIGN KEY (`idpenulis`) REFERENCES `penulis` (`id`);

--
-- Constraints for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD CONSTRAINT `peminjam_ibfk_1` FOREIGN KEY (`idbuku`) REFERENCES `buku` (`id`),
  ADD CONSTRAINT `peminjam_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `peminjam_ibfk_3` FOREIGN KEY (`petugaskembali`) REFERENCES `petugas` (`id`),
  ADD CONSTRAINT `peminjam_ibfk_4` FOREIGN KEY (`petugaspinjam`) REFERENCES `petugas` (`id`);

--
-- Constraints for table `peminjamdenda`
--
ALTER TABLE `peminjamdenda`
  ADD CONSTRAINT `peminjamdenda_ibfk_1` FOREIGN KEY (`idpinjam`) REFERENCES `peminjam` (`id`),
  ADD CONSTRAINT `peminjamdenda_ibfk_2` FOREIGN KEY (`petugas`) REFERENCES `petugas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

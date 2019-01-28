-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28 Jan 2019 pada 19.13
-- Versi Server: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buku_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `nama_admin` varchar(30) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `password`, `username`) VALUES
(11, 'suci rahayu ramadini', 'rahayucantikyes', 'sucirahayur25'),
(22, ' boy william', 'charpool12', 'boywilliam99');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(5) NOT NULL,
  `id_penerbit` int(5) DEFAULT NULL,
  `ISBN` int(10) DEFAULT NULL,
  `judul_buku` varchar(15) DEFAULT NULL,
  `penulis_buku` varchar(15) DEFAULT NULL,
  `harga_buku` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `id_penerbit`, `ISBN`, `judul_buku`, `penulis_buku`, `harga_buku`) VALUES
(81, 31, 9786003, 'statistika', 'agus irianto', 57200),
(91, 21, 978602, 'masakan indo', 'yasaboga', 36500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `chekout`
--

CREATE TABLE `chekout` (
  `id_chekout` int(5) NOT NULL,
  `id_customer` int(5) DEFAULT NULL,
  `total_harga` int(10) NOT NULL,
  `judul_buku` varchar(20) NOT NULL,
  `id_buku` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `chekout`
--

INSERT INTO `chekout` (`id_chekout`, `id_customer`, `total_harga`, `judul_buku`, `id_buku`) VALUES
(1, 12, 36500, 'masakan indo', 91),
(2, 13, 57200, 'statistika', 31),
(124, NULL, 0, '0', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(5) NOT NULL,
  `nama_customer` varchar(30) NOT NULL,
  `alamat_customer` text,
  `no_HPcustomer` varchar(15) DEFAULT NULL,
  `email_customer` varchar(30) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`, `alamat_customer`, `no_HPcustomer`, `email_customer`, `username`, `password`) VALUES
(12, 'amelia martha', 'jl.H.R rasuna said kav.33 jaksel', '081568893546', 'amelmrth@gmil.com', 'amelmrt', 'habib123'),
(13, 'aqila verara', 'jl. kamp baru no.2 jaksel', '085467783421', 'aqilverara@yahoo.com', 'aqilv', 'pasku5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `manager`
--

CREATE TABLE `manager` (
  `username_manager` varchar(15) NOT NULL,
  `id_admin` int(5) NOT NULL,
  `id_chekout` int(5) NOT NULL,
  `password` varchar(8) DEFAULT NULL,
  `id_manager` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `manager`
--

INSERT INTO `manager` (`username_manager`, `id_admin`, `id_chekout`, `password`, `id_manager`) VALUES
('diahputrr', 11, 1, '1000seri', 99);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(5) NOT NULL,
  `nama_penerbit` varchar(15) NOT NULL,
  `noTELP_penerbit` varchar(15) DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama_penerbit`, `noTELP_penerbit`, `alamat`) VALUES
(21, 'elex media', '0274451138', 'jl garuda kd11 376 jaranan bantul yogyakarta'),
(31, 'erlangga', '0274552261', 'jl beo no 9 demangan baru yogyakarta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_penerbit` (`id_penerbit`);

--
-- Indexes for table `chekout`
--
ALTER TABLE `chekout`
  ADD PRIMARY KEY (`id_chekout`),
  ADD KEY `judul_buku` (`judul_buku`),
  ADD KEY `judul_buku_2` (`judul_buku`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id_manager`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `chekout`
--
ALTER TABLE `chekout`
  MODIFY `id_chekout` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id_penerbit` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

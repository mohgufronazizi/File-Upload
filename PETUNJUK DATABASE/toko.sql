-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Nov 2021 pada 14.23
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `foto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`, `foto`) VALUES
('IDB001', 'TV LED', 2500000, NULL),
('IDB002', 'TV LCD', 1000000, NULL),
('IDB003', 'Kipas', 150000, NULL),
('IDB004', 'Blender', 300000, NULL),
('IDB005', 'Sterika', 100000, NULL),
('IDB006', 'Pompa Galon Elektrik', 30000, NULL),
('IDB007', 'Raket Nyamuk', 50000, NULL),
('IDB008', 'Remote TV', 10000, NULL),
('IDB009', 'AC', 3000000, NULL),
('IDB010', 'Lampu LED', 16000, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `faktur`
--

CREATE TABLE `faktur` (
  `id_faktur` varchar(20) NOT NULL,
  `id_pelanggan` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `totalBayar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `faktur`
--

INSERT INTO `faktur` (`id_faktur`, `id_pelanggan`, `tanggal`, `totalBayar`) VALUES
('IDF0001', '2021001', '2021-10-03', 2525000),
('IDF0002', '2021002', '2021-10-03', 75000),
('IDF0003', '2021003', '2021-10-03', 550000),
('IDF0004', '2021004', '2021-10-04', 3080000),
('IDF0005', '2021008', '2021-10-04', 600000),
('IDF0006', '2021009', '2021-10-05', 75000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `faktur_barang`
--

CREATE TABLE `faktur_barang` (
  `id_barang` varchar(20) NOT NULL,
  `id_faktur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `faktur_barang`
--

INSERT INTO `faktur_barang` (`id_barang`, `id_faktur`) VALUES
('IDB001', 'IDF0001'),
('IDB008', 'IDF0001'),
('IDB010', 'IDF0001'),
('IDB008', 'IDF0002'),
('IDB010', 'IDF0002'),
('IDB007', 'IDF0002'),
('IDB003', 'IDF0003'),
('IDB004', 'IDF0003'),
('IDB005', 'IDF0003'),
('IDB009', 'IDF0004'),
('IDB006', 'IDF0004'),
('IDB007', 'IDF0004'),
('IDB003', 'IDF0005'),
('IDB004', 'IDF0005'),
('IDB005', 'IDF0005'),
('IDB007', 'IDF0005'),
('IDB007', 'IDF0006'),
('IDB008', 'IDF0006'),
('IDB010', 'IDF0006');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`) VALUES
('2021001', 'Yuni'),
('2021002', 'Gufron'),
('2021003', 'Ayek'),
('2021004', 'Ilwan'),
('2021005', 'Satori'),
('2021006', 'Sandi'),
('2021007', 'Zainur'),
('2021008', 'Wina'),
('2021009', 'Arif'),
('2021010', 'Linda');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`id_faktur`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indeks untuk tabel `faktur_barang`
--
ALTER TABLE `faktur_barang`
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_faktur` (`id_faktur`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `faktur`
--
ALTER TABLE `faktur`
  ADD CONSTRAINT `id_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Ketidakleluasaan untuk tabel `faktur_barang`
--
ALTER TABLE `faktur_barang`
  ADD CONSTRAINT `id_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `id_faktur` FOREIGN KEY (`id_faktur`) REFERENCES `faktur` (`id_faktur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

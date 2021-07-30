-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jul 2021 pada 04.38
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sisfo`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `iuranlog`
--

CREATE TABLE `iuranlog` (
  `log_id` int(11) NOT NULL,
  `no_lama` int(10) NOT NULL,
  `no_baru` int(10) NOT NULL,
  `bulan_lama` varchar(50) NOT NULL,
  `bulan_baru` varchar(50) NOT NULL,
  `tahun_lama` int(5) NOT NULL,
  `tahun_baru` int(5) NOT NULL,
  `setoran_lama` int(20) NOT NULL,
  `setoran_baru` int(20) NOT NULL,
  `waktu_perubahan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `iuranlog`
--

INSERT INTO `iuranlog` (`log_id`, `no_lama`, `no_baru`, `bulan_lama`, `bulan_baru`, `tahun_lama`, `tahun_baru`, `setoran_lama`, `setoran_baru`, `waktu_perubahan`) VALUES
(1, 3, 3, 'November', 'November', 2021, 2020, 500000, 500000, '2021-07-27 14:52:17'),
(2, 3, 3, 'November', 'November', 2020, 2021, 500000, 500000, '2021-07-27 14:52:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_datakepalakeluarga`
--

CREATE TABLE `tb_datakepalakeluarga` (
  `id` int(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_rumah` int(50) NOT NULL,
  `no_telp` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_datakepalakeluarga`
--

INSERT INTO `tb_datakepalakeluarga` (`id`, `nama`, `no_rumah`, `no_telp`) VALUES
(1, 'Dimas Satrio', 13, '081528648219'),
(2, 'Rahmat Dian', 53, '081542854371');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_iuran`
--

CREATE TABLE `tb_iuran` (
  `no` int(10) NOT NULL,
  `bulan` varchar(50) NOT NULL,
  `tahun` int(5) NOT NULL,
  `setoran` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_iuran`
--

INSERT INTO `tb_iuran` (`no`, `bulan`, `tahun`, `setoran`) VALUES
(2, 'Mei', 2021, 300000),
(3, 'November', 2021, 500000),
(25, 'Juni', 2021, 400000);

--
-- Trigger `tb_iuran`
--
DELIMITER $$
CREATE TRIGGER `trg_UpdateIuran` BEFORE UPDATE ON `tb_iuran` FOR EACH ROW BEGIN
INSERT INTO iuranlog 
set iuranlog.no_lama = old.no,
iuranlog.no_baru = new.no,
iuranlog.bulan_lama = old.bulan,
iuranlog.bulan_baru = new.bulan,
iuranlog.tahun_lama = old.tahun,
iuranlog.tahun_baru = new.tahun ,
iuranlog.setoran_lama = old.setoran,
iuranlog.setoran_baru = new.setoran,
iuranlog.waktu_perubahan = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_laporan`
--

CREATE TABLE `tb_laporan` (
  `id` int(11) NOT NULL,
  `bulan` varchar(50) NOT NULL,
  `jml_pemasukan` int(11) NOT NULL,
  `jml_pengeluaran` int(11) NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_laporan`
--

INSERT INTO `tb_laporan` (`id`, `bulan`, `jml_pemasukan`, `jml_pengeluaran`, `saldo`) VALUES
(1, 'Mei', 200000, 50000, 150000),
(412, 'Juni', 400000, 200000, 9000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_login`
--

CREATE TABLE `tb_login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_login`
--

INSERT INTO `tb_login` (`username`, `password`) VALUES
('dimassatrio', 'dimassatrio');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `iuranlog`
--
ALTER TABLE `iuranlog`
  ADD PRIMARY KEY (`log_id`);

--
-- Indeks untuk tabel `tb_datakepalakeluarga`
--
ALTER TABLE `tb_datakepalakeluarga`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_iuran`
--
ALTER TABLE `tb_iuran`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `tb_laporan`
--
ALTER TABLE `tb_laporan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `iuranlog`
--
ALTER TABLE `iuranlog`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_datakepalakeluarga`
--
ALTER TABLE `tb_datakepalakeluarga`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_iuran`
--
ALTER TABLE `tb_iuran`
  MODIFY `no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `tb_laporan`
--
ALTER TABLE `tb_laporan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Feb 2023 pada 00.08
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id` int(11) NOT NULL,
  `nama_outlet` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tlp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id`, `nama_outlet`, `alamat`, `tlp`) VALUES
(1, 'King Laundry - Helvetia', 'Jalan Veteran Pasar V Helvetia', '0895628894070'),
(2, 'King Laundry - Marelan', 'Jalan Marelan Raya Tanah 600', '085236954712');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenis`
--

CREATE TABLE `tb_jenis` (
  `kd_jenis` int(11) NOT NULL,
  `jenis_laundry` varchar(100) NOT NULL,
  `lama_proses` int(11) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jenis`
--

INSERT INTO `tb_jenis` (`kd_jenis`, `jenis_laundry`, `lama_proses`, `tarif`) VALUES
(1, 'Laundry + Seterika', 3, 10000),
(2, 'Fast Laundry', 1, 15000),
(12, 'Regular', 2, 6000),
(13, 'Cuci Karpet', 3, 50000),
(14, 'Selimut', 2, 20000),
(15, 'Kaos', 1, 10000),
(16, 'Kain', 2, 15000),
(17, 'Kiloan', 1, 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_laporan`
--

CREATE TABLE `tb_laporan` (
  `id_laporan` int(11) NOT NULL,
  `tgl_laporan` date NOT NULL,
  `ket_laporan` int(1) NOT NULL,
  `catatan` text NOT NULL,
  `id_laundry` char(10) DEFAULT NULL,
  `pemasukan` int(11) NOT NULL,
  `id_pengeluaran` char(10) DEFAULT NULL,
  `pengeluaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_laporan`
--

INSERT INTO `tb_laporan` (`id_laporan`, `tgl_laporan`, `ket_laporan`, `catatan`, `id_laundry`, `pemasukan`, `id_pengeluaran`, `pengeluaran`) VALUES
(33, '2023-02-10', 2, 'Deterjen', NULL, 0, 'PG-0001', 500000),
(34, '2023-02-10', 2, 'Pewangi', NULL, 0, 'PG-0002', 400000),
(35, '2023-02-10', 2, 'Token', NULL, 0, 'PG-0003', 1000000),
(36, '2023-02-10', 1, 'Antarkan di jalan persatuan', 'LD-0001', 50000, NULL, 0),
(37, '2023-02-10', 1, 'Sampe Bersih', 'LD-0002', 250000, NULL, 0),
(38, '2023-02-10', 1, 'Diantarkan ya', 'LD-0003', 1000000, NULL, 0),
(39, '2023-02-10', 1, 'Diantarkan ya', 'LD-0004', 1500000, NULL, 0),
(40, '2023-02-11', 1, 'Secepatnya', 'LD-0005', 50000, NULL, 0),
(41, '2023-02-11', 1, 'OK', 'LD-0006', 100000, NULL, 0),
(42, '2023-02-11', 1, 'OK', 'LD-0007', 10000, NULL, 0),
(43, '2023-02-11', 1, 'Diantarkan ke Helvetia pasar V gg Persatuan Raya', 'LD-0008', 50000, NULL, 0),
(44, '2023-02-11', 1, 'CEPAT', 'LD-0009', 80000, NULL, 0),
(45, '2023-02-11', 1, 'Segera Diantar', 'LD-0010', 100000, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_laundry`
--

CREATE TABLE `tb_laundry` (
  `id_laundry` char(10) NOT NULL,
  `pelangganid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `kd_jenis` char(6) NOT NULL,
  `tgl_terima` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `jml_kilo` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `totalbayar` int(11) NOT NULL,
  `status_pembayaran` int(1) NOT NULL,
  `status_pengambilan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_laundry`
--

INSERT INTO `tb_laundry` (`id_laundry`, `pelangganid`, `userid`, `kd_jenis`, `tgl_terima`, `tgl_selesai`, `jml_kilo`, `catatan`, `totalbayar`, `status_pembayaran`, `status_pengambilan`) VALUES
('LD-0001', 11, 28, '2', '2023-02-10', '2023-02-11', 5, 'Antarkan di jalan persatuan', 50000, 1, 1),
('LD-0002', 12, 28, '13', '2023-02-10', '2023-02-13', 5, 'Sampe Bersih', 250000, 1, 1),
('LD-0003', 13, 28, '13', '2023-02-10', '2023-02-13', 20, 'Diantarkan ya', 1000000, 1, 1),
('LD-0004', 14, 28, '13', '2023-02-10', '2023-02-13', 30, 'Diantarkan ya', 1500000, 1, 1),
('LD-0005', 11, 27, '1', '2023-02-11', '2023-02-14', 5, 'Secepatnya', 50000, 1, 1),
('LD-0006', 12, 27, '1', '2023-02-11', '2023-02-14', 10, 'OK', 100000, 1, 1),
('LD-0007', 12, 27, '1', '2023-02-11', '2023-02-14', 1, 'OK', 10000, 1, 1),
('LD-0008', 11, 28, '1', '2023-02-11', '2023-02-14', 5, 'Diantarkan ke Helvetia pasar V gg Persatuan Raya', 50000, 1, 0),
('LD-0009', 12, 28, '1', '2023-02-11', '2023-02-14', 8, 'CEPAT', 80000, 1, 0),
('LD-0010', 13, 28, '13', '2023-02-11', '2023-02-14', 2, 'Segera Diantar', 100000, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `pelangganid` int(11) NOT NULL,
  `pelanggannama` varchar(150) NOT NULL,
  `pelangganjk` varchar(15) NOT NULL,
  `pelangganalamat` text NOT NULL,
  `pelanggantelp` varchar(20) NOT NULL,
  `pelangganfoto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`pelangganid`, `pelanggannama`, `pelangganjk`, `pelangganalamat`, `pelanggantelp`, `pelangganfoto`) VALUES
(11, 'Bagus Setiawan', 'Laki - laki', 'Jalan Veteran Pasar V Helvetia', '0895628894070', '63e5e8fc70422.jpg'),
(12, 'Muhammad Riski', 'Laki - laki', 'Jalan Veteran Pasar IV Helvetia', '085623417895', '63e5e9c6c4ed3.jpg'),
(13, 'Bukhari', 'Laki - laki', 'Jalan Veteran Pasar VI Helvetia', '085968745212', '63e5ea0739f83.jpg'),
(14, 'Muhammad Rifqi', 'Laki - laki', 'Marelan Pasar II', '085968745621', '63e6f78839bad.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengeluaran`
--

CREATE TABLE `tb_pengeluaran` (
  `id_pengeluaran` char(10) NOT NULL,
  `tgl_pengeluaran` date NOT NULL,
  `catatan` text NOT NULL,
  `pengeluaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pengeluaran`
--

INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tgl_pengeluaran`, `catatan`, `pengeluaran`) VALUES
('PG-0001', '2023-02-10', 'Deterjen', 500000),
('PG-0002', '2023-02-10', 'Pewangi', 400000),
('PG-0003', '2023-02-10', 'Token', 1000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_users`
--

CREATE TABLE `tb_users` (
  `userid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `userpass` varchar(100) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `jk` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `usertelp` varchar(20) NOT NULL,
  `userfoto` varchar(50) DEFAULT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_users`
--

INSERT INTO `tb_users` (`userid`, `username`, `userpass`, `nama`, `jk`, `alamat`, `usertelp`, `userfoto`, `level`) VALUES
(27, 'admin', '$2y$10$mvZtk7iJNi4A5dEcpdaPTu/J7azwtqNd9qU6kgGHJHl/6wPbvW3.y', 'Bagus', 'Laki - laki', 'Jalan Veteran Pasar V Helvetia', '0895628894070', '63e5eaf2a8e43.jpg', 'admin'),
(28, 'kasir', '$2y$10$OY0kfQYiX2MK6DM/PvlCf.LdnqZbrzQmhZsRHUhFIgr3t.qqz.AJ2', 'Bagus Setiawan', 'Laki - laki', 'Jalan Veteran Pasar V Helvetia', '0895392518509', '63e5e964905b8.jpg', 'kasir');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_jenis`
--
ALTER TABLE `tb_jenis`
  ADD PRIMARY KEY (`kd_jenis`);

--
-- Indeks untuk tabel `tb_laporan`
--
ALTER TABLE `tb_laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indeks untuk tabel `tb_laundry`
--
ALTER TABLE `tb_laundry`
  ADD PRIMARY KEY (`id_laundry`);

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`pelangganid`);

--
-- Indeks untuk tabel `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indeks untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_jenis`
--
ALTER TABLE `tb_jenis`
  MODIFY `kd_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `tb_laporan`
--
ALTER TABLE `tb_laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `pelangganid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

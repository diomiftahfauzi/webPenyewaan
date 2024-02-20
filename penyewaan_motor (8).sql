-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Feb 2024 pada 08.47
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penyewaan_motor`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keterangan_motor`
--

CREATE TABLE `keterangan_motor` (
  `id_motor` int(10) NOT NULL,
  `warna motor` varchar(10) NOT NULL,
  `cc motor` varchar(10) NOT NULL,
  `plat motor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `keterangan_motor`
--

INSERT INTO `keterangan_motor` (`id_motor`, `warna motor`, `cc motor`, `plat motor`) VALUES
(1, 'merah', '1000cc', 'B 123 CPI'),
(2, 'hitam', '600cc', 'B 145 VNDI'),
(3, 'hijau', '250cc', 'B 232 AYI'),
(4, 'putih', '1000cc', 'B 100 DAN'),
(5, 'merah', '1000cc', 'B 676 CEP'),
(6, 'hitam', '600cc', 'B 198 DAM'),
(7, 'hijau', '250cc', 'B 768 ASEP'),
(8, 'merah', '1000cc', 'B 879 BEN'),
(9, 'hitam', '1000cc', 'B 678 AAN'),
(10, 'merah', '1000cc', 'B 643 YOO');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id`, `nama`, `username`, `password`) VALUES
(1, 'dio', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewa`
--

CREATE TABLE `penyewa` (
  `id` int(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(10) NOT NULL,
  `no_hp` int(10) NOT NULL,
  `nama_motor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penyewa`
--

INSERT INTO `penyewa` (`id`, `nama`, `alamat`, `no_hp`, `nama_motor`) VALUES
(1, 'hendra', 'bandung', 9876, ''),
(2, 'cepi', 'alam barja', 89765428, 'zx25rr'),
(3, 'vindisel', 'ciburuy', 927483, 'ducatiV4'),
(4, 'asep', 'langit', 666666, 'ducatiV4S'),
(5, 'vindisel', 'brigez', 34567, 'h2'),
(6, 'bonteng', 'tanah ', 9877877, 'cbr250rr'),
(7, 'dani', 'afrika', 57657, 'beat'),
(8, 'turutut ketut', 'alam', 879876765, 'vario'),
(9, 'aan', 'moonraker', 76567876, 'r6'),
(10, 'samsul', 'bandung', 8282, 'r1m'),
(12, 'citra', 'gerahakenc', 765434567, ''),
(13, 'deden', 'cimahi', 98768, ''),
(15, 'bebep', 'batujajar', 9392738, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(10) NOT NULL,
  `waktu_bayar` date NOT NULL,
  `no_hp` int(10) NOT NULL,
  `id_penyewa` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `waktu_bayar`, `no_hp`, `id_penyewa`) VALUES
(1, '2023-08-01', 987654321, 3),
(2, '2023-08-02', 1234567890, 4),
(3, '2023-08-03', 98765432, 5),
(4, '2023-08-04', 9876543, 6),
(5, '2023-08-05', 12345678, 7),
(6, '2023-08-06', 98765, 8),
(7, '2023-08-07', 123456, 9),
(8, '2023-08-08', 123456, 0),
(9, '2023-08-09', 98765, 0),
(10, '2023-08-10', 9876543, 0);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `vtransaksi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `vtransaksi` (
`waktu_bayar` date
,`no_hp` int(10)
,`nama` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `vtransaksi`
--
DROP TABLE IF EXISTS `vtransaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtransaksi`  AS SELECT `transaksi`.`waktu_bayar` AS `waktu_bayar`, `transaksi`.`no_hp` AS `no_hp`, `penyewa`.`nama` AS `nama` FROM (`transaksi` left join `penyewa` on(`penyewa`.`id` = `transaksi`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keterangan_motor`
--
ALTER TABLE `keterangan_motor`
  ADD PRIMARY KEY (`id_motor`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keterangan_motor`
--
ALTER TABLE `keterangan_motor`
  MODIFY `id_motor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `penyewa`
--
ALTER TABLE `penyewa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1211226;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

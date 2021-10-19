-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Okt 2021 pada 21.16
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pariwisata2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_admin`
--

CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL,
  `ussername` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL COMMENT 'kombinasi angka dan karakter',
  `level` text NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kategori`
--

CREATE TABLE `t_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL,
  `keterangan_kategori` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_penginapan`
--

CREATE TABLE `t_penginapan` (
  `id_penginapan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `telp` text NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `fasilitas` text NOT NULL,
  `jumlah_kamar` int(11) NOT NULL,
  `gambar` int(11) NOT NULL,
  `pemilik` text NOT NULL,
  `id_biroperjalanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_usser`
--

CREATE TABLE `t_usser` (
  `id_usser` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `kota_asal` text NOT NULL,
  `Jenis_kelamin` text NOT NULL,
  `no_telp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_wisata`
--

CREATE TABLE `t_wisata` (
  `id_wisa` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_wisata` text NOT NULL,
  `alamat_wisata` text NOT NULL,
  `fasilitas` text NOT NULL,
  `gambar` text NOT NULL,
  `id_biroperjalanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_admin`
--
ALTER TABLE `t_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_kategori`
--
ALTER TABLE `t_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `t_penginapan`
--
ALTER TABLE `t_penginapan`
  ADD PRIMARY KEY (`id_penginapan`),
  ADD KEY `id_biroperjalanan` (`id_biroperjalanan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `t_usser`
--
ALTER TABLE `t_usser`
  ADD PRIMARY KEY (`id_usser`);

--
-- Indeks untuk tabel `t_wisata`
--
ALTER TABLE `t_wisata`
  ADD PRIMARY KEY (`id_wisa`),
  ADD KEY `id_biroperjalanan` (`id_biroperjalanan`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_admin`
--
ALTER TABLE `t_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t_kategori`
--
ALTER TABLE `t_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t_penginapan`
--
ALTER TABLE `t_penginapan`
  MODIFY `id_penginapan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t_usser`
--
ALTER TABLE `t_usser`
  MODIFY `id_usser` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t_wisata`
--
ALTER TABLE `t_wisata`
  MODIFY `id_wisa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_kategori`
--
ALTER TABLE `t_kategori`
  ADD CONSTRAINT `t_kategori_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `t_usser` (`id_usser`) ON DELETE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `t_penginapan`
--
ALTER TABLE `t_penginapan`
  ADD CONSTRAINT `t_penginapan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `t_usser` (`id_usser`) ON DELETE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `t_wisata`
--
ALTER TABLE `t_wisata`
  ADD CONSTRAINT `t_wisata_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `t_usser` (`id_usser`) ON DELETE NO ACTION,
  ADD CONSTRAINT `t_wisata_ibfk_2` FOREIGN KEY (`id_wisa`) REFERENCES `t_kategori` (`id_kategori`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

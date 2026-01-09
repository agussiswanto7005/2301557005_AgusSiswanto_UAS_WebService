-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2025 at 06:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan_masyarakat`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori_pengaduan`
--

CREATE TABLE `kategori_pengaduan` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_pengaduan`
--

INSERT INTO `kategori_pengaduan` (`id`, `nama_kategori`) VALUES
(1, 'Infrastruktur'),
(2, 'Pelayanan Publik'),
(3, 'Kebersihan'),
(4, 'Keamanan'),
(5, 'Perizinan'),
(6, 'Bencana Alam (Longsor)'),
(7, 'Pertanian & Irigasi'),
(8, 'Kesehatan Puskesmas'),
(9, 'Penerangan Jalan Desa'),
(10, 'Pungutan Liar');

-- --------------------------------------------------------

--
-- Table structure for table `log_status`
--

CREATE TABLE `log_status` (
  `id` int(11) NOT NULL,
  `pengaduan_id` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_status`
--

INSERT INTO `log_status` (`id`, `pengaduan_id`, `status`, `keterangan`, `tanggal`) VALUES
(1, 3, 'dikirim', 'Laporan longsor masuk', '2025-12-20 04:32:30'),
(2, 3, 'diproses', 'Tim PU menuju lokasi Sengare', '2025-12-20 04:32:30'),
(3, 5, 'dikirim', 'Warga mengeluh antrian', '2025-12-20 04:32:30'),
(4, 5, 'selesai', 'Sistem antrian diperbarui', '2025-12-20 04:32:30'),
(5, 8, 'diproses', 'Pemotongan dahan pohon', '2025-12-20 04:32:30'),
(6, 8, 'selesai', 'Jalan Krompeng sudah bersih', '2025-12-20 04:32:30'),
(7, 7, 'diproses', 'Pengecekan jaringan internet kantor', '2025-12-20 04:32:30'),
(8, 9, 'dikirim', 'Laporan jalan gelap Karangasem', '2025-12-20 04:32:30'),
(9, 10, 'dikirim', 'Laporan pungli masuk', '2025-12-20 04:32:30'),
(10, 1, 'diproses', 'Survei kerusakan jalan oleh tim', '2025-12-20 04:32:30'),
(11, 10, 'diproses', 'Tanggapan diberikan: Laporan Anda sedang kami proses, terima kasih....', '2025-12-27 04:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `isi` text NOT NULL,
  `status` enum('dikirim','diproses','selesai') DEFAULT 'dikirim',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id`, `user_id`, `kategori_id`, `judul`, `isi`, `status`, `created_at`) VALUES
(2, 1, 1, 'Jembatan Rusak', 'Perbaiki segera', 'dikirim', '2025-12-16 13:52:19'),
(3, 3, 6, 'Longsor Jalan Sengare', 'Akses jalan menuju Desa Sengare tertutup tanah longsor kecil.', 'diproses', '2025-12-20 04:32:30'),
(4, 4, 7, 'Irigasi Sawah Macet', 'Saluran air ke sawah warga di Desa Kalirejo tersumbat sampah.', 'dikirim', '2025-12-20 04:32:30'),
(5, 5, 8, 'Layanan Antrian Obat', 'Mohon diperbaiki sistem antrian obat di Puskesmas Talun.', 'selesai', '2025-12-20 04:32:30'),
(6, 1, 1, 'Aspal Mengelupas Kalirejo', 'Jalan arah Desa Kalirejo banyak yang berlubang kena hujan.', 'diproses', '2025-12-20 04:32:30'),
(7, 3, 9, 'Lampu Jalan Karangasem', 'Sepanjang jalan hutan Karangasem gelap kalau malam.', 'dikirim', '2025-12-20 04:32:30'),
(8, 7, 2, 'Petugas Pelayanan Lambat', 'Pelayanan KK di kantor kecamatan hari ini sangat lama.', 'diproses', '2025-12-20 04:32:30'),
(9, 8, 6, 'Pohon Tumbang Krompeng', 'Ada pohon jati tumbang menutup sebagian jalan Krompeng.', 'selesai', '2025-12-20 04:32:30'),
(10, 4, 10, 'Oknum Parkir Wisata', 'Ada pungutan parkir liar di sekitar curug wilayah Talun.', 'diproses', '2025-12-20 04:32:30'),
(11, 1, 1, 'Jalan Berlubang di Desa Sengare', 'Mohon perbaikan jalan di dusun 2 Desa Sengare karena sudah sangat parah.', 'dikirim', '2025-12-20 05:34:35');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id`, `nama`, `jabatan`, `no_hp`) VALUES
(1, 'Bripka Hartono', 'Babinkamtibmas Talun', '08122500111'),
(2, 'Siska Administrasi', 'Staf Kec. Talun', '08122500222'),
(3, 'Dedi Lapangan', 'Upt PU Wilayah Talun', '08122500333'),
(4, 'Ir. Bambang', 'Penyuluh Pertanian', '08122500444'),
(5, 'dr. Maya', 'Kepala Puskesmas Talun', '08122500555'),
(6, 'Haryono', 'Trantib Kecamatan', '08122500666'),
(7, 'Lina', 'Staf Kesejahteraan Rakyat', '08122500777'),
(8, 'Anto', 'Teknisi LPJU Kabupaten', '08122500888'),
(9, 'Rina', 'Admin Bansos Talun', '08122500999'),
(10, 'Tono', 'Staf Pelayanan Umum', '08122500000');

-- --------------------------------------------------------

--
-- Table structure for table `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id` int(11) NOT NULL,
  `pengaduan_id` int(11) NOT NULL,
  `petugas_id` int(11) NOT NULL,
  `isi_tanggapan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tanggapan`
--

INSERT INTO `tanggapan` (`id`, `pengaduan_id`, `petugas_id`, `isi_tanggapan`, `created_at`) VALUES
(1, 3, 3, 'Alat berat sedang dikirim ke lokasi jalan Sengare.', '2025-12-20 04:32:30'),
(2, 5, 5, 'Kami sudah menambah loket pengambilan obat per hari ini.', '2025-12-20 04:32:30'),
(3, 1, 2, 'Laporan diterima, sudah kami sampaikan ke dinas terkait.', '2025-12-20 04:32:30'),
(4, 7, 2, 'Mohon maaf, kendala pada server pusat saat proses KK.', '2025-12-20 04:32:30'),
(5, 8, 6, 'Tim BPBD dan Trantib sudah mengevakuasi pohon tersebut.', '2025-12-20 04:32:30'),
(6, 9, 8, 'Perbaikan lampu jalan Karangasem dijadwalkan minggu ini.', '2025-12-20 04:32:30'),
(7, 10, 1, 'Anggota Babinkamtibmas akan cek lokasi wisata tersebut.', '2025-12-20 04:32:30'),
(8, 2, 3, 'Perbaikan jembatan penghubung masuk anggaran tahun depan.', '2025-12-20 04:32:30'),
(9, 4, 4, 'Ketua kelompok tani sudah diminta membersihkan saluran.', '2025-12-20 04:32:30'),
(10, 6, 10, 'Petugas sudah diperingatkan untuk lebih sigap melayani.', '2025-12-20 04:32:30'),
(11, 10, 1, 'Laporan Anda sedang kami proses, terima kasih.', '2025-12-27 04:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','petugas','masyarakat') DEFAULT 'masyarakat',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Masyarakat Umum', 'tamu@talun.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'masyarakat', '2025-12-16 13:48:15'),
(2, 'Admin Sistem', 'admin@pengaduan.com', 'admin123', 'admin', '2025-12-16 13:48:15'),
(3, 'Slamet Riadi', 'slamet@talun.com', 'password123', 'masyarakat', '2025-12-20 04:32:30'),
(4, 'Hj. Aminah', 'aminah@talun.com', 'password123', 'masyarakat', '2025-12-20 04:32:30'),
(5, 'Rizky Kurniawan', 'rizky@talun.com', 'password123', 'masyarakat', '2025-12-20 04:32:30'),
(6, 'Siti Zulaikha', 'siti@talun.com', 'password123', 'masyarakat', '2025-12-20 04:32:30'),
(7, 'Agus Prayitno', 'agus@talun.com', 'password123', 'masyarakat', '2025-12-20 04:32:30'),
(8, 'Bripka Hartono', 'hartono@petugas.com', 'petugas123', 'petugas', '2025-12-20 04:32:30'),
(9, 'Siska Administrasi', 'siska@petugas.com', 'petugas123', 'petugas', '2025-12-20 04:32:30'),
(10, 'Dedi Lapangan', 'dedi@petugas.com', 'petugas123', 'petugas', '2025-12-20 04:32:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori_pengaduan`
--
ALTER TABLE `kategori_pengaduan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_status`
--
ALTER TABLE `log_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori_pengaduan`
--
ALTER TABLE `kategori_pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `log_status`
--
ALTER TABLE `log_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaduan_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_pengaduan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

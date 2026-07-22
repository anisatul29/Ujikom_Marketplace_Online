-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2026 at 10:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marketplace`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `password`, `created_at`) VALUES
('ADM01', 'anisa', 'anisa@gmail.com', 'admin123', '2026-07-21 15:38:16'),
('ADM02', 'staff gudang', 'staff@gmail.com', 'staff456', '2026-07-21 15:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(10) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `created_at`) VALUES
('KTG01', 'Elektronik', '2026-07-21 15:45:59'),
('KTG02', 'Fashion & Pakaian', '2026-07-21 15:43:24'),
('KTG03', 'Makanan & Minuman', '2026-07-21 15:43:24'),
('KTG04', 'Kesehatan & Rumah Tangga', '2026-07-21 15:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` varchar(10) NOT NULL,
  `id_produk` varchar(10) NOT NULL,
  `nama_pembeli` varchar(100) NOT NULL,
  `nomor_hp` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` decimal(12,2) NOT NULL,
  `tanggal_pesan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `id_produk`, `nama_pembeli`, `nomor_hp`, `jumlah`, `total_harga`, `tanggal_pesan`, `status`) VALUES
('ORD0001', 'PRD002', 'Ghozali', '085812736923', 1, 75000.00, '2026-07-22 06:49:50', 'Selesai'),
('ORD0002', 'PRD001', 'rakhel', '081990623594', 1, 150000.00, '2026-07-22 06:49:44', 'Diproses'),
('ORD0003', 'PRD003', 'bagas', '085609127306', 4, 100000.00, '2026-07-22 06:49:27', 'Pending'),
('TRX004', 'PRD006', 'anisa', '085600529869', 1, 300000.00, '2026-07-22 07:34:35', 'Pending'),
('TRX005', 'PRD002', 'hani', '09362664847', 1, 75000.00, '2026-07-22 07:43:27', 'Pending'),
('TRX006', 'PRD007', 'istik', '09437867', 5, 1000000.00, '2026-07-22 07:58:08', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` varchar(10) NOT NULL,
  `id_kategori` varchar(10) NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` decimal(12,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `foto` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `deskripsi`, `harga`, `stok`, `foto`, `created_at`) VALUES
('PRD001', 'KTG01', 'Headphone Bluetooth Bass', 'Headphone wireless dengan fitur noise cancelling dan baterai tahan lama.', 150000.00, 15, 'headphone.jpg', '2026-07-01 16:02:09'),
('PRD002', 'KTG02', 'Kaos Polos Cotton Combed', 'Kaos polos premium bahan katun combed 30s, sangat adem dan nyaman.', 75000.00, 24, 'kaos.jpg', '2026-07-22 07:43:27'),
('PRD003', 'KTG03', 'Baso Aci', ' Perpaduan sempurna antara baso aci yang kenyal, kuah kaldu gurih yang hangat, serta taburan cabai rawit segar dan perasan jeruk limau menciptakan ledakan rasa di setiap suapan.', 25000.00, 85, 'baso.jpg', '2026-07-22 06:11:57'),
('PRD004', 'KTG01', 'Mouse Gaming RGB', 'Mouse gaming kabel dengan sensitivitas tinggi hingga 7200 DPI dan lampu RGB.', 120000.00, 20, 'mouse.jpg', '2026-07-22 00:17:17'),
('PRD005', 'KTG02', 'Hoodie', 'Hoodie dengan bahan fleece tebal yang cocok untuk udara dingin atau berkendara.', 185000.00, 12, 'hoodie.jpg', '2026-07-22 06:07:48'),
('PRD006', 'KTG04', '1 Set Alat Masak', '-Dibuat dari material seperti stainless steel anti-karat, keramik, atau granit anti-lengket, set ini dirancang agar tahan panas, mudah dibersihkan, dan mendukung berbagai teknik memasak harian.', 300000.00, 3, '1784702795_998.jpg', '2026-07-22 07:35:29'),
('PRD007', 'KTG02', 'set makeup', 'makeup set', 200000.00, 5, '1784707032_319.jpg', '2026-07-22 07:58:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

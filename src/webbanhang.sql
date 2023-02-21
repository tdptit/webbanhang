-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Feb 21, 2023 at 04:22 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webbanhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
('ctg1', 'Điện thoại'),
('ctg2', 'Máy tính'),
('ctg3', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `orderr`
--

CREATE TABLE `orderr` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `total_money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orderr`
--

INSERT INTO `orderr` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `order_date`, `total_money`) VALUES
('_q0ZHNrrY', 'customer1', 'Phùng Tú', 'tu@gmail.com', '0987645323', 'Hà nội', '2023-02-21', 347040),
('eH3R6NV8w', 'customer2', 'Phùng Văn Tú', 'tuabc@gmail.com', '0967634324', 'Vĩnh Phúc', '2023-02-21', 88540),
('Hj7oLiQ15', 'customer1', 'Tiến Dũng', 'satthumauda@gmail.com', 'a', 'Hà Nội Làng Al', '2023-02-21', 31980),
('PA_LsdXEN', 'customer1', 'Tiến Dũng', 'dung@gmail.com', '0967632564', 'Vĩnh Phúc', '2023-02-21', 103040);

-- --------------------------------------------------------

--
-- Table structure for table `orderr_detail`
--

CREATE TABLE `orderr_detail` (
  `id` int(11) NOT NULL,
  `orderr_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orderr_detail`
--

INSERT INTO `orderr_detail` (`id`, `orderr_id`, `product_id`, `name`, `quantity`, `price`) VALUES
(2, 'Hj7oLiQ15', 'l2', 'MSI Gaming GF63 Thin 11SC-1090VN i5 11400H', 2, 31980),
(3, '_q0ZHNrrY', 'l3', 'Gigabyte Gaming G5 GE-51VN263SH i5 12500H', 5, 347040),
(4, 'eH3R6NV8w', 'p4', 'OPPO A77s 8GB-128GB', 1, 6090),
(5, 'eH3R6NV8w', 'l1', 'Asus TUF Gaming FX506LHB-HN188W i5 10300H', 1, 15990),
(6, 'eH3R6NV8w', 'l3', 'Gigabyte Gaming G5 GE-51VN263SH i5 12500H', 1, 21690),
(7, 'eH3R6NV8w', 'p6', 'Samsung Galaxy S22 Bora Purple 5G', 1, 14990),
(8, 'eH3R6NV8w', 'p1', 'Samsung Galaxy S23 Ultra 5G 256GB', 1, 26990),
(9, 'eH3R6NV8w', 'p2', 'Xiaomi Redmi 10A 3GB-64GB', 1, 2790),
(10, 'PA_LsdXEN', 'l4', 'Laptop Lenovo IdeaPad Gaming 3 15IAH7 i5 12500H', 1, 22990),
(11, 'PA_LsdXEN', 'l8', 'Laptop MSI Gaming GF63 Thin 11SC-663VN i7 11800H', 1, 18690),
(12, 'PA_LsdXEN', 'l3', 'Gigabyte Gaming G5 GE-51VN263SH i5 12500H', 1, 21690),
(13, 'PA_LsdXEN', 'p5', 'Xiaomi Redmi Note 11 Pro 8GB - 128GB', 1, 6590),
(14, 'PA_LsdXEN', 'p1', 'Samsung Galaxy S23 Ultra 5G 256GB', 1, 26990),
(15, 'PA_LsdXEN', 'p4', 'OPPO A77s 8GB-128GB', 1, 6090);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `image`, `title`, `price`, `description`) VALUES
('l1', 'ctg2', '637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg', 'Asus TUF Gaming FX506LHB-HN188W i5 10300H', 15990, '15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-glare LED-backlit\r\n\r\nIntel, Core i5, 10300H\r\n\r\n8 GB (1 thanh 8 GB), DDR4, 2933 MHz\r\n\r\nSSD 512 GB\r\n\r\nNVIDIA GeForce GTX 1650 4GB; Intel UHD Graphics'),
('l2', 'ctg2', '638007352801976726_msi-gaming-gf63-thin-11sc-1090vn-den-dd.jpg', 'MSI Gaming GF63 Thin 11SC-1090VN i5 11400H', 15990, '15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, IPS FHD\r\n\r\nIntel, Core i5, 11400H\r\n\r\n8 GB (1 thanh 8 GB), DDR4, 3200 MHz\r\n\r\nSSD 512 GB\r\n\r\nNVIDIA GeForce GTX 1650 4GB'),
('l3', 'ctg2', '638036059541782094_gigabyte-gaming-g5-ge-i5-12500h-rtx3050-dd-bh-moi.jpg', 'Gigabyte Gaming G5 GE-51VN263SH i5 12500H', 21690, '15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-Glare LED-Backlit Display\r\n\r\nIntel, Core i5, 12500H\r\n\r\n8 GB (1 thanh 8 GB), DDR4, 3200 MHz\r\n\r\nSSD 512 GB\r\n\r\nNVIDIA GeForce RTX 3050 4GB; Intel Iris Xe Graphics'),
('l4', 'ctg2', '637971149907512230_lenovo-ideapad-gaming-3-15iah7-xam-dd.jpg', 'Laptop Lenovo IdeaPad Gaming 3 15IAH7 i5 12500H', 22990, '15.6 inch, 1920 x 1080 Pixels, IPS, 120 Hz, 250 nits, IPS LCD LED Backlit, True Tone\r\n\r\nIntel, Core i5, 12500H\r\n\r\n16 GB (2 thanh 8 GB), DDR4, 3200 MHz\r\n\r\nSSD 512 GB\r\n\r\nNVIDIA GeForce RTX 3050 4GB'),
('l5', 'ctg2', '638053327684236749_lenovo-ideapad-1-15amn7-xam-dd.jpg', 'Laptop Lenovo IdeaPad 1 15AMN7 R5 7520U', 12190, '15.6 inch, 1920 x 1080 Pixels, TN, 60 Hz, 220 nits, FHD\r\n\r\nAMD, Ryzen 5, 7520U\r\n\r\n8 GB, LPDDR5, 5500 MHz\r\n\r\nSSD 512 GB\r\n\r\nAMD Radeon 610 2GB'),
('l6', 'ctg2', '638121561917481306_msi-gaming-gf63-thin-11uc-1228vn-i7-11800h-dd.jpg', 'Laptop MSI Gaming GF63 Thin 11UC-1228VN i7-11800H', 20690, '15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, 250 nits, IPS\r\n\r\nIntel, Core i7, 11800H\r\n\r\n8 GB, DDR4, 3200 MHz\r\n\r\nSSD 512 GB\r\n\r\nNVIDIA GeForce RTX 3050 4GB'),
('l7', 'ctg2', '637950740313797526_asus-tuf-gaming-fa506ihr-den-dd.jpg', 'Laptop Asus TUF Gaming FA506IHRB-HN019W R5 4600H', 16490, '15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, 250 nits, Anti-Glare LED-Backlit Display\r\n\r\nAMD, Ryzen 5, 4600H\r\n\r\n8 GB (1 thanh 8 GB), DDR4, 3200 MHz\r\n\r\nSSD 512 GB\r\n\r\nNVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics'),
('l8', 'ctg2', '637639339928194488_msi-gaming-gf63-den-dd.jpg', 'Laptop MSI Gaming GF63 Thin 11SC-663VN i7 11800H', 18690, '15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, 300 nits, FHD\r\n\r\nIntel, Core i7, 11800H\r\n\r\n8 GB, DDR4, 3200 MHz\r\n\r\nSSD 512 GB\r\n\r\nNVIDIA GeForce GTX 1650 Max-Q 4GB; Intel UHD Graphics'),
('p1', 'ctg1', '638028878218412584_samsung-galaxy-s22-bora-purple-dd-docquyen-bh.jpg', 'Samsung Galaxy S23 Ultra 5G 256GB', 26990, '6.8 inch, Dynamic AMOLED 2X, QHD+, 1440 x 3088 Pixels\r\n\r\n200.0 MP + 12.0 MP + 10.0 MP + 10.0 MP\r\n\r\n12.0 MP\r\n\r\nSnapdragon 8 Gen 2\r\n\r\n256 GB'),
('p2', 'ctg1', '638074782811199183_xiaomi-redmi-10a-dd-bh-docquyen.jpg', 'Xiaomi Redmi 10A 3GB-64GB', 2790, '6.53 inch, IPS LCD, HD+, 720 x 1600 Pixels\r\n\r\n13.0 MP + 2.0 MP\r\n\r\n5.0 MP\r\n\r\nHelio G25\r\n\r\n64 GB'),
('p3', 'ctg1', '638107840321324440_iphone-11-dd.jpg', 'iPhone 11 64GB', 11499, '6.1 inch, IPS LCD, Liquid Retina HD, 828 x 1792 Pixels\r\n\r\n12.0 MP + 12.0 MP\r\n\r\n12.0 MP\r\n\r\nApple A13 Bionic\r\n\r\n64 GB'),
('p4', 'ctg1', '638071499364966239_oppo-a77s-dd.jpg', 'OPPO A77s 8GB-128GB', 6090, '.56 inch, LCD, HD+, 720 x 1612 Pixels\r\n\r\n50.0 MP + 2.0 MP\r\n\r\n8.0 MP\r\n\r\nSnapdragon 680\r\n\r\n128 GB'),
('p5', 'ctg1', '638072161262575097_xiaomi-redmi-note-11-pro-4g-dd-bh.jpg', 'Xiaomi Redmi Note 11 Pro 8GB - 128GB', 6590, '6.67 inch, AMOLED, FHD+, 1080 x 2400 Pixels\r\n\r\n108.0 MP + 8.0 MP + 2.0 MP + 2.0 MP\r\n\r\n16.0 MP\r\n\r\nMediaTek Helio G96'),
('p6', 'ctg1', '638028878218412584_samsung-galaxy-s22-bora-purple-dd-docquyen-bh.jpg', 'Samsung Galaxy S22 Bora Purple 5G', 14990, '6.1 inch, Dynamic AMOLED 2X, FHD+, 1080 x 2340 Pixels\r\n\r\n50.0 MP + 12.0 MP + 10.0 MP\r\n\r\n10.0 MP\r\n\r\nSnapdragon 8 Gen 1\r\n\r\n128 GB');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
('R1', 'admin'),
('R2', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `a` int(11) NOT NULL,
  `b` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `c` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `d` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`a`, `b`, `c`, `d`) VALUES
(1, 'customer1', 'qwe', 'qwe'),
(2, 'customer1', 'asd', 'asd'),
(4, 'customer1', 'qwe', 'qwe');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roleid` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `phone_number`, `address`, `password`, `roleid`) VALUES
('abc', 'abc', 'abc@gmail.com', '0980890', 'hn', 'abc', 'R2'),
('admin1', 'Amin1', 'admin1@gmail.com', '0965431467', 'Nguyễn Trãi - Thanh Xuân - Hà Nội', 'admin1', 'R1'),
('customer1', 'Tiến Dũng', 'customer1@gmail.com', '0987523587', 'Vĩnh Phúc', 'customer1', 'R2'),
('customer2', 'Phùng Tú', 'customer2@gmail.com', '0965434567', 'Hà Nội Làng Al', 'customer2', 'R2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderr`
--
ALTER TABLE `orderr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderr_ibfk_1` (`user_id`);

--
-- Indexes for table `orderr_detail`
--
ALTER TABLE `orderr_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `orderr_detail_ibfk_3` (`orderr_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_ibfk_1` (`category_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`a`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleid` (`roleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderr_detail`
--
ALTER TABLE `orderr_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderr_detail`
--
ALTER TABLE `orderr_detail`
  ADD CONSTRAINT `orderr_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `orderr_detail_ibfk_3` FOREIGN KEY (`orderr_id`) REFERENCES `orderr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

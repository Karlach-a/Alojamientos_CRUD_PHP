-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2025 at 03:26 AM
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
-- Database: `alojamientos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodations`
--

CREATE TABLE `accommodations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accommodations`
--

INSERT INTO `accommodations` (`id`, `name`, `description`, `image_url`) VALUES
(1, 'Las Bahamas', 'Las Bahamas', 'https://www.tripsavvy.com/thmb/zFdklI9Mzl5g9BWSwOapJNKc9c0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/coral-reef-at-crystal-waters-at-caribbean-nassau-565944835-5b9c3cfd46e0fb00257e7fd4.jpg'),
(2, 'DUBAI', 'DUBAI', 'https://cdn.britannica.com/15/189715-050-4310222B/Dubai-United-Arab-Emirates-Burj-Khalifa-top.jpg'),
(3, 'Mexico', 'Mexico', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpsDlRlqaLdfxoeTsxcyBGZe_qzHamU_145Q&s'),
(4, 'El Salvador ', 'El SAlvador', 'https://diarioelsalvador.media/2025/01/WhatsApp-Image-2025-01-01-at-9.05.49-PM.jpeg'),
(5, 'Peru', 'Peru', 'https://th.bing.com/th/id/R.7f83181774b9c141bbf2c1e98206789b?rik=cFdTFjlPjocr0Q&riu=http%3a%2f%2fupload.wikimedia.org%2fwikipedia%2fcommons%2f8%2f8a%2fMachu_Picchu_Peru.JPG&ehk=qTceKgLsBu4VPyYuB0iY4m81mlz%2bdTGIy2FawyNHgLg%3d&risl=&pid=ImgRaw&r=0'),
(6, 'Guatemala', 'Guatemala', 'https://th.bing.com/th/id/OIP.Pis32HONrUlLvQSOu29RRwHaD8?rs=1&pid=ImgDetMain');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'rivas', '$2y$10$8JuqHAq1FqBRJteUQadcdesVRvGw1SgmPeZNaYTMZ7DYjY./GW5fK', 'user'),
(4, 'antonio', '$2y$10$8p8Ctsfeio/QZaAjr1UvG.M.EAREPnsEt4O4SykLG/Wf5h/KjZI8m', 'user'),
(5, 'carolina', '$2y$10$PFXZd6j98nBuWxK0nk3RDefTtwwb0pFKds/rvCadVCO2Oehm0Mg.y', 'user'),
(6, 'Karla', '$2y$10$3a8/8jqTJ1RqfUz2Bq28luD6PG9cAU.alwgeRjLwSasslP8TZ55ba', 'user'),
(7, 'Sofia', '12345', 'admin'),
(8, 'hola', '$2y$10$DAyM6AUwlvSEi9j6hsBe7O.OY2y24hoMn3aAehemTte.SFud/Js3q', 'user'),
(9, 'admin', '$2y$10$u7WFDKuuHDUMO9hO3F1pjuO5hOSjelQYvpDdD7fKSYRT0yvAchqwy', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_accommodations`
--

CREATE TABLE `user_accommodations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `accommodation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_accommodations`
--

INSERT INTO `user_accommodations` (`id`, `user_id`, `accommodation_id`) VALUES
(1, 6, 1),
(2, 9, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accommodations`
--
ALTER TABLE `accommodations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_accommodations`
--
ALTER TABLE `user_accommodations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `accommodation_id` (`accommodation_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accommodations`
--
ALTER TABLE `accommodations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_accommodations`
--
ALTER TABLE `user_accommodations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_accommodations`
--
ALTER TABLE `user_accommodations`
  ADD CONSTRAINT `user_accommodations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_accommodations_ibfk_2` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

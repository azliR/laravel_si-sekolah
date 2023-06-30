-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 30, 2023 at 03:46 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET
SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET
time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensis`
--

CREATE TABLE `absensis`
(
    `id`         bigint(20) UNSIGNED NOT NULL,
    `jadwal_id`  bigint(20) UNSIGNED NOT NULL,
    `siswa_id`   bigint(20) UNSIGNED NOT NULL,
    `keterangan` enum('sakit','izin','alfa') NOT NULL,
    `tanggal`    date      NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp ()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs`
(
    `id`         bigint(20) UNSIGNED NOT NULL,
    `uuid`       varchar(255) NOT NULL,
    `connection` text         NOT NULL,
    `queue`      text         NOT NULL,
    `payload`    longtext     NOT NULL,
    `exception`  longtext     NOT NULL,
    `failed_at`  timestamp    NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gurus`
--

CREATE TABLE `gurus`
(
    `id`         bigint(20) UNSIGNED NOT NULL,
    `user_id`    bigint(20) UNSIGNED DEFAULT NULL,
    `nama`       varchar(255) NOT NULL,
    `nip`        varchar(255) NOT NULL,
    `mapel_id`   bigint(20) UNSIGNED NOT NULL,
    `no_telp`    varchar(255) NOT NULL,
    `alamat`     varchar(255) NOT NULL,
    `foto`       varchar(255) DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gurus`
--

INSERT INTO `gurus` (`id`, `user_id`, `nama`, `nip`, `mapel_id`, `no_telp`, `alamat`, `foto`, `created_at`,
                     `updated_at`)
VALUES (4, 7, 'Rifky Maulana', '1207050106', 1, '089660009762', '1212', 'images/guru/1687083281.jpg',
        '2023-06-18 10:14:41', '2023-06-18 13:41:53'),
       (5, 10, 'Rizal Hadiyansah', '1207050109', 3, '089660952861', '121212', 'images/guru/1687096522.jpg',
        '2023-06-18 13:55:22', '2023-06-18 13:56:13'),
       (6, NULL, 'Romi Jatmiko', '1207050110', 9, '083788271198', '121', 'images/guru/1687140821.png',
        '2023-06-19 02:13:41', '2023-06-19 02:13:41');

-- --------------------------------------------------------

--
-- Table structure for table `jadwals`
--

CREATE TABLE `jadwals`
(
    `id`            bigint(20) UNSIGNED NOT NULL,
    `kelas_id`      bigint(20) UNSIGNED NOT NULL,
    `mapel_id`      bigint(20) UNSIGNED NOT NULL,
    `hari`          varchar(255) NOT NULL,
    `dari_jam`      time         NOT NULL,
    `sampai_jam`    time         NOT NULL,
    `tanggal_mulai` date         NOT NULL DEFAULT current_timestamp(),
    `created_at`    timestamp NULL DEFAULT NULL,
    `updated_at`    timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwals`
--

INSERT INTO `jadwals` (`id`, `kelas_id`, `mapel_id`, `hari`, `dari_jam`, `sampai_jam`, `tanggal_mulai`, `created_at`,
                       `updated_at`)
VALUES (3, 3, 9, 'senin', '00:00:00', '00:00:00', '2023-01-02', '2023-06-18 10:58:17', '2023-06-18 10:58:17'),
       (4, 4, 3, 'selasa', '00:08:40', '00:10:20', '2023-01-03', '2023-06-18 13:57:57', '2023-06-19 02:04:22'),
       (5, 4, 4, 'jumat', '00:07:00', '00:08:40', '2023-01-06', '2023-06-19 02:03:25', '2023-06-19 02:03:25'),
       (6, 3, 6, 'rabu', '00:12:40', '00:14:20', '2023-01-04', '2023-06-19 02:04:49', '2023-06-19 02:04:49'),
       (7, 3, 1, 'kamis', '00:10:20', '00:12:00', '2023-01-05', '2023-06-19 02:05:18', '2023-06-19 02:05:18'),
       (8, 5, 3, 'rabu', '00:07:00', '00:08:40', '2023-01-02', '2023-06-19 02:16:20', '2023-06-19 02:16:20'),
       (9, 3, 3, 'rabu', '00:08:40', '00:10:20', '2023-01-02', '2023-06-19 02:39:11', '2023-06-19 02:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `jurusans`
--

CREATE TABLE `jurusans`
(
    `id`           bigint(20) UNSIGNED NOT NULL,
    `nama_jurusan` varchar(255) NOT NULL,
    `created_at`   timestamp NULL DEFAULT NULL,
    `updated_at`   timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jurusans`
--

INSERT INTO `jurusans` (`id`, `nama_jurusan`, `created_at`, `updated_at`)
VALUES (1, 'IPA', NULL, NULL),
       (2, 'IPS', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas`
(
    `id`         bigint(20) UNSIGNED NOT NULL,
    `nama_kelas` varchar(255) NOT NULL,
    `jurusan_id` bigint(20) UNSIGNED NOT NULL,
    `guru_id`    bigint(20) UNSIGNED NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `jurusan_id`, `guru_id`, `created_at`, `updated_at`)
VALUES (3, 'X IPA 1', 1, 4, '2023-06-18 10:42:46', '2023-06-18 10:42:46'),
       (4, 'X IPA 2', 1, 5, '2023-06-18 13:57:24', '2023-06-18 13:57:24'),
       (5, 'X IPA 3', 1, 6, '2023-06-19 02:15:21', '2023-06-19 02:15:21');

-- --------------------------------------------------------

--
-- Table structure for table `mapels`
--

CREATE TABLE `mapels`
(
    `id`         bigint(20) UNSIGNED NOT NULL,
    `nama_mapel` varchar(255) NOT NULL,
    `jurusan_id` bigint(20) UNSIGNED NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mapels`
--

INSERT INTO `mapels` (`id`, `nama_mapel`, `jurusan_id`, `created_at`, `updated_at`)
VALUES (1, 'Biologi I', 1, '2023-06-18 07:29:33', '2023-06-18 07:33:05'),
       (2, 'Ekonomi', 2, '2023-06-18 07:29:13', '2023-06-18 07:35:25'),
       (3, 'Fisika I', 1, '2023-06-18 07:29:43', '2023-06-18 07:31:56'),
       (4, 'Kimia I', 1, '2023-06-18 07:29:55', '2023-06-18 07:31:51'),
       (5, 'Matematika Peminatan I', 1, '2023-06-18 07:30:08', '2023-06-18 07:32:11'),
       (6, 'Fisika II', 1, '2023-06-18 07:32:22', '2023-06-18 07:32:22'),
       (7, 'Kimia II', 1, '2023-06-18 07:32:34', '2023-06-18 07:32:34'),
       (8, 'Matematika Peminatan II', 1, '2023-06-18 07:33:35', '2023-06-18 07:33:35'),
       (9, 'Sosiologi', 2, '2023-06-18 07:34:45', '2023-06-18 07:34:45'),
       (10, 'Sejarah', 2, '2023-06-18 07:34:51', '2023-06-18 07:34:51'),
       (11, 'Geografi', 2, '2023-06-18 07:34:59', '2023-06-18 07:34:59'),
       (12, 'Akuntansi', 2, '2023-06-18 07:35:05', '2023-06-18 07:35:05'),
       (13, 'Kewirausahaan', 2, '2023-06-18 07:35:12', '2023-06-18 07:35:12'),
       (14, 'Antropologi', 2, '2023-06-18 07:35:18', '2023-06-18 07:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations`
(
    `id`        int(10) UNSIGNED NOT NULL,
    `migration` varchar(255) NOT NULL,
    `batch`     int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets`
(
    `email`      varchar(255) NOT NULL,
    `token`      varchar(255) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens`
(
    `id`             bigint(20) UNSIGNED NOT NULL,
    `tokenable_type` varchar(255) NOT NULL,
    `tokenable_id`   bigint(20) UNSIGNED NOT NULL,
    `name`           varchar(255) NOT NULL,
    `token`          varchar(64)  NOT NULL,
    `abilities`      text DEFAULT NULL,
    `last_used_at`   timestamp NULL DEFAULT NULL,
    `created_at`     timestamp NULL DEFAULT NULL,
    `updated_at`     timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswas`
--

CREATE TABLE `siswas`
(
    `id`         bigint(20) UNSIGNED NOT NULL,
    `user_id`    bigint(20) UNSIGNED DEFAULT NULL,
    `nis`        varchar(255) NOT NULL,
    `nama`       varchar(255) NOT NULL,
    `telp`       varchar(255) NOT NULL,
    `alamat`     varchar(255) NOT NULL,
    `foto`       varchar(255) DEFAULT NULL,
    `kelas_id`   bigint(20) UNSIGNED NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswas`
--

INSERT INTO `siswas` (`id`, `user_id`, `nis`, `nama`, `telp`, `alamat`, `foto`, `kelas_id`, `created_at`, `updated_at`)
VALUES (4, NULL, '1234567890', 'Budi Santoso', '081212345678',
        'Jl. Fiksi No. 123, Kota Imajinasi, Provinsi Fantasi, 45678', 'images/siswa/1687272810.jpg', 3,
        '2023-06-20 14:53:30', '2023-06-20 14:53:30'),
       (5, NULL, '2345678901', 'Siti Hartini', '081323456789',
        'Jl. Khayalan No. 234, Kota Utopia, Provinsi Mimpi, 56789', 'images/siswa/1687272857.jpg', 3,
        '2023-06-20 14:54:17', '2023-06-20 14:54:17'),
       (6, NULL, '3456789012', 'Agus Pranoto', '081434567890',
        'Jl. Impian No. 345, Kota Ideal, Provinsi Harapan, 67890', 'images/siswa/1687272877.jpg', 3,
        '2023-06-20 14:54:37', '2023-06-20 14:54:37'),
       (7, NULL, '4567890123', 'Dewi Sartika', '081545678901',
        'Jl. Fantasi No. 456, Kota Fiksi, Provinsi Imajinasi, 78901', 'images/siswa/1687272897.jpg', 3,
        '2023-06-20 14:54:57', '2023-06-20 14:54:57'),
       (8, NULL, '5678901234', 'Eko Wibowo', '081656789012', 'Jl. Utopia No. 567, Kota Mimpi, Provinsi Khayalan, 89012',
        'images/siswa/1687272919.jpg', 3, '2023-06-20 14:55:19', '2023-06-20 14:55:19'),
       (9, NULL, '6789012345', 'Fitri Ayu', '081767890123', 'Jl. Ideal No. 678, Kota Harapan, Provinsi Impian, 90123',
        'images/siswa/1687272941.jpg', 3, '2023-06-20 14:55:41', '2023-06-20 14:55:41'),
       (10, NULL, '7890123456', 'Gunawan Setiadi', '081878901234',
        'Jl. Mimpi No. 789, Kota Khayalan, Provinsi Utopia, 01234', 'images/siswa/1687273029.jpg', 3,
        '2023-06-20 14:57:09', '2023-06-20 14:57:09'),
       (11, NULL, '8901234567', 'Hana Sari', '081989012345', 'Jl. Harapan No. 890, Kota Impian, Provinsi Ideal, 12345',
        'images/siswa/1687273053.jpg', 3, '2023-06-20 14:57:33', '2023-06-20 14:57:33'),
       (12, NULL, '9012345678', 'Indra Yudha', '082090123456',
        'Jl. Imajinasi No. 901, Kota Fantasi, Provinsi Fiksi, 23456', 'images/siswa/1687273076.jpg', 3,
        '2023-06-20 14:57:56', '2023-06-20 14:57:56'),
       (13, NULL, '0123456789', 'Joko Widodo', '082101234567',
        'Jl. Fiksi No. 012, Kota Imajinasi, Provinsi Fantasi, 34567', 'images/siswa/1687273099.jpg', 3,
        '2023-06-20 14:58:19', '2023-06-20 14:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users`
(
    `id`                bigint(20) UNSIGNED NOT NULL,
    `name`              varchar(255) NOT NULL,
    `email`             varchar(255) NOT NULL,
    `email_verified_at` timestamp NULL DEFAULT NULL,
    `password`          varchar(255) NOT NULL,
    `roles`             varchar(255) NOT NULL,
    `remember_token`    varchar(100) DEFAULT NULL,
    `nis`               varchar(255) DEFAULT NULL,
    `nip`               varchar(255) DEFAULT NULL,
    `created_at`        timestamp NULL DEFAULT NULL,
    `updated_at`        timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles`, `remember_token`, `nis`, `nip`,
                     `created_at`, `updated_at`)
VALUES (1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$Zx9O9v2TtAtHmQ2BR5GzFOwcf9ta.WYg9yA4U4VpUtl1vzBrmGpt6', 'admin',
        NULL, NULL, NULL, '2023-06-18 07:06:39', '2023-06-18 07:06:39'),
       (7, 'Rifky Maulana', 'ririnsitiarofahh12@gmail.com', NULL,
        '$2y$10$qx4ozvEw1YkrlLRJDKZXwOxLBxR/lSZZeevg7ywPwyDhmKAaMRUqm', 'guru', NULL, NULL, '1207050106',
        '2023-06-18 13:41:53', '2023-06-18 13:41:53'),
       (10, 'Rizal Hadiyansah', 'rizalhadiyansah@gmail.com', NULL,
        '$2y$10$dfqMg49mYTYA/fuo4EH8Q.Izae6P4tV6DtYCI/QbqaYo556BMXtjW', 'guru', NULL, NULL, '1207050109',
        '2023-06-18 13:56:13', '2023-06-18 13:56:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensis`
--
ALTER TABLE `absensis`
    ADD PRIMARY KEY (`id`),
  ADD KEY `absensis_siswa_id_foreign` (`siswa_id`),
  ADD KEY `absensis_jadwal_id_foreign` (`jadwal_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gurus`
--
ALTER TABLE `gurus`
    ADD PRIMARY KEY (`id`),
  ADD KEY `gurus_mapel_id_foreign` (`mapel_id`),
  ADD KEY `gurus_user_id_foreign` (`user_id`);

--
-- Indexes for table `jadwals`
--
ALTER TABLE `jadwals`
    ADD PRIMARY KEY (`id`),
  ADD KEY `jadwals_kelas_id_foreign` (`kelas_id`),
  ADD KEY `jadwals_mapel_id_foreign` (`mapel_id`);

--
-- Indexes for table `jurusans`
--
ALTER TABLE `jurusans`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
    ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_jurusan_id_foreign` (`jurusan_id`),
  ADD KEY `kelas_guru_id_foreign` (`guru_id`);

--
-- Indexes for table `mapels`
--
ALTER TABLE `mapels`
    ADD PRIMARY KEY (`id`),
  ADD KEY `mapels_jurusan_id_foreign` (`jurusan_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
    ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `siswas`
--
ALTER TABLE `siswas`
    ADD PRIMARY KEY (`id`),
  ADD KEY `siswas_user_id_foreign` (`user_id`),
  ADD KEY `siswas_kelas_id_foreign` (`kelas_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensis`
--
ALTER TABLE `absensis`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gurus`
--
ALTER TABLE `gurus`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jadwals`
--
ALTER TABLE `jadwals`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jurusans`
--
ALTER TABLE `jurusans`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mapels`
--
ALTER TABLE `mapels`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
    MODIFY `id` int (10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `siswas`
--
ALTER TABLE `siswas`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensis`
--
ALTER TABLE `absensis`
    ADD CONSTRAINT `absensis_jadwal_id_foreign` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwals` (`id`),
  ADD CONSTRAINT `absensis_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswas` (`id`) ON
DELETE
CASCADE;

--
-- Constraints for table `gurus`
--
ALTER TABLE `gurus`
    ADD CONSTRAINT `gurus_mapel_id_foreign` FOREIGN KEY (`mapel_id`) REFERENCES `mapels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gurus_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON
DELETE
SET NULL;

--
-- Constraints for table `jadwals`
--
ALTER TABLE `jadwals`
    ADD CONSTRAINT `jadwals_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jadwals_mapel_id_foreign` FOREIGN KEY (`mapel_id`) REFERENCES `mapels` (`id`) ON
DELETE
CASCADE;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
    ADD CONSTRAINT `kelas_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `gurus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kelas_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusans` (`id`) ON
DELETE
CASCADE;

--
-- Constraints for table `mapels`
--
ALTER TABLE `mapels`
    ADD CONSTRAINT `mapels_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `siswas`
--
ALTER TABLE `siswas`
    ADD CONSTRAINT `siswas_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `siswas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON
DELETE
CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

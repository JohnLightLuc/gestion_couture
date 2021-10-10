-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 10 oct. 2021 à 21:40
-- Version du serveur :  10.1.30-MariaDB
-- Version de PHP :  7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_gestion_couture`
--

-- --------------------------------------------------------

--
-- Structure de la table `ateliers`
--

CREATE TABLE `ateliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `couturier_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ateliers`
--

INSERT INTO `ateliers` (`id`, `nom`, `ville`, `adresse`, `email`, `created_at`, `updated_at`, `couturier_id`, `deleted_at`) VALUES
(1, 'Atelier de couture villageoise', 'San-Pédro', 'BP 01 ABIDJAN', 'info@modernecouture.com', '2021-09-18 15:32:52', '2021-09-27 18:47:15', 1, '2021-09-27 18:47:15'),
(2, 'Couture de moderne de Bouna/ Tche', 'Bouna', 'Derrière la boulagerie', 'tatacouture@gmail.com', '2021-09-18 15:34:27', '2021-09-30 09:11:58', 6, '2021-09-30 09:11:58'),
(4, 'Le trousse des Sapeurs', 'Tingrela', 'BP 02 Tingrela 05', 'sapeur@gmail.com', '2021-09-18 15:39:24', '2021-09-18 15:39:24', 2, NULL),
(5, 'Atelierle Bourgeois', 'Campement le bouquantier', 'Cote d\'Ivoire', 'bourgeois@gmail.com', '2021-09-20 16:53:21', '2021-09-20 16:53:21', 5, NULL),
(6, 'Atelierle Bourgeois 2', 'Campement le bouquantier 2', 'Cote d\'Ivoire', 'bourgeois2@gmail.com', '2021-09-20 17:00:51', '2021-09-30 09:14:25', 6, '2021-09-30 09:14:25'),
(7, 'Atelier le sapeur', 'Washington', 'Washington 01', 'sapeur@gmail.com', '2021-10-01 09:16:13', '2021-10-01 09:16:13', 14, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenoms` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `atelier_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `prenoms`, `contact`, `photo`, `numero`, `created_at`, `updated_at`, `atelier_id`, `deleted_at`) VALUES
(1, 'Konaté', 'Charlène Amanda Chela', '0121542614', 'wAlEbPj0AvIV8E1nqanjIqRMicVgMvAu3Y82tTCW.webp', 354752720, '2021-09-21 16:10:33', '2021-09-30 09:49:15', 7, NULL),
(2, 'Klara', 'Loreine', '4754466566262', '0L3nSECHL6UZF7KWpcTCZjy2s9XRVFo2kcuF4Gs8.webp', 410632978, '2021-09-21 16:14:44', '2021-09-30 09:30:52', 7, NULL),
(3, 'Dakota', 'Johnson', '225 07465662', 'Hyx1IX4JnhRpuY5v3NYoj6PvbDLxyGGOyL0M93eZ.webp', 908862548, '2021-09-29 09:05:55', '2021-09-29 09:05:55', 7, NULL),
(4, 'Sylver', 'Galenma', '2458798559+', 'FbisWWZocJys60T0xzt0zeVLA08xXc7rSK3l0BFD.jpeg', 407081842, '2021-09-29 15:16:19', '2021-09-29 15:16:19', 4, NULL),
(5, 'Sylvère', 'Charlène', '0121542614', 'tMi6o6igluacuHtAiT3vOKSbHcmWOXjm5fXB5Ryp.jpeg', 545177307, '2021-09-29 15:20:54', '2021-09-29 16:32:32', 4, NULL),
(6, 'Ouattara', 'Tokyo', '+225 02 27 56 13', 'q0yTn9QCJWXFHM4AnQPHFZUGUzQlvl7cTVtBDA5W.webp', 718430155, '2021-09-29 16:34:52', '2021-09-29 16:34:52', 5, NULL),
(7, 'Ouattara', 'Tokyo', '+225 02 27 56 13', 'uWmw37npjzg1Gg6vd8DkWpadqVNCgTAJrPKEzu9y.png', 645037060, '2021-09-29 16:36:23', '2021-09-29 16:36:23', 5, NULL),
(8, 'Korine', 'Dupont', '5485621466', 'JLttu9k569kvX0HgNUixT1vEFPUeRB9D1FVoPLIO.jpeg', 697072379, '2021-09-30 10:19:45', '2021-09-30 10:19:45', 4, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `coutures`
--

CREATE TABLE `coutures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `somme` decimal(12,2) NOT NULL,
  `apercu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `modele_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `coutures`
--

INSERT INTO `coutures` (`id`, `nom`, `description`, `date`, `somme`, `apercu`, `created_at`, `updated_at`, `client_id`, `modele_id`, `deleted_at`) VALUES
(1, '', 'Couture d\'un complet pagne accompagné d\'une veste en bison.', '2021-09-21', '55000.00', 'mIBCxGUENnoNtPyaWmGRR8eiGhAZ5EsDs1N9MRkL.jpeg', '2021-09-21 17:45:18', '2021-09-30 10:44:33', 2, 2, NULL),
(2, '', '3 chemise', '2021-09-21', '15000.00', 'e1IhcVDIDXO6sBGAOsUJF85xHLo3XomD3yPYWe7U.jpeg', '2021-09-21 17:47:21', '2021-09-29 12:00:37', 2, 3, '2021-09-29 12:00:37'),
(3, '', 'Une robe et une jupe de serise', '2021-09-21', '23500.00', 'BWvNSRd7GIDT3EYXZM9XWZCSjCCZ9WjcPvsMZGAd.webp', '2021-09-21 17:49:25', '2021-09-21 17:49:25', 2, 2, NULL),
(4, '', 'Description', '2021-10-09', '44555625.00', 'vUdnO80Z44EO4u2V7S6Yr9HJ0caI2czh9ntSzTKc.webp', '2021-09-29 17:47:59', '2021-09-29 17:47:59', 2, 2, NULL),
(5, '', 'mY descption', '2021-09-26', '45559.00', 'opa3j2n1GJb54zQBIKysUdGVohZZthFFjzMfAQzI.png', '2021-09-29 17:51:28', '2021-09-29 17:51:28', 6, 2, NULL),
(6, '', 'Chemise manche longue avec drapeau du roix', '2021-10-10', '75000.00', 'nyhbdAEYvZuwRdqdyNDsrvnpxhQrMh3SNuP4K0zE.jpeg', '2021-09-30 11:10:30', '2021-09-30 11:10:30', 2, 4, NULL),
(7, '', 'Pantalon contenant des poils de lion enrobé d\'écailles de dragon', '2021-10-10', '100000.00', 'tLMsAxDgvoQd8gvUDVso271VJ2LS6XVLRC4kNyQ5.png', '2021-09-30 11:13:17', '2021-09-30 11:13:17', 5, 3, NULL),
(8, '', 'Chapeau traditionnel en peau de lezard', '2021-10-10', '54000.00', 'nUpRmzfQVpU7Hhu3rtTB2J3Gf6rt4eycQJ1nOKpY.png', '2021-09-30 11:15:53', '2021-09-30 11:15:53', 7, 3, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `couture_texture`
--

CREATE TABLE `couture_texture` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `couture_id` bigint(20) UNSIGNED NOT NULL,
  `texture_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `couture_texture`
--

INSERT INTO `couture_texture` (`id`, `description`, `created_at`, `updated_at`, `couture_id`, `texture_id`, `deleted_at`) VALUES
(1, 'Une robe et une jupe de serise', '2021-09-21 17:55:52', '2021-09-21 17:55:52', 1, 2, NULL),
(2, 'Une robe et une jupe de jupon', '2021-09-21 18:02:53', '2021-09-21 18:02:53', 2, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `couturiers`
--

CREATE TABLE `couturiers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenoms` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `couturiers`
--

INSERT INTO `couturiers` (`id`, `nom`, `prenoms`, `adresse`, `email`, `contact`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kone', 'Mamadou Kadou', 'San-Pédro', 'superuser@gmail.com', '45124634132', NULL, '2021-09-18 12:28:49', '2021-09-29 12:31:23', '2021-09-29 12:31:23'),
(2, 'Koffi', 'Maloudou', 'Bouaké', 'maloudou.koffi@gmail.com', '45124634132', NULL, '2021-09-18 12:30:03', '2021-09-28 14:56:06', '2021-09-28 14:56:06'),
(4, 'Boka', 'Severin', 'Bouaflé', 'severin.boka@gmail.com', '45124634132', NULL, '2021-09-18 15:14:52', '2021-09-29 12:35:17', '2021-09-29 12:35:17'),
(5, 'Couturier', 'Distigué', 'BP01 Le bon vivre', 'myboxgmail.com', '010104523611', NULL, '2021-09-20 16:39:44', '2021-09-20 16:39:44', NULL),
(6, 'Couturier2', 'Distigué2', 'BP01 Le bon vivre2', 'mybox2gmail.com', '0101045236114', NULL, '2021-09-20 16:58:00', '2021-09-20 16:58:00', NULL),
(7, 'Koffi', 'Marcel Kouadio', 'Port-Bouet', 'marcel.koffi@gmail.com', '0102054265656', NULL, '2021-09-22 14:51:15', '2021-09-22 14:52:48', NULL),
(8, 'Sembène', 'Ousmane', 'Dakar', 'sembene@gmail.com', '45124634132', NULL, '2021-09-28 14:49:50', '2021-09-28 14:49:50', NULL),
(9, 'Kamara', 'Nangala', 'Yamoussoukro', 'nangala@gmail.com', '2455565595556', NULL, '2021-09-28 14:54:33', '2021-09-28 14:54:33', NULL),
(10, 'Kouakou', 'Kouassi', 'Abidjan', 'kouassi@gmail.com', '56565566556', NULL, '2021-09-29 12:37:29', '2021-09-29 12:37:29', NULL),
(11, 'Marcel', 'Napsom', 'Dp Walstreet', 'name@gmail.com', '225 07465662', NULL, '2021-09-29 16:07:43', '2021-09-29 16:07:43', NULL),
(12, 'Adeni', 'Bossemi', 'Bp 02 Abidjan', 'adeni@gmail.com', '2546874125', NULL, '2021-09-30 12:00:12', '2021-09-30 12:00:12', NULL),
(13, 'Le couturier de Koumacci', 'Couture', 'Derrière la boulagerie', 'tatacouture@gmail.com', '55115855', 4, '2021-09-30 12:01:56', '2021-09-30 12:01:56', NULL),
(14, 'Masterson', 'Couture', 'BP 01 Paname', 'masterson@gmail.com', '215466524163', 2, '2021-10-01 09:11:26', '2021-10-01 09:11:26', NULL),
(15, 'Alabi', 'Castaro', 'Washinton', 'alabi@gmail.com', '54216987123', 1, '2021-10-01 09:16:12', '2021-10-01 09:16:12', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mesures`
--

CREATE TABLE `mesures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `couture_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mesure` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valeur` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mesures`
--

INSERT INTO `mesures` (`id`, `couture_id`, `mesure`, `valeur`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, '', '0.00', '2021-09-19 12:14:17', '2021-09-19 12:24:52', NULL),
(2, NULL, '', '0.00', '2021-09-19 12:26:31', '2021-09-19 12:26:31', NULL),
(3, NULL, '', '0.00', '2021-09-19 12:27:19', '2021-09-19 12:27:19', NULL),
(4, 2, 'taille d\'\'epaule', '18.20', '2021-09-21 18:18:21', '2021-09-21 18:18:21', NULL),
(5, 2, 'tour de taille', '130.35', '2021-09-21 18:19:11', '2021-09-21 18:19:11', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_09_17_104021_createtables', 1),
(2, '2021_09_17_105642_createtableatelier', 2),
(3, '2021_09_17_112849_create_table_client', 2),
(4, '2021_09_17_115030_create_table_rendez_vous', 3),
(5, '2021_09_17_115814_create_table_texture', 4),
(6, '2021_09_17_120103_create_table_liaison', 5),
(7, '2021_09_17_120255_create_table_modeles', 6),
(8, '2021_09_17_120604_create_table_paiements', 7),
(9, '2021_09_17_121232_create_table_coutures', 8),
(10, '2021_09_17_122051_alter_table_ateliers', 9),
(11, '2021_09_17_122937_alter_table_clients', 10),
(12, '2021_09_17_123204_alter_table_commandes', 11),
(13, '2021_09_17_123948_alter_table_rendez_vous', 12),
(14, '2021_09_17_124345_alter_table_paiements', 13),
(15, '2021_09_17_124701_alter_table_liaisons', 14),
(16, '2016_06_01_000001_create_oauth_auth_codes_table', 15),
(17, '2016_06_01_000002_create_oauth_access_tokens_table', 15),
(18, '2016_06_01_000003_create_oauth_refresh_tokens_table', 15),
(19, '2016_06_01_000004_create_oauth_clients_table', 15),
(20, '2016_06_01_000005_create_oauth_personal_access_clients_table', 15),
(21, '2021_09_18_173802_alter_table_client', 16),
(22, '2021_09_18_175603_create_table_mesure', 17),
(23, '2021_09_18_180618_add_messure_id_to_table_client', 18),
(24, '2021_09_19_120028_rename_table_texture', 19),
(25, '2021_09_19_135758_create_users_table', 20),
(26, '2021_09_19_140020_create_password_resets_table', 21),
(27, '2021_09_19_140130_create_fail_job_table', 22),
(28, '2021_09_19_142943_create_users_table', 23),
(29, '2021_09_21_104730_delete_mesure_id_in_table_client', 24),
(31, '2021_09_21_110707_change_mesure_id_in_table_client', 25),
(32, '2021_09_21_111959_alter_table_mesure', 26),
(34, '2021_09_21_122338_set_attribut_position', 27),
(35, '2021_09_21_124626_add_column_table_clients', 28),
(36, '2021_09_21_141915_add_image_to_table_client', 29),
(37, '2021_09_22_170818_add_soft_delete_to_table_atelier', 30),
(38, '2021_09_22_171226_add_soft_delete_to_table_clients', 31),
(39, '2021_09_22_171416_add_soft_delete_to_table_coutures', 32),
(40, '2021_09_22_171608_add_soft_delete_to_table_couturiers', 33),
(41, '2021_09_22_171755_add_soft_delete_to_table_liaisons', 34),
(42, '2021_09_22_171932_add_soft_delete_to_table_mesures', 35),
(43, '2021_09_22_172117_add_soft_delete_to_table_modeles', 36),
(44, '2021_09_22_172305_add_soft_delete_to_table_paiements', 37),
(45, '2021_09_22_172516_add_soft_delete_to_table_rendez_vous', 38),
(46, '2021_09_22_172741_add_soft_delete_to_table_textures', 39),
(47, '2021_09_22_173840_rename_table_liaison', 40),
(48, '2021_10_01_103318_adduserin_atelier_table', 41);

-- --------------------------------------------------------

--
-- Structure de la table `modeles`
--

CREATE TABLE `modeles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `modeles`
--

INSERT INTO `modeles` (`id`, `nom`, `description`, `photo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Robe de jumelo de viennes', 'Une chemisette conçcue à partir d\'un modèle ancien del\'antiquité. Sa première parrution etaient en 1856.', '8pjjX7a5WwFXDZ9t6Qy76VHgECSuRLV5QJB3IfyF.png', '2021-09-19 11:37:56', '2021-09-30 14:53:03', '2021-09-30 14:53:03'),
(3, 'Robe de jumelo', 'Petite merveille adorée par les bourgeois.', 'Ay34VWMjYMVQgH9PUY1mESM1aAMd5MQTJyL5kNCj.webp', '2021-09-19 11:40:16', '2021-09-30 14:29:22', NULL),
(4, 'Complet Ribosome', 'Un accoutrement prisé dans l\'Afrique antique.', 'modele3.jpg', '2021-09-19 11:47:58', '2021-09-19 11:47:58', NULL),
(5, 'Robe de jumelo de viennes', 'Une chemisette conçcue à partir d\'un modèle ancien del\'antiquité. Sa première parrution etaient en 1856.', 'ifi1LcN0HnZZ1vg4WeomyZYwAZGE9uIKigFscINc.png', '2021-09-30 14:07:13', '2021-09-30 14:07:13', NULL),
(6, 'Robe de jumelo de viennes', 'Une chemisette conçcue à partir d\'un modèle ancien del\'antiquité. Sa première parrution etaient en 1856.', 'RxMW70JUK54F8YotPcGAZbzUoyszg7KnvV43cvgK.png', '2021-09-30 14:09:59', '2021-09-30 14:09:59', NULL),
(7, 'Robe de jumelo de viennes', 'Une chemisette conçcue à partir d\'un modèle ancien del\'antiquité. Sa première parrution etaient en 1856.', 'aagrcSKm1yovBU377HlOfpBFsHfUUV3i2i28bOjT.png', '2021-09-30 14:11:46', '2021-09-30 14:11:46', NULL),
(8, 'Robe de jumelo de viennes', 'Une chemisette conçcue à partir d\'un modèle ancien del\'antiquité. Sa première parrution etaient en 1856.', '8fiKGcMELW6ajzFFswVSe1rW3pm4lct92pZ9BsPk.png', '2021-09-30 14:12:47', '2021-09-30 14:12:47', NULL),
(9, 'Robe de jumelo de viennes', 'Une chemisette conçcue à partir d\'un modèle ancien del\'antiquité. Sa première parrution etaient en 1856.', 'dFxWDQztHbbHMwNrPIjDmQM9SEsnbUgTFKtWV1p2.png', '2021-09-30 14:13:26', '2021-09-30 14:13:26', NULL),
(10, 'Robe de jumelo de viennes', 'Une chemisette conçcue à partir d\'un modèle ancien del\'antiquité. Sa première parrution etaient en 1856.', 'E8nnXqJ5uoObs6Npr8siNzkX2vKDGucQDiZ0u4w3.png', '2021-09-30 14:13:32', '2021-09-30 14:13:32', NULL),
(11, 'Robe de jumelo de viennes', 'Une chemisette conçcue à partir d\'un modèle ancien del\'antiquité. Sa première parrution etaient en 1856.', 'iafBY7QNGpq5XqYv5RMKohq0Ln6BVw047yJc5K4u.png', '2021-09-30 14:17:34', '2021-09-30 14:55:14', '2021-09-30 14:55:14'),
(12, 'Modèle en style taille basse', 'Datant de la prehistoire', '8ETRIZEqaSdU0lNseYzqovAQyjvELlmTWM7Q54Rm.jpeg', '2021-09-30 14:39:52', '2021-09-30 14:39:52', NULL),
(13, 'Modèle Chemisette en version citadin', 'Nouveau modèle ivoirien', 'A7L6mwBhF7CvssSBskburjm7GDBPlKFOfdy9393t.webp', '2021-09-30 14:41:51', '2021-09-30 14:41:51', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00ba9582519342ebd980d3b5b292c6aed91a1c76b1de29e253a983720d89f7ecce0bf19352deb19d', 2, 3, 'authToken', '[]', 0, '2021-09-27 15:05:18', '2021-09-27 15:05:18', '2022-09-27 15:05:18'),
('036cf7f592fde0f9bc77900a3acc474cb7a516f245b7c4429775d58a4b3ab66db11bd80e47839a70', 4, 3, 'authToken', '[]', 0, '2021-10-03 14:02:45', '2021-10-03 14:02:45', '2022-10-03 14:02:45'),
('07ec648b204646e5312e41e0644a29d8ba7c5d289ee69f263e211398707ad631c0cf0dec5374c76c', 4, 3, 'authToken', '[]', 0, '2021-10-03 13:05:52', '2021-10-03 13:05:52', '2022-10-03 13:05:52'),
('09f39972ce777b94c8dd5c39841821ffc27f02f239be92d21c010a3706983a7144d1c9f7832876e1', 1, 3, 'authToken', '[]', 0, '2021-09-19 16:02:02', '2021-09-19 16:02:02', '2022-09-19 16:02:02'),
('0b284fef0dc47c95e6e14ca2f084a666edfe310d7d09ad9791f4388866da0a2a49a9f316544e1287', 2, 3, 'authToken', '[]', 0, '2021-10-04 09:18:37', '2021-10-04 09:18:37', '2022-10-04 09:18:37'),
('0f8eca1a4131692baeaf50093a2f605ca853296c4cfabccd3a637e5313749d2cd0233fbf663c11ca', 2, 3, 'authToken', '[]', 0, '2021-09-22 14:33:53', '2021-09-22 14:33:53', '2022-09-22 14:33:53'),
('1286b5e053059e34d24cf5c5317c45ab4bad489c3730aa7dbc4d62b6033c344da139a99db3259b0d', 2, 3, 'authToken', '[]', 0, '2021-10-04 08:21:41', '2021-10-04 08:21:41', '2022-10-04 08:21:41'),
('133455795bde6221c6d731b8445854df459a6d391e546cb943dead0893163341319395a4be2464b1', 2, 3, 'authToken', '[]', 0, '2021-10-04 09:15:09', '2021-10-04 09:15:09', '2022-10-04 09:15:09'),
('276a6f77a0ce82deed14f2b2bd79f9580146aa2551fb1d4a7eea63806df71c52d7686a1aac2add1a', 2, 3, 'authToken', '[]', 0, '2021-10-03 22:02:14', '2021-10-03 22:02:14', '2022-10-03 22:02:14'),
('2ec20cbfb417526ad06203eab49ae9375d61ef97937f6859f241aaf848ee440e8283e959455d8282', 4, 3, 'authToken', '[]', 0, '2021-10-03 14:47:55', '2021-10-03 14:47:55', '2022-10-03 14:47:55'),
('32e5cd21e7b87031724de3e03daa93fa56e87ab1b33908afac821f3d30cfd856fc2b0763dc206450', 1, 3, 'authToken', '[]', 0, '2021-09-19 15:53:33', '2021-09-19 15:53:33', '2022-09-19 15:53:33'),
('3e899b3570920d811c13903e286549765c9dae9901465e055294bc65627cc970eeba5460c931953b', 4, 3, 'authToken', '[]', 0, '2021-10-03 09:09:06', '2021-10-03 09:09:06', '2022-10-03 09:09:06'),
('3fdcca365892fc3dcf5e10c2998e8709a689f64d738b6bff19978956a91662f90a187a774fdc6359', 2, 3, 'authToken', '[]', 0, '2021-10-03 19:30:29', '2021-10-03 19:30:29', '2022-10-03 19:30:29'),
('40d50ad3daa2e731b21018efaac9a59e4d0104b4b9d725c2e05a937785c449f6e2c33afd9892268f', 4, 3, 'authToken', '[]', 0, '2021-10-03 10:41:14', '2021-10-03 10:41:14', '2022-10-03 10:41:14'),
('42c3d9269df5e2b20b026652dab3ec0fc01e6bf0baf111fec2772573878c9ed2fdd04363fb0abbfc', 2, 3, 'authToken', '[]', 0, '2021-10-04 09:43:50', '2021-10-04 09:43:50', '2022-10-04 09:43:50'),
('43f7c1cb07e1840bc94396403fbfad58879e180250c80f15091ccefbc993b68759945ee936e0905d', 2, 3, 'authToken', '[]', 0, '2021-10-03 22:10:28', '2021-10-03 22:10:28', '2022-10-03 22:10:28'),
('45a7c2948aa97cf89cf853d4d0239940469136d0da5e24e1e0598786162cb5a31afb38d6e218f455', 2, 3, 'authToken', '[]', 0, '2021-10-03 21:58:52', '2021-10-03 21:58:52', '2022-10-03 21:58:52'),
('47d111cac14684c45f73f078b9227be756e372f871a78b028d0ef53b72aa193da27f396c8ec40e16', 1, 3, 'authToken', '[]', 0, '2021-09-19 17:47:43', '2021-09-19 17:47:43', '2022-09-19 17:47:43'),
('4b6efbf6bb65126c2fa4e70c835a0542443038a0152920515b780b396e745a6f9b6f0465e7a9b080', 2, 3, 'authToken', '[]', 0, '2021-10-03 22:06:23', '2021-10-03 22:06:23', '2022-10-03 22:06:23'),
('4ef9102ca681d652f00c1a3d6c8ec81f6032daf8f6e43f4a102f0cf8f6e9e3e57a055ebb316cf986', 2, 3, 'authToken', '[]', 0, '2021-10-04 09:47:49', '2021-10-04 09:47:49', '2022-10-04 09:47:49'),
('50e59c44745a00cd1b43b3fa3eb7ae5f64fe2fe76c4f350328ba9bdd9ea6f8f617b69de0e91a2a8e', 2, 3, 'authToken', '[]', 0, '2021-10-03 07:39:37', '2021-10-03 07:39:37', '2022-10-03 07:39:37'),
('512fb540d9c5f946a7b3774199e0d5065235a168e6b75d195d30a20348c14e06daabb9a5ae2fb596', 2, 3, 'authToken', '[]', 0, '2021-10-03 08:40:09', '2021-10-03 08:40:09', '2022-10-03 08:40:09'),
('5379321b0d56b7662d5be2f75758f7a6c935bdd09072985f4df5a0f25fca0382caea5d82ee3d7a73', 2, 3, 'authToken', '[]', 0, '2021-10-03 22:04:33', '2021-10-03 22:04:33', '2022-10-03 22:04:33'),
('568ef908aa6e2a20e5605d43324f8743a09efa0f4282a0fcfcd5a1d1ff6d5d4e647e2b5f62806ccd', 4, 3, 'authToken', '[]', 0, '2021-10-03 10:20:02', '2021-10-03 10:20:02', '2022-10-03 10:20:02'),
('5fc221bdda7d90b3cacc6e68703392e70879db1e2cad47391742903706fa3a7ce8956d0ee17fbbfa', 4, 3, 'authToken', '[]', 0, '2021-10-03 10:42:53', '2021-10-03 10:42:53', '2022-10-03 10:42:53'),
('6791416b7f2e571dde1182b26917e47fc03615fb94d0aaa6363de57af5e3753a597f1784caa5fe4c', 4, 3, 'authToken', '[]', 0, '2021-10-03 10:23:35', '2021-10-03 10:23:35', '2022-10-03 10:23:35'),
('68d2b75045e79bdc8a3ebd17139bb56cff970be016cbd98de2bef245fb06fc9b1e924cc8eec75a52', 4, 3, 'authToken', '[]', 0, '2021-10-03 10:50:16', '2021-10-03 10:50:16', '2022-10-03 10:50:16'),
('6a006fa587f90b185cf151e0be2a680968d8d1b99edf1f66760894cb283c79889aeba154d2181d0a', 2, 3, 'authToken', '[]', 0, '2021-10-03 22:07:58', '2021-10-03 22:07:58', '2022-10-03 22:07:58'),
('6a4e1da3e2fdf83acda6b20a2718c9a3e7a61b7ef467e42561e21e48b02463f7c4f3079cd85d02b1', 2, 3, 'authToken', '[]', 0, '2021-10-04 08:25:30', '2021-10-04 08:25:30', '2022-10-04 08:25:30'),
('6c86cf318103b47d922db5cf9dbc04ee0c142cd6b95418204a0673e4581aa19012ef1497280ccf61', 4, 3, 'authToken', '[]', 0, '2021-10-03 10:35:43', '2021-10-03 10:35:43', '2022-10-03 10:35:43'),
('6f9fbcfeb828ec6b4207272b4d4d422bb26903deeaf139f79a66806613d4b604d524ef0c2fbcf184', 4, 3, 'authToken', '[]', 0, '2021-10-03 12:48:30', '2021-10-03 12:48:30', '2022-10-03 12:48:30'),
('78eee8938560ee2e1f9f97ecdc26dd2e9452e382275b961b43b18075afda6a0c3a2b5a4de81098c3', 2, 3, 'authToken', '[]', 0, '2021-10-04 09:19:47', '2021-10-04 09:19:47', '2022-10-04 09:19:47'),
('7904634744420b3b53a4cd01ac32a6cc13819388ffa6048931acecbbd7210a8dd6af869337d6302e', 4, 3, 'authToken', '[]', 0, '2021-10-03 09:36:56', '2021-10-03 09:36:56', '2022-10-03 09:36:56'),
('79f64eafd15c7ad808be71732399e8d22675615a8f634438e41b1e60d23edecfdf2e548658f3b0f0', 2, 3, 'authToken', '[]', 0, '2021-10-03 08:37:44', '2021-10-03 08:37:44', '2022-10-03 08:37:44'),
('7acf5493cb6f50e52be8666a2c4a907438362026e07cf7d100a5b7e763896477531619a3d9904dd4', 2, 3, 'authToken', '[]', 0, '2021-10-04 08:13:33', '2021-10-04 08:13:33', '2022-10-04 08:13:33'),
('7bd4d778e86986f56a51e452f10ededc7a69ce1b77389020ad12a1a3124d8962d8fc5c3e797adb9e', 2, 3, 'authToken', '[]', 0, '2021-10-04 08:18:29', '2021-10-04 08:18:29', '2022-10-04 08:18:29'),
('7eb3600c8552ec9117a105e78330c7833b531f1ceb41d4f67125f50d452338a962f87d7af0cf4009', 1, 3, 'authToken', '[]', 0, '2021-09-19 17:31:07', '2021-09-19 17:31:07', '2022-09-19 17:31:07'),
('96aa539c273c729cec2b7f2ca261d104dbe71256d0db2c322cb3855416b2089de7d607b1b3ada9d5', 2, 3, 'authToken', '[]', 0, '2021-10-04 08:20:38', '2021-10-04 08:20:38', '2022-10-04 08:20:38'),
('983c63a3c565c3e2f065aaebfee87f20bc758c4c2a2b773a78b7ba98c17f8628d35be5e5d146bdfa', 2, 3, 'authToken', '[]', 0, '2021-10-04 08:48:11', '2021-10-04 08:48:11', '2022-10-04 08:48:11'),
('9a7aa428f3c97cdbe5a4db71ce2ce92bbc61210c08d080d769b322d3ba6bbc5e24149df5f69160e3', 4, 3, 'authToken', '[]', 0, '2021-10-03 19:34:06', '2021-10-03 19:34:06', '2022-10-03 19:34:06'),
('9deabbfa139a5c373db26fb1401accd3d3157fb8a53331f14ce3fad88c2799eb27e3c3e3c35e5588', 4, 3, 'authToken', '[]', 0, '2021-10-03 11:01:00', '2021-10-03 11:01:00', '2022-10-03 11:01:00'),
('a349fa81a38b9adc3f1d5db7e5ea9d02d20e771a7ba3c73a6fce141925fba389344a16c4d6f5f321', 2, 3, 'authToken', '[]', 0, '2021-10-03 08:39:18', '2021-10-03 08:39:18', '2022-10-03 08:39:18'),
('acfb026231c107882ba58185eb6c2f9d73311f845d68cfb41d56e4dbc56cdd1d86596a389540e569', 2, 3, 'authToken', '[]', 0, '2021-10-03 22:06:27', '2021-10-03 22:06:27', '2022-10-03 22:06:27'),
('af98b5414b967eba314f12e5da3f39385edf7532080fb73eaecc80ac4bdd30be5321b2f054bf021e', 2, 3, 'authToken', '[]', 0, '2021-10-03 08:36:16', '2021-10-03 08:36:16', '2022-10-03 08:36:16'),
('b3bb6ab3f3ecf6f40002abe02dab27f21eed1ef4a628b73479d8ffa4a9cb3538e9d50463c177a4aa', 2, 3, 'authToken', '[]', 0, '2021-09-22 12:56:14', '2021-09-22 12:56:14', '2022-09-22 12:56:14'),
('b3cd556ad500e55dbb266f9a582ea0c06fc34ff60bfaefdb793b43482f75e8361a73d84d55e69127', 2, 3, 'authToken', '[]', 0, '2021-10-03 20:22:10', '2021-10-03 20:22:10', '2022-10-03 20:22:10'),
('b5b5cdb1c5fa223c6f49a62ca2fabfd739a22e3126c7d530dd9249238857554851c087350fd1e2d1', 2, 3, 'authToken', '[]', 0, '2021-10-04 09:13:51', '2021-10-04 09:13:51', '2022-10-04 09:13:51'),
('b9e06113382c226a25f45680cac301535624cee916dc27af25e22ed760469c16cb2ba145eef6a16d', 2, 3, 'authToken', '[]', 0, '2021-10-04 08:22:01', '2021-10-04 08:22:01', '2022-10-04 08:22:01'),
('bca216b89a357800115647bae1739a8a608c5990268870265ce7801859dcdbf48b9ad7399653119c', 1, 3, 'authToken', '[]', 0, '2021-09-19 17:47:20', '2021-09-19 17:47:20', '2022-09-19 17:47:20'),
('beb814b0aa85b16106f3283138821ede530c4a71e8f970b1db8d12ec11774ca375436ab29676ea6c', 2, 3, 'authToken', '[]', 0, '2021-10-03 21:54:47', '2021-10-03 21:54:47', '2022-10-03 21:54:47'),
('c11870c49d6c5d7868cece91fe69e67c30890bd571d7dd640361aaf45a1f805981fa3dabf9d1e84a', 4, 3, 'authToken', '[]', 0, '2021-10-03 11:15:15', '2021-10-03 11:15:15', '2022-10-03 11:15:15'),
('c1fc920ab14074095cf1ce07312f3db589f7d72b7408ef0a1410f64b106e88b9700bce915d90c3ed', 2, 3, 'authToken', '[]', 0, '2021-10-03 22:08:11', '2021-10-03 22:08:11', '2022-10-03 22:08:11'),
('c236d6d59e77539771e94a7c892854964d0f7817937c7556f1a22cbf3bd9a1a90d62366f7f024bf9', 2, 3, 'authToken', '[]', 0, '2021-10-04 09:17:23', '2021-10-04 09:17:23', '2022-10-04 09:17:23'),
('ce9e8bbefe879d9265b794ec63c19220bd249cf8f69ef8c10845fb2940f99185f63d69808569804f', 2, 3, 'authToken', '[]', 0, '2021-09-28 12:36:21', '2021-09-28 12:36:21', '2022-09-28 12:36:21'),
('d5d7bbe3e41d66559a6da112a42afff9e2dee37d9c9ec23d77f672a4a562fbdddcc59d6666da7966', 4, 3, 'authToken', '[]', 0, '2021-10-03 10:23:37', '2021-10-03 10:23:37', '2022-10-03 10:23:37'),
('d602c6739c0cce888f5b522946e989eb91da8aacee92306e6c159716b9a7b93b32d73ffb962838b1', 2, 3, 'authToken', '[]', 0, '2021-10-04 08:27:51', '2021-10-04 08:27:51', '2022-10-04 08:27:51'),
('d903a4520a4cafc829c252072f6aa728b3620ddcf22d0a449c273de189a5526b629acc8c1a21abd3', 2, 3, 'authToken', '[]', 0, '2021-10-03 22:01:53', '2021-10-03 22:01:53', '2022-10-03 22:01:53'),
('e0844b7166faa08ed0005c795412046e8120e506f21e02b05f5ec301a8f5b6aa8593ea530a233e2e', 1, 3, 'authToken', '[]', 0, '2021-09-19 16:14:42', '2021-09-19 16:14:42', '2022-09-19 16:14:42'),
('e2a568b8bdfc90a71922a78fac7f8851b131869ad9f681047c1758e124da898d7ebce8abcfd3083c', 2, 3, 'authToken', '[]', 0, '2021-10-04 09:45:51', '2021-10-04 09:45:51', '2022-10-04 09:45:51'),
('e759153866d569900c7d8111d137b680b70497aff1960e7eb0ab68e16e07d281fa19b6c795a61670', 4, 3, 'authToken', '[]', 0, '2021-10-03 19:44:09', '2021-10-03 19:44:09', '2022-10-03 19:44:09'),
('ea08545919b1982d04bc512869af31a2669e29e2ea69b1404b9ff3c6a652305d59978900c321c3f9', 2, 3, 'authToken', '[]', 0, '2021-10-04 08:28:24', '2021-10-04 08:28:24', '2022-10-04 08:28:24'),
('ed8494f659058a538f4eadaf5ca78e4daf81678387e7a9ec74945ec9d4b9a0d3d5266f816419b829', 2, 3, 'authToken', '[]', 0, '2021-10-04 09:32:11', '2021-10-04 09:32:11', '2022-10-04 09:32:11'),
('f43ebc37bb9a1c33d184a015eeeeb045c24c18ddd5e1c0fdfbe0bc1c079b36ae70dc29fa03d02fef', 4, 3, 'authToken', '[]', 0, '2021-10-03 09:10:30', '2021-10-03 09:10:30', '2022-10-03 09:10:30'),
('f498749cd5edcbdcae7e64fe951a2327a13dbc9ba806bafae580b747a5aa46a30a94454a303e0295', 2, 3, 'authToken', '[]', 0, '2021-10-04 08:22:44', '2021-10-04 08:22:44', '2022-10-04 08:22:44'),
('f59d2a2e87ce3064009eb314e125db01107f990ee8c8057f344c1a17b225b80e8d006ed241b525d2', 2, 3, 'authToken', '[]', 0, '2021-10-04 09:14:58', '2021-10-04 09:14:58', '2022-10-04 09:14:58'),
('f7271d71591b9a74efbb32a4eeb81e570464b481870a1e78c2b20064cdb60d730bee44e3a22855d2', 2, 3, 'authToken', '[]', 0, '2021-10-03 21:57:46', '2021-10-03 21:57:46', '2022-10-03 21:57:46'),
('f8e3fcca3f4e78841ba4703f81a367297f8114bcaea3d31e8a6de53ffcb96786ae4b238271e10abc', 2, 3, 'authToken', '[]', 0, '2021-10-03 21:58:13', '2021-10-03 21:58:13', '2022-10-03 21:58:13'),
('faa2b9f511d3b61de14aef92309a5f03b50e73b549578ea93b234c5df80df71af7b923b4f335c650', 2, 3, 'authToken', '[]', 0, '2021-10-04 09:33:08', '2021-10-04 09:33:08', '2022-10-04 09:33:08');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'wkQF4Ydpz83qpgzJuM2Ei8Up2q4H4lVyyOfqdiFy', NULL, 'http://localhost', 1, 0, 0, '2021-09-17 14:08:51', '2021-09-17 14:08:51'),
(2, NULL, 'Laravel Password Grant Client', 'R8sJH2at3LTRPs2arLF31TulNoDZOlem2VNGueRh', 'users', 'http://localhost', 0, 1, 0, '2021-09-17 14:08:51', '2021-09-17 14:08:51'),
(3, NULL, 'Laravel Personal Access Client', 'eWrcCKQrUnarpb8krnX4xLuFaco8B8F0R1FOGpxd', NULL, 'http://localhost', 1, 0, 0, '2021-09-19 12:55:00', '2021-09-19 12:55:00'),
(4, NULL, 'Laravel Password Grant Client', '6iLUpZP2CI4HgpQUXE9VZ6ferFrah7dttola67GQ', 'users', 'http://localhost', 0, 1, 0, '2021-09-19 12:55:01', '2021-09-19 12:55:01');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-09-17 14:08:51', '2021-09-17 14:08:51'),
(2, 3, '2021-09-19 12:55:01', '2021-09-19 12:55:01');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiements`
--

CREATE TABLE `paiements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(12,2) NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `couture_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `paiements`
--

INSERT INTO `paiements` (`id`, `type`, `reference`, `montant`, `date`, `created_at`, `updated_at`, `couture_id`, `deleted_at`) VALUES
(1, 'Cash', '125662136', '25000.00', '2021-02-21 00:00:00', '2021-09-22 15:36:14', '2021-09-22 15:36:14', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous`
--

CREATE TABLE `rendez_vous` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `objet` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `couture_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rendez_vous`
--

INSERT INTO `rendez_vous` (`id`, `objet`, `date`, `created_at`, `updated_at`, `couture_id`, `deleted_at`) VALUES
(1, 'Essayage de la couture', '2021-10-10 17:49:00', '2021-09-30 17:17:49', '2021-09-30 17:51:41', 3, NULL),
(2, 'Rendez-vous de prise de mesure', '2021-10-02 10:22:00', '2021-09-30 17:19:14', '2021-09-30 17:19:14', 4, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `textures`
--

CREATE TABLE `textures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `textures`
--

INSERT INTO `textures` (`id`, `nom`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'tissu', 'Issu de l\'antiquité, le tissu est l\'une des textures qui a révolutionné de monde du textile. Plusieurs pays se sont developpés grâce au commerce du tissu.', '2021-09-21 17:22:07', '2021-09-21 17:22:07', NULL),
(3, 'Pagne', 'Origine d\'Afrique, aujourd\'hui le page est présent dans tous les évènement de la mode dans monde.', '2021-09-30 15:35:46', '2021-09-30 15:53:51', NULL),
(4, 'Pagne Baoulé', 'Pagne traditionnel baoulé cousu à la main par les tisserands baoulé. Aujourd\'hui il est présent dans aussi lors des cérémonies traditionnelles et mariages.', '2021-09-30 15:38:37', '2021-09-30 15:38:37', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `email`, `email_verified_at`, `password`, `is_admin`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Light Luc', NULL, 'admin@gmail.com', '2021-09-20 00:00:00', 'azerty', 0, NULL, '', '2021-09-19 00:00:00', '2021-09-19 00:00:00'),
(2, 'James Patrick', NULL, 'patrick.james@gmail.com', NULL, '$2y$10$VmH6HrGCyGqdnhX6FDz4suaTFBH4ya0DtkOo5t9u0fvrh4aQEbsWq', 0, NULL, NULL, '2021-09-22 12:43:48', '2021-09-22 12:43:48'),
(4, 'John', 'light', 'myadmin@gmail.com', NULL, '$2y$10$hfU2ggGOLacqx2.AYZrvceGx86RAuAjwAnmFKyBwgmLYVSfAuPi.K', 1, NULL, NULL, '2021-10-03 09:07:35', '2021-10-03 09:07:35');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ateliers`
--
ALTER TABLE `ateliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ateliers_couturier_id_foreign` (`couturier_id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_numero_unique` (`numero`),
  ADD KEY `clients_atelier_id_foreign` (`atelier_id`);

--
-- Index pour la table `coutures`
--
ALTER TABLE `coutures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coutures_client_id_foreign` (`client_id`),
  ADD KEY `coutures_modele_id_foreign` (`modele_id`);

--
-- Index pour la table `couture_texture`
--
ALTER TABLE `couture_texture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `liaisons_couture_id_foreign` (`couture_id`),
  ADD KEY `liaisons_texture_id_foreign` (`texture_id`);

--
-- Index pour la table `couturiers`
--
ALTER TABLE `couturiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `couturiers_user_id_foreign` (`user_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `mesures`
--
ALTER TABLE `mesures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mesures_couture_id_foreign` (`couture_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `modeles`
--
ALTER TABLE `modeles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Index pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paiements_couture_id_foreign` (`couture_id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rendez_vous_couture_id_foreign` (`couture_id`);

--
-- Index pour la table `textures`
--
ALTER TABLE `textures`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ateliers`
--
ALTER TABLE `ateliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `coutures`
--
ALTER TABLE `coutures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `couture_texture`
--
ALTER TABLE `couture_texture`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `couturiers`
--
ALTER TABLE `couturiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mesures`
--
ALTER TABLE `mesures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `modeles`
--
ALTER TABLE `modeles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `paiements`
--
ALTER TABLE `paiements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `textures`
--
ALTER TABLE `textures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ateliers`
--
ALTER TABLE `ateliers`
  ADD CONSTRAINT `ateliers_couturier_id_foreign` FOREIGN KEY (`couturier_id`) REFERENCES `couturiers` (`id`);

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_atelier_id_foreign` FOREIGN KEY (`atelier_id`) REFERENCES `ateliers` (`id`);

--
-- Contraintes pour la table `coutures`
--
ALTER TABLE `coutures`
  ADD CONSTRAINT `coutures_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `coutures_modele_id_foreign` FOREIGN KEY (`modele_id`) REFERENCES `modeles` (`id`);

--
-- Contraintes pour la table `couture_texture`
--
ALTER TABLE `couture_texture`
  ADD CONSTRAINT `liaisons_couture_id_foreign` FOREIGN KEY (`couture_id`) REFERENCES `coutures` (`id`),
  ADD CONSTRAINT `liaisons_texture_id_foreign` FOREIGN KEY (`texture_id`) REFERENCES `textures` (`id`);

--
-- Contraintes pour la table `couturiers`
--
ALTER TABLE `couturiers`
  ADD CONSTRAINT `couturiers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `mesures`
--
ALTER TABLE `mesures`
  ADD CONSTRAINT `mesures_couture_id_foreign` FOREIGN KEY (`couture_id`) REFERENCES `coutures` (`id`);

--
-- Contraintes pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD CONSTRAINT `paiements_couture_id_foreign` FOREIGN KEY (`couture_id`) REFERENCES `coutures` (`id`);

--
-- Contraintes pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD CONSTRAINT `rendez_vous_couture_id_foreign` FOREIGN KEY (`couture_id`) REFERENCES `coutures` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

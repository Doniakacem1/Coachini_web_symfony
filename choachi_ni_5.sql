-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 14 mai 2021 à 12:51
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `choachi'ni`
--

-- --------------------------------------------------------

--
-- Structure de la table `actualite`
--

CREATE TABLE `actualite` (
  `IdAct` int(11) NOT NULL,
  `Statut` varchar(255) NOT NULL,
  `Image` varchar(2083) NOT NULL,
  `Fichier` varchar(2083) DEFAULT NULL,
  `Bio` varchar(255) NOT NULL,
  `Compétence` varchar(255) NOT NULL,
  `likepub` int(11) DEFAULT 0,
  `datepub` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `actualite`
--

INSERT INTO `actualite` (`IdAct`, `Statut`, `Image`, `Fichier`, `Bio`, `Compétence`, `likepub`, `datepub`) VALUES
(145, 'dvbfwv', 'judo-608a0674d940e.png', 'CV_DoniaKAXEM-608a0674dccfa.pdf', 'testt', 'testtt', 0, '2021-04-29 03:05:56'),
(146, 'testFlash', 'surf-608a8f72be4f1.png', 'CV_DoniaKAXEM-608a8f72beade.pdf', 'testt', 'testtt', NULL, '2021-04-29 12:50:26'),
(147, 'bfdgs', 'golf-608a9e3088799.png', 'CV_DoniaKAXEM-608a9e3088d35.pdf', 'fdf', 'fgh', NULL, '2021-04-29 13:53:20');

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `role`) VALUES
(150, 'moudir'),
(160, 'admin'),
(262, 'moudir');

-- --------------------------------------------------------

--
-- Structure de la table `amis`
--

CREATE TABLE `amis` (
  `idAmis` int(11) NOT NULL,
  `destinataire` varchar(20) NOT NULL,
  `expediteur` varchar(20) NOT NULL,
  `etatDemande` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `amis`
--

INSERT INTO `amis` (`idAmis`, `destinataire`, `expediteur`, `etatDemande`) VALUES
(27, 'Elyes', 'louay', 1),
(28, 'guest', 'louay', 1),
(29, 'Adem', 'guest', 0),
(31, 'louay', 'Ahmed', 1),
(32, 'Anis', 'Elyes', 0),
(41, 'ElLou', 'Louay', 1),
(43, 'ElLouClient', 'Louay', 1),
(44, 'guest', 'Louay', 1),
(45, 'ademclient', 'Louay', 0),
(46, 'doniaCoach', 'doniaClient', 1);

-- --------------------------------------------------------

--
-- Structure de la table `categorieevent`
--

CREATE TABLE `categorieevent` (
  `id` int(255) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `description` varchar(2500) NOT NULL,
  `photo` varchar(2000) NOT NULL,
  `db_picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorieevent`
--

INSERT INTO `categorieevent` (`id`, `nom`, `description`, `photo`, `db_picture`) VALUES
(30, 'Tournoi Football', 'Compétition entre équipes de football pour gagner des récompenses', '/home/kagha/Desktop/002-football-2.png', 'localhost/coachini/uploads/f_605790c4725aa.png'),
(31, 'Compétition Tennis', 'Compétition entre équipes de Tennispour gagner des récompenses', '/home/kagha/Desktop/502108-sport/png/065-tennis-1.png', 'localhost/coachini/uploads/f_605791bb7e511.png'),
(32, 'Tour de cyclisme', 'c\'est une compétition de cyclisme qui permet aux cyclistes de faire  un tour bien précisés', '/home/kagha/Desktop/502108-sport/502108-sport/png/093-cycling-1.png', 'localhost/coachini/uploads/f_6057964fdcabb.png'),
(33, 'Tournoi échecs', 'Un tournoi d\'échecs est souvent organisé sous forme de rondes. Chaque joueur est ainsi assuré de jouer le même nombre de parties qu\'il gagne ou qu\'il perde', '/home/kagha/Desktop/502108-sport/502108-sport/png/078-chess-1.png', 'localhost/coachini/uploads/f_605796b4b1ed5.png'),
(34, 'Formation Sportif', 'Formation professionnelle qui permet l\'apprentissage des aspects généraux sportifs.', '/home/kagha/Desktop/012-fitness-1.png', 'localhost/coachini/uploads/f_6057ac87d01f5.png'),
(57, 'test', 'dsfsdffkjsdfkljsdlfkjsdlfjsldjf', '608a7afc9db91520252261.png', 'localhost/coachini/uploads/608a7afc9db91520252261.png');

-- --------------------------------------------------------

--
-- Structure de la table `categoriesport`
--

CREATE TABLE `categoriesport` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(2083) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categoriesport`
--

INSERT INTO `categoriesport` (`id`, `nom`, `description`, `photo`) VALUES
(11, 'Tennis', 'un sport collectif qui se joue avec un ballon', '370561ca4c1aca8014b23cf87e9ac3b7.png'),
(12, 'BasketBall', 'un sport collectif qui se joue avec un ballon', 'c896e58b160cd407f2afa86fe389a88d.png'),
(13, 'Box', 'art martial a été créé en tant que pédagogie physi', '52cd0843e33acb469cf02d9f3e288159.png'),
(14, 'Cycling', 'cycling est un loisir créatif adulte', '7088c961a031a84998f60c2f5abbc608.png'),
(16, 'FootBall', 'un sport collectif qui se joue avec un ballon', '1abca9dcbff47f9faf05daf2c84157bc.png'),
(21, 'Golf', 'un sport collectif qui se joue avec un ballon', '1abca9dcbff47f9faf05daf2c84157bc.png');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `idc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `idc`) VALUES
(8, 204),
(11, 246),
(12, 249),
(13, 251),
(14, 253),
(15, 254),
(16, 260),
(17, 262),
(18, 264),
(19, 265),
(20, 266),
(21, 267),
(22, 268),
(23, 271);

-- --------------------------------------------------------

--
-- Structure de la table `coach`
--

CREATE TABLE `coach` (
  `id` int(11) NOT NULL,
  `profession` varchar(30) DEFAULT NULL,
  `idc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `coach`
--

INSERT INTO `coach` (`id`, `profession`, `idc`) VALUES
(1, 'Coach1', 207),
(2, 'CoachA', 248),
(3, 'CoachHedi', 250),
(4, 'CoachElyess', 256),
(5, 'Coach12', 257),
(6, 'CoachAdem', 258),
(7, 'CoachAdem', 259),
(8, 'CoachHedi', 261),
(9, 'CoachDonia', 263),
(10, 'CoachDonia', 270),
(11, 'CoachDonia', 273);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `userName` varchar(32) NOT NULL,
  `nom` varchar(32) NOT NULL,
  `prenom` varchar(32) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `adresse_mail` varchar(64) DEFAULT NULL,
  `mot_de_passe` varchar(32) DEFAULT NULL,
  `num_tel` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `userName`, `nom`, `prenom`, `age`, `adresse_mail`, `mot_de_passe`, `num_tel`, `date`, `type`, `roles`) VALUES
(150, 'qq', 'elyes', 'qq', 99, 'qq', 'modifier', 100, '2020-01-02', '', ''),
(160, 'admin', 'massoussi', 'elyes', 21, 'massoussielyes2@gmail.com', 'modifier', 26213651, '2020-01-31', '', ''),
(192, 'hello', 'darkness', 'my', 12, 'old', 'friend', 12, '2019-02-03', '', ''),
(193, 'hello', 'darkness', 'my', 12, 'old', 'friend', 12, '2018-02-02', '', ''),
(195, 'hello', 'darkness', 'my', 59, 'old', 'friend', 59, '2016-01-01', '', ''),
(197, 'hello', 'darkness', 'my', 75, 'old', 'friend', 75, '2020-03-05', '', ''),
(198, 'hello', 'darkness', 'my', 42, 'old', 'friend', 85, '2019-02-03', '', ''),
(204, 'test', 'test', 'test', 4, 'test', 'test', 5, '2021-04-13', 'client', ''),
(205, 'elyesCoach', 'coach', 'coach', 6, 'coach', 'coach', 5, '2021-04-22', 'coach', ''),
(206, 'coach', 'coach', 'coach', 5, 'coach', 'coach', 5, '2021-04-16', 'coach', ''),
(207, 'coach', 'coach', 'coach', 5, 'coach', 'coach', 5, '2021-04-16', 'coach', ''),
(208, 'tst', 'test', 'test', 4, 'test', 'tets', 4, '2021-04-14', 'coach', ''),
(209, 'tst', 'test', 'test', 4, 'test', 'tets', 4, '2021-04-15', 'coach', ''),
(210, 'tst', 'test', 'test', 4, 'test', 'tets', 4, '2021-04-21', 'coach', ''),
(212, 'tst', 'test', 'test', 4, 'test', 'tets', 4, '2021-09-16', 'coach', ''),
(219, 'validation 2', 'validation2', 'validation2', 4, 'validation2', 'ACEFIKMHJSL', 3, '2012-12-12', 'coach', ''),
(220, 'hihiw', 'hihiw', 'hihiw', 3, 'hihiw', 'ACEFIKMHJSL', 5, '2012-12-12', 'coach', ''),
(221, 'hihiw', 'hihiw', 'hihiw', 3, 'hihiw', 'ACEFIKMHJSL', 5, '2012-12-12', 'coach', ''),
(222, 'hihiw', 'hihiw', 'hihiw', 3, 'hihiw', 'ACEFIKMHJSL', 5, '2012-12-12', 'coach', ''),
(223, 'hihiwerererererere', 'hihiw', 'hihiw', 3, 'hihiw', 'ACEFIKMHJSL', 5, '2012-12-12', 'coach', ''),
(224, 'tirtir', 'tirtir', 'tirtir', 4, 'tirtir', 'ACEFIKMHJSL', 3, '2012-12-12', 'coach', ''),
(225, 'admin', 'item3', 'ea', 23, 'jh', 'pprr', 3456, '2012-12-12', 'coach', ''),
(226, 'admin', 'item3', 'ea', 23, 'jh', 'pprr', 3456, '2012-12-12', 'coach', ''),
(262, 'elyesMassoussi', 'massoussi', 'elyes', 21, 'admin.admin@gmail.com', 'aeolr', 26154879, '2021-04-15', 'admin', '[]'),
(263, 'doniaCoach', 'doniaCoach', 'doniaCoach', 22, 'donia.kacem@esprit.tn', 'dppleHuhkq', 55309781, '2021-04-14', 'coach', '[]'),
(264, 'doniaClient', 'doniaClient', 'doniaClient', 239, 'donia.kacem@esprit.tn', 'dppleHrpmwD', 55309781, '2021-04-08', 'client', '[]'),
(265, 'elyesClient', 'elyesClient', 'elyesClient', 5, 'elyes.massoussi@esprit.tn', 'emAhwHrpmwDXAqwuyvJ', 26213651, '2021-04-20', 'client', '[]'),
(266, 'elyesClient2', 'elyesClient2', 'elyesClient2', 95563, 'elyes.massoussi@esprit.tn', 'ACEDIKHOISU', 26213651, '2021-04-25', 'client', '[]'),
(267, 'elyesClient3', 'elyesClient3', 'elyesClient3', 12, 'elyes.massoussi@esprit.tn', 'emAhwHrpmwD', 26213651, '2021-04-27', 'coach', '[]'),
(269, 'donia kacem', 'kacem', 'donia', NULL, 'donia.kacem@esprit.tn', NULL, NULL, '2021-04-29', 'client', '[]'),
(270, 'elyesDCoach', 'elyesDCoach', 'elyesDCoach', 5698, 'elyes.massoussi@esprit.tn', 'emAhwIIvilr', 26213651, '2021-04-20', 'coach', '[]'),
(271, 'validationfinale', 'validationfinalefinale', 'validationfinale', 12, 'coachiniapp@gmail.com', 'vbnlhfzpwwptznztvzFtFz', 26213651, NULL, 'client', '[]'),
(272, 'Sarra SLIMI', 'SLIMI', 'Sarra', NULL, 'sarra.slimi@esprit.tn', NULL, NULL, NULL, 'client', '[]'),
(273, 'validationcoach', 'validationcoach', 'validationcoach', 12, 'elyes.massoussi@esprit.tn', 'vbnlhfzpwwmzmpv', 26213651, NULL, 'coach', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210413081446', '2021-04-13 10:15:04', 15973),
('DoctrineMigrations\\Version20210423195902', '2021-04-23 21:59:28', 3670);

-- --------------------------------------------------------

--
-- Structure de la table `encapsulation_message`
--

CREATE TABLE `encapsulation_message` (
  `id` int(11) NOT NULL,
  `me` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenu_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE `event` (
  `id` int(25) NOT NULL,
  `Nom_event` varchar(35) NOT NULL,
  `Date_debut` date NOT NULL,
  `Heure_debut` varchar(35) NOT NULL,
  `Date_fin` date NOT NULL,
  `Heure_fin` varchar(35) NOT NULL,
  `Participation` varchar(35) NOT NULL,
  `Nb_participant` int(25) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `id_Cat` int(11) DEFAULT NULL,
  `db_map` varchar(255) DEFAULT NULL,
  `id_Coach` int(11) DEFAULT NULL,
  `Map` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `Nom_event`, `Date_debut`, `Heure_debut`, `Date_fin`, `Heure_fin`, `Participation`, `Nb_participant`, `Description`, `id_Cat`, `db_map`, `id_Coach`, `Map`) VALUES
(332, 'dsfsdfsdf', '2021-04-19', '10:20', '2021-04-19', '10:10', 'On Ligne', 9, 'sdfsdfsdf', 30, 'localhost/coachini/uploads/607d6445bda68221774592.png', NULL, 'LatLng(36.81667, 10.17528) ممر جنين, المنزه, تونس'),
(333, 'testing map', '2021-04-20', '10:20', '2021-04-20', '20:10', 'On Ligne', 10, 'qsdqsdqsd', 33, 'localhost/coachini/uploads/607e44014add9176565612.png', NULL, 'LatLng(36.453012, 10.748619) نهج مسجد, دار شعبان الفهري'),
(336, 'feature', '2021-04-21', '18:00', '2021-04-22', '15:28', 'On Ligne', 3, 'sdfsdf', 33, 'localhost/coachini/uploads/60806f3149706836813760.png', NULL, 'LatLng(36.815463, 10.160067) طريق المستشفى العسكري, العمران, تونس'),
(337, 'qqsdqsd', '2021-04-22', '10:20', '2021-04-22', '10:30', 'On Ligne', 5, 'qsdqsd', 33, 'localhost/coachini/uploads/608138b76c71b856050368.png', NULL, 'LatLng(36.804677, 10.185846) ممر محمد الخامس, باب البحر, تونس'),
(338, 'testing dev', '2021-04-22', '13:00', '2021-04-22', '13:00', 'On Ligne', 6, 'sdfsdf', 33, 'localhost/coachini/uploads/6081611656d74610632121.png', NULL, 'LatLng(36.82522, 10.14652) 102 نهج الدار البيضاء, العمران, تونس'),
(339, 'hifromjava', '2021-04-22', '01:00', '2021-04-08', '03:45', 'En Personne', 20, 'hell yeah', 34, 'localhost/coachini/uploads/f_60843293d7dd3.png', 0, NULL),
(340, 'sdfsdf', '2021-04-08', '00:30', '2021-04-08', '01:00', 'En Personne', 20, 'sdfsdfsdf', 34, 'localhost/coachini/uploads/f_608435c2c5b39.png', 0, 'LatLng(36.79732, 10.18539) 38 نهج القائد محمد البجاوي, باب البحر, تونس'),
(342, 'sfdsdfsdf', '2021-04-28', '10:20', '2021-04-28', '22:10', 'En Personne', 100, 'sdfsdfs', 34, 'localhost/coachini/uploads/608924fede425237198950.png', 263, 'LatLng(36.82207, 10.13455) نهج الرقة, التحرير, تونس'),
(346, 'finalo', '2021-04-14', '01:45', '2021-04-16', '01:15', 'En Personne', 20, 'dqsdqsdqsd', 31, 'localhost/coachini/uploads/f_60893da11abe0.png', 0, 'LatLng(36.82435, 10.13914) مركز الصحة الأساسية ابن خلدون'),
(347, 'PIDEV v5', '2021-04-14', '01:30', '2021-04-15', '01:00', 'En Personne', 10, 'sdfsdfsd', 32, 'localhost/coachini/uploads/f_608a7db492ea1.png', 263, 'LatLng(36.81691, 10.16126) مأكولات الفورتي'),
(349, 'testing V5', '2021-04-08', '00:30', '2021-04-08', '01:15', 'En Personne', 40, 'qsdqsd', 34, 'localhost/coachini/uploads/f_608aa435de147.png', 263, 'LatLng(36.818767, 10.23222) تونس');

-- --------------------------------------------------------

--
-- Structure de la table `map`
--

CREATE TABLE `map` (
  `id` int(11) NOT NULL,
  `Latitude` float DEFAULT NULL,
  `Longtitude` float DEFAULT NULL,
  `Lieu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `map`
--

INSERT INTO `map` (`id`, `Latitude`, `Longtitude`, `Lieu`) VALUES
(300, 36.7979, 10.1693, 'جامع حمودة باشا'),
(343, 36.8087, 10.2099, 'تونس'),
(345, 36.8082, 10.1882, 'شارع المغرب العربي الكبير, باب البحر, تونس'),
(346, 36.8243, 10.1391, 'مركز الصحة الأساسية ابن خلدون'),
(347, 36.8169, 10.1613, 'مأكولات الفورتي'),
(349, 36.8188, 10.2322, 'تونس');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `idMessage` int(11) NOT NULL,
  `destinataire` varchar(20) NOT NULL,
  `expediteur` varchar(20) NOT NULL,
  `contenuMessage` varchar(255) NOT NULL,
  `dateEnvoie` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`idMessage`, `destinataire`, `expediteur`, `contenuMessage`, `dateEnvoie`) VALUES
(300, 'Louay', 'guest', 'yoo  (300)', '2021-04-17 05:45:30'),
(301, '', '', '', '2021-04-20 02:33:33'),
(302, '', '', '', '2021-04-20 02:34:58'),
(372, 'Ahmed', 'louay', 'Saluuut', '2021-04-23 18:52:33'),
(373, 'louay', 'Ahmed', 'Edited', '2021-04-23 18:53:00'),
(374, 'Ahmed', 'louay', 'comment ça va ?', '2021-04-23 18:54:08'),
(375, 'louay', 'Ahmed', 'Bien et toi ?', '2021-04-23 18:54:18'),
(376, 'Ahmed', 'louay', 'Bien, bien', '2021-04-23 18:54:27'),
(377, 'Ahmed', 'louay', 'test 3', '2021-04-23 18:58:43'),
(378, 'louay', 'Ahmed', 'test 4', '2021-04-23 18:58:58'),
(380, 'louay', 'Ahmed', 'Test Avant modif XXXX', '2021-04-23 19:32:00'),
(383, 'louay', 'Ahmed', 'Niiice', '2021-04-23 20:45:12'),
(385, 'doniaCoach', 'doniaClient', 'Bonjouur', '2021-04-29 03:14:34'),
(386, 'doniaClient', 'doniaCoach', 'Edited ?', '2021-04-29 03:14:37'),
(387, 'doniaCoach', 'doniaClient', 'bien', '2021-04-29 03:14:46'),
(388, 'doniaClient', 'doniaCoach', 'Saluut', '2021-04-29 13:35:35'),
(389, 'doniaCoach', 'doniaClient', 'Comment ça va ?', '2021-04-29 13:35:44');

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

CREATE TABLE `offre` (
  `id` int(11) NOT NULL,
  `id_coach` int(11) DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCompte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `offre`
--

INSERT INTO `offre` (`id`, `id_coach`, `id_categorie`, `titre`, `date`, `description`, `idCompte`) VALUES
(11, 9, 14, 'testflashy', '2021-06-25', 'basketball est un loisir', 263),
(12, 9, 11, 'titre12', '2022-11-26', 'tennis est un loisir', 263),
(18, NULL, 14, 'Cycling', '2021-04-25', ' testt', 263),
(24, NULL, 11, 'testf', '2021-04-30', ' testtt', 0),
(25, NULL, 11, 'testtt', '2021-04-30', ' testttt', 0),
(27, NULL, 13, 'testb', '2021-04-30', ' testt', 0),
(28, NULL, 13, 'testb', '2021-04-30', ' testt', 0),
(32, NULL, 12, 'testff', '2021-04-23', ' testt', 263),
(34, NULL, 12, 'testJSON', '2021-05-03', 'testJSON', 263),
(36, NULL, 11, 'test', '2021-05-03', 'test', 263),
(42, NULL, 14, 'newOffre', '2021-05-06', 'newOffre', 0),
(49, NULL, 13, 'OffreCategorie', '2021-05-09', 'offreCategorie', 263),
(51, NULL, 11, 'tstt', '2021-05-09', 'tdrtt', 263),
(53, NULL, 12, 'esttt', '2021-05-09', 'tttt', 263),
(54, NULL, 11, 'offre', '2021-05-09', 'offre', 263);

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

CREATE TABLE `profile` (
  `ID_Coach` int(11) NOT NULL,
  `Photo` varchar(2083) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Catégorie` varchar(255) NOT NULL,
  `Détail` varchar(255) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `ID_Compte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `profile`
--

INSERT INTO `profile` (`ID_Coach`, `Photo`, `Description`, `Rating`, `Catégorie`, `Détail`, `Nom`, `ID_Compte`) VALUES
(171, 'lion-608a9cb929a0a.jpeg', 'sgddfcbxcvb', 1, 'Football', 'gsdg', 'doniaCoach', 0),
(172, 'moh-608a9d696dc69.jpeg', 'fdbxcvb', 3, 'Football', 'bxcvbx', 'donia', 263);

-- --------------------------------------------------------

--
-- Structure de la table `reclamation`
--

CREATE TABLE `reclamation` (
  `idReclamation` int(11) NOT NULL,
  `login` varchar(25) NOT NULL,
  `descriptionReclamation` varchar(4000) NOT NULL,
  `typeReclamation` varchar(100) NOT NULL,
  `dateReclamation` varchar(25) NOT NULL,
  `enCours` int(1) NOT NULL,
  `traite` int(1) NOT NULL,
  `idTypeReclamation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reclamation`
--

INSERT INTO `reclamation` (`idReclamation`, `login`, `descriptionReclamation`, `typeReclamation`, `dateReclamation`, `enCours`, `traite`, `idTypeReclamation`) VALUES
(14, 'Louay', 'insulte et non respect', 'none', '12/04/2021', 0, 1, 1),
(22, 'Louay', 'bouton non-fonctionnel', 'none', '13/04/2021', 0, 1, 3),
(23, 'ElLou', 'Rien à dire', 'none', '08/04/2021', 0, 1, 4),
(24, 'Louay', 'bla bla bla', 'none', '13/04/2021', 0, 1, 4),
(28, 'Anis', 'bla bla bla', 'none', '13/04/2021', 0, 1, 3),
(29, 'ElLou', 'Test reclamation', 'none', '13/04/2021', 0, 1, 3),
(30, 'ElLou', 'test total', 'none', '22/04/2021', 0, 1, 3),
(31, 'Louay', 'Test Java', 'Problème technique', '2021/04/23 14:56:55', 0, 0, NULL),
(32, 'Louay', 'Test Java 2', 'Attitude négative', '23/04/2021', 0, 0, 1),
(33, 'doniaClient', 'Envoie réclamation', 'Attitude négative', '29/04/2021', 0, 1, 1),
(34, 'doniaCoach', 'le bouton sign out ne fondtionne pas', 'Problème technique', '29/04/2021', 0, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `review_client`
--

CREATE TABLE `review_client` (
  `id_review` int(11) NOT NULL,
  `description_review` text NOT NULL,
  `nom_client_review` varchar(30) NOT NULL,
  `nom_coach_review` varchar(30) NOT NULL,
  `date_review` varchar(30) NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `review_client`
--

INSERT INTO `review_client` (`id_review`, `description_review`, `nom_client_review`, `nom_coach_review`, `date_review`, `rating`) VALUES
(37, 'R1 w kima 9al sahib elyes hard work pays off ', 'Adem Youssef', 'COACH XY', '2021-02-24 25:15:45', 4.5),
(39, '1er execution du crud review', 'Adem YSF', 'COACH XY', '2021-02-24 25:17:45', 5),
(149, 'test integration en tant que coach', 'adem', 'ademcoach', '2021-03-23 11:39:07', 2),
(154, 'pfff w barra min donia rekda 10 sweyaa', 'doniaClient', 'ademCoach', '2021-04-28 14:26:18', 4),
(155, 'tit', 'doniaClient', 'doniaCoach', '2021-04-28 14:35:17', 3),
(156, 'test test noti', 'doniaClient', 'doniaCoach', '2021-04-28 14:52:30', 4),
(157, 'best coach xd', 'doniaClient', 'doniaCoach', '2021-04-29 03:27:19', 3),
(159, 'test validation', 'doniaClient', 'doniaCoach', '2021-04-29 14:25:06', 5);

-- --------------------------------------------------------

--
-- Structure de la table `seance_planning`
--

CREATE TABLE `seance_planning` (
  `id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `Summary` varchar(30) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Date` varchar(30) NOT NULL,
  `Starts_at` varchar(30) NOT NULL,
  `Finishs_at` varchar(30) NOT NULL,
  `Localisation` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `seance_planning`
--

INSERT INTO `seance_planning` (`id`, `user_name`, `Summary`, `Description`, `Date`, `Starts_at`, `Finishs_at`, `Localisation`) VALUES
(1, 'DoniaClient', 'test', 'chest day', '2021-04-29', '15:59:16', '16:59:16', 'esprit gym'),
(2, 'DoniaClient', 'leg day', 'leg press + leg extention', '2021-04-26', '15:00:14', '17:00:14', 'california gym EL MARSA'),
(75, 'adem70', 'testcalender integration', 'integration test', '2021-05-28', '15:01:56', '16:01:56', 'sousse'),
(76, 'DoniaClient', 'seance CorssFit', 'make sure to drink 2l of water and get enought sleep', '2021-04-30', '14:57:46', '15:57:46', 'esprit gym'),
(77, 'doniaClient', 'testdoniaCoach', 'null', '2021-04-30', '14:20:00', '18:00:00', 'null'),
(78, 'doniaClient', 'test2donia', 'null', '2021-04-30', '09:30:00', '12:25:00', 'null'),
(79, 'doniaClient', 'test validation', 'null', '2021-04-30', '14:30:00', '18:30:00', 'null'),
(80, 'DoniaClient', 'seance CorssFit', 'test validation', '2021-04-29', '14:30:24', '14:30:24', 'gym');

-- --------------------------------------------------------

--
-- Structure de la table `typereclamation`
--

CREATE TABLE `typereclamation` (
  `idTypeReclamation` int(11) NOT NULL,
  `typeReclamation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `typereclamation`
--

INSERT INTO `typereclamation` (`idTypeReclamation`, `typeReclamation`) VALUES
(1, 'Attitude négative'),
(3, 'Problème technique'),
(4, 'Autres');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`) VALUES
(15, 'elyes.massoussi@esprit.tn', '[]'),
(16, 'Elyes MASSOUSSI', '[]'),
(17, 'donia kacem', '[]'),
(18, 'Sarra SLIMI', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurbloque`
--

CREATE TABLE `utilisateurbloque` (
  `idBloque` int(11) NOT NULL,
  `utilisateur` varchar(20) NOT NULL,
  `abloque` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateurbloque`
--

INSERT INTO `utilisateurbloque` (`idBloque`, `utilisateur`, `abloque`) VALUES
(14, 'ElLou', 'Louay');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actualite`
--
ALTER TABLE `actualite`
  ADD PRIMARY KEY (`IdAct`);

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `amis`
--
ALTER TABLE `amis`
  ADD PRIMARY KEY (`idAmis`);

--
-- Index pour la table `categorieevent`
--
ALTER TABLE `categorieevent`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categoriesport`
--
ALTER TABLE `categoriesport`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_compte_client` (`idc`);

--
-- Index pour la table `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_compte_coach` (`idc`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `encapsulation_message`
--
ALTER TABLE `encapsulation_message`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Cat` (`id_Cat`);

--
-- Index pour la table `map`
--
ALTER TABLE `map`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`idMessage`);

--
-- Index pour la table `offre`
--
ALTER TABLE `offre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test` (`id_categorie`),
  ADD KEY `test2` (`id_coach`);

--
-- Index pour la table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`ID_Coach`);

--
-- Index pour la table `reclamation`
--
ALTER TABLE `reclamation`
  ADD PRIMARY KEY (`idReclamation`),
  ADD KEY `FK_ForeignKey` (`idTypeReclamation`);

--
-- Index pour la table `review_client`
--
ALTER TABLE `review_client`
  ADD PRIMARY KEY (`id_review`);

--
-- Index pour la table `seance_planning`
--
ALTER TABLE `seance_planning`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `typereclamation`
--
ALTER TABLE `typereclamation`
  ADD PRIMARY KEY (`idTypeReclamation`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- Index pour la table `utilisateurbloque`
--
ALTER TABLE `utilisateurbloque`
  ADD PRIMARY KEY (`idBloque`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actualite`
--
ALTER TABLE `actualite`
  MODIFY `IdAct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT pour la table `amis`
--
ALTER TABLE `amis`
  MODIFY `idAmis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `categorieevent`
--
ALTER TABLE `categorieevent`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `categoriesport`
--
ALTER TABLE `categoriesport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `coach`
--
ALTER TABLE `coach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT pour la table `encapsulation_message`
--
ALTER TABLE `encapsulation_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT pour la table `map`
--
ALTER TABLE `map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=391;

--
-- AUTO_INCREMENT pour la table `offre`
--
ALTER TABLE `offre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `profile`
--
ALTER TABLE `profile`
  MODIFY `ID_Coach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT pour la table `reclamation`
--
ALTER TABLE `reclamation`
  MODIFY `idReclamation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `review_client`
--
ALTER TABLE `review_client`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT pour la table `seance_planning`
--
ALTER TABLE `seance_planning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `typereclamation`
--
ALTER TABLE `typereclamation`
  MODIFY `idTypeReclamation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `utilisateurbloque`
--
ALTER TABLE `utilisateurbloque`
  MODIFY `idBloque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_compte_admin` FOREIGN KEY (`id`) REFERENCES `compte` (`id`);

--
-- Contraintes pour la table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FK_Cat` FOREIGN KEY (`id_Cat`) REFERENCES `categorieevent` (`id`);

--
-- Contraintes pour la table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `test` FOREIGN KEY (`id_categorie`) REFERENCES `categoriesport` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reclamation`
--
ALTER TABLE `reclamation`
  ADD CONSTRAINT `FK_CE6064045F6E1399` FOREIGN KEY (`idTypeReclamation`) REFERENCES `typereclamation` (`idTypeReclamation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

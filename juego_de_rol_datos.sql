-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-01-2022 a las 11:33:25
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juego_de_rol`
--

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellidos`, `apodo`) VALUES
(1, 'Santy', 'Esteban', NULL),
(2, 'Jorge', 'Parada', NULL),
(3, 'Lucas', 'Piñeiro', NULL),
(4, 'Alcira', 'Parga', NULL),
(5, 'Becky', 'Saray', NULL),
(6, 'Falchion', '', NULL),
(7, 'Manu', 'Esteban', NULL),
(8, 'Dani', 'Esteban', NULL),
(9, 'Nacho', 'Ramos', NULL),
(10, 'Cristina', '', NULL),
(11, 'Pablo', 'Pivot', NULL),
(12, 'Jaime', '', NULL),
(13, 'Lidia', '', NULL),
(14, 'Jose', 'Rial', NULL),
(15, 'Pablo', 'Rodriguez', NULL),
(16, 'Marcos', 'Perez', NULL),
(17, 'Cristina', 'Piñeiro', NULL);

--
-- Volcado de datos para la tabla `personaje`
--

INSERT INTO `personaje` (`id`, `nombre`, `apodo`, `id_raza`, `id_trabajo`, `edad`, `id_persona`, `descripcion`, `id_fisicas`, `id_rol`) VALUES
(1, 'Chorvitta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Gobbla', NULL, 7, NULL, NULL, 9, NULL, NULL, NULL),
(3, 'Vince', NULL, 14, NULL, NULL, 7, NULL, NULL, NULL),
(4, 'Crist', NULL, 5, NULL, NULL, 17, NULL, NULL, NULL),
(5, 'Den, El Negro', NULL, 3, NULL, NULL, 2, NULL, NULL, NULL),
(6, 'Ithaisa', NULL, 5, NULL, NULL, 5, NULL, NULL, NULL),
(7, 'Falchion', NULL, 1, NULL, NULL, 6, NULL, NULL, NULL),
(8, 'Arion', NULL, 14, NULL, NULL, 1, NULL, NULL, NULL),
(9, 'Sr. Mani', NULL, 1, NULL, NULL, 16, NULL, NULL, NULL),
(10, 'Leigh', NULL, 14, NULL, NULL, 10, NULL, NULL, NULL),
(11, 'Pivot', NULL, 3, NULL, NULL, 11, NULL, NULL, NULL),
(12, 'Eifdeg', NULL, 4, NULL, NULL, 15, NULL, NULL, NULL),
(13, 'Shadow', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Lemur', NULL, 14, NULL, NULL, 3, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `raza`
--

INSERT INTO `raza` (`id`, `nombre`) VALUES
(1, 'Elfo'),
(2, 'SemiElfo'),
(3, 'Humano'),
(4, 'Enano'),
(5, 'NOLDOR'),
(6, 'WOSE'),
(7, 'OGRO'),
(8, 'SemiOgro'),
(9, 'Mediano'),
(10, 'Goblin'),
(11, 'Orco'),
(12, 'SemiOrco'),
(13, 'Alto Elfo'),
(14, 'Elfo Silvano');

--
-- Volcado de datos para la tabla `trabajo`
--

INSERT INTO `trabajo` (`id`, `nombre`) VALUES
(1, 'Bardo'),
(2, 'Guerrero'),
(3, 'Barbaro'),
(4, 'Asesino'),
(5, 'Cazador'),
(6, 'Mago'),
(7, 'Montaraz'),
(8, 'Paladin'),
(9, 'Ladron'),
(10, 'Monje');

-- --------------------------------------------------------

--
-- Estructura para la vista `lista_personajes`
--
DROP TABLE IF EXISTS `lista_personajes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lista_personajes`  AS SELECT `per`.`id` AS `id`, `per`.`nombre` AS `nombre`, `r`.`nombre` AS `raza`, `p`.`nombre` AS `persona` FROM ((`personaje` `per` join `persona` `p` on(`per`.`id_persona` = `p`.`id`)) join `raza` `r` on(`per`.`id_raza` = `r`.`id`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

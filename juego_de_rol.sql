-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2022 a las 12:45:42
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anecdotas`
--

CREATE TABLE `anecdotas` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `id_persona` int(10) UNSIGNED DEFAULT NULL,
  `cuando` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capitulos`
--

CREATE TABLE `capitulos` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `cuando` varchar(100) DEFAULT NULL,
  `orden` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas_rol`
--

CREATE TABLE `caracteristicas_rol` (
  `id` int(10) UNSIGNED NOT NULL,
  `fuerza` int(10) UNSIGNED DEFAULT NULL,
  `destreza` int(10) UNSIGNED DEFAULT NULL,
  `constitucion` int(10) UNSIGNED DEFAULT NULL,
  `inteligencia` int(10) UNSIGNED DEFAULT NULL,
  `sabiduria` int(10) UNSIGNED DEFAULT NULL,
  `carisma` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carasteristicas_fisicas`
--

CREATE TABLE `carasteristicas_fisicas` (
  `id` int(10) UNSIGNED NOT NULL,
  `altura` int(10) UNSIGNED DEFAULT NULL,
  `peso` int(10) UNSIGNED DEFAULT NULL,
  `genero` int(10) UNSIGNED DEFAULT 0 COMMENT '0 - masculino.\n1 - femenino.\n2 - otros'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='gasgasf';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades`
--

CREATE TABLE `habilidades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `id` int(10) UNSIGNED NOT NULL,
  `nonbre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mn_anecdotas_relacionadas`
--

CREATE TABLE `mn_anecdotas_relacionadas` (
  `id_anecdota` int(10) UNSIGNED DEFAULT NULL,
  `id_relacionada` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mn_anecdota_capitulo`
--

CREATE TABLE `mn_anecdota_capitulo` (
  `id_anecdota` int(10) UNSIGNED DEFAULT NULL,
  `id_capitulo` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mn_habilidad_personaje`
--

CREATE TABLE `mn_habilidad_personaje` (
  `id_personaje` int(10) UNSIGNED DEFAULT NULL,
  `id_habilidad` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mn_lugares_anecdota`
--

CREATE TABLE `mn_lugares_anecdota` (
  `id_lugar` int(10) UNSIGNED DEFAULT NULL,
  `id_anecdota` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mn_personaje_anectdota`
--

CREATE TABLE `mn_personaje_anectdota` (
  `id_anecdota` int(10) UNSIGNED DEFAULT NULL,
  `id_personaje` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mn_personaje_capitulo`
--

CREATE TABLE `mn_personaje_capitulo` (
  `id_capitulo` int(10) UNSIGNED DEFAULT NULL,
  `id_personaje` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `apodo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(11, 'Alberto', 'Pivot', NULL),
(12, 'Jaime', '', NULL),
(13, 'Lidia', '', NULL),
(14, 'Jose', 'Rial', NULL),
(15, 'Pablo', 'Rodriguez', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje`
--

CREATE TABLE `personaje` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apodo` varchar(100) DEFAULT NULL,
  `id_raza` int(10) UNSIGNED DEFAULT NULL,
  `id_trabajo` int(10) UNSIGNED DEFAULT NULL,
  `edad` int(10) UNSIGNED DEFAULT NULL,
  `id_persona` int(10) UNSIGNED DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `id_fisicas` int(10) UNSIGNED DEFAULT NULL,
  `id_rol` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza`
--

CREATE TABLE `raza` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion`
--

CREATE TABLE `relacion` (
  `id_personaje` int(10) UNSIGNED DEFAULT NULL,
  `id_relacionado` int(10) UNSIGNED DEFAULT NULL,
  `id_tipo_relacion` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_relacion`
--

CREATE TABLE `tipo_relacion` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo`
--

CREATE TABLE `trabajo` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anecdotas`
--
ALTER TABLE `anecdotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_anecdotas_persona` (`id_persona`);

--
-- Indices de la tabla `capitulos`
--
ALTER TABLE `capitulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caracteristicas_rol`
--
ALTER TABLE `caracteristicas_rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carasteristicas_fisicas`
--
ALTER TABLE `carasteristicas_fisicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mn_anecdotas_relacionadas`
--
ALTER TABLE `mn_anecdotas_relacionadas`
  ADD KEY `fk_mn_anecdotas_relacionadas_anecdotas` (`id_anecdota`),
  ADD KEY `fk_mn_anecdotas_relacionadas_anecdotas_0` (`id_relacionada`);

--
-- Indices de la tabla `mn_anecdota_capitulo`
--
ALTER TABLE `mn_anecdota_capitulo`
  ADD KEY `fk_mn_personaje_anectdota_anecdotas_0` (`id_anecdota`),
  ADD KEY `fk_mn_personaje_anectdota_0_capitulos` (`id_capitulo`);

--
-- Indices de la tabla `mn_habilidad_personaje`
--
ALTER TABLE `mn_habilidad_personaje`
  ADD KEY `fk_mn_habilidad_personaje_habilidades` (`id_habilidad`),
  ADD KEY `fk_mn_habilidad_personaje_personaje` (`id_personaje`);

--
-- Indices de la tabla `mn_lugares_anecdota`
--
ALTER TABLE `mn_lugares_anecdota`
  ADD KEY `fk_mn_lugares_anecdota_lugares` (`id_lugar`),
  ADD KEY `fk_mn_lugares_anecdota_anecdotas` (`id_anecdota`);

--
-- Indices de la tabla `mn_personaje_anectdota`
--
ALTER TABLE `mn_personaje_anectdota`
  ADD KEY `fk_mn_personaje_anectdota_anecdotas` (`id_anecdota`),
  ADD KEY `fk_mn_personaje_anectdota_personaje` (`id_personaje`);

--
-- Indices de la tabla `mn_personaje_capitulo`
--
ALTER TABLE `mn_personaje_capitulo`
  ADD KEY `fk_mn_personaje_anectdota_personaje_0` (`id_personaje`),
  ADD KEY `fk_mn_personaje_capitulo_capitulos` (`id_capitulo`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_personaje_trabajo` (`id_trabajo`),
  ADD KEY `fk_personaje_raza` (`id_raza`),
  ADD KEY `fk_personaje_persona` (`id_persona`),
  ADD KEY `fk_personaje_caracteristicas_rol` (`id_rol`),
  ADD KEY `fk_personaje_carasteristicas_fisicas` (`id_fisicas`);

--
-- Indices de la tabla `raza`
--
ALTER TABLE `raza`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `relacion`
--
ALTER TABLE `relacion`
  ADD KEY `fk_mn_personaje_personaje_personaje` (`id_personaje`),
  ADD KEY `fk_mn_personaje_personaje_personaje_0` (`id_relacionado`),
  ADD KEY `fk_relacion_tipo_relacion` (`id_tipo_relacion`);

--
-- Indices de la tabla `tipo_relacion`
--
ALTER TABLE `tipo_relacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trabajo`
--
ALTER TABLE `trabajo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anecdotas`
--
ALTER TABLE `anecdotas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capitulos`
--
ALTER TABLE `capitulos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caracteristicas_rol`
--
ALTER TABLE `caracteristicas_rol`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carasteristicas_fisicas`
--
ALTER TABLE `carasteristicas_fisicas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lugares`
--
ALTER TABLE `lugares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `personaje`
--
ALTER TABLE `personaje`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `raza`
--
ALTER TABLE `raza`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tipo_relacion`
--
ALTER TABLE `tipo_relacion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trabajo`
--
ALTER TABLE `trabajo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anecdotas`
--
ALTER TABLE `anecdotas`
  ADD CONSTRAINT `fk_anecdotas_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mn_anecdotas_relacionadas`
--
ALTER TABLE `mn_anecdotas_relacionadas`
  ADD CONSTRAINT `fk_mn_anecdotas_relacionadas_anecdotas` FOREIGN KEY (`id_anecdota`) REFERENCES `anecdotas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mn_anecdotas_relacionadas_anecdotas_0` FOREIGN KEY (`id_relacionada`) REFERENCES `anecdotas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mn_anecdota_capitulo`
--
ALTER TABLE `mn_anecdota_capitulo`
  ADD CONSTRAINT `fk_mn_personaje_anectdota_0_capitulos` FOREIGN KEY (`id_capitulo`) REFERENCES `capitulos` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mn_personaje_anectdota_anecdotas_0` FOREIGN KEY (`id_anecdota`) REFERENCES `anecdotas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mn_habilidad_personaje`
--
ALTER TABLE `mn_habilidad_personaje`
  ADD CONSTRAINT `fk_mn_habilidad_personaje_habilidades` FOREIGN KEY (`id_habilidad`) REFERENCES `habilidades` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mn_habilidad_personaje_personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mn_lugares_anecdota`
--
ALTER TABLE `mn_lugares_anecdota`
  ADD CONSTRAINT `fk_mn_lugares_anecdota_anecdotas` FOREIGN KEY (`id_anecdota`) REFERENCES `anecdotas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mn_lugares_anecdota_lugares` FOREIGN KEY (`id_lugar`) REFERENCES `lugares` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mn_personaje_anectdota`
--
ALTER TABLE `mn_personaje_anectdota`
  ADD CONSTRAINT `fk_mn_personaje_anectdota_anecdotas` FOREIGN KEY (`id_anecdota`) REFERENCES `anecdotas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mn_personaje_anectdota_personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mn_personaje_capitulo`
--
ALTER TABLE `mn_personaje_capitulo`
  ADD CONSTRAINT `fk_mn_personaje_anectdota_personaje_0` FOREIGN KEY (`id_personaje`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mn_personaje_capitulo_capitulos` FOREIGN KEY (`id_capitulo`) REFERENCES `capitulos` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD CONSTRAINT `fk_personaje_caracteristicas_rol` FOREIGN KEY (`id_rol`) REFERENCES `caracteristicas_rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personaje_carasteristicas_fisicas` FOREIGN KEY (`id_fisicas`) REFERENCES `carasteristicas_fisicas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personaje_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personaje_raza` FOREIGN KEY (`id_raza`) REFERENCES `raza` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personaje_trabajo` FOREIGN KEY (`id_trabajo`) REFERENCES `trabajo` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Filtros para la tabla `relacion`
--
ALTER TABLE `relacion`
  ADD CONSTRAINT `fk_mn_personaje_personaje_personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mn_personaje_personaje_personaje_0` FOREIGN KEY (`id_relacionado`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_relacion_tipo_relacion` FOREIGN KEY (`id_tipo_relacion`) REFERENCES `tipo_relacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

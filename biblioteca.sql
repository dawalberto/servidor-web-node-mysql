-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-08-2019 a las 06:46:12
-- Versión del servidor: 5.7.26
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

DROP TABLE IF EXISTS `autores`;
CREATE TABLE IF NOT EXISTS `autores` (
  `cod` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`cod`, `nombre`) VALUES
('1', 'Isvaku'),
('2', 'Oscar'),
('3', 'Alberto'),
('4', 'Roberto'),
('5', 'Albert');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprar`
--

DROP TABLE IF EXISTS `comprar`;
CREATE TABLE IF NOT EXISTS `comprar` (
  `cod_usu` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `cod_ejem` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_usu`,`cod_ejem`,`fecha`),
  KEY `fk_cod_ejem` (`cod_ejem`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comprar`
--

INSERT INTO `comprar` (`cod_usu`, `cod_ejem`, `fecha`) VALUES
('1', '1', '05/08/19'),
('2', '2', '04/08/19'),
('3', '3', '03/08/19'),
('4', '4', '02/08/19'),
('5', '5', '01/08/19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplares`
--

DROP TABLE IF EXISTS `ejemplares`;
CREATE TABLE IF NOT EXISTS `ejemplares` (
  `cod` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `localizacion` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `version` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cod_libro` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_ejemplares` (`cod_libro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ejemplares`
--

INSERT INTO `ejemplares` (`cod`, `localizacion`, `version`, `cod_libro`) VALUES
('1', 'Alicante', 'v1.0.0', '1'),
('2', 'Onil', 'v1.0.0', '2'),
('3', 'Ibi', 'v2.0.0', '3'),
('4', 'Castalla', 'v3.0.0', '4'),
('5', 'Elche', 'v1.0.0', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `cod` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `ISBN` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `titulo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cod_autor` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `uk_ISBN` (`ISBN`),
  KEY `fk_libros_autor` (`cod_autor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`cod`, `ISBN`, `titulo`, `precio`, `url`, `imagen`, `cod_autor`) VALUES
('1', '1234A', 'El Resplandor', 9, 'elresplandor.com', 'elresplandor.png', '1'),
('2', '1234B', 'El Doctor Sueño', 10, 'eldoctorsuenio.com', 'eldoctorsuenio.png', '2'),
('3', '1234C', 'El Sabueso de los Baskerbille', 10, 'elsabuesodelosbaskerbille.com', 'elsabuesodelosbaskerbille.png', '3'),
('4', '1234D', 'Estudio en Escarlata', 10, 'estudioenescarlata.com', 'estudioenescarlata.png', '4'),
('5', '1234E', 'El signo de los cuatro', 10, 'elsignodeloscuatro.com', 'elsignodeloscuatro.png', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ser_afin`
--

DROP TABLE IF EXISTS `ser_afin`;
CREATE TABLE IF NOT EXISTS `ser_afin` (
  `cod_libro` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `cod_libro_afin` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_libro`,`cod_libro_afin`),
  KEY `fk_cod_libro_afin` (`cod_libro_afin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ser_afin`
--

INSERT INTO `ser_afin` (`cod_libro`, `cod_libro_afin`) VALUES
('1', '2'),
('1', '3'),
('2', '4'),
('2', '5'),
('5', '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `cod` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CC` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliente` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `uk_CC` (`CC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cod`, `nombre`, `CC`, `cliente`, `telefono`) VALUES
('1', 'Adrian', '123456A', 'si', '111111111'),
('2', 'Ismael', '123456B', 'si', '222222222'),
('3', 'Ivan', '123456C', 'no', '333333333'),
('4', 'Sergio', '123456D', 'no', '444444444'),
('5', 'Natalia', '123456E', 'si', '555555555');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

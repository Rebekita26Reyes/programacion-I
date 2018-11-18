-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2018 a las 06:48:16
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `practica2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `CodCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Tell` int(10) NOT NULL,
  PRIMARY KEY (`CodCliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`CodCliente`, `Nombre`, `Apellido`, `Tell`) VALUES
(1, 'Jose ', 'Lopez', 74125896),
(2, 'Carlos', 'Perez', 75369852),
(3, 'Pedro', 'Alvares', 74125895),
(4, 'MARIA', 'CANIZALES', 72154896),
(5, 'JUAN', 'BENITEZ', 71250014);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE IF NOT EXISTS `cotizacion` (
  `CodCotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `CodCliente` int(11) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `FechaCotizacion` date NOT NULL,
  PRIMARY KEY (`CodCotizacion`),
  KEY `CodCliente` (`CodCliente`,`Codigo`),
  KEY `codigo` (`Codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`CodCotizacion`, `CodCliente`, `Codigo`, `FechaCotizacion`) VALUES
(3, 2, 1, '2018-11-17'),
(7, 3, 2, '2018-11-14'),
(8, 2, 2, '2018-11-17'),
(9, 4, 2, '0000-00-00'),
(10, 1, 3, '0000-00-00'),
(11, 4, 2, '0000-00-00'),
(12, 1, 3, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `cantidad` int(100) NOT NULL,
  `precio` int(5) NOT NULL,
  `FechaIngreso` date NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigo`, `Nombre`, `cantidad`, `precio`, `FechaIngreso`) VALUES
(1, 'PEPSI', 500, 1, '2018-11-15'),
(2, 'COCA COLA', 500, 2, '2018-11-16'),
(3, 'Café', 800, 5, '0000-00-00'),
(4, 'Azucar', 200, 1, '0000-00-00');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`CodCliente`) REFERENCES `clientes` (`CodCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cotizacion_ibfk_2` FOREIGN KEY (`Codigo`) REFERENCES `productos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

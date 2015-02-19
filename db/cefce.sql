-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-02-2015 a las 17:59:16
-- Versión del servidor: 5.5.41-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cefce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `balance`
--

CREATE TABLE IF NOT EXISTS `balance` (
  `id` int(11) NOT NULL,
  `monto_teorico` float DEFAULT NULL,
  `monto_real` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `Turno` varchar(10) DEFAULT NULL,
  `Usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Balance_Usuario1_idx` (`Usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_compras`
--

CREATE TABLE IF NOT EXISTS `movimientos_compras` (
  `id` int(11) NOT NULL,
  `monto` float DEFAULT NULL,
  `decripcion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_movimientos_compras_producto1_idx` (`producto_id`),
  KEY `fk_movimientos_compras_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_varios`
--

CREATE TABLE IF NOT EXISTS `movimientos_varios` (
  `id` int(11) NOT NULL,
  `monto` float DEFAULT NULL,
  `decripcion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` datetime DEFAULT NULL,
  `tipo_movimiento_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_movimientos_varios_tipo_movimiento1_idx` (`tipo_movimiento_id`),
  KEY `fk_movimientos_varios_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_ventas`
--

CREATE TABLE IF NOT EXISTS `movimientos_ventas` (
  `id` int(11) NOT NULL,
  `monto` float DEFAULT NULL,
  `decripcion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_movimientos_ventas_producto1_idx` (`producto_id`),
  KEY `fk_movimientos_ventas_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio_venta` float DEFAULT NULL,
  `precio_compra` float DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimiento`
--

CREATE TABLE IF NOT EXISTS `tipo_movimiento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `contacto` varchar(45) DEFAULT NULL,
  `Permisos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Usuario_Permisos_idx` (`Permisos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos_compras`
--
ALTER TABLE `movimientos_compras`
  ADD CONSTRAINT `fk_movimientos_compras_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movimientos_compras_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimientos_varios`
--
ALTER TABLE `movimientos_varios`
  ADD CONSTRAINT `fk_movimientos_varios_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movimientos_varios_tipo_movimiento1` FOREIGN KEY (`tipo_movimiento_id`) REFERENCES `tipo_movimiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimientos_ventas`
--
ALTER TABLE `movimientos_ventas`
  ADD CONSTRAINT `fk_movimientos_ventas_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movimientos_ventas_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Permisos` FOREIGN KEY (`Permisos_id`) REFERENCES `permisos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

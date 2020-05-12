-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-05-2020 a las 21:13:58
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `securityapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `idreporte` int(11) NOT NULL,
  `ubicacion` text NOT NULL,
  `fecha` text NOT NULL,
  `descripcion` text NOT NULL,
  `Titulo` text NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `corrUsr` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`idreporte`, `ubicacion`, `fecha`, `descripcion`, `Titulo`, `puntuacion`, `corrUsr`) VALUES
(3, 'defwefewfewfwef', '2020/05/12', 'Esta es una prueba mamamlona', 'PRUEBA', 5, 'prueba@hotmail.com'),
(4, 'Celaya', 'Hoy', 'frferferfefefefefefefeefefefe', 'Prueba 2', 5, 'prueba2@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `foto` text NOT NULL,
  `nombre` text NOT NULL,
  `correo` varchar(30) NOT NULL,
  `fechaNac` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`foto`, `nombre`, `correo`, `fechaNac`, `sexo`, `telefono`) VALUES
('https://asa', 'Alex Lora', 'al@hotmail.com', '0000-00-00', 'H', 'prueba@hot'),
('https://', 'Francisco', 'fran.16980405@gmail.com', '2020-05-12', 'H', '1111111111'),
('https://', 'prueba 2', 'prueba2@hotmail.com', '2020-05-12', 'M', '5555555555'),
('https://', 'Prueba', 'prueba@hotmail.com', '2020-05-12', 'H', '333333333');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`idreporte`),
  ADD KEY `corrUsr` (`corrUsr`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `idreporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`corrUsr`) REFERENCES `usuarios` (`correo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2021 a las 00:09:26
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `articles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `p_claves` varchar(100) NOT NULL,
  `resumen` text NOT NULL,
  `autores` varchar(100) NOT NULL,
  `topico` varchar(100) NOT NULL,
  `archivo` varchar(150) NOT NULL,
  `f_envio` date NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id`, `titulo`, `p_claves`, `resumen`, `autores`, `topico`, `archivo`, `f_envio`, `estado`) VALUES
(8, 'titulo modificado', 'palabra1,palabra2', 'laskdmlkamsldakm', 'autor1, autor2', 'topico1', 'SEGUNDO PARCIAL DE PROGRAMACIÓN WEB.pdf', '2021-06-15', 4),
(9, 'titulo2', 'palabra1,palabra2,palabra3', 'resumen añlsdñals,mdñl', 'autor1, autor2', 'topico1', 'calendario_Primeros_previos_2021 - Copy 1.pdf', '2021-06-17', 2),
(10, 'titulo del articulo 1', 'palabras clave', 'Resumen', 'autor1, autor2', 'topico1', 'calendario_Primeros_previos_2021 - Copy 1.pdf', '2021-06-17', 1),
(11, 'Data Encryption', 'Advances; Advantages; Companies; Data; Disadvantages; Encryption; Methodologies.', 'This article is carried out as part of the final exam of the subject Theory of Communications at the Francisco de Paula Santander University, in order to cover topics related to computer security in this case focused on data encryption, in order to find out how it is done, its advances, what are its advantages and disadvantages, as well as some of the most common encryption methodologies currently used. The adoption of technological advances by companies worldwide is a fundamental requirement to achieve their objectives. The use of technology as a communication channel, including information storage, puts the information that passes through it at risk, so together with these advances we can also observe the increase in computer crimes. Hence the urgent need for organizations to protect their digital data. In conclusion, it is essential that companies adopt a culture of encryption of their data, which while it is true that it is not the total solution to the problem of cybercrime, represents a great obstacle t', 'Edinson Botello Montes, Ibeth Jimena Ortega Rojas', 'Examen', 'Examen-Final-Articulo.pdf', '2021-06-17', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor_articulo`
--

CREATE TABLE `autor_articulo` (
  `autor` int(11) NOT NULL,
  `articulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autor_articulo`
--

INSERT INTO `autor_articulo` (`autor`, `articulo`) VALUES
(1, 8),
(3, 9),
(5, 10),
(6, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `descripcion`) VALUES
(1, 'pendiente'),
(2, 'evaluando'),
(3, 'aceptado'),
(4, 'rechazado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `articulo` int(11) NOT NULL,
  `evaluador` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observaciones` varchar(300) NOT NULL,
  `aprobacion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`articulo`, `evaluador`, `fecha`, `observaciones`, `aprobacion`) VALUES
(8, 3, '0000-00-00', '', ''),
(8, 4, '0000-00-00', '', ''),
(9, 4, '2021-06-17', 'observaciones de aceptacion', 'aceptado'),
(9, 8, '2021-06-21', 'Falta de informacion', 'rechazado'),
(11, 7, '0000-00-00', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observacion`
--

CREATE TABLE `observacion` (
  `id` int(11) NOT NULL,
  `admin` int(11) NOT NULL,
  `articulo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observaciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `observacion`
--

INSERT INTO `observacion` (`id`, `admin`, `articulo`, `fecha`, `observaciones`) VALUES
(6, 2, 8, '2021-06-17', 'observacion asdkajlsklmkxlckzmlxkmlkamslkd laksmdla l kalms ldkmals alksmdlaksdlmamsd alksmdlakmsdlka laksldamlskdmalskmd lakmsdlakmsdlkm'),
(7, 2, 11, '2021-06-21', 'El articulo es aceptado. Felicidades');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `descripcion`) VALUES
(1, 'autor'),
(2, 'evaluador'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `orcid` varchar(15) NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `password`, `email`, `orcid`, `rol`) VALUES
(1, 'nombre1', 'apellido1', '123123', 'example@mail.com', '32135654', 1),
(2, 'admin', 'nistrador', 'admin', 'admin@mail.com', '123456789', 3),
(3, 'evaluador 1', '...', 'eva', 'evaluador@mail.com', '25354253', 2),
(4, 'evaluador 2', 'apellido1', 'eva', 'evaluador2@mail.com', '25354253561', 2),
(5, 'Fredy', 'Vera', '123123', 'fredyvera@mail.com', '25354253', 1),
(6, 'IbethJO', 'Ortega', '1201', 'ibethJO@mail.com', '1234', 1),
(7, 'Gisell ', 'Perez', '1212', 'gisell1@mail.com', '1234', 2),
(8, 'Gisell ', 'Perez', '12123', 'gisell@mail.com', '1234', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `autor_articulo`
--
ALTER TABLE `autor_articulo`
  ADD PRIMARY KEY (`autor`,`articulo`),
  ADD UNIQUE KEY `articulo` (`articulo`),
  ADD KEY `autor` (`autor`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`articulo`,`evaluador`),
  ADD KEY `evaluador` (`evaluador`);

--
-- Indices de la tabla `observacion`
--
ALTER TABLE `observacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin` (`admin`),
  ADD KEY `articulo` (`articulo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `observacion`
--
ALTER TABLE `observacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `articulo_ibfk_3` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `autor_articulo`
--
ALTER TABLE `autor_articulo`
  ADD CONSTRAINT `autor_articulo_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `autor_articulo_ibfk_2` FOREIGN KEY (`articulo`) REFERENCES `articulo` (`id`);

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `evaluacion_ibfk_1` FOREIGN KEY (`articulo`) REFERENCES `articulo` (`id`),
  ADD CONSTRAINT `evaluacion_ibfk_2` FOREIGN KEY (`evaluador`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `observacion`
--
ALTER TABLE `observacion`
  ADD CONSTRAINT `observacion_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `observacion_ibfk_2` FOREIGN KEY (`articulo`) REFERENCES `articulo` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

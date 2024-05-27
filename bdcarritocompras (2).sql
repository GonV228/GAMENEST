-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2024 a las 21:34:11
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcarritocompras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompra` int(10) UNSIGNED NOT NULL,
  `idCliente` int(11) NOT NULL,
  `FechaCompra` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Monto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `idCompra` int(11) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `descuento` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallejuego`
--

CREATE TABLE `detallejuego` (
  `detalleJuegoId` int(11) NOT NULL,
  `descripcionJuego` mediumtext NOT NULL,
  `fechaEsterno` date NOT NULL,
  `plataforma` varchar(10) NOT NULL,
  `idiomaTexto` varchar(50) NOT NULL,
  `idiomaAudio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallejuego`
--

INSERT INTO `detallejuego` (`detalleJuegoId`, `descripcionJuego`, `fechaEsterno`, `plataforma`, `idiomaTexto`, `idiomaAudio`) VALUES
(1, 'Los creadores de la aclamada saga de Left 4 Dead presentan Back 4 Blood, un emocionante juego de disparos en primera persona cooperativo. Te encuentras en medio de una guerra contra los Infectados. Estos humanos, huéspedes de un parásito letal, se han convertido en terroríficas criaturas dispuestas a devorar lo que queda de civilización. Con la humanidad a punto de extinguirse, tus amigos y tú deberéis enfrentaros al enemigo, exterminar a los Infectados y recuperar el control del mundo.', '2021-10-12', 'PC', 'Español', 'Español'),
(2, 'Explora tierras remotas, enfréntate a máquinas más grandes e imponentes y conoce a increíbles tribus en tu regreso a un futuro lejano en el mundo postapocalíptico de Horizon. La tierra se muere. Tormentas violentas y una plaga imparable asolan los restos dispersos de la humanidad mientras nuevas y temibles máquinas merodean sus fronteras. La vida en la Tierra se precipita hacia otra extinción.', '2024-03-21', 'PC', 'Español', 'Español'),
(3, 'Alone in the Dark teje un tapiz de terror psicológico y encanto gótico, reinventando el icónico juego que marcó el género. Te invitamos a un viaje hacia la locura, donde cada encuentro podría ser el último. A cada paso que das para desentrañar el misterio de Derceto, los ojos que observan desde la oscuridad se vuelven más hambrientos. Cada bala es la diferencia entre la supervivencia y un final impensable. La siguiente puerta que abras podrá conducirte a un reino de pesadilla con garras, tentáculos y locura. Viaja a la Luisiana de entreguerras, donde se esconde una historia sombría: el escape de traumas pasados y una sociedad intolerante, hacia la espera de algo más oscuro, algo que ha acechado pacientemente durante eras imposibles. Esto es Alone in the Dark como nunca lo has visto: una narrativa de elegancia gótica y locura sobrenatural que rinde homenaje a sus orígenes legendarios mientras avanza el terror de supervivencia.', '2024-03-20', 'PC', 'Español', 'Ingles'),
(4, 'Tras derrotar a su padre, Heihachi Mishima, Kazuya continúa su conquista por la dominación global, utilizando las fuerzas de la Corporación G para detonar la guerra en el mundo. Jin se ve obligado a enfrentarse a su destino cuando se reencuentra con su desaparecida madre e intenta detener el reino de terror de su padre Kazuya.', '2024-01-25', 'PC', 'Español', 'Ingles'),
(5, 'Black Ops Cold War, la secuela directa de Call of Duty®: Black Ops, transportará a los jugadores al centro de la volátil batalla geopolítica de la Guerra Fría, a principios de los 80. Nada es lo que parece en la fascinante Campaña para un jugador, donde los jugadores se enfrentarán cara a cara a figuras históricas y verdades incómodas mientras luchan por todo el mundo en escenarios icónicos de la Guerra Fría como Berlín Oriental, Vietnam, la sede de la KGB y más.', '2023-03-08', 'PC', 'Español', 'Español'),
(6, 'Stray es un juego de aventura felina en tercera persona ambientada en los callejones iluminados con luces de neón de una ciberciudad en plena decadencia y el ambiente turbio de sus bajos fondos. Deambula por cada rincón de los alrededores, defiéndete de amenazas imprevistas y resuelve los misterios de este lugar inhóspito en el cual moran robots apáticos y criaturas peligrosas.', '2022-07-19', 'PC', 'Español', 'Español'),
(7, 'EA SPORTS FIFA 23 da vida al juego del mundo con la tecnología HyperMotion2 y su experiencia de juego aún más realista, incluye tanto la FIFA World Cup™ masculina como la femenina como actualizaciones posteriores tras el lanzamiento, incorpora equipos femeninos y funciones Cross-Play**, ¡y mucho más! Disfruta de una autenticidad única con más de 19 000 jugadores, 700 equipos, 100 estadios y más de 30 ligas en FIFA 23.', '2022-09-30', 'PC', 'Español', 'Español');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `idJuego` int(11) NOT NULL,
  `nombreJuego` varchar(60) NOT NULL,
  `imagenJuego` varchar(150) NOT NULL,
  `pesoJuego` varchar(10) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `detalleJuegoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`idJuego`, `nombreJuego`, `imagenJuego`, `pesoJuego`, `precio`, `categoria`, `detalleJuegoId`) VALUES
(1, 'Back 4 Blood Ultimate Edition', 'Back_4_Blood_Ultimate_Edition.jpg', '47,8 GB', 75, 'Accion', 1),
(2, 'Horizon Forbidden West Complete Edition', 'Horizon-Forbidden-West-Complete-Edition.jpg', '98,9 GB', 125, 'Aventura', 2),
(3, 'Alone in the Dark Deluxe Edition', 'Alone-in-the-Dark-Deluxe-Edition.jpg', '26,9 GB', 100, 'Accion', 3),
(4, 'TEKKEN 8 Ultimate Edition', 'TEKKEN-8-Ultimate-Edition.jpg', '78,6 GB', 150, 'Lucha', 4),
(5, 'Call of Duty Black Ops Cold War', 'Call-of-Duty-Black-Ops-Cold-War.jpg', '122 GB', 200, 'Accion', 5),
(6, 'Stray', 'Stray.jpg', '6,5 GB', 180, 'Aventura', 6),
(7, 'FIFA 23', 'FIFA23.jpg', '46,5 GB', 220, 'Deporte', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idCliente` int(11) NOT NULL,
  `Dni` varchar(9) NOT NULL,
  `Nombres` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Rol` enum('cliente','administrador') NOT NULL DEFAULT 'cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idCliente`, `Dni`, `Nombres`, `Direccion`, `Email`, `Contraseña`, `Rol`) VALUES
(1, '12345678A', 'Juan Pérez', 'Calle Principal 123', 'juan@example.com', 'contraseña123', 'cliente'),
(2, '12345679A', 'Sara', 'Calle Principal 123', 'sara@gmail.com', '12', 'cliente'),
(3, '98765432B', 'Jheremy Alois', 'dubai', 'saremi@game.com', '123', 'administrador'),
(4, '15231', 'manu', 'avenida  los incas', 'dvega1402@icloud.com', '12345', 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompra`),
  ADD UNIQUE KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD PRIMARY KEY (`idCompra`,`idJuego`),
  ADD UNIQUE KEY `idJuego` (`idJuego`);

--
-- Indices de la tabla `detallejuego`
--
ALTER TABLE `detallejuego`
  ADD PRIMARY KEY (`detalleJuegoId`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`idJuego`),
  ADD KEY `detalleJuegoId` (`detalleJuegoId`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `Dni` (`Dni`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompra` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallejuego`
--
ALTER TABLE `detallejuego`
  MODIFY `detalleJuegoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `idJuego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `juego`
--
ALTER TABLE `juego`
  ADD CONSTRAINT `juego_ibfk_1` FOREIGN KEY (`detalleJuegoId`) REFERENCES `detallejuego` (`detalleJuegoId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2024 a las 22:17:07
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
  `idCliente` int(10) UNSIGNED NOT NULL,
  `FechaCompra` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Monto` double NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `Email` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompra`, `idCliente`, `FechaCompra`, `Monto`, `Nombres`, `Email`) VALUES
(1, 2, '2024-07-24 15:03:01', 75, 'Sara', 'sara@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `idCompra` int(10) UNSIGNED NOT NULL,
  `idJuego` int(10) UNSIGNED NOT NULL,
  `descuento` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallejuego`
--

CREATE TABLE `detallejuego` (
  `detalleJuegoId` int(11) NOT NULL,
  `idJuego` int(10) UNSIGNED NOT NULL,
  `descripcionJuego` mediumtext NOT NULL,
  `fechaEstreno` date NOT NULL,
  `plataforma` varchar(10) NOT NULL,
  `idiomaTexto` varchar(50) NOT NULL,
  `idiomaAudio` varchar(50) NOT NULL,
  `urlVideo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallejuego`
--

INSERT INTO `detallejuego` (`detalleJuegoId`, `idJuego`, `descripcionJuego`, `fechaEstreno`, `plataforma`, `idiomaTexto`, `idiomaAudio`, `urlVideo`) VALUES
(1, 1, 'Los creadores de la aclamada saga de Left 4 Dead presentan Back 4 Blood, un emocionante juego de disparos en primera persona cooperativo. Te encuentras en medio de una guerra contra los Infectados. Estos humanos, huéspedes de un parásito letal, se han convertido en terroríficas criaturas dispuestas a devorar lo que queda de civilización. Con la humanidad a punto de extinguirse, tus amigos y tú deberéis enfrentaros al enemigo, exterminar a los Infectados y recuperar el control del mundo.', '2021-10-12', 'PC', 'Español', 'Español', 'https://www.youtube.com/embed/tKlFJbyUsoo?si=6qA-FlbM6n_h_09C    '),
(2, 2, 'Explora tierras remotas, enfréntate a máquinas más grandes e imponentes y conoce a increíbles tribus en tu regreso a un futuro lejano en el mundo postapocalíptico de Horizon. La tierra se muere. Tormentas violentas y una plaga imparable asolan los restos dispersos de la humanidad mientras nuevas y temibles máquinas merodean sus fronteras. La vida en la Tierra se precipita hacia otra extinción.', '2024-03-21', 'PC', 'Español', 'Español', 'https://www.youtube.com/embed/SEVdWRmLn54?si=QjiCzyoeXOMJXHJZ'),
(3, 3, 'Alone in the Dark teje un tapiz de terror psicológico y encanto gótico, reinventando el icónico juego que marcó el género. Te invitamos a un viaje hacia la locura, donde cada encuentro podría ser el último. A cada paso que das para desentrañar el misterio de Derceto, los ojos que observan desde la oscuridad se vuelven más hambrientos. Cada bala es la diferencia entre la supervivencia y un final impensable. La siguiente puerta que abras podrá conducirte a un reino de pesadilla con garras, tentáculos y locura. Viaja a la Luisiana de entreguerras, donde se esconde una historia sombría: el escape de traumas pasados y una sociedad intolerante, hacia la espera de algo más oscuro, algo que ha acechado pacientemente durante eras imposibles. Esto es Alone in the Dark como nunca lo has visto: una narrativa de elegancia gótica y locura sobrenatural que rinde homenaje a sus orígenes legendarios mientras avanza el terror de supervivencia.', '2024-03-20', 'PC', 'Español', 'Ingles', 'https://www.youtube.com/embed/ddsa1IB9MH4?si=I4jP7vUXbxaPDzrs'),
(4, 4, 'Tras derrotar a su padre, Heihachi Mishima, Kazuya continúa su conquista por la dominación global, utilizando las fuerzas de la Corporación G para detonar la guerra en el mundo. Jin se ve obligado a enfrentarse a su destino cuando se reencuentra con su desaparecida madre e intenta detener el reino de terror de su padre Kazuya.', '2024-01-25', 'PC', 'Español', 'Ingles', 'https://www.youtube.com/embed/_MM4clV2qjE?si=Za7HPQQCfoC12feg'),
(5, 5, 'Black Ops Cold War, la secuela directa de Call of Duty®: Black Ops, transportará a los jugadores al centro de la volátil batalla geopolítica de la Guerra Fría, a principios de los 80. Nada es lo que parece en la fascinante Campaña para un jugador, donde los jugadores se enfrentarán cara a cara a figuras históricas y verdades incómodas mientras luchan por todo el mundo en escenarios icónicos de la Guerra Fría como Berlín Oriental, Vietnam, la sede de la KGB y más.', '2023-03-08', 'PC', 'Español', 'Español', 'https://www.youtube.com/embed/aTS9n_m7TW0?si=SpdxcqsWXC2JNKkV'),
(6, 6, 'Stray es un juego de aventura felina en tercera persona ambientada en los callejones iluminados con luces de neón de una ciberciudad en plena decadencia y el ambiente turbio de sus bajos fondos. Deambula por cada rincón de los alrededores, defiéndete de amenazas imprevistas y resuelve los misterios de este lugar inhóspito en el cual moran robots apáticos y criaturas peligrosas.', '2022-07-19', 'PC', 'Español', 'Español', 'https://www.youtube.com/embed/vBDQEkfAcnc?si=8Ppbj6DvCCgdUB3A'),
(7, 7, 'EA SPORTS FIFA 23 da vida al juego del mundo con la tecnología HyperMotion2 y su experiencia de juego aún más realista, incluye tanto la FIFA World Cup™ masculina como la femenina como actualizaciones posteriores tras el lanzamiento, incorpora equipos femeninos y funciones Cross-Play**, ¡y mucho más! Disfruta de una autenticidad única con más de 19 000 jugadores, 700 equipos, 100 estadios y más de 30 ligas en FIFA 23.', '2022-09-30', 'PC', 'Español', 'Español', 'https://www.youtube.com/embed/zMyeAFzCTM0?si=e40VoOTdjbQX-OQe'),
(13, 18, 'En su cruzada para reunir los elementos de la Trifuerza, su lucha contra el malvado Ganondorf, o intentando salvar a la sensata princesa Zelda, Link demuestra que es un héroe para la historia.', '2024-07-25', 'PC', 'Español', 'Español', 'NULL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `idJuego` int(10) UNSIGNED NOT NULL,
  `nombreJuego` varchar(60) NOT NULL,
  `imagenJuego` varchar(150) NOT NULL,
  `pesoJuego` varchar(10) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`idJuego`, `nombreJuego`, `imagenJuego`, `pesoJuego`, `precio`, `categoria`) VALUES
(1, 'Back 4 Blood Ultimate Edition', 'Back_4_Blood_Ultimate_Edition.jpg', '47,8 GB', 75, 'Accion'),
(2, 'Horizon Forbidden West Complete Edition', 'Horizon-Forbidden-West-Complete-Edition.jpg', '98,9 GB', 125, 'Aventura'),
(3, 'Alone in the Dark Deluxe Edition', 'Alone-in-the-Dark-Deluxe-Edition.jpg', '26,9 GB', 100, 'Accion'),
(4, 'TEKKEN 8 Ultimate Edition', 'TEKKEN-8-Ultimate-Edition.jpg', '78,6 GB', 150, 'Lucha'),
(5, 'Call of Duty Black Ops Cold War', 'Call-of-Duty-Black-Ops-Cold-War.jpg', '122 GB', 200, 'Accion'),
(6, 'Stray', 'Stray.jpg', '6,5 GB', 180, 'Aventura'),
(7, 'FIFA 23', 'FIFA23.jpg', '46,5 GB', 220, 'Deporte'),
(16, 'zelda', 'games/The_Legend_of_Zelda_Breath_of_the_Wild.jpg', '125gb', 150, 'estrategia'),
(17, 'Mortal Kombat', 'games/mortal-kombat-11-ultimate.jpg', '125gb', 254, 'accion'),
(18, 'gtaV', 'games/Grand_Theft_Auto_V.png', '100gb', 254, 'accion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamaciones`
--

CREATE TABLE `reclamaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `monto_reclamado` decimal(10,2) NOT NULL,
  `descripcion_problema` text NOT NULL,
  `evidencia` varchar(255) DEFAULT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reclamaciones`
--

INSERT INTO `reclamaciones` (`id`, `nombre`, `apellidos`, `correo`, `telefono`, `producto`, `monto_reclamado`, `descripcion_problema`, `evidencia`, `estado`) VALUES
(1, 'sfsfa', 'asffsgds', 'asasd@gmail.com', '46456456', 'afsafsafsegrg', 152.00, 'jtfyf', '', ''),
(2, 'sfsfafghf', 'asffsgdsfgjfgj', 'asasd@gmail.com', '4645645645', 'afsafsafsegrg', 152.00, 'buuÃ±', 'Captura de pantalla 2024-05-25 160148.png', ''),
(3, 'sfsfafghf', 'asffsgdsfgjfgj', 'asasd@gmail.com', '4645645645', 'afsafsafsegrg', 152.00, 'tjrhtherhrhe', 'PERFIL.png', ''),
(4, 'Sara', 'gallegos', 'sara@gmail.com', '9382323221', 'left', 150.00, 'pipipipi', 'evidencias/a46efd6651e00b47106de378a467f320.jpg', 'P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugerencias`
--

CREATE TABLE `sugerencias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `categoria` enum('usabilidad','catalogo','precios','soporte','metodos_pago','otros') NOT NULL,
  `asunto` varchar(255) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idCliente` int(10) UNSIGNED NOT NULL,
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
  ADD PRIMARY KEY (`detalleJuegoId`),
  ADD KEY `idJuego` (`idJuego`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`idJuego`);

--
-- Indices de la tabla `reclamaciones`
--
ALTER TABLE `reclamaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `idCompra` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detallejuego`
--
ALTER TABLE `detallejuego`
  MODIFY `detalleJuegoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `idJuego` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `reclamaciones`
--
ALTER TABLE `reclamaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_idCliente_users` FOREIGN KEY (`idCliente`) REFERENCES `usuario` (`idCliente`);

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD CONSTRAINT `detallecompra_idCompra_users` FOREIGN KEY (`idCompra`) REFERENCES `compras` (`idCompra`),
  ADD CONSTRAINT `detallecompra_idJuego_users` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idJuego`);

--
-- Filtros para la tabla `detallejuego`
--
ALTER TABLE `detallejuego`
  ADD CONSTRAINT `detallejuego_ibfk_1` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idJuego`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

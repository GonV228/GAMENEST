<%@page import="modelo.dto.Usuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GameNest</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="../css/header.css" rel="stylesheet" type="text/css"/>
        <link href="../css/carrusel.css" rel="stylesheet" type="text/css"/>
        <link href="../css/gestionarjuegos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <header class="main-header">
            <i class="fa-solid fa-dragon"></i>
            <div class="search-bar">
                <input type="text" placeholder="Buscar...">
                <button type="button">
                    <i class="fa-solid fa-search"></i>
                </button>
            </div>
            <div class="container">
                <%
                    Usuario usuario = (Usuario) session.getAttribute("usuario");
                    if (usuario != null && usuario.getRol().equals("administrador")) {
                        out.print("Hola " + usuario.getNombres() + ", bienvenido como administrador.");
                %>
                <a href="${pageContext.request.contextPath}/ControladorLogin?accion=cerrar"><i class="fa-solid fa-right-to-bracket cerrar"></i>Salir</a>
                <% } else { %>
                <a href="${pageContext.request.contextPath}/vista/login.jsp">Login<i class="fa-solid fa-user usuario"></i></a>
                    <% }%>
            </div>
        </header>

        <div class="carrusel-body">
            <div class='sidebar'>   
                <div class='top'>
                    <i class="fa-solid fa-bars" id='btn'></i>
                </div>     
                <ul>
                    <li>
                        <a href='../vista/indexAdministrador.jsp'>
                            <i class="fa-solid fa-house"></i>
                            <span class='nav-item'>Inicio</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/ControladorJuego">
                            <i class="fa-solid fa-gamepad"></i>
                            <span class='nav-item'>Juegos</span>
                        </a>                   

                    </li>
                    <li>
                        <a href='#'>
                            <i class="fa-solid fa-file-circle-exclamation"></i>
                            <span class='nav-item'>Reportes</span>
                        </a>
                    </li>
                    <li>
                        <a href="../vista/FAQ.jsp">
                            <i class="fa-regular fa-circle-question"></i>
                            <span class='nav-item'>Soporte</span>
                        </a>
                    </li>
                    <li>
                        <a href="../vista/GestionarJuegos.jsp">
                            <i class="fa-solid fa-gamepad"></i>
                            <span class='nav-item'>GestionarJuegos</span>
                        </a>
                    </li>
                </ul>
            </div>
            <script>
                let btn = document.querySelector('#btn');
                let sidebar = document.querySelector('.sidebar');
                btn.onclick = function () {
                    sidebar.classList.toggle('active');
                };
            </script>

            <div class="ContenedorAgregarJuego">
                <h4>Agregar Nuevo Juego</h4>
                <form action="<%=request.getContextPath()%>/ControladorGestionarJuegos" method="post">
                    <label for="nombre">Nombre del Juego:</label>
                    <input type="text" id="nombre" name="nombre" required><br>

                    <label for="imagen">URL de la Imagen:</label>
                    <input type="text" id="imagen" name="imagen" required><br>

                    <label for="peso">Peso del Juego:</label>
                    <input type="text" id="peso" name="peso" required><br>

                    <label for="precio">Precio:</label>
                    <input type="text" id="precio" name="precio" required><br>

                    <label for="categoria">Categoría:</label>
                    <select id="categoria" name="categoria" required>
                        <option value="accion">Acción</option>
                        <option value="aventura">Aventura</option>
                        <option value="estrategia">Estrategia</option>
                        <!-- Agrega más opciones según sea necesario -->
                    </select><br>

                    <button type="submit">Agregar Juego</button>
                </form>
            </div>
            <div class="ContenedorDetalle">
                <h4>Agregar Detalle del Juego</h4>
                <label for="juego">Juego:</label>
                <select id="juego" name="juego" required>
                    <!-- Aquí se incluirán las opciones de los juegos -->
                    <option value="juego1">Juego 1</option>
                    <option value="juego2">Juego 2</option>
                    <option value="juego3">Juego 3</option>
                </select>

                <label for="descripcionJuego">Descripción del Juego:</label>
                <textarea id="descripcionJuego" name="descripcionJuego" rows="4" cols="50" required></textarea><br>

                <label for="fechaEstreno">Fecha de Estreno:</label>
                <input type="date" id="fechaEstreno" name="fechaEstreno" required><br>

                <label for="plataforma">Plataforma:</label>
                <input type="text" id="plataforma" name="plataforma" required><br>

                <label for="idiomaTexto">Idioma de Texto:</label>
                <input type="text" id="idiomaTexto" name="idiomaTexto" required><br>

                <label for="idiomaAudio">Idioma de Audio:</label>
                <input type="text" id="idiomaAudio" name="idiomaAudio" required><br>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>

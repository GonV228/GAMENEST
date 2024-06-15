<%@page import="modelo.dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/css/juegos.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
      crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="css/header.css" rel="stylesheet" type="text/css"/>
<link href="css/login.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Catalogo de Juegos</title>

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
                if (usuario != null && usuario.getRol().equals("cliente")) {
                    out.print("Hola " + usuario.getNombres() + ", bienvenido como cliente.");
            %>
            <a href="${pageContext.request.contextPath}/ControladorLogin?accion=cerrar"><i class="fa-solid fa-right-to-bracket cerrar"></i>SALIR</a>
            <% } else { %>
            <a href="${pageContext.request.contextPath}/vista/login.jsp">Login<i class="fa-solid fa-user usuario"></i></a>
                <% }%>
            <a href="vista/carrito.jsp" class="cart-button">
                <i class="fa-solid fa-cart-shopping"></i>
                <span id="cart-counter" class="cart-counter">0</span>
            </a>
        </div>
    </header>
    <body>

        <h1>Catálogo Completo</h1>
        <div class="listaJuegos">
            <c:forEach var="j" items="${lista}">
                <div class="juegos">
                    <div>
                        <a href="#">
                            <picture>
                                <img src="juegos/${j.imagenJuego}" alt="${j.nombreJuego}"/>
                            </picture>
                        </a>
                        <div class="name-game">
                            <a href="#" title="${j.nombreJuego}">
                                <h5>${j.nombreJuego}</h5>
                            </a>
                            <p>Peso: ${j.pesoJuego}</p>
                            <p>Categoria: ${j.categoria}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
    
</html>

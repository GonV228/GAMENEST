<%@page import="modelo.dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
   <head>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="../css/header.css" rel="stylesheet" type="text/css"/>
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
        <link href="../css/carrusel.css" rel="stylesheet" type="text/css"/> 
        <link href="../css/barraLateral.css" rel="stylesheet" type="text/css"/>
    </head>    
        <!---------------------------------------- BARRA SUPERIOR ---------------------------------------->    
        <header class="main-header">
            <a href="../index.jsp">
               <i class="fa-solid fa-dragon icon-white"></i>
            </a>
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
        <a href="${pageContext.request.contextPath}/ControladorLogin?accion=cerrar"><i class="fa-solid fa-right-to-bracket cerrar"></i></a>
        <% } else { %>
        <a href="${pageContext.request.contextPath}/vista/login.jsp"><i class="fa-solid fa-user usuario"></i></a>
        <% } %>
    </div>

    </header>
       <!--------------------------------------------------------------------------------------------------> 

</html>
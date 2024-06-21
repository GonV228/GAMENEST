<%@page import="modelo.dto.juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles del Juego</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <%
            juego j = (juego) request.getAttribute("juego");
            if (j != null) {
        %>
        <main>
            <div class="content">
                <div class="picture">
                    <picture>
                        <img src="juegos/<%= j.getImagenJuego()%>" alt="${j.nombreJuego}"/>
                    </picture>
                </div>
                    
                <div>
                    <h1><%= j.getNombreJuego()%></h1>
                    <h4><%= j.getCategoria()%></h4>
                </div>
            </div>
        </main>
        <div class="main-content">
            <div class="content-wrapper">

                <div class="detalleJuego">
                    <p>Peso: <%= j.getPesoJuego()%></p>
                    <p>Precio: <%= j.getPrecio()%></p>
                    <p>Descripción: <%= j.getDetalleJuego().getDescripcionJuego()%></p>
                    <p>Fecha de Estreno: <%= j.getDetalleJuego().getFechaEsterno()%></p>
                    <p>Plataforma: <%= j.getDetalleJuego().getPlataforma()%></p>
                    <p>Idioma del Texto: <%= j.getDetalleJuego().getIdiomaTexto()%></p>
                    <p>Idioma del Audio: <%= j.getDetalleJuego().getIdiomaAudio()%></p>
                </div>
                <% } else { %>
                <p>No se encontraron detalles para este juego.</p>
                <% }%>
            </div>


        </div>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/css/juegos.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catalogo de Juegos</title>
    </head>
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

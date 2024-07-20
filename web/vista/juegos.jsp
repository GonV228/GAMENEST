<%@page import="modelo.dto.Usuario"%>
<%@ include file="../vista/header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Catalogo de Juegos</title>
    <link href="${pageContext.request.contextPath}/css/juegos.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="css/header.css" rel="stylesheet" type="text/css"/>
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
    <link href="../css/barraLateral.css" rel="stylesheet" type="text/css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
   
    <div class="main-content">
        <div class="sidebar">
            <div class="top">
                <i class="fa-solid fa-bars" id="btn"></i>
            </div>
            <ul>
                <li><a href="index.jsp"><i class="fa-solid fa-house"></i><span class="nav-item">Inicio</span></a></li>
                <li><a href="<%=request.getContextPath()%>/ControladorJuego"><i class="fa-solid fa-gamepad"></i><span class="nav-item">Juegos</span></a></li>
                <li><a href="vista/sugerencias.jsp"><i class="fa-regular fa-comment"></i><span class="nav-item">Sugerencias</span></a></li>
                <li><a href="vista/libroReclamaciones.jsp"><i class="fa-solid fa-file-circle-exclamation"></i><span class="nav-item">Reportes</span></a></li>
                <li><a href="vista/FAQ.jsp"><i class="fa-regular fa-circle-question"></i><span class="nav-item">Soporte</span></a></li>
            </ul>
        </div>
                <style>

        .content-wrapper {
            flex: 1;
            padding: 20px;
            background-color: #f7f7f7;
        }

        .filter-container {
            margin: 10px 0;
            padding: 10px;
            background-color: #e9ecef;
            border-radius: 6px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 250px;
        }

        .filter-label {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .filter-select {
            font-size: 12px;
            padding: 8px;
            border: 1px solid #999;
            border-radius: 4px;
            width: 100%;
            background-color: #fff;
            color: #333;
            cursor: pointer;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .filter-select:focus {
            border-color: #007bff;
            box-shadow: 0 0 3px rgba(0, 123, 255, 0.5);
            outline: none;
        }

        .filter-select:hover {
            border-color: #777;
        }

       

       
    </style>
         <div class="content-wrapper">
            <div class="filter-container">
                <label for="categoria" class="filter-label">Filtrar por categoría:</label>
                <select id="categoria" name="categoria" class="filter-select">
                    <option value="accion">Acción</option>
                    <option value="aventura">Aventura</option>
                    <option value="deporte">Deporte</option>
                    <!-- Añade más categorías según tu base de datos -->
                </select>
            </div>
            <div id="listaJuegos" class="listaJuegos">
                <c:forEach var="j" items="${lista}">
                    <div class="juegos">
                        <div>
                            <a href="${pageContext.request.contextPath}/ControladorJuego?accion=detalle&idJuego=${j.idJuego}">
                                <picture>
                                    <img src="juegos/${j.imagenJuego}" alt="${j.nombreJuego}"/>
                                </picture>
                            </a>
                            <div class="name-game">
                                <a href="${pageContext.request.contextPath}/ControladorJuego?accion=detalle&idJuego=${j.idJuego}" title="${j.nombreJuego}">
                                    <h5>${j.nombreJuego}</h5>
                                </a>
                                <p>Peso: ${j.pesoJuego}</p>
                                <p>Categoria: ${j.categoria}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#categoria').change(function () {
                var categoria = $(this).val();
                $.ajax({
                    url: '<%=request.getContextPath()%>/ControladorJuego',
                    type: 'GET',
                    data: {accion: 'filtrar', categoria: categoria},
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        if (!data || data.length === 0) {
                            alert('No se encontraron juegos para esta categoría.');
                            return;
                        }
                        var listaJuegos = $('#listaJuegos');
                        listaJuegos.empty();
                        data.forEach(item => {
                            listaJuegos.append(`
                                <div class="juegos">
                                    <div>
                                        <a href="${pageContext.request.contextPath}/ControladorJuego?accion=detalle&idJuego=` + item.idJuego + `">
                                            <picture>
                                                <img src="juegos/` + item.imagenJuego + `" alt="` + item.nombreJuego + `"/>
                                            </picture>
                                        </a>
                                        <div class="name-game">
                                            <a href="${pageContext.request.contextPath}/ControladorJuego?accion=detalle&idJuego=` + item.idJuego + `" title="` + item.nombreJuego + `">
                                                <h5>` + item.nombreJuego + `</h5>
                                            </a>
                                            <p>Peso: ` + item.pesoJuego + `</p>
                                            <p>Categoria: ` + item.categoria + ` </p>
                                        </div>
                                    </div>
                                </div>
                            `);
                        });
                    },
                    error: function () {
                        alert('Error al filtrar los juegos.');
                    }
                });
            });
        });
    </script>
</body>
</html>

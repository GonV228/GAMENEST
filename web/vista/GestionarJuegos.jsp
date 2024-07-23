<%@page import="modelo.dto.detalleJuego"%>
<%@page import="modelo.dao.DetalleDao"%>
<%@page import="modelo.dao.TablaJuegosDao"%>
<%@page import="modelo.dto.juego"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GameNest</title>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
        <link href="../css/gestionarjuegos.css" rel="stylesheet" type="text/css"/>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }

            body {
                min-height: 100vh;
                background-image: url('../img/fondoG.jpg');
                background-size: cover;
                background-position: center;
            }

            .container-row {
                display: flex;
                justify-content: space-around;
                margin-bottom: 20px;
            }

            .ContenedorAgregarJuego, .container {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 20px;
                border-radius: 10px;
                width: 45%;
            }

            .ContenedorAgregarJuego h4, .container h4 {
                margin-bottom: 15px;
            }

            .ContenedorAgregarJuego label, .container label {
                display: block;
                margin-top: 10px;
            }

            .ContenedorAgregarJuego input, .ContenedorAgregarJuego select,
            .container input, .container select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
            }

            .ContenedorAgregarJuego button, .container button {
                margin-top: 15px;
            }

            .table thead th {
                background-color: #007bff;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="container-row">
            <div class="ContenedorAgregarJuego">
                <h4>Agregar Nuevo Juego</h4>
                <form action="<%=request.getContextPath()%>/ControladorCrudDataJuegos" method="post">
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
                    </select><br>

                    <button type="submit" name="accion" value="agregar">Agregar Juego</button>
                </form>
            </div>

            <div class="container">
                <h4>Tabla de Juegos</h4>
                <table id="table_id" class="display table table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Imagen</th>
                            <th>Peso</th>
                            <th>Precio</th>
                            <th>Categoría</th>
                            <th>Operaciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            TablaJuegosDao juegosDao = new TablaJuegosDao();
                            List<juego> juegos = juegosDao.listar();
                            for (juego j : juegos) {
                        %>
                        <tr>
                            <td><%= j.getIdJuego()%></td>
                            <td><%= j.getNombreJuego()%></td>
                            <td><%= j.getImagenJuego()%></td>
                            <td><%= j.getPesoJuego()%></td>
                            <td><%= j.getPrecio()%></td>
                            <td><%= j.getCategoria()%></td>
                            <td>
                                <form action="editarJuego.jsp" method="get" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= j.getIdJuego()%>">
                                    <input type="hidden" name="nombre" value="<%= j.getNombreJuego()%>">
                                    <input type="hidden" name="imagen" value="<%= j.getImagenJuego()%>">
                                    <input type="hidden" name="peso" value="<%= j.getPesoJuego()%>">
                                    <input type="hidden" name="precio" value="<%= j.getPrecio()%>">
                                    <input type="hidden" name="categoria" value="<%= j.getCategoria()%>">
                                    <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                                </form>
                                <form action="<%=request.getContextPath()%>/ControladorCrudDataJuegos" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= j.getIdJuego()%>">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Imagen</th>
                            <th>Peso</th>
                            <th>Precio</th>
                            <th>Categoría</th>
                            <th>Operaciones</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div class="container-row">
            <div class="ContenedorAgregarJuego">
                <h4>Agregar Detalle del Juego</h4>
                <form action="<%=request.getContextPath()%>/CCrudDetalleJuegos" method="post">
                    <input type="hidden" name="accion" value="agregar">

                    <label for="idJuego">ID del Juego:</label>
                    <input type="text" id="idJuego" name="idJuego" required>

                    <label for="descripcion">Descripción:</label>
                    <input type="text" id="descripcion" name="descripcion" required>

                    <label for="fechaEstreno">Fecha de Estreno:</label>
                    <input type="date" id="fechaEstreno" name="fechaEstreno" required>

                    <label for="plataforma">Plataforma:</label>
                    <input type="text" id="plataforma" name="plataforma" required>

                    <label for="idiomaTexto">Idioma del Texto:</label>
                    <input type="text" id="idiomaTexto" name="idiomaTexto" required>

                    <label for="idiomaAudio">Idioma del Audio:</label>
                    <input type="text" id="idiomaAudio" name="idiomaAudio" required>

                    <button type="submit">Agregar Detalle</button>
                </form>



            </div>

            <div class="container">
                <h4>Tabla Detalles del Juego</h4>
                <table id="table_detalle_id" class="display table table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>Detalle ID</th>
                            <th>ID Juego</th>
                            <th>Descripción</th>
                            <th>Fecha de Estreno</th>
                            <th>Plataforma</th>
                            <th>Idioma Texto</th>
                            <th>Idioma Audio</th>
                            <th>Operaciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Instanciar el DAO para obtener los datos
                            DetalleDao detalleDao = new DetalleDao();
                            List<detalleJuego> detalles = detalleDao.listar();
                            for (detalleJuego d : detalles) {
                        %>
                        <tr>
                            <td><%= d.getDetalleJuegoId()%></td>
                            <td><%= d.getIdJuego()%></td>
                            <td><%= d.getDescripcionJuego()%></td>
                            <td><%= d.getFechaEsterno()%></td>
                            <td><%= d.getPlataforma()%></td>
                            <td><%= d.getIdiomaTexto()%></td>
                            <td><%= d.getIdiomaAudio()%></td>
                            <td>
                                <form action="EditarDetalle.jsp" method="get" style="display:inline;">
                                    <input type="hidden" name="detalleId" value="<%= d.getDetalleJuegoId()%>">
                                    <input type="hidden" name="idJuego" value="<%= d.getIdJuego()%>">
                                    <input type="hidden" name="descripcionJuego" value="<%= d.getDescripcionJuego()%>">
                                    <input type="hidden" name="fechaEstreno" value="<%= d.getFechaEsterno()%>">
                                    <input type="hidden" name="plataforma" value="<%= d.getPlataforma()%>">
                                    <input type="hidden" name="idiomaTexto" value="<%= d.getIdiomaTexto()%>">
                                    <input type="hidden" name="idiomaAudio" value="<%= d.getIdiomaAudio()%>">
                                    <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                                </form>
                                <form action="<%=request.getContextPath()%>/CCrudDetalleJuegos" method="post" style="display:inline;">
                                    <input type="hidden" name="detalleId" value="<%= d.getDetalleJuegoId()%>">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Detalle ID</th>
                            <th>ID Juego</th>
                            <th>Descripción</th>
                            <th>Fecha de Estreno</th>
                            <th>Plataforma</th>
                            <th>Idioma Texto</th>
                            <th>Idioma Audio</th>
                            <th>Operaciones</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('#table_id').DataTable();
                $('#table_detalle_id').DataTable();
            });
        </script>
    </body>
</html>

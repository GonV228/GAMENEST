<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css"/>
        <link href="${pageContext.request.contextPath}/css/tableReclamaciones.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/lightbox/lightbox.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Reclamaciones</title>
    </head>
    <body>
        <div class="listaReclamaciones">
            <table id="reclamacionesTable" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Correo</th>
                        <th>Telefono</th>
                        <th>Producto</th>
                        <th>Monto</th>
                        <th>Descripcion</th>
                        <th>Evidencia</th>
                        <th>Verificar</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="r" items="${lista}" varStatus="status">
                        <tr>
                            <td>${r.id}</td>
                            <td>${r.nombre}</td>
                            <td>${r.apellidos}</td>
                            <td>${r.correo}</td>
                            <td>${r.telefono}</td>
                            <td>${r.producto}</td>
                            <td>S/.${r.monto_reclamado}</td>
                            <td>${r.descripcion_problema}</td>
                            <td><a href="${pageContext.request.contextPath}/${r.evidencia}" data-lightbox="image-${status.index}"><img src="${pageContext.request.contextPath}/${r.evidencia}" style="width: 30px; height: 30px;"></a></td>
                            <td>
                                <button class="btn success"><i class="fas fa-check-circle"></i></button>
                                <button class="btn danger"><i class="fas fa-times-circle"></i></button>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/lightbox/lightbox.js"></script>


        <script>
            new DataTable('#reclamacionesTable', {
                language: {
                    url: '//cdn.datatables.net/plug-ins/2.1.0/i18n/es-ES.json',
                },
                columnDefs: [
                    {
                        target: 4,
                        visible: false,
                        searchable: false
                    },
                    {
                        target: 2,
                        visible: false
                    }
                ]

            });
        </script>
    </body>
</html>

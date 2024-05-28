<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
 <link href="../css/login.css" rel="stylesheet" type="text/css"/>
 <link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css"/>


    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>
    <main class="CC">
        <div class="C1">
            <form action="<%=request.getContextPath()%>/ControladorLogin" method="post">
                <h1>Iniciar sesión</h1>
                <%-- Mostrar mensaje de error si está presente --%>
                <c:if test="${not empty mensajeError}">
                    <div class="C3-error">
                        <p>${mensajeError}</p>
                    </div>
                </c:if>
                <div class="C2-usuario">
                    <input type="email" placeholder="Correo electrónico" name="Email" required>
                    <i class='bx bxs-envelope'></i>
                </div>
                <div class="C2-usuario">
                    <input type="password" placeholder="Contraseña" name="Password" required>
                    <i class='bx bxs-lock-alt'></i>
                </div>
                <div class="C4-recuerdame">
                    <label><input type="checkbox">Recuérdame</label>
                    <a href="#">¿Olvidaste tu contraseña?</a>
                </div>
                <button type="submit" class="btn">Iniciar Sesión</button>
                <div class="C5-registrar">
                    <p>¿No tienes una cuenta? <a href="../vista/registrar.jsp">Registrarse</a></p>
                    <p>Volver al <a href="../index.jsp">Inicio</a></p>
                </div>
            </form>
        </div>
    </main>
</body>
</html>

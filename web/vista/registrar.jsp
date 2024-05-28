<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="../css/registrar.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<main>
    <div class="registration-container">
        <h1>Registro de Usuario</h1>
        <form action="<%=request.getContextPath()%>/ControladorRegistrarUs" method="post">
            <div class="form-group">
                <input type="text" placeholder="DNI" name="Dni" required>
            </div>
            <div class="form-group">
                <input type="text" placeholder="Nombres" name="Nombres" required>
            </div>
            <div class="form-group">
                <input type="text" placeholder="Dirección" name="Direccion" required>
            </div>
            <div class="form-group">
                <input type="email" placeholder="Correo Electrónico" name="Email" required>
                <i class='bx bxs-envelope'></i>
            </div>
            <div class="form-group">
                <input type="password" placeholder="Contraseña" name="Password" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="form-group">
                <input type="password" placeholder="Confirmar Contraseña" name="ConfirmarPassword" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="remember-me">
                <label><input type="checkbox">Recuérdame</label>
                <a href="#">¿Olvidaste tu contraseña?</a>
            </div>
            <button type="submit" class="btn">Registrarse</button>
            <div class="register-link">
                <p>¿Ya tienes una cuenta? <a href="../vista/login.jsp">Iniciar Sesión</a></p>
            </div>
        </form>

    </div>
</main>
</body>
</html>

package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.dao.LoginDAO;
import modelo.dto.Usuario;

@WebServlet(name = "ControladorLogin", urlPatterns = {"/ControladorLogin"})
public class ControladorLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String accion = request.getParameter("accion");
            if (accion != null && accion.equals("cerrar")) {
                cerrarSesion(request); // Llamar al método para cerrar sesión
                response.sendRedirect("login.jsp"); // Redirigir al usuario a la página de inicio de sesión
                return; // Terminar el procesamiento para evitar errores adicionales
            }
            HttpSession sesion;
            // Obtener los parámetros del formulario de inicio de sesión
            String email = request.getParameter("Email");
            String contraseña = request.getParameter("Password");

            // Crear una instancia del DAO de login
            LoginDAO loginDAO = new LoginDAO();

            // Verificar las credenciales del usuario
            Usuario usuario = loginDAO.autenticarUsuario(email, contraseña);

            if (usuario != null) {
                // Verificar el rol y redirigir a la página correspondiente
                if (usuario.getRol().equals("cliente")) {
                    sesion = request.getSession();
                    sesion.setAttribute("usuario", usuario); // Guardar el usuario en la sesión
                    System.out.println("Cliente autenticado: " + usuario.getNombres()); // Depuración
                    // Si el usuario es cliente, redirigir a la página de cliente
                    response.sendRedirect("index.jsp");
                } else if (usuario.getRol().equals("administrador")) {
                   sesion = request.getSession();
                    sesion.setAttribute("usuario", usuario); // Guardar el usuario en la sesión
                    // Si el usuario es administrador, redirigir a la página de administrador
                    response.sendRedirect("indexAdministrador.jsp");
                }
            } else {
                // Si las credenciales son incorrectas, mostrar un mensaje de error
                System.err.println("Error: Usuario o contraseña incorrectos");
                // Redirigir a la página de inicio de sesión
                request.setAttribute("mensajeError", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Imprimir un mensaje de error específico en la consola
            System.err.println("Error al procesar la solicitud: " + e.getMessage());
            // Redirigir a una página de error
            response.sendRedirect("error.jsp");
        }
    }

    private void cerrarSesion(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // Obtener la sesión existente, si existe
        if (session != null) {
            session.invalidate(); // Invalidar la sesión para cerrarla
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

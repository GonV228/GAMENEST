package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.ReclamacionDAO;
import modelo.dto.reclamaciones;

@WebServlet(name = "ControladorGuardarRec", urlPatterns = {"/ControladorGuardarRec"})
public class ControladorGuardarRec extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Obtener parámetros del formulario de reclamaciones
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String producto = request.getParameter("producto");
        double monto_reclamado = Double.parseDouble(request.getParameter("monto_reclamado"));
        String descripcion_problema = request.getParameter("descripcion_problema");
        String evidencia = request.getParameter("evidencia"); // La evidencia se manejara como una cadena

        // Validar datos del formulario
        if (nombre.isEmpty() || apellidos.isEmpty() || correo.isEmpty() || telefono.isEmpty() ||
            producto.isEmpty() || descripcion_problema.isEmpty()) {
            out.println("<div class='error'>Por favor, complete todos los campos</div>");
            return;
        }
        

        // Crear un objeto Reclamaciones con la información del formulario
        reclamaciones nuevaReclamacion = new reclamaciones(0, nombre, apellidos, correo, telefono, producto, monto_reclamado, descripcion_problema, evidencia);

        // Crear una instancia del DAO para el registro de reclamaciones
        ReclamacionDAO dao = new ReclamacionDAO();

        // Intentar registrar la reclamación
        boolean registrado = dao.reclamaciones(nuevaReclamacion);

        // Mostrar mensaje de éxito o error según el resultado del registro
        if (registrado) {
            // Si el registro fue exitoso, mostrar mensaje de éxito y redireccionar
            out.println("<script type=\"text/javascript\">");
            out.println("alert('¡Reclamación registrada exitosamente!');");
            out.println("window.location.href = 'index.jsp';");
            out.println("</script>");
        } else {
            // Si hubo un error en el registro, mostrar mensaje de error
            out.println("<div class='error'>Error al registrar la reclamación. Intente nuevamente más tarde</div>");
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

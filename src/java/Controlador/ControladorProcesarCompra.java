package controlador;

import conexiones.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ControladorProcesarCompra")
public class ControladorProcesarCompra extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        String nombres = request.getParameter("nombres");
        String email = request.getParameter("email");
        double monto = Double.parseDouble(request.getParameter("total"));

        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            Conexion conexion = new Conexion();
            con = conexion.getConection();

            String sql = "INSERT INTO compras (idCliente, Nombres, Email, Monto) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, idCliente);
            ps.setString(2, nombres);
            ps.setString(3, email);
            ps.setDouble(4, monto);

            int resultado = ps.executeUpdate();
            if (resultado > 0) {
                response.sendRedirect(request.getContextPath() + "/vista/confirmacion.jsp"); // Redirigir a una página de confirmación
            } else {
                response.sendRedirect(request.getContextPath() + "/vista/error.jsp"); // Redirigir a una página de error
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/vista/error.jsp"); // Redirigir a una página de error en caso de excepción
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}


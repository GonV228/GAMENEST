package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.dto.reclamaciones;
import conexiones.Conexion;

public class ReclamacionDAO {
    private final Conexion conexion;
    
    public ReclamacionDAO() {
        this.conexion = new Conexion();
    }   
        public boolean reclamaciones (reclamaciones nuevaReclamacion) {
        boolean registrado = false;
        String query = "INSERT INTO reclamaciones (nombre, apellidos, correo, telefono, id_usuario, producto, monto_reclamado, descripcion_problema, evidencia) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = conexion.getConection();
            PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nuevaReclamacion.getNombre());
            ps.setString(2, nuevaReclamacion.getApellidos());
            ps.setString(3, nuevaReclamacion.getCorreo());
            ps.setString(4, nuevaReclamacion.getTelefono());
            ps.setString(5, nuevaReclamacion.getId_usuario());
            ps.setString(6, nuevaReclamacion.getProducto());
            ps.setDouble(7, nuevaReclamacion.getMonto_reclamado());
            ps.setString(8, nuevaReclamacion.getDescripcion_problema());
            ps.setString(9, nuevaReclamacion.getEvidencia());
            int rowsAffected = ps.executeUpdate();
            registrado = rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return registrado;
    }
}
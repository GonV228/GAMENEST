package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.dto.Usuario;
import conexiones.Conexion;

public class registrarDAO {
    private final Conexion conexion;

    public registrarDAO() {
        this.conexion = new Conexion();
    }

    public boolean registrarUsuario(Usuario nuevoUsuario) {
        boolean registrado = false;
        String query = "INSERT INTO Usuario (Dni, Nombres, Direccion, Email, Contraseña, Rol) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = conexion.getConection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nuevoUsuario.getDni());
            ps.setString(2, nuevoUsuario.getNombres());
            ps.setString(3, nuevoUsuario.getDireccion());
            ps.setString(4, nuevoUsuario.getEmail());
            ps.setString(5, nuevoUsuario.getContraseña());
            ps.setString(6, nuevoUsuario.getRol());
            int filasAfectadas = ps.executeUpdate();
            registrado = filasAfectadas > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return registrado;
    }
}

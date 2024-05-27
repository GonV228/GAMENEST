package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import conexiones.Conexion;
import modelo.dto.Usuario;

public class LoginDAO {

    private final Connection conexion;

    public LoginDAO() throws SQLException {
        this.conexion = new Conexion().getConection();
    }

public Usuario autenticarUsuario(String email, String contraseña) {
    Usuario usuario = null;
    try {
        String query = "SELECT * FROM usuario WHERE Email = ? AND Contraseña = ?";
        PreparedStatement ps = conexion.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, contraseña);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            usuario = new Usuario(
                rs.getInt("idCliente"),
                rs.getString("Dni"),
                rs.getString("Nombres"),
                rs.getString("Direccion"),
                rs.getString("Email"),
                rs.getString("Contraseña"),
                rs.getString("Rol")
            );
        }
        rs.close();
        ps.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return usuario;
}



    public String validarCredenciales(String email, String contraseña) {
        String rol = null;
        try {
            String query = "SELECT Rol FROM Usuario WHERE Email = ? AND Contraseña = ?";
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, contraseña);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                rol = rs.getString("Rol");
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rol;
    }
}

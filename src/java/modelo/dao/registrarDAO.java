package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.dto.Usuario;
import conexiones.Conexion;

public class registrarDAO {
    private final Conexion conexion;

    // Constructor de la clase registrarDAO que inicializa la conexión a la base de datos
    public registrarDAO() {
        this.conexion = new Conexion(); // Se inicializa la conexión a la base de datos usando la clase Conexion
    }

    // Método para registrar un nuevo usuario en la base de datos
    public boolean registrarUsuario(Usuario nuevoUsuario) {
        boolean registrado = false; // Se inicializa como falso el estado de registro
        String query = "INSERT INTO Usuario (Dni, Nombres, Direccion, Email, Contraseña, Rol) VALUES (?, ?, ?, ?, ?, ?)"; // Consulta SQL para insertar un nuevo usuario en la base de datos
        try (Connection con = conexion.getConection(); // Se obtiene una conexión a la base de datos
             PreparedStatement ps = con.prepareStatement(query)) { // Se prepara la consulta SQL
            // Se establecen los parámetros de la consulta con los datos del nuevo usuario
            ps.setString(1, nuevoUsuario.getDni());
            ps.setString(2, nuevoUsuario.getNombres());
            ps.setString(3, nuevoUsuario.getDireccion());
            ps.setString(4, nuevoUsuario.getEmail());
            ps.setString(5, nuevoUsuario.getContraseña());
            ps.setString(6, nuevoUsuario.getRol());
            int filasAfectadas = ps.executeUpdate(); // Se ejecuta la consulta y se obtiene el número de filas afectadas
            registrado = filasAfectadas > 0; // Se actualiza el estado de registro dependiendo de si se afectaron filas
        } catch (SQLException ex) { // Captura de excepciones SQL
            ex.printStackTrace(); // Impresión del error
        }
        return registrado; // Se devuelve el estado de registro
    }
}

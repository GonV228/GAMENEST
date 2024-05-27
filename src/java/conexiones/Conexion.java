package conexiones;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    private Connection con = null;
    private String url = "jdbc:mysql://localhost:33065/bdcarritocompras?useTimeZone=true&serverTimezone=UTC&autoReconnect=true";
    private String user = "root";
    private String pass = "12";
    private String driver = "com.mysql.cj.jdbc.Driver";

    public Connection getConection() throws SQLException {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

    public static void main(String[] args) {
        Conexion cdb = new Conexion();
        try {
            Connection cnx = cdb.getConection();
            System.out.println("Conexión exitosa a la base de datos: " + cnx.getCatalog());
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

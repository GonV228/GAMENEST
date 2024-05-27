package modelo.dao;
import modelo.dto.juego;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import conexiones.Conexion;

public class juegoDAO {
    Connection cnx;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public List listar(){
        List<juego> lista = new ArrayList<>();
        String SQL = "SELECT imagenJuego, nombreJuego, pesoJuego, categoria FROM juego order by nombreJuego asc";
        try {
            cnx = cn.getConection();
            ps = cnx.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                juego j = new juego();
                j.setImagenJuego(rs.getString(1));
                j.setNombreJuego(rs.getString(2));
                j.setPesoJuego(rs.getString(3));
                j.setCategoria(rs.getString(4));
                lista.add(j);
            }
        } catch (SQLException e) {
        }
        return lista;
    }
}

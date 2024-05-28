package modelo.dao;
import modelo.dto.juego;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import conexiones.Conexion;
import java.util.stream.Collectors;

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
        public juego obtenerJuego(int idJuego) throws SQLException {
        juego j = null;
        String sql = "SELECT j.idJuego, j.nombreJuego, j.pesoJuego, j.precio, j.imagenJuego "
                   + "FROM juego j "
                   + "WHERE j.idJuego = ? ";
        try (Connection cnx = cn.getConection();
             PreparedStatement ps = cnx.prepareStatement(sql)) {
            ps.setInt(1, idJuego);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    j = new juego();
                    j.setIdJuego(rs.getInt("idJuego"));
                    j.setNombreJuego(rs.getString("nombreJuego"));
                    j.setPesoJuego(rs.getString("pesoJuego"));
                    j.setPrecio(rs.getDouble("precio"));
                    j.setImagenJuego(rs.getString("imagenJuego"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return j;
    }

    
}

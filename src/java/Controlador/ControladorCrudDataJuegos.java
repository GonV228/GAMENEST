package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.TablaJuegosDao;
import modelo.dto.juego;

@WebServlet(name = "ControladorCrudDataJuegos", urlPatterns = {"/ControladorCrudDataJuegos"})
public class ControladorCrudDataJuegos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "agregar":
                    agregarJuego(request, response);
                    break;
                case "editar":
                    editarJuego(request, response);
                    break;
                case "eliminar":
                    eliminarJuego(request, response);
                    break;
                default:
                    listarJuegos(request, response);
                    break;
            }
        } else {
            listarJuegos(request, response);
        }
    }

    private void agregarJuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String imagen = request.getParameter("imagen");
        String peso = request.getParameter("peso");
        String precio = request.getParameter("precio");
        String categoria = request.getParameter("categoria");

        if (nombre != null && imagen != null && peso != null && precio != null && categoria != null) {
            juego nuevoJuego = new juego();
            nuevoJuego.setNombreJuego(nombre);
            nuevoJuego.setImagenJuego(imagen);
            nuevoJuego.setPesoJuego(peso);
            nuevoJuego.setPrecio(Double.parseDouble(precio));
            nuevoJuego.setCategoria(categoria);

            TablaJuegosDao dao = new TablaJuegosDao();
            dao.agregar(nuevoJuego);

            response.sendRedirect("vista/GestionarJuegos.jsp");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan datos para agregar el juego.");
        }
    }

    private void editarJuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String imagen = request.getParameter("imagen");
        String peso = request.getParameter("peso");
        String precio = request.getParameter("precio");
        String categoria = request.getParameter("categoria");

        if (idStr != null && nombre != null && imagen != null && peso != null && precio != null && categoria != null) {
            try {
                int id = Integer.parseInt(idStr);

                juego juegoEditado = new juego();
                juegoEditado.setIdJuego(id);
                juegoEditado.setNombreJuego(nombre);
                juegoEditado.setImagenJuego(imagen);
                juegoEditado.setPesoJuego(peso);
                juegoEditado.setPrecio(Double.parseDouble(precio));
                juegoEditado.setCategoria(categoria);

                TablaJuegosDao dao = new TablaJuegosDao();
                dao.editar(juegoEditado);

                response.sendRedirect("vista/GestionarJuegos.jsp");
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID o precio inválido.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan datos para editar el juego.");
        }
    }

    private void eliminarJuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");

        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);

                TablaJuegosDao dao = new TablaJuegosDao();
                dao.eliminar(id);

                response.sendRedirect("vista/GestionarJuegos.jsp");
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID inválido.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el ID para eliminar el juego.");
        }
    }

    private void listarJuegos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TablaJuegosDao dao = new TablaJuegosDao();
        request.setAttribute("juegos", dao.listar());
        request.getRequestDispatcher("vista/GestionarJuegos.jsp").forward(request, response);
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
package modelo.dto;

public class juego {
    private int idJuego;
    private String nombreJuego;
    private String imagenJuego;
    private String categoria;
    private String pesoJuego;
    private Double precio;

    public juego(){
    }

    public juego(int idJuego, String nombreJuego, String imagenJuego, String categoria, String pesoJuego, Double precio) {
        this.idJuego = idJuego;
        this.nombreJuego = nombreJuego;
        this.imagenJuego = imagenJuego;
        this.categoria = categoria;
        this.pesoJuego = pesoJuego;
        this.precio = precio;
    }
    

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public int getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(int idJuego) {
        this.idJuego = idJuego;
    }

    public String getNombreJuego() {
        return nombreJuego;
    }

    public void setNombreJuego(String nombreJuego) {
        this.nombreJuego = nombreJuego;
    }

    public String getImagenJuego() {
        return imagenJuego;
    }

    public void setImagenJuego(String imagenJuego) {
        this.imagenJuego = imagenJuego;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    

    public String getPesoJuego() {
        return pesoJuego;
    }

    public void setPesoJuego(String pesoJuego) {
        this.pesoJuego = pesoJuego;
    }
    
    
    
}

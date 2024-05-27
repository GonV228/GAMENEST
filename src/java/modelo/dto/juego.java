package modelo.dto;

public class juego {
    private int idJuego;
    private String nombreJuego;
    private String imagenJuego;
    private String categoria;
    private String pesoJuego;

    public juego(){}

    
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

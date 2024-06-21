package modelo.dto;

import java.util.Date;
public class detalleJuego {
    
    private int detalleJuegoId;
    private String descripcionJuego;
    private Date fechaEsterno;
    private String plataforma;
    private String idiomaTexto;
    private String idiomaAudio;

    public int getDetalleJuegoId() {
        return detalleJuegoId;
    }

    public void setDetalleJuegoId(int detalleJuegoId) {
        this.detalleJuegoId = detalleJuegoId;
    }

    public String getDescripcionJuego() {
        return descripcionJuego;
    }

    public void setDescripcionJuego(String descripcionJuego) {
        this.descripcionJuego = descripcionJuego;
    }

    public Date getFechaEsterno() {
        return fechaEsterno;
    }

    public void setFechaEsterno(Date fechaEsterno) {
        this.fechaEsterno = fechaEsterno;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    public String getIdiomaTexto() {
        return idiomaTexto;
    }

    public void setIdiomaTexto(String idiomaTexto) {
        this.idiomaTexto = idiomaTexto;
    }

    public String getIdiomaAudio() {
        return idiomaAudio;
    }

    public void setIdiomaAudio(String idiomaAudio) {
        this.idiomaAudio = idiomaAudio;
    }
    
    
    
}

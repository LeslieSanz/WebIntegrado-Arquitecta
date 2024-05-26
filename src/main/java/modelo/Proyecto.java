/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author yosse
 */
public class Proyecto {
    private String cod;
    private String nombre;
    private String descrip_corta;
    private String descr_larga;
    private byte[] imagen;
    private String tipo;

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getCod() {
        return cod;
    }

    public void setCod(String cod) {
        this.cod = cod;
    }
    
    
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescrip_corta() {
        return descrip_corta;
    }

    public void setDescrip_corta(String descrip_corta) {
        this.descrip_corta = descrip_corta;
    }

    public String getDescr_larga() {
        return descr_larga;
    }

    public void setDescr_larga(String descr_larga) {
        this.descr_larga = descr_larga;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

   
    
    
}

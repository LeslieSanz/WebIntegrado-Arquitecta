/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author yosse
 */
public class Compra {
    private String cod;
    private String fecha;
    private double monto;
    private Usuario codUsu;

    public String getCod() {
        return cod;
    }

    public void setCod(String cod) {
        this.cod = cod;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public Usuario getCodUsu() {
        return codUsu;
    }

    public void setCodUsu(Usuario codUsu) {
        this.codUsu = codUsu;
    }
    
    
}
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
    private Usuario codUsu;
    //Para el procedimiento almacenado
    private double monto;
    private int cantCursos;
    
    //Para el grafico
    private int mes;
    private double totalPorMes;
    
    public String Lmes(){
        String vec[]={"","Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Set","Oct","Nov","Dic"};
        return vec[mes];
    }
    

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

    public int getCantCursos() {
        return cantCursos;
    }

    public void setCantCursos(int cantCursos) {
        this.cantCursos = cantCursos;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public double getTotalPorMes() {
        return totalPorMes;
    }

    public void setTotalPorMes(double totalPorMes) {
        this.totalPorMes = totalPorMes;
    }
    
    
}

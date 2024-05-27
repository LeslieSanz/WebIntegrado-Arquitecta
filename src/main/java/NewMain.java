
import dao.tipoProyectDAO;
import java.util.List;
import modelo.tipoProyecto;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author yosse
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       tipoProyectDAO dao = new tipoProyectDAO();
        List<tipoProyecto> listaTipoProyectos = dao.mostrarGraficoTipo();

        // Imprimir los resultados obtenidos
        for (tipoProyecto tp : listaTipoProyectos) {
            System.out.println("Tipo de Proyecto: " + tp.getNomTipo());
            System.out.println("Código de Tipo: " + tp.getCodTipo());
            System.out.println("Cantidad de Proyectos: " + tp.getProyecto().getCantidad());
            System.out.println();
        }
    }
    
}

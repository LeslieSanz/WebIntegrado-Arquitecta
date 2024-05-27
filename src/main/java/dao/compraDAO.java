package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Compra;
import modelo.Usuario;
import util.MySQLConexion;

public class compraDAO {
    
    //Lista de Compras por Usuario
    public List<Compra> LisComprasPorUsu(String codusu) {
    List<Compra> lista = new ArrayList<>();
    Connection cn = MySQLConexion.getConexion();
    try {
        String sql = "{call ObtenerComprasPorUsuario(?)}"; // Agregar el parámetro del procedimiento
        CallableStatement st = cn.prepareCall(sql);
        st.setString(1, codusu);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Compra c = new Compra();
            c.setCod(rs.getString(1));
            c.setFecha(rs.getString(2));
            c.setCantCursos(rs.getInt(3)); // Agregar la cantidad de cursos
            c.setMonto(rs.getDouble(4)); // Agregar el monto total

            lista.add(c);
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    } 
    return lista;
    }
    
    public List<Compra> LisComprasPorMes(int an) {
    List<Compra> lista = new ArrayList<>();
    Connection cn = MySQLConexion.getConexion();
    try {
        String sql = "{call ObtenerTotalPorMes(?)}";
        PreparedStatement st = cn.prepareStatement(sql);
        st.setInt(1, an);
        System.out.println("Ejecutando procedimiento almacenado con año: " + an);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Compra c = new Compra();
            c.setMes(rs.getInt(1));
            c.setTotalPorMes(rs.getDouble(2));
            System.out.println("Mes: " + c.getMes() + ", Total: " + c.getTotalPorMes()); // Verifica los datos recuperados
            lista.add(c);
        }
        rs.close();
        st.close();
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (cn != null) cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    System.out.println("Tamaño de la lista: " + lista.size()); // Verifica el tamaño de la lista resultante
    return lista;
}



}

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

}

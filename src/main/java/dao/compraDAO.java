package dao;

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
    public List<Compra> LisComprasPorUsu(String codusu){
        List<Compra> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="SELECT  codCompra, fecha, MontoTotal FROM compra WHERE Usuario_cod=?";
            PreparedStatement st=cn.prepareStatement(sql);
            st.setString(1, codusu);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Compra c=new Compra();
                c.setCod(rs.getString(1));
                c.setFecha(rs.getString(2));
                c.setMonto(rs.getDouble(3));
                lista.add(c);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
}

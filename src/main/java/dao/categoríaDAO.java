package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Categoria;
import util.MySQLConexion;
/**
 *
 * @author luism
 */
public class categoríaDAO {
    public List<Categoria> ListarTodos(){
        List<Categoria> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="SELECT codCat,nomCategor FROM categoria";
            PreparedStatement st=cn.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Categoria ct=new Categoria();
                ct.setCodCat(rs.getString(1));
                ct.setNombre(rs.getString(2));
                lista.add(ct);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
}

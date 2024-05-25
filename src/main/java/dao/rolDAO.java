package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Rol;
import util.MySQLConexion;

public class rolDAO {
    public List<Rol> ListarTodos(){
        List<Rol> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="SELECT codRol,nomRol FROM rol";
            PreparedStatement st=cn.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Rol r=new Rol();
                r.setCodRol(rs.getInt(1));
                r.setNombre(rs.getString(2));
                lista.add(r);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
}

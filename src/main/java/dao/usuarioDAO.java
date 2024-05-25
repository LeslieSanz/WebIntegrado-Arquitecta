package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;
import util.MySQLConexion;

public class usuarioDAO {
    
    public List<Usuario> ListarTodos(){
        List<Usuario> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="SELECT cod, Rol_codRol, dni, password, nombre, apellidos, correo FROM usuario";
            PreparedStatement st=cn.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Usuario u=new Usuario();
                u.setCod(rs.getString(1));
                u.setCod_rol(rs.getInt(2));
                u.setDni(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setNombre(rs.getString(5));
                u.setApellidos(rs.getString(6));
                u.setCorreo(rs.getString(7));
                lista.add(u);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
    
}

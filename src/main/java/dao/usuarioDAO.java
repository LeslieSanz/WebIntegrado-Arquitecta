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
    
    public void agregarUsuario(Usuario u) {
    Connection cn = MySQLConexion.getConexion();
    try {
        String sql = "INSERT INTO usuario (Rol_codRol, dni, password, nombre, apellidos, correo) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement st = cn.prepareStatement(sql);
        st.setInt(1, u.getCod_rol());
        st.setString(2, u.getDni());
        st.setString(3, u.getPassword());
        st.setString(4, u.getNombre());
        st.setString(5, u.getApellidos());
        st.setString(6, u.getCorreo());
        st.executeUpdate();
        System.out.println("Usuario agregado exitosamente.");
        } catch (Exception ex) {
            ex.printStackTrace();
        } 
    }
    
    public void actualizarUsuario(Usuario u) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql =  "UPDATE usuario SET dni=?, nombre=?, apellidos=?, correo=? WHERE cod ='"+u.getCod()+"'";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, u.getDni());
            st.setString(2, u.getNombre());
            st.setString(3, u.getApellidos());
            st.setString(4, u.getCorreo());
            st.executeUpdate();
            System.out.println("Usuario actualizado exitosamente.");
        } catch (Exception ex) {
            ex.printStackTrace();
        } 
    }
    
    public boolean eliminarUsuario(String codigo) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "delete from usuario where cod = '"+codigo+"'";
            PreparedStatement st = cn.prepareStatement(sql);
            st.executeUpdate();
            
             System.out.println("Usuario eliminado exitosamente.");
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } 
    }
    
    //Buscar por Codigo
     public Usuario buscarUsuario(String cod){
        Usuario a = null;
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="SELECT cod,dni, password, nombre, apellidos, correo FROM usuario where cod=?";
            PreparedStatement st=cn.prepareStatement(sql);
            st.setString(1, cod);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                a=new  Usuario();
                a.setCod(rs.getString(1));
                a.setDni(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setNombre(rs.getString(4));
                a.setApellidos(rs.getString(5));
                a.setCorreo(rs.getString(6));
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return a;
    }
    
    //Lista de Usuarios por Rol
    public List<Usuario> LisUsuPorRol(int codrol){
        List<Usuario> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="SELECT cod, Rol_codRol, dni, password, nombre, apellidos, correo FROM usuario WHERE Rol_codRol=?";
            PreparedStatement st=cn.prepareStatement(sql);
            st.setInt(1, codrol);
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

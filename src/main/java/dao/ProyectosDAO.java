/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Proyecto;
import modelo.Usuario;
import util.MySQLConexion;

/**
 *
 * @author yosse
 */
public class ProyectosDAO {
    
    
    public List<Proyecto> ListarTodos(){
        List<Proyecto> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="SELECT codProy, nombre, codTipo, descrip_cor, descrip_lar FROM proyecto";
            PreparedStatement st=cn.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Proyecto p=new Proyecto();
                Usuario s = new  Usuario();
                p.setCod(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setTipo(rs.getString(3));
                p.setDescrip_corta(rs.getString(4));;
                p.setDescr_larga(rs.getString(5));
                lista.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
    
    
    public void agregarProyecto(Proyecto proyecto) {
    Connection cn = MySQLConexion.getConexion();
    try {
        String sql = "INSERT INTO proyecto (nombre, codTipo, descrip_cor, descrip_lar) VALUES (?, ?, ?, ?)";
        PreparedStatement st = cn.prepareStatement(sql);
        st.setString(1, proyecto.getNombre());
        st.setString(2, proyecto.getTipo());
        st.setString(3, proyecto.getDescrip_corta());
        st.setString(4, proyecto.getDescr_larga());
        st.executeUpdate();
        
        System.out.println("Proyecto agregado exitosamente.");
        } catch (Exception ex) {
            ex.printStackTrace();
        } 
    }
         
     //corregir
  
    
    
    public boolean eliminarProyecto(String codigo) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "delete from proyecto where codProy= '"+codigo+"'";
            PreparedStatement st = cn.prepareStatement(sql);
            st.executeUpdate();
            
             System.out.println("Proyecto eliminado exitosamente.");
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } 
    }
      
    
    //Buscar por Codigo
     public Proyecto buscarProyecto(String cod){
        Proyecto a = null;
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="SELECT codProy, nombre, codTipo, descrip_cor, descrip_lar FROM proyecto where codProy=?";
            PreparedStatement st=cn.prepareStatement(sql);
            st.setString(1, cod);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                a=new  Proyecto();
                a.setCod(rs.getString(1));
                a.setNombre(rs.getString(2));
                a.setTipo(rs.getString(3));
                a.setDescrip_corta(rs.getString(4));
                a.setDescr_larga(rs.getString(5));
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return a;
    }
     
     public void actualizarProyecto(Proyecto p) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql =  "UPDATE proyecto SET codProy=?, nombre=?, codTipo=?, descrip_cor=?, descrip_lar=?  WHERE codProy ='"+p.getCod()+"'";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, p.getCod());
            st.setString(2, p.getNombre());
            st.setString(3, p.getTipo());
            st.setString(4, p.getDescrip_corta());
            st.setString(5, p.getDescr_larga());
            st.executeUpdate();
            System.out.println("Proyecto actualizado exitosamente.");
        } catch (Exception ex) {
            ex.printStackTrace();
        } 
    }
    
     
    public List<Proyecto> ListarPorTipo(String codrol){
        List<Proyecto> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="SELECT codProy, codTipo, nombre, descrip_cor, descrip_lar FROM proyecto WHERE codTipo=?";
            PreparedStatement st=cn.prepareStatement(sql);
            st.setString(1, codrol);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Proyecto p=new Proyecto();
                p.setCod(rs.getString(1));
                p.setTipo(rs.getString(2));
                p.setNombre(rs.getString(3));
                p.setDescrip_corta(rs.getString(4));
                p.setDescr_larga(rs.getString(5));
                lista.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
    
    
}

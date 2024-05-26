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
        String sql = "INSERT INTO proyecto (codProy, nombre, codTipo, descrip_cor, descrip_lar) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement st = cn.prepareStatement(sql);
        st.setString(1, proyecto.getCod());
        st.setString(2, proyecto.getNombre());
        st.setString(3, proyecto.getTipo());
        st.setString(4, proyecto.getDescrip_corta());
        st.setString(5, proyecto.getDescr_larga());
        st.executeUpdate();
        
        System.out.println("Proyecto agregado exitosamente.");
        } catch (Exception ex) {
            ex.printStackTrace();
        } 
    }
         
     //corregir
  public void cambio(Proyecto p){
     Connection cn = MySQLConexion.getConexion();
     try{
         String sql="{call modificarProyecto(?,?,?,?,?,?)}";
         CallableStatement st=cn.prepareCall(sql);
        st.setString(1, p.getCod());
        st.setString(2, p.getDescrip_corta());
        st.setString(3, p.getDescr_larga());
        st.setBytes(4, p.getImagen());
        st.setString(5, p.getNombre());
         st.executeUpdate();
     }catch(Exception ex){
         ex.printStackTrace();
     }
 }
  
  //Borrar
  
 public void borra(String cod){
     Connection cn = MySQLConexion.getConexion();
     try{
         String sql="{call spDelAlu(?)}";
         CallableStatement st=cn.prepareCall(sql);
         st.setString(1, cod);
         st.executeUpdate();
     }catch(Exception ex){
         ex.printStackTrace();
     }
 }
    
    
    
}

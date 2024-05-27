/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Proyecto;
import modelo.tipoProyecto;
import util.MySQLConexion;

/**
 *
 * @author yosse
 */
public class tipoProyectDAO {
    public List<tipoProyecto> ListarTodos(){
        List<tipoProyecto> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="SELECT codTipo,nomTipo FROM tipoproyecto";
            PreparedStatement st=cn.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                tipoProyecto t=new tipoProyecto();
                t.setCodTipo(rs.getString(1));
                t.setNomTipo(rs.getString(2));
                lista.add(t);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
    
    
        public List<tipoProyecto> mostrarGraficoTipo() {
        List<tipoProyecto> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call contarProyectosPorTipo()}";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                tipoProyecto v = new tipoProyecto();
                v.setCodTipo(rs.getString(1));
                v.setNomTipo(rs.getString(2));

                Proyecto proy = new Proyecto();
                proy.setCantidad(rs.getInt(3)); // Capturar la cantidad de proyectos

                v.setProyecto(proy); // Asocia el proyecto con el tipo de proyecto

                lista.add(v);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return lista;
    }
}

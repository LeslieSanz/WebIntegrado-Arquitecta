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
}

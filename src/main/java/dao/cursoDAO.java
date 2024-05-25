package dao;

import modelo.Curso;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.MySQLConexion;

public class cursoDAO {

    public List<Curso> listarTodos() {
        List<Curso> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = MySQLConexion.getConexion();
            String sql = "SELECT codCurso, nombreCurso, precio, Categoria_cosCat FROM curso";
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Curso c = new Curso();
                c.setIdCurso(rs.getInt("codCurso"));
                c.setNombre(rs.getString("nombreCurso"));            
                c.setPrecio(rs.getDouble("precio"));
                c.setCategoría(rs.getString("Categoria_cosCat"));
                lista.add(c);
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // Consider using a logger here
        } finally {
            // Cerrar ResultSet, PreparedStatement y Connection aquí
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace(); // Consider using a logger here
            }
        }
        return lista;
    }
    
     public boolean insertarCurso(Curso curso) {
        Connection cn = null;
        PreparedStatement st = null;
        try {
            cn = MySQLConexion.getConexion();
            String sql = "INSERT INTO curso (nombreCurso, precio, Categoria_cosCat) VALUES (?, ?, ?)";
            st = cn.prepareStatement(sql);
            st.setString(1, curso.getNombre());
            st.setDouble(2, curso.getPrecio());
            st.setString(3, curso.getCategoría());
            int resultado = st.executeUpdate();
            return resultado > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public boolean actualizarCurso(Curso curso) {
        Connection cn = null;
        PreparedStatement st = null;
        try {
            cn = MySQLConexion.getConexion();
            String sql = "UPDATE curso SET nombreCurso = ?, precio = ?, Categoria_cosCat = ? WHERE codCurso = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, curso.getNombre());
            st.setDouble(2, curso.getPrecio());
            st.setString(3, curso.getCategoría());
            st.setInt(4, curso.getIdCurso());
            int resultado = st.executeUpdate();
            return resultado > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public boolean eliminarCurso(int idCurso) {
        Connection cn = null;
        PreparedStatement st = null;
        try {
            cn = MySQLConexion.getConexion();
            String sql = "DELETE FROM curso WHERE codCurso = ?";
            st = cn.prepareStatement(sql);
            st.setInt(1, idCurso);
            int resultado = st.executeUpdate();
            return resultado > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
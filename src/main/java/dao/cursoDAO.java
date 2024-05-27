package dao;

import modelo.Curso;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DetalleCompra;
import modelo.Usuario;
import util.MySQLConexion;

public class cursoDAO {
    
    public List<Curso> listarTodos(){
        List<Curso> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="SELECT codCurso, nombreCurso, precio, Categoria_codCat FROM curso";
            PreparedStatement st=cn.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Curso c = new Curso();
                c.setIdCurso(rs.getString("codCurso"));
                c.setNombre(rs.getString("nombreCurso"));            
                c.setPrecio(rs.getDouble("precio"));
                c.setCategoría(rs.getString("Categoria_codCat"));
                lista.add(c);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
    
     public boolean insertarCurso(Curso curso) {
        Connection cn = null;
        PreparedStatement st = null;
        try {
            cn = MySQLConexion.getConexion();
            String sql = "INSERT INTO curso (codCurso, nombreCurso, precio, Categoria_codCat) VALUES (?, ?, ?, ?)";
            st = cn.prepareStatement(sql);
            st.setString(1, curso.getIdCurso());
            st.setString(2, curso.getNombre());
            st.setDouble(3, curso.getPrecio());
            st.setString(4, curso.getCategoría());
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
            String sql = "UPDATE curso SET nombreCurso = ?, precio = ?, Categoria_codCat = ? WHERE codCurso = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, curso.getNombre());
            st.setDouble(2, curso.getPrecio());
            st.setString(3, curso.getCategoría());
            st.setString(4, curso.getIdCurso());
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

    public boolean eliminarCurso(String idCurso) {
    Connection cn = null;
    PreparedStatement st = null;
    try {
        cn = MySQLConexion.getConexion();
        String sql = "DELETE FROM curso WHERE codCurso = ?";
        st = cn.prepareStatement(sql);
        st.setString(1, idCurso);
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

    
    public List<Curso> ListarCursosPorCategoria(String codCat) {
    List<Curso> lista = new ArrayList<>();
    Connection cn = MySQLConexion.getConexion();
    try {
        String sql = "SELECT codCurso, nombreCurso, precio, Categoria_codCat FROM curso WHERE Categoria_codCat = ?";
        PreparedStatement st = cn.prepareStatement(sql);
        st.setString(1, codCat);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Curso curso = new Curso();
            curso.setIdCurso(rs.getString("codCurso"));
            curso.setNombre(rs.getString("nombreCurso"));
            curso.setPrecio(rs.getDouble("precio"));
            curso.setCategoría(rs.getString("Categoria_codCat"));
            lista.add(curso);
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    return lista;
}

    
    public List<DetalleCompra> ListarComprasPorCurso(String codCurso) {
        List<DetalleCompra> lista = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "SELECT codCompra, codCurso, cantidad FROM detalle_compra WHERE codCurso = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, codCurso);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DetalleCompra detalle = new DetalleCompra();
                detalle.setCodCompra(rs.getString("codCompra"));
                detalle.setCodCurso(rs.getString("codCurso"));
                detalle.setCantidad(rs.getInt("cantidad"));
                lista.add(detalle);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }
}

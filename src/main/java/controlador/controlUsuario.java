package controlador;

import dao.usuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;

public class controlUsuario extends HttpServlet {
    usuarioDAO ud=new usuarioDAO();
    Usuario usu=new Usuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int op=Integer.parseInt(request.getParameter("opc"));
        if(op==1) listarUsuarios(request,response);
        if(op==2) adicionarUsuarioAdmi(request,response);
        if(op==3) buscarUsuario(request,response);
        if(op==4) modificarUsuario(request,response);
        if(op==5) eliminarUsuario(request,response);
    }
    
    protected void listarUsuarios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("dato", ud.ListarTodos());
        String pag ="vistas.admin/crudUsuarios.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    protected void adicionarUsuarioAdmi(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Obteniendo los parámetros del request y 
        // Asignando los valores al objeto usu
        usu.setCod_rol(1);
        usu.setDni(request.getParameter("dni"));
        usu.setPassword(request.getParameter("pass"));
        usu.setNombre(request.getParameter("nom"));
        usu.setApellidos(request.getParameter("ape"));
        usu.setCorreo(request.getParameter("correo"));

        ud.agregarUsuario(usu);
        
        request.setAttribute("dato", ud.ListarTodos());
        String pag ="vistas.admin/crudUsuarios.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    protected void buscarUsuario(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        String id = request.getParameter("id");
        usu = ud.buscarUsuario(id);

        if (usu != null) {
            StringBuilder userInfo = new StringBuilder();
            userInfo.append(usu.getCod()).append(",");
            userInfo.append(usu.getDni()).append(",");
            userInfo.append(usu.getNombre()).append(",");
            userInfo.append(usu.getApellidos()).append(",");
            userInfo.append(usu.getCorreo());

            response.getWriter().write(userInfo.toString());
        } else {
            response.getWriter().write("null");
        }
    }
    
    //Actualizar un usuario pasando su codigo
    protected void modificarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String id = request.getParameter("codusu");
        usu = ud.buscarUsuario(id);
        System.out.println("Obteniendo codigo del usu a modificar: " + usu.getCod());
        
        // Asignando los valores al objeto usu
        usu.setDni(request.getParameter("dniusu"));
        usu.setNombre(request.getParameter("nomusu"));
        usu.setApellidos(request.getParameter("apeusu"));
        usu.setCorreo(request.getParameter("correousu"));

        ud.actualizarUsuario(usu);
        
        request.setAttribute("dato", ud.ListarTodos());
        String pag ="vistas.admin/crudUsuarios.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    //Borrar un usuario pasando su codigo
    protected void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String cod = request.getParameter("id");
        System.out.println("Codigo para eliminar: " + cod);
        ud.eliminarUsuario(cod);
        
        request.setAttribute("dato", ud.ListarTodos());
        String pag ="vistas.admin/crudUsuarios.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}


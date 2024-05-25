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
        if(op==2) adicionarUsuario(request,response);
    }
    
    protected void listarUsuarios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("dato", ud.ListarTodos());
        String pag ="vistas.admin/crudUsuarios.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    protected void adicionarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        usu.setCod(request.getParameter("cod"));
        usu.setCod_rol(Integer.parseInt(request.getParameter("codrol")));
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

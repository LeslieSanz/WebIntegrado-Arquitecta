/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import dao.ProyectosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Proyecto;

/**
 *
 * @author yosse
 */
public class ProyectoControl extends HttpServlet {

    ProyectosDAO pDAO=new ProyectosDAO();
    Proyecto proy=new Proyecto();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int op=Integer.parseInt(request.getParameter("opc"));
        if(op==1) listarUsuarios(request,response);
//        if(op==2) (request,response);
    }
    
    protected void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("dato", pDAO.ListarTodos());
        String pag ="vistas.admin/crudProyectos.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
//    protected void adicionarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        proy.setCod(Integer.parseInt(request.getParameter("codrol")));
//        proy.setNombre(request.getParameter("dni"));
//        proy.setDescrip_corta(request.getParameter("dni"));
//        proy.setDescr_larga(request.getParameter("pass"));
//        proy.setImagen(Bytes.parseByte(request.getParameter("codrol")));
//        proy.getCodUsu().setCod(request.getParameter("ape"));
//        
//        pDAO.agregarProyecto(proy);
//        
//        request.setAttribute("dato", pDAO.ListarTodos());
//        String pag ="vistas.admin/crudUsuarios.jsp";
//        request.getRequestDispatcher(pag).forward(request, response);
//    }
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

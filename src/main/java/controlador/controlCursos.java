/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import dao.cursoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Curso;

/**
 *
 * @author luism
 */
public class controlCursos extends HttpServlet {

    cursoDAO cursoDAO = new cursoDAO();
    Curso curso = new Curso();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int op=Integer.parseInt(request.getParameter("opc"));
        if(op==1) listarCursos(request,response);
        if(op==2) insertarCurso(request,response);
        if(op==3) actualizarCurso(request,response);
        if(op==4) eliminarCurso(request,response);
    }

    protected void listarCursos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");      
        List<Curso> cursos = cursoDAO.listarTodos();
        request.setAttribute("dato", cursos);     
        // Verificación de los datos recibidos
        System.out.println("Cursos recibidos: ");
        for (Curso curso : cursos) {
            System.out.println("Código: " + curso.getIdCurso()+ ", Nombre: " + curso.getNombre());
        }
        String pag ="vistas.admin/crudCursos.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
     
    
      protected void insertarCurso(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
        
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String categoria = request.getParameter("categoria");

            Curso nuevoCurso = new Curso();
            nuevoCurso.setIdCurso(codigo);
            nuevoCurso.setNombre(nombre);
            nuevoCurso.setPrecio(precio);
            nuevoCurso.setCategoría(categoria);

                boolean insercionExitosa = cursoDAO.insertarCurso(nuevoCurso);

            if (insercionExitosa) {
                  System.out.println("Curso insertado correctamente");
              } else {
                  System.out.println("Error al insertar el curso");
         }

        listarCursos(request, response);
    }

        protected void actualizarCurso(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    
            String idCurso = request.getParameter("idCurso");
            String nombre = request.getParameter("nombre");
         double precio = Double.parseDouble(request.getParameter("precio"));
           String categoria = request.getParameter("categoria");

        Curso cursoActualizado = new Curso();
        cursoActualizado.setIdCurso(idCurso);
        cursoActualizado.setNombre(nombre);
        cursoActualizado.setPrecio(precio);
        cursoActualizado.setCategoría(categoria);

    boolean actualizacionExitosa = cursoDAO.actualizarCurso(cursoActualizado);

        if (actualizacionExitosa) {
            System.out.println("Curso actualizado correctamente");
        } else {
            System.out.println("Error al actualizar el curso");
        }

        listarCursos(request, response);
    }

        protected void eliminarCurso(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    String idCurso = request.getParameter("idCurso");

    boolean eliminacionExitosa = cursoDAO.eliminarCurso(idCurso);

    if (eliminacionExitosa) {
        System.out.println("Curso eliminado correctamente");
    } else {
        System.out.println("Error al eliminar el curso");
    }

    listarCursos(request, response);
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

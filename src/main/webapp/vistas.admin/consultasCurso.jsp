<%-- 
    Document   : consultasCurso
    Created on : 26 may 2024, 19:11:42
    Author     : luism
--%>
<%@page import="dao.*,modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultas de Cursos y Compras</title>
        <link rel="icon" href="${pageContext.request.contextPath}/img/LOGO AZUL.png" type="image/png">
    </head>
    <body>
        <div class="app-wrapper">
            <%@ include file="menu.jsp" %>
            <main class="app-main">
                <div class="app-content-header">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <h3 class="mb-0">Consultas de Cursos y Compras</h3>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-end">
                                    <li class="breadcrumb-item"><a href="#">Consultas</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Cursos y Compras</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <form method="get">
                                    <div class="form-group">
                                        <label>Seleccione Categoría</label>
                                        <select class="form-control" name="categoria" onchange="this.form.submit()">
                                            <option>--Elegir--</option>
                                            <%
                                            categoríaDAO catDAO = new categoríaDAO();
                                            String categoriaSeleccionada = request.getParameter("categoria");
                                            for (Categoria cat : catDAO.ListarTodos()) {
                                                if (cat.getCodCat().equals(categoriaSeleccionada)) {
                                                    out.print("<option value='" + cat.getCodCat() + "' selected>" + cat.getNombre() + "</option>");
                                                } else {
                                                    out.print("<option value='" + cat.getCodCat() + "'>" + cat.getNombre() + "</option>");
                                                }
                                            }
                                            %>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Seleccione Curso</label>
                                        <select class="form-control" name="curso" onchange="this.form.submit()">
                                            <option>--Elegir--</option>
                                            <%
                                            if (categoriaSeleccionada != null) {
                                                cursoDAO cursoDAO = new cursoDAO();
                                                String cursoSeleccionado = request.getParameter("curso");
                                                for (Curso curso : cursoDAO.ListarCursosPorCategoria(categoriaSeleccionada)) {
                                                    if (curso.getIdCurso().equals(cursoSeleccionado)) {
                                                        out.print("<option value='" + curso.getIdCurso() + "' selected>" + curso.getNombre() + "</option>");
                                                    } else {
                                                        out.print("<option value='" + curso.getIdCurso() + "'>" + curso.getNombre() + "</option>");
                                                    }
                                                }
                                            }
                                            %>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead class="bg-dark-subtle">
                                    <tr>
                                        <th>Código de Compra</th>
                                        <th>Código de Curso</th>
                                        <th>Cantidad</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        if (request.getParameter("curso") != null) {
                                            String cursoSeleccionado = request.getParameter("curso");
                                            cursoDAO cursoDAO = new cursoDAO();
                                            for (DetalleCompra detalle : cursoDAO.ListarComprasPorCurso(cursoSeleccionado)) {
                                                out.print("<tr><td>" + detalle.getCodCompra() +
                                                        "<td>" + detalle.getCodCurso() +
                                                        "<td>" + detalle.getCantidad() + "</td></tr>");
                                            }
                                        }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>


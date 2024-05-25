<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cursos</title>
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
<div class="app-wrapper">
    <%@include file="menu.jsp"%>
    <%
       List<Curso> cursos = (ArrayList<Curso>) request.getAttribute("dato");
    %>
    <main class="app-main">
        <div class="app-content-header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <h3 class="mb-0">El CRUD de cursos va acá</h3>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-end">
                            <li class="breadcrumb-item"><a href="#">Curso</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Mantenimiento
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-12">
                <div class="card">
                     <div class="card-header">
                        <h3 class="card-title">Lista de Cursos</h3>
                        <a href="#" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#agregarCurso">
                            Agregar curso
                        </a>
                      </div>
                    
                    <div class="card-body">
                      <table id="example2" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                              <th>Código</th>
                              <th>Nombre</th>
                              <th>Precio</th>
                              <th>Categoría</th>
                              <th colspan="2">Acción</th>
                            </tr>
                            </thead>
                            <tbody>
                                <%
                                for(Curso c : cursos){
                                out.print("<tr><td>"+c.getIdCurso()
                                           +"<td>"+c.getNombre()
                                           +"<td>"+c.getPrecio()
                                           +"<td>"+c.getCategoría()
                                           );
                                %>
                                <td><a href="#" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#modificarCurso" onclick="editarCurso('<%=c.getIdCurso()%>', '<%=c.getNombre()%>', '<%=c.getPrecio()%>', '<%=c.getCategoría()%>')">
                                       <i class="fas fa-edit"></i>
                                </a></td>
                                <td><a href="<%=request.getContextPath()%>/controlCursos?opc=4&idCurso=<%=c.getIdCurso()%>" class="btn btn-danger btn-sm">
                                       <i class="fas fa-trash"></i>
                                </a></td>
                                <%
                                    }
                                %>
                            </tbody>
                      </table>
                      </div>
                </div>
            </div>
        </div>
        
        <!-- Modal Agregar Curso -->
        <div class="modal fade" id="agregarCurso" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Agregar curso</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="${pageContext.request.contextPath}/controlCursos?opc=2" method="post">
                    <div class="form-group">
                        <label>Código</label>
                        <input type="text" name="nombre" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" name="nombre" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Precio</label>
                        <input type="number" name="precio" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Categoría</label>
                        <input type="text" name="categoria" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary">Agregar</button>
                </form>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Modal Modificar Curso -->
        <div class="modal fade" id="modificarCurso" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar curso</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="${pageContext.request.contextPath}/controlCurso?opc=3" method="post">
                    <input type="hidden" id="idCurso" name="idCurso">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" id="nombre" name="nombre" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Precio</label>
                        <input type="number" id="precio" name="precio" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Categoría</label>
                        <input type="text" id="categoria" name="categoria" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary">Guardar cambios</button>
                </form>
              </div>
            </div>
          </div>
        </div>
    </main>
</div>

<script>
function editarCurso(id, nombre, precio, categoria) {
    document.getElementById('idCurso').value = id;
    document.getElementById('nombre').value = nombre;
    document.getElementById('precio').value = precio;
    document.getElementById('categoria').value = categoria;
}
</script>
</body>
</html>

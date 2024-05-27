<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cursos</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
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
                        <h3 class="mb-0">Mantenimiento de cursos</h3>
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
                      <table id="tablax" class="table table-striped table-hover">
                            <thead class="bg-dark-subtle">
                            <tr>
                              <th>Código</th>
                              <th>Nombre</th>
                              <th>Precio</th>
                              <th>Categoría</th>
                              <th>Editar</th>
                              <th>Eliminar</th>
                            </tr>
                            </thead>
                            <tbody>
                                <%
    for(Curso c : cursos){
%>
    <tr>
        <td><%= c.getIdCurso() %></td>
        <td><%= c.getNombre() %></td>
        <td><%= c.getPrecio() %></td>
        <td><%= c.getCategoría() %></td>
        <td>
            <a href="#" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#modificarCurso" onclick="editarCurso('<%= c.getIdCurso() %>','<%= c.getNombre() %>','<%= c.getPrecio() %>','<%= c.getCategoría() %>')">
                <i class="fas fa-edit"></i> 
            </a>
        </td>
        
        <td><a href="${pageContext.request.contextPath}/controlCursos?opc=4&id=<%=c.getIdCurso()%>" class="btn btn-danger btn-sm delete-course" data-course-id="<%=c.getIdCurso()%>">
            <i class="fas fa-trash"></i>
        </a></td>   
    </tr>
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
                        <input type="text" name="codigo" class="form-control">
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
                        <label>Categoria</label>
                        <input type="text" name="categoria" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary">Guardar</button>
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
                <form action="${pageContext.request.contextPath}/controlCursos?opc=3" method="post">
                    <div class="form-group">
                        <label>Código</label>
                        <input type="text" id="codigo" name="idCurso" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" id="nombre" name="nombre" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Precio</label>
                        <input type="number" id="precio" name="precio" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Categoria</label>
                        <input type="text" id="categoria" name="categoria" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                </form>
              </div>
            </div>
          </div>
        </div>
        
    </main>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
    <!-- DATATABLES -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
    </script>
    <!-- BOOTSTRAP -->
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
    </script>

<script>
        $(document).ready(function () {
            $('#tablax').DataTable({
                language: {
                    processing: "Tratamiento en curso...",
                    search: "Buscar&nbsp;:",
                    lengthMenu: "Agrupar de _MENU_ items",
                    info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                    infoEmpty: "No existen datos.",
                    infoFiltered: "(filtrado de _MAX_ elementos en total)",
                    infoPostFix: "",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron datos con tu busqueda",
                    emptyTable: "No hay datos disponibles en la tabla.",
                    paginate: {
                        first: "Primero",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Ultimo"
                    },
                    aria: {
                        sortAscending: ": active para ordenar la columna en orden ascendente",
                        sortDescending: ": active para ordenar la columna en orden descendente"
                    }
                },
                scrollY: 400,
                lengthMenu: [ [5,10, 25, -1], [5,10, 25, "All"] ],
            });
        });
    </script>
<script>
  
  function editarCurso(codigo, nombre, precio, categoria){
    $("#codigo").val(codigo);
    $("#nombre").val(nombre);
    $("#precio").val(precio);
    $("#categoria").val(categoria);
  }

  $(".delete-course").click(function(e){
    e.preventDefault();
    var courseId = $(this).data("course-id");
    var url = $(this).attr('href');

    swal({
      title: "¿Estás seguro?",
      text: "¡Una vez eliminado, no podrás recuperar este curso!",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        window.location.href = url;
      }
    });
  });
</script>
</body>
</html>

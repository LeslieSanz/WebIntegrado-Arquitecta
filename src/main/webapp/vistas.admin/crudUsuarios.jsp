<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    
    <body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
    <!--Inicio::App Wrapper-->
    <div class="app-wrapper">
        <%@include file="menu.jsp"%>
        <%
           List<Usuario> usuarios=(ArrayList<Usuario>)request.getAttribute("dato");
        %>
        <main class="app-main">
            <!--begin::App Content Header-->
            <div class="app-content-header">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">El CRUD de usuarios va acá</h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-end">
                                <li class="breadcrumb-item"><a href="#">Usuario</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Mantenimiento
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!--end::Row-->
                </div>
                <!--end::Container-->
            </div>
            <!--end::App Content Header--> 
            
            <!-- begin:: Main content -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                         <div class="card-header">
                            <h3 class="card-title">Se supone que debe ir texto acá</h3>
                            <a href="#" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#agregarUsuario">
                                Agregar usuario
                            </a>
                          </div>
                        
                        <div class="card-body">
                          <table id="tablax" class="table table-striped table-hover">
                                <thead class="bg-dark-subtle">
                                <tr>
                                  <th>Código</th>
                                  <th>Rol</th>
                                  <th>DNI</th>
                                  <th>Password</th>
                                  <th>Nombre</th>
                                  <th>Apellidos</th>
                                  <th>Correo</th>
                                  <th>Editar</th>
                                  <th>Eliminar</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <%
                                    for(Usuario x:usuarios){
                                    out.print("<tr><td>"+x.getCod()
                                               +"<td>"+x.getCod_rol()
                                               +"<td>"+x.getDni()
                                               +"<td>"+x.getPassword()
                                               +"<td>"+x.getNombre()
                                               +"<td>"+x.getApellidos()
                                               +"<td>"+x.getCorreo()
                                               );
                                    %>
                                    <td><a href="#" class="btn btn-warning btn-sm"  data-bs-toggle="modal" data-bs-target="#modificarUsuario">
                                           <i class="fas fa-edit"></i>
                                    </a>
                                    <td><a href="#" class="btn btn-danger btn-sm">
                                           <i class="fas fa-trash"></i>
                                    </a>
                                    <%
                                        }
                                    %>
                                
                                </table>
                          </div>
                    </div>
                </div>
            </div>
            <!-- end:: Main content -->
            
            <!-- Modal Agregar Usuario -->
            <div class="modal fade" id="agregarUsuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Agregar usuario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/controlUsuario?opc=2" method="post">
                        <div class="form-group">
                            <label>Codigo</label>
                            <input type="input" name="cod" >
                        </div>
                        <div class="form-group">
                            <label>Rol</label>
                            <input type="input" name="codrol" >
                        </div>
                        <div class="form-group">
                            <label>DNI</label>
                            <input type="input" name="dni">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="input" name="pass">
                        </div>
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="input" name="nom">
                        </div>
                        <div class="form-group">
                            <label>Apellidos</label>
                            <input type="input" name="ape">
                        </div>
                        <div class="form-group">
                            <label>Correo</label>
                            <input type="input" name="correo">
                        </div>
                      <button type="submit" class="btn btn-primary">Agregar</button>
                    </form>
                  </div>
                  
                </div>
              </div>
            </div>
            
            <!-- Modal Modificar Usuario -->
            <div class="modal fade" id="modificarUsuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modificar usuario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    ...
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Guardar cambios</button>
                  </div>
                </div>
              </div>
            </div>
            
        </main>
        <!--end::App Main-->
       
        
    </div>
    <!--end::App Wrapper-->
    
     <!-- JQUERY -->
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
    
    </body>
</html>

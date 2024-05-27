<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
        <link rel="icon" href="${pageContext.request.contextPath}/img/LOGO AZUL.png" type="image/png">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
                            <h3 class="mb-0">Mantenimiento de usuarios</h3>
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
                            <h3 class="card-title">Información básica</h3>
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
                                  <th>Nombre</th>
                                  <th>Apellidos</th>
                                  <th>Correo</th>
                                  <th>Password</th>
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
                                               +"<td>"+x.getNombre()
                                               +"<td>"+x.getApellidos()
                                               +"<td>"+x.getCorreo()
                                               +"<td>"+x.getPassword()
                                               
                                               );
                                    %>
                                    <td><a href="#" class="btn btn-warning btn-sm edit-user" data-user-id="<%= x.getCod()%>" data-bs-toggle="modal" data-bs-target="#modificarUsuario">
                                        <i class="fas fa-edit"></i> 
                                      </a>

                                    <td><a href="${pageContext.request.contextPath}/controlUsuario?opc=5&id=<%=x.getCod()%>" class="btn btn-danger btn-sm delete-user" data-user-id="<%=x.getCod()%>">
                                           <i class="fas fa-trash"></i>
                                            </a></td>

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
                        <div class="mb-3">
                        <label for="dni" class="form-label">DNI</label>
                        <input type="text" class="form-control" name="dni">
                        </div>
                        
                        <div class="mb-3">
                        <label for="nom" class="form-label">Nombre</label>
                        <input type="text" class="form-control" name="nom">
                        </div>
                      
                        <div class="mb-3">
                        <label for="ape" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" name="ape">
                        </div>
                      
                        <div class="mb-3">
                        <label for="correo" class="form-label">Correo</label>
                        <input type="email" class="form-control" name="correo">
                        </div>
                        
                        <div class="mb-3">
                        <label for="pass" class="form-label">Password</label>
                        <input type="text" class="form-control" name="pass">
                        </div>
                        
                      <button type="submit" class="btn btn-primary">Agregar</button>
                    </form>
                  </div>
                  
                </div>
              </div>
            </div>
            
            <!-- Modal de accion de Usuario (Puede ser agregar o editar)-->
            <div class="modal fade" id="modificarUsuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modificar usuario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/controlUsuario?opc=4" method="post">
                      
                        <input type="hidden" id="codusu" name="codusu">
                      
                      <div class="mb-3">
                        <label for="dniusu" class="form-label">DNI</label>
                        <input type="text" class="form-control" id="dniusu" name="dniusu">
                      </div>
                      <div class="mb-3">
                        <label for="nomusu" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nomusu" name="nomusu">
                      </div>
                      
                      <div class="mb-3">
                        <label for="apeusu" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" id="apeusu" name="apeusu">
                      </div>
                      
                      <div class="mb-3">
                        <label for="correousu" class="form-label">Correo</label>
                        <input type="email" class="form-control" id="correousu" name="correousu">
                      </div>
                       <button type="submit" class="btn btn-primary">Guardar</button>
                    </form>
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
    
    <!-- ESTE SCRIPT ES PARA EDITAR EL USUARIO-->
    <script>
    $(document).ready(function() {
      $('.edit-user').on('click', function() {
        var userId = $(this).data('user-id');
        console.log('El codigo que se esta obteniendo es '+userId);
        $.ajax({
          url: '${pageContext.request.contextPath}/controlUsuario?opc=3', // Asegúrate de que la URL sea correcta
          method: 'GET',
          data: { id: userId },
          success: function(response) {
            if (response !== "null") {
              var userInfo = response.split(",");
              $('#modificarUsuario #codusu').val(userInfo[0]);
              $('#modificarUsuario #dniusu').val(userInfo[1]);
              $('#modificarUsuario #nomusu').val(userInfo[2]);
              $('#modificarUsuario #apeusu').val(userInfo[3]);
              $('#modificarUsuario #correousu').val(userInfo[4]);
            } else {
              console.error('Usuario no encontrado');
            }
          },
          error: function(xhr, status, error) {
            console.error('Error al obtener los datos del usuario:', error);
          }
        });
      });
    });
    </script>
    <!-- ESTE SCRIPT ES PARA LA PAGINACION-->
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
    
    <script type="text/javascript">
    $(document).ready(function() {
        $('.delete-user').on('click', function(event) {
            event.preventDefault();
            var url = $(this).attr('href');
            var userId = $(this).data('user-id');
            
            swal({
                title: "¿Está seguro que desea eliminar el usuario seleccionado?",
                text: "Una vez eliminado no se podrá revertir los cambios",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
            .then((willDelete) => {
                if (willDelete) {
                    // Redirigir a la URL para eliminar el usuario
                    window.location.href = url;
                } else {
                    dispose();
                }
            });
        });
    });
</script>

    
    </body>
</html>

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
                          </div>
                        
                        <div class="card-body">
                          <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                  <th>Código</th>
                                  <th>Rol</th>
                                  <th>DNI</th>
                                  <th>Password</th>
                                  <th>Nombre</th>
                                  <th>Apellidos</th>
                                  <th>Correo</th>
                                  <th colspan="2">Acción</th>
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
                                    <td><a href="#" class="btn btn-warning btn-sm">
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
        </main>
        <!--end::App Main-->
       
        
    </div>
    <!--end::App Wrapper-->
    </body>
</html>

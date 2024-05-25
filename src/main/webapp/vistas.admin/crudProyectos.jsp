<%-- 
    Document   : crudProyectos
    Created on : 24 may 2024, 23:51:34
    Author     : yosse
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../bootstrap/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
    <!--Inicio::App Wrapper-->
    <div class="app-wrapper">
        <%@include file="menu.jsp"%>
        <%
           List<Proyecto> proyecto=(ArrayList<Proyecto>)request.getAttribute("dato");
        %>
        <main class="app-main">
            <!--begin::App Content Header-->
            <div class="app-content-header">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">El CRUD de Proyectos va acá</h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-end">
                                <li class="breadcrumb-item"><a href="#">Proyectos</a></li>
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
                                Agregar proyecto
                            </a>
                          </div>
                        
                        <div class="card-body">
                          <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                  <th>Código</th>
                                  <th>Nombre</th>
                                  <th>Descripción Corta</th>
                                  <th>Descripción Larga</th>
                                  <th>Imagen</th>
                                  <th>Nombre</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <%
                                    for(Proyecto x: proyecto){
                                    out.print("<tr><td>"+x.getCod()
                                               +"<td>"+x.getNombre()
                                               +"<td>"+x.getDescrip_corta()
                                               +"<td>"+x.getDescr_larga()
                                               +"<td>"+x.getImagen()
                                               );
                                    %>
                                    <td><a href="#" class="btn btn-warning btn-sm"  data-bs-toggle="modal" data-bs-target="#modificarProyecto">
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
            
            <!-- Modal Agregar Proyecto -->
            <div class="modal fade" id="agregarProyecto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Agregar Proyecto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/ProyectoControl?opc=2" method="post">
                        <div class="form-group">
                            <label>Codigo</label>
                            <input type="input" name="cod" >
                        </div>
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="input" name="codrol" >
                        </div>
                        <div class="form-group">
                            <label>Descripción corta</label>
                            <input type="input" name="dni">
                        </div>
                        <div class="form-group">
                            <label>Descripción corta</label>
                            <input type="input" name="pass">
                        </div>
                        <div class="form-group">
                            <label>Imagen</label>
                            <input type="input" name="nom">
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
  
    </body>
</html>

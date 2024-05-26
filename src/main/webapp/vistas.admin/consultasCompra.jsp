<%@page import="dao.*,modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cursos</title>
    </head>
    <body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
    <!--Inicio::App Wrapper-->
    <div class="app-wrapper">
        <%@include file="menu.jsp"%>
        <%
            usuarioDAO ud = new usuarioDAO();
            rolDAO rd = new rolDAO();
            int codrol = 0;
            String codusu ="";
            if(request.getParameter("cbe")!=null){
                codrol = Integer.parseInt(request.getParameter("cbe"));
            }
            if(request.getParameter("cba")!=null){
                codusu = request.getParameter("cba");
            }
        %>
        <main class="app-main">
            <!--begin::App Content Header-->
            <div class="app-content-header">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">Aca se consultan las compras de los usuarios</h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-end">
                                <li class="breadcrumb-item"><a href="#">Compras</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Consultas
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
                            <form>
                                <!--Para listar los roles en el primer comboBox -->
                                <div class="form-group">
                                    <label>Seleccione rol</label>
                                    <select class="form-control" name="cbe" onchange="submit()">
                                        <option>--Elegir--</option>
                                      <%
                                     for (Rol x:rd.ListarTodos()){
                                         if(codrol == x.getCodRol()){
                                           out.print("<option value="+x.getCodRol()+" selected>"+x.getNombre());
                                         }else{
                                           out.print("<option value="+x.getCodRol()+">"+x.getNombre());
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
                                  <th>Código</th>
                                  <th>Rol</th>
                                  <th>DNI</th>
                                  <th>Password</th>
                                  <th>Nombre</th>
                                  <th>Apellidos</th>
                                  <th>Correo</th>
                                  <th>Ver compras</th>
                                </tr>
                                </thead>
                                
                                <tbody>
                                    <%
                                        for(Usuario x: ud.LisUsuPorRol(codrol)){
                                        out.print("<tr><td>"+x.getCod()
                                                    +"<td>"+x.getCod_rol()
                                                    +"<td>"+x.getDni()
                                                    +"<td>"+x.getPassword()
                                                    +"<td>"+x.getNombre()
                                                    +"<td>"+x.getApellidos()
                                                    +"<td>"+x.getCorreo()
                                                    );
                                            

                                        %>
                                   <td><a href="control?opc=5&id=" 
                                   class="btn btn-primary">
                                    <i class="fa-solid fa-shop"></i>
                                </a> 
                                <% 
                                    }
                                %>
                                </tbody>
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
</html>

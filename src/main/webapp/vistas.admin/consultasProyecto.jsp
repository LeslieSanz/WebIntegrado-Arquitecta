<%@page import="dao.*,modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultas | Proyectos </title>
        <link rel="icon" href="${pageContext.request.contextPath}/img/LOGO AZUL.png" type="image/png">
    </head>
    <body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
    <!--Inicio::App Wrapper-->
    <div class="app-wrapper">
        <%@include file="menu.jsp"%>
        <%
            ProyectosDAO p = new ProyectosDAO();
            tipoProyectDAO tP = new tipoProyectDAO();
            String codrol = "";
            String codPro ="";
            if(request.getParameter("cbe")!=null){
                codrol = request.getParameter("cbe");
            }
            if(request.getParameter("cba")!=null){
                codPro = request.getParameter("cba");
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
                            <h3 class="mb-0">Consulta de Proyectos</h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-end">
                                <li class="breadcrumb-item"><a href="#">Proyectos</a></li>
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
                                    <label>Seleccione tipo de Proyecto</label>
                                    <select class="form-control" name="cbe" onchange="submit()">
                                        <option>--Elegir--</option>
                                      <%
                                     for (tipoProyecto x:tP.ListarTodos()){
                                         if(codrol == x.getCodTipo()){
                                           out.print("<option value="+x.getCodTipo()+" selected>"+x.getNomTipo());
                                         }else{
                                           out.print("<option value="+x.getCodTipo()+">"+x.getNomTipo());
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
                                  <th>Tipo</th>
                                  <th>Nombre</th>
                                  <th>Descripción Corta</th>
                                  <th>Descripción Larga</th>
                                </tr>
                                </thead>
                                
                                <tbody>
                                    <%
                                        for(Proyecto x: p.ListarPorTipo(codrol)){
                                        out.print("<tr><td>"+x.getCod()
                                                    +"<td>"+x.getTipo()
                                                    +"<td>"+x.getNombre()
                                                    +"<td>"+x.getDescrip_corta()
                                                    +"<td>"+x.getDescr_larga()
                                                    );
                                            
                                        if(x.getTipo()== "T001"){ //Si es admin, van a mostrarse los proyectos que ha agregado
                                        %>
                                        
                                       <% } else if(x.getTipo()== "T002"){  //
                                       %>
                                      
                                       <% } else if(x.getTipo()== "T003"){  //
                                       %>
                                      
                                       
                                   
                                <% 
                                    }
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

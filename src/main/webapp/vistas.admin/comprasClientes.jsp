<%@page import="modelo.Compra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras</title>
        <link rel="icon" href="${pageContext.request.contextPath}/img/LOGO AZUL.png" type="image/png">
    </head>
    <body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
    <!--Inicio::App Wrapper-->
    <div class="app-wrapper">
        <%@include file="menu.jsp"%>
        <%
           List<Compra> compras=(ArrayList<Compra>)request.getAttribute("dato");
           String nomusu=(String) request.getParameter("nomusu");
        %>
        <main class="app-main">
            <!--begin::App Content Header-->
            <div class="app-content-header">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0"></h3>
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
                            <h3 class="card-title">Lista de compras de <%=nomusu%></h3>
                          </div>
                        
                        <div class="card-body">
                          <table id="tablax" class="table table-striped table-hover">
                              <thead class="bg-dark-subtle">
                                  <th>Código de compra
                                  <th>Fecha
                                  <th>Monto total
                              </thead>
                                 <%
                                    for(Compra x:compras){
                                    out.print("<tr><td>"+x.getCod()
                                               +"<td>"+x.getFecha()
                                               +"<td>"+x.getMonto()
                                               );
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

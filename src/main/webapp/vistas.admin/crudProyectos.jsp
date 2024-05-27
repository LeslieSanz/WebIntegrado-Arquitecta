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
                List<Proyecto> proyecto = (ArrayList<Proyecto>) request.getAttribute("dato");
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
                                <a href="#" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#agregarProyecto">
                                    Agregar proyecto
                                </a>
                            </div>

                            <div class="card-body">
                                <table id="tablax" class="table table-striped table-hover">
                                    <thead class="bg-dark-subtle">
                                        <tr>
                                            <th>Código</th>
                                            <th>Nombre</th>
                                            <th>Tipo de Proyecto</th>
                                            <th>Descripción Corta</th>
                                            <th>Descripción Larga</th>
                                            <th>Editar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (Proyecto x : proyecto) {
                                                out.print("<tr><td>" + x.getCod()
                                                        + "<td>" + x.getNombre()
                                                        + "<td>" + x.getTipo()
                                                        + "<td>" + x.getDescrip_corta()
                                                        + "<td>" + x.getDescr_larga()
                                                );
                                        %>
                                    <td><a href="#" class="btn btn-warning btn-sm edit-user" data-user-id="<%= x.getCod()%>" data-bs-toggle="modal" data-bs-target="#modificarProyecto">
                                            <i class="fas fa-edit"></i> 
                                        </a>

                                    <td><a href="${pageContext.request.contextPath}/ProyectoControl?opc=5&id=<%=x.getCod()%>" class="btn btn-danger btn-sm">
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

                <!-- Modal Agregar Curso -->
                <div class="modal fade" id="agregarProyecto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Agregar Proyecto</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="${pageContext.request.contextPath}/ProyectoControl?opc=2" method="post">

                                    <div class="mb-3">
                                        <label for="nom" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" name="nom" id="nom">
                                    </div>

                                    <div class="mb-3">
                                        <label for="tipo" class="form-label">Tipo</label>
                                        <select class="form-control" name="tipo" id="tipo">
                                            <option value="T001">T001</option>
                                            <option value="T002">T002</option>
                                            <option value="T003">T003</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="dC" class="form-label">Descripción Corta</label>
                                        <textarea class="form-control" name="dC" id="dC"></textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label for="dL" class="form-label">Descripción Larga</label>
                                        <textarea class="form-control" name="dL" id="dL"></textarea>
                                    </div>

                                    <button type="submit" class="btn btn-primary">Agregar</button>
                                </form>

                            </div>

                        </div>
                    </div>
                </div>

                <!-- Modal Modificar Usuario -->
                <div class="modal fade" id="modificarProyecto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modificar Proyecto</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="${pageContext.request.contextPath}/ProyectoControl?opc=4" method="post">
                                    <input type="hidden" id="cod" name="cod">

                                    <div class="mb-3">
                                        <label for="nom" class="form-label">Nombre Proyecto</label>
                                        <input type="text" class="form-control" id="nom" name="nom">
                                    </div>

                                    <div class="mb-3">
                                        <label for="tipoLabel" class="form-label">Tipo</label>
                                        <select class="form-control" id="tipo" name="tipo" onchange="updateLabel()">
                                            <option value="T001">T001</option>
                                            <option value="T002">T002</option>
                                            <option value="T003">T003</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="dC" class="form-label">Descripción Corta</label>
                                        <textarea class="form-control" id="dC" name="dC"></textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label for="dL" class="form-label">Descripción Larga</label>
                                        <textarea class="form-control" id="dL" name="dL"></textarea>
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

        <script>
            function updateLabel() {
                var tipoSelect = document.getElementById('tipo');
                var tipoLabel = document.querySelector('label[for="tipoLabel"]');
                tipoLabel.innerText = 'Tipo: ' + tipoSelect.value;
            }

            // Llamada inicial para mostrar el valor seleccionado al cargar la página
            document.addEventListener('DOMContentLoaded', function () {
                updateLabel();
            });
        </script>

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

        <!-- ESTE SCRIPT ES PARA EDITAR EL PROYECTO-->
        <script>
            $(document).ready(function () {
                $('.edit-user').on('click', function () {
                    var userId = $(this).data('user-id');
                    console.log('El codigo que se esta obteniendo es ' + userId);
                    $.ajax({
                        url: '${pageContext.request.contextPath}/ProyectoControl?opc=3', // Asegúrate de que la URL sea correcta
                        method: 'GET',
                        data: {id: userId},
                        success: function (response) {
                            if (response !== "null") {
                                var userInfo = response.split(",");
                                $('#modificarProyecto #cod').val(userInfo[0]);
                                $('#modificarProyecto #nom').val(userInfo[1]);
                                $('#modificarProyecto #tipo').val(userInfo[2]);
                                $('#modificarProyecto #dC').val(userInfo[3]);
                                $('#modificarProyecto #dL').val(userInfo[4]);
                            } else {
                                console.error('Proyecto no encontrado');
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error('Error al obtener los datos del Proyecto', error);
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
                    lengthMenu: [[5, 10, 25, -1], [5, 10, 25, "All"]],
                });
            });
        </script>


    </body>
</html>

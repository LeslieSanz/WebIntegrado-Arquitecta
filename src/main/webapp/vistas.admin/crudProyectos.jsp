<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CRUD Proyectos</title>
    <link href="../bootstrap/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
    <div class="app-wrapper">
        <%@include file="menu.jsp"%>
        <%
            List<Proyecto> proyecto = (ArrayList<Proyecto>) request.getAttribute("dato");
        %>
        <main class="app-main">
            <div class="app-content-header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">El CRUD de Proyectos va acá</h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-end">
                                <li class="breadcrumb-item"><a href="#">Proyectos</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Mantenimiento</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Lista de Proyectos</h3>
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
                                </td>
                                <td><a href="${pageContext.request.contextPath}/ProyectoControl?opc=5&id=<%=x.getCod()%>" class="btn btn-danger btn-sm delete-user">
                                     <i class="fas fa-trash"></i>
                                  </a>
                                </td>
                                    <%
                                        }
                                    %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

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
    </div>

    <script>
        function updateLabel() {
            var tipoSelect = document.getElementById('tipo');
            var tipoLabel = document.querySelector('label[for="tipoLabel"]');
            tipoLabel.innerText = 'Tipo: ' + tipoSelect.value;
        }

        $(document).ready(function () {
            updateLabel();

            $(document).on('click', '.edit-user', function () {
                var userId = $(this).data('user-id');
                $.ajax({
                    url: '${pageContext.request.contextPath}/ProyectoControl?opc=3',
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

            $('#tablax').DataTable({
                language: {
                    processing: "Tratamiento en curso...",
                    search: "Buscar&nbsp;:",
                    lengthMenu: "Agrupar de _MENU_ items",
                    info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                    infoEmpty: "No existen datos.",
                    infoFiltered: "(filtrado de _MAX_ elementos en total)",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron datos con tu búsqueda",
                    emptyTable: "No hay datos disponibles en la tabla.",
                    paginate: {
                        first: "Primero",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Último"
                    },
                    aria: {
                        sortAscending: ": activar para ordenar la columna en orden ascendente",
                        sortDescending: ": activar para ordenar la columna en orden descendente"
                    }
                },
                scrollY: 400,
                lengthMenu: [[5, 10, 25, -1], [5, 10, 25, "All"]],
            });

            $(document).on('click', '.delete-user', function (event) {
                event.preventDefault();
                var url = $(this).attr('href');
                swal({
                    title: "¿Está seguro que desea eliminar el proyecto seleccionado?",
                    text: "Una vez eliminado no se podrá revertir los cambios",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                }).then((willDelete) => {
                    if (willDelete) {
                        window.location.href = url;
                    }
                });
            });
        });
    </script>
</body>
</html>

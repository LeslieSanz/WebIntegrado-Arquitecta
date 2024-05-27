<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="modelo.Compra,dao.compraDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Grafico de Compras</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
    <style>
        .container {
            width: 70%;
            margin: 15px auto;
        }
        body {
            text-align: center;
            color: green;
        }
        h2 {
            text-align: center;
            font-family: "Verdana", sans-serif;
            font-size: 30px;
        }
    </style>
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
    <!--Inicio::App Wrapper-->
    <div class="app-wrapper">
        <%@include file="menu.jsp"%>
        <main class="app-main">
            
            <!--begin::App Content Header-->
            <div class="app-content-header">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">Reporte de compras por año</h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-end">
                                <li class="breadcrumb-item"><a href="#">Grafico 1</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Gráficos
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!--end::Row-->
                </div>
                <!--end::Container-->
            </div>
            <!--end::App Content Header--> 
            
            <div class="row">
                
                <div class="col-lg-5 connectedSortable">
                    <div class="card text-white bg-primary bg-gradient border-primary">
                        <div class="card-header border-0">
                            <h3 class="card-title">Ingrese año</h3>
                        </div>
                        
                        <div class="card-body">
                            <form method="GET" class="form">
                                <div class="form-group">
                                    <label for="year">Ingrese año:</label>
                                    <input type="number" name="tan" id="year" required>
                                </div>
                                <div class="form-group">
                                    <input type="radio" name="opc" id="bar" value="bar" required>
                                    <label for="bar">Barras</label>

                                    <input type="radio" name="opc" id="pie" value="pie">
                                    <label for="pie">Círculo</label>

                                    <input type="radio" name="opc" id="line" value="line">
                                    <label for="line">Lineal</label>
                                </div>
                                <button type="submit" class="btn btn-success">Generar Gráfico</button>
                            </form>
                        </div>
                    </div>
                    
                    <div class="card">
                        <div class="card-body">
                            <table id="tablax" class="table table-striped table-hover">
                            <thead class="bg-dark-subtle">
                                <tr>
                                    <th>Mes</th>
                                    <th>Monto recaudado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% String anParam1 = request.getParameter("tan");
                                    String tipo1 = request.getParameter("opc");
                                    if (anParam1 != null && tipo1 != null) {
                                        compraDAO obj = new compraDAO();
                                        int an = Integer.parseInt(anParam1);
                                        for (Compra x : obj.LisComprasPorMes(an)) {
                                %>
                                <tr>
                                    <td><%= x.Lmes() %></td>
                                    <td><%= x.getTotalPorMes() %></td>
                                </tr>
                                <%      }
                                    }
                                %>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div> 
                
                <div class="col-lg-7 connectedSortable">
                     <% 
                    String anParam = request.getParameter("tan");
                    String tipo = request.getParameter("opc");
                    if (anParam != null && tipo != null) {
                        compraDAO obj = new compraDAO();
                        int an = Integer.parseInt(anParam);
                        String label = "", data = "";
                        for (Compra x : obj.LisComprasPorMes(an)) {
                            label += "'" + x.Lmes() + "',";
                            data += x.getTotalPorMes() + ",";
                        }
                        if (data.length() > 0) {
                            data = data.substring(0, data.length() - 1);
                        }
                        if (label.length() > 0) {
                            label = label.substring(0, label.length() - 1);
                        }
                    %>
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title"><strong>Grafico de ventas del año <%=an%></strong></h3>
                        </div>
                        <div class="card-body">
                            <canvas id="myChart"></canvas>
                        </div>
                    </div>
                </div>
                        
                
            </div>
        </main>
    </div>
</body>
    

    <script>
        console.log("Tipo: <%= tipo %>");
        console.log("Labels: [<%= label %>]");
        console.log("Data: [<%= data %>]");
        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: "<%= tipo %>",
            data: {
                labels: [<%= label %>],
                datasets: [{
                    label: "Ventas",
                    data: [<%= data %>],
                    backgroundColor: ["rgba(153,205,1,0.6)", "orange", "peru", "yellow", "lightblue", "lightgreen", "red"]
                }]
            }
        });
    </script>

    <% 
        }
    %>

</body>
</html>

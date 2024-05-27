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
            <div class="row">
                <div class="col-4">
                    <div class="card">
                        
                            
                            <form method="GET">
                                Ingrese año: <input name="tan">
                                <br>
                                <input type="radio" name="opc" value="bar"> Barras
                                <input type="radio" name="opc" value="pie"> Circulo
                                <input type="radio" name="opc" value="line"> Lineal
                                <input type="submit" value="Generar Grafico">
                            </form>
                        
                    <table> 
                        <thead class="bg-dark-subtle">
                                <tr>
                                  <th>Mes</th>
                                  <th>Monto total</th>
                                </tr>
                        </thead>
                    </table>
                    </div>
                    
                </div>
                
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
                
                <div class="col-8">
                    <div class="card">
                        <div class="container">
                            <h2>Grafico de ventas del año <%= an %></h2>
                            <div>
                                <canvas id="myChart"></canvas>
                            </div>
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

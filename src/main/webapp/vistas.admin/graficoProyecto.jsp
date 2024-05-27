<%@page import="modelo.tipoProyecto"%>
<%@page import="dao.tipoProyectDAO"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="modelo.Compra,dao.compraDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Gráfico de Proyectos</title>
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
    <body>
        <div class="app-wrapper">
            <%@include file="menu.jsp" %>
            <main class="app-main">
                <div class="row">
                    <div class="col-4">
                        <div class="card">
                            <form method="GET">
                                <br>
                                <input type="radio" name="opc" value="pie"> Circular
                                <input type="submit" value="Generar Gráfico">
                            </form>
                        </div>
                    </div>

                    <%
                        String tipo = request.getParameter("opc");
                        if (tipo != null) {
                            tipoProyectDAO obj = new tipoProyectDAO();
                            String label = "", data = "";
                            for (tipoProyecto tp : obj.mostrarGraficoTipo()) {
                                label += "'" + tp.getNomTipo() + "',";
                                data += tp.getProyecto().getCantidad() + ",";
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
                                <h2>Gráfico de Proyectos por Tipo</h2>
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
                console.log("Tipo: <%= tipo%>");
                console.log("Labels: [<%= label%>]");
                console.log("Data: [<%= data%>]");
            var ctx = document.getElementById("myChart").getContext("2d");
            var myChart = new Chart(ctx, {
                type: "<%= tipo%>",
                data: {
                    labels: [<%= label%>],
                    datasets: [{
                            label: "Cantidad de Proyectos",
                            data: [<%=data%>],
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

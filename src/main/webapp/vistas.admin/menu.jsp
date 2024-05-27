<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Dashboard</title>
        <link rel="icon" href="${pageContext.request.contextPath}/img/LOGO AZUL.png" type="image/png">
        <!--Meta Tags-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="ColorlibHQ">

        <!--Fuentes-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

        <!--Plugin para las barras de desplazamiento (OverlayScrollbars)-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.1.0/styles/overlayscrollbars.min.css" integrity="sha256-LWLZPJ7X1jJLI5OG5695qDemW1qQ7lNdbTfQ64ylbUY=" crossorigin="anonymous">

        <!--Para los iconos (FontAwesome)-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.3.0/css/all.min.css" integrity="sha256-/4UQcSmErDzPCMAiuOiWPVVsNN2s3ZY/NsmXNcj0IFc=" crossorigin="anonymous">

        <!--Plugin requerido de Bootstrap(AdminLTE)-->
        <link href="${pageContext.request.contextPath}/bootstrap/adminlte.css" rel="stylesheet" type="text/css"/>
        <!--end::Required Plugin(AdminLTE)-->
        <link href="${pageContext.request.contextPath}/bootstrap/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <!-- Biblioteca de JS para los graficos -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.css" integrity="sha256-4MX+61mt9NVvvuPjUWdUdyfZfxSB1/Rf9WtqRHgG5S0=" crossorigin="anonymous">

        <!-- Bibliteca JS para los mapas -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/jsvectormap@1.5.3/dist/css/jsvectormap.min.css" integrity="sha256-+uGLJmmTKOqBr+2E6KDYs/NRsHxSkONXFHUL0fy2O/4=" crossorigin="anonymous">
    </head>


<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
        <nav class="app-header navbar navbar-expand bg-body">
            <!--Inicio::Container-->
            <div class="container-fluid">
                 <!--Inicio::Navbar Superior-->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-lte-toggle="sidebar" href="#" role="button">
                            <i class="fa-solid fa-bars"></i>
                        </a>
                    </li>
                    <li class="nav-item d-none d-md-block">
                        <a href="#" class="nav-link">Inicio</a>
                    </li>
                    <li class="nav-item d-none d-md-block">
                        <a href="#" class="nav-link">Contacto</a>
                    </li>
                </ul>
                <!--Fin::Navbar superior-->

                <!--Inicio::End Navbar Links-->
                <ul class="navbar-nav ms-auto">
                    <!--Inicio::Navbar Search-->
                    <li class="nav-item">
                        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                            <i class="fa-solid fa-search"></i>
                        </a>
                    </li>
                    <!--Fin::Navbar Search-->

                    <!--Inicio::User Menu Dropdown-->
                    <li class="nav-item dropdown user-menu">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img src="${pageContext.request.contextPath}/img/user.png" class="user-image rounded-circle shadow" alt="User Image">
                            <span class="d-none d-md-inline">Luis Miguel Paz</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
                            <!--begin::User Image-->
                            <li class="user-header text-bg-primary">
                                <img src="${pageContext.request.contextPath}/img/user.png" class="rounded-circle shadow" alt="User Image">
                                <p>
                                    Luis Miguel Paz - Web Developer
                                    <small>Member since Nov. 2023</small>
                                </p>
                            </li>
                            <!--Fin::User Image-->
                            
                            <!--Inicio::Menu Body-->
                            <li class="user-body">
                                <!--Inicio::Row-->
                                <div class="row">
                                    <div class="col-4 text-center">
                                        <a href="#">Seguidores</a>
                                    </div>
                                    <div class="col-4 text-center">
                                        <a href="#">Ventas</a>
                                    </div>
                                    <div class="col-4 text-center">
                                        <a href="#">Amigos</a>
                                    </div>
                                </div>
                                <!--Fin::Row-->
                            </li>
                            <!--Inicio::Menu Body-->
                            <!--Fin::Menu Footer-->
                            <li class="user-footer">
                                <a href="#" class="btn btn-default btn-flat">Perfil</a>
                                <a href="#" class="btn btn-default btn-flat float-end">Cerrar sesión</a>
                            </li>
                            <!--Fin::Menu Footer-->
                        </ul>
                    </li>
                    <!--Fin::User Menu Dropdown-->
                </ul>
                <!--Fin::End Navbar Links-->
                
            </div>
            <!--Fin::Container-->
        </nav>
        <!--end::Header-->
        
        <!--Inicio::Barra lateral-->
        <aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark">
            <!--begin::Sidebar Brand-->
            <div class="sidebar-brand">
                <!--begin::Brand Link-->
                <a href="${pageContext.request.contextPath}/vistas.admin/menu.jsp" class="brand-link">
                    <!--begin::Brand Image-->
                    <img src="${pageContext.request.contextPath}/img/LOGO BLANCO.png" alt="Logo" class="brand-image opacity-75 shadow">
                    <!--end::Brand Image-->
                    <!--begin::Brand Text-->
                    <span class="brand-text fw-light"><strong>Lizbet Huamani</strong></span>
                    <!--end::Brand Text-->
                </a>
                <!--end::Brand Link-->
            </div>
            <!--end::Sidebar Brand-->
            <!--begin::Sidebar Wrapper-->
            <div class="sidebar-wrapper">
                <nav class="mt-2">
                    <!--begin::Sidebar Menu-->
                    <ul class="nav sidebar-menu flex-column" data-lte-toggle="treeview" role="menu" data-accordion="false">
                        <li class="nav-item">
                            <a href="javascript:;" class="nav-link">
                                <i class="nav-icon fa-solid fa-table"></i>
                                <p>
                                    Mantenimiento
            <i class="nav-arrow fa-solid fa-angle-right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/controlUsuario?opc=1" class="nav-link">
                                        <i class="nav-icon fa-solid fa-user"></i>
                                        <p>Usuarios</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/controlCursos?opc=1" class="nav-link">
                                        <i class="nav-icon fa-solid fa-book"></i>
                                        <p>Cursos</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/ProyectoControl?opc=1" class="nav-link">
                                        <i class="nav-icon fa-solid fa-house"></i>
                                        <p>Proyectos</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="javascript:;" class="nav-link">
                                <i class="fa-brands fa-searchengin"></i>
                                <p>
                                    Consultas
                                    <i class="nav-arrow fa-solid fa-angle-right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/vistas.admin/consultasCompra.jsp" class="nav-link">
                                        <i class="nav-icon fa-solid fa-shop"></i>
                                        <p>Compras</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/vistas.admin/consultasCurso.jsp" class="nav-link">
                                        <i class="nav-icon fa-solid fa-book"></i>
                                            <p>Cursos</p>
                                    </a>
                                </li>
                            </ul>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/vistas.admin/consultasProyecto.jsp" class="nav-link">
                                        <i class="nav-icon fa-solid fa-shop"></i>
                                        <p>Proyectos</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="nav-item">
                            <a href="javascript:;" class="nav-link">
                                <i class="fa-solid fa-chart-simple"></i>
                                <p>
                                    Gráficos
                                    
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/vistas.admin/graficoCompras.jsp" class="nav-link">
                                        <i class="nav-icon fas fa-chart-pie"></i>
                                        <p>Gráfico 1</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/vistas.admin/graficoCursos.jsp" class="nav-link">
                                        <i class="nav-icon fas fa-chart-area"></i>
                                        <p>Gráfico 2</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/vistas.admin/graficoProyecto.jsp" class="nav-link">
                                        <i class="nav-icon fas fa-chart-bar"></i>
                                        <p>Gráfico 3</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    <!--end::Sidebar Menu-->
                </nav>
            </div>
            <!--end::Sidebar Wrapper-->
        </aside>
        <!--end::Sidebar-->
       
    
    
    <!--begin::Script-->
    <!--begin::Third Party Plugin(OverlayScrollbars)-->
    <script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.1.0/browser/overlayscrollbars.browser.es6.min.js" integrity="sha256-NRZchBuHZWSXldqrtAOeCZpucH/1n1ToJ3C8mSK95NU=" crossorigin="anonymous"></script>
    <!--end::Third Party Plugin(OverlayScrollbars)--><!--begin::Required Plugin(popperjs for Bootstrap 5)-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <!--end::Required Plugin(popperjs for Bootstrap 5)--><!--begin::Required Plugin(Bootstrap 5)-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <!--end::Required Plugin(Bootstrap 5)--><!--begin::Required Plugin(AdminLTE)-->
    <script src="${pageContext.request.contextPath}/js/adminlte.js" type="text/javascript"></script>
    <!--end::Required Plugin(AdminLTE)--><!--begin::OverlayScrollbars Configure-->
    <script>
        const SELECTOR_SIDEBAR_WRAPPER = ".sidebar-wrapper";
        const Default = {
            scrollbarTheme: "os-theme-light",
            scrollbarAutoHide: "leave",
            scrollbarClickScroll: true,
        };

        document.addEventListener("DOMContentLoaded", function() {
            const sidebarWrapper = document.querySelector(SELECTOR_SIDEBAR_WRAPPER);
            if (
                sidebarWrapper &&
                typeof OverlayScrollbarsGlobal?.OverlayScrollbars !== "undefined"
            ) {
                OverlayScrollbarsGlobal.OverlayScrollbars(sidebarWrapper, {
                    scrollbars: {
                        theme: Default.scrollbarTheme,
                        autoHide: Default.scrollbarAutoHide,
                        clickScroll: Default.scrollbarClickScroll,
                    },
                });
            }
        });
    </script>
    
</body>

</html>
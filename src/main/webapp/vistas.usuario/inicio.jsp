<%-- 
    Document   : inicio.jsp
    Created on : May 22, 2024, 3:38:24 PM
    Author     : lesly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link href="../css/inicio.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/09bca36bc3.js" crossorigin="anonymous"></script>
         <!-- AOS CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />
        <!-- AOS JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

    </head>
    <body>
        <%@include file="Header.jsp"%>
        
        <!-- Sección de bienvenida -->
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="../img/prueba_home.jpg" class="d-block w-100" alt="...">
              <div class="carousel-caption">
                  <h1>Creando espacios únicos que inspiran</h1>
                  <p>
                            Sumérgete en el mundo de pequeñas grandes aventuras de diseño 
                            con un enfoque se centra en capturar la esencia de cada lugar y 
                            mejorar la calidad de vida de quienes lo disfrutan.
                   </p><br>
                   <a class="btn btn-beige">¡Empieza ya!</a>
              </div>
            </div>
            <div class="carousel-item">
              <img src="../img/prueba_perfil.jpg" class="d-block w-100" alt="...">
            </div>
              
            <div class="carousel-item">
              <img src="../img/prueba_proyecto.jpg" class="d-block w-100" alt="...">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>


        
        <!-- Sección: sobre mí -->
        <section id="about" class="about section-padding" data-aos="fade-up">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 col-12 ps-lg-5 mt-md-5" data-aos="fade-right" data-aos-duration="1500"
>
                        <div class="about-text">
                            <h2> Hola, soy <span class="highlight-azul">Lizbet Huamaní</span></h2>
                            <p2>
                                Arquitecta y diseñadora de interiores apasionada por la creación de espacios únicos y funcionales. 
                                Con experiencia en la gestión de proyectos residenciales y comerciales, me dedico a diseñar e 
                                implementar ideas en realidades que inspiran y mejoran la calidad de vida de las personas. 
                                ¡Encantada de conocerte!
                            </p2><br><br>
                            <a href="#" class="btn btn-beige" data-aos="fade-up" data-aos-delay="200">Más información</a>
                        </div>
                    </div>

                    <div class="col-lg-5 col-md-12 col-12" data-aos="fade-left" data-aos-duration="1500">
                        <div class="about-img">
                            <img src="../img/Lizbeth.png" alt="" class="img-fluid rounded-circle"/>
                           
                        </div>
                    </div>
                </div>
            </div>
        </section>

        
        <!-- Sección: Mis proyectos -->
        <section id="proyectos" class="proyectos section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12"></div>
                    <div class="section-header text-center pb5">
                        <h3>Conoce algunos de mis <span class="highlight-beige">proyectos</span></h3>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-md-12 col-lg-3">
                        <div class="card text-center">  
                            <div class="card-body">
                                <img src="../img/dptoBT_1.jpg" alt="" class="img-fluid rounded-circle">
                                <h5 class="card-title py-2">DPTO .BT</h5>
                                <p class="card-text">Ubicado en la av. alameda del pinar - Comas. La clienta buscaba una propuesta de diseño que represente la elegancia y versatilidad del espacio para poder unificar sus ambientes.</p>
                                <a href="#" class="btn btn-beige-claro">Más detalles</a>
                            </div>
                            <div class="card-footer"></div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-3">
                        <div class="card text-center">  
                            <div class="card-body">
                                <img src="../img/dptoJ_1.jpg" alt="" class="img-fluid rounded-circle">
                                <h5 class="card-title py-2">DPTO .J</h5>
                                <p class="card-text">Claudia aún estaba en el vientre de su mami cuando se diseñó la habitación. Sus papitos planificaban un ambiente cálido y acogedor inspirado en el mundo safari animales baby.</p>
                                <a href="#" class="btn btn-beige-claro">Más detalles</a>
                            </div>
                            <div class="card-footer"></div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-3">
                        <div class="card text-center">  
                            <div class="card-body">
                                <img src="../img/casa.jpg" alt="" class="img-fluid rounded-circle">
                                <h5 class="card-title py-2">CASA E.R</h5>
                                <p class="card-text">Mi objetivo era transformar la cocina de la familia Rementerio, en un oasis de elegancia con la combinación vibrante de verde salvia y tonos suaves de beige.</p>
                                <a href="#" class="btn btn-beige-claro">Más detalles</a>
                            </div>
                            <div class="card-footer"></div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-3">
                        <div class="card text-center">  
                            <div class="card-body">
                                <img src="../img/cafeteria.jpg" alt="" class="img-fluid rounded-circle">
                                <h5 class="card-title py-2">CAFETERÍA</h5>
                                <p class="card-text">Clientes de Villa Rica, buscaban diseñar su nuevo emprendimiento, necesitaban un espacio instagrameable. Colores predominantes protagonizan esta propuesta.</p>
                                <a href="#" class="btn btn-beige-claro">Más detalles</a>
                            </div>
                            <div class="card-footer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Sección: Mis servicios -->
        <section id="servicios" class="servicios section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-header text-center pb5" data-aos="fade-up" data-aos-duration="1000">
                            <h3>¿Qué <span class="highlight-beige">servicio</span> te interesa?</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-center pb-2" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="200">
                            <div class="card-body">
                                <i class="fa-solid fa-house"></i>
                                <h4 class="card-title">Residencial</h4>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-center pb-2" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="400">
                            <div class="card-body">
                                <i class="fa-solid fa-store"></i>
                                <h4 class="card-title">Comercial</h4>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-center pb-2" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="600">
                            <div class="card-body">
                                <i class="fa-solid fa-couch"></i>
                                <h4 class="card-title">Muebles</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script>
            AOS.init();
        </script>
    </body> 
</html>

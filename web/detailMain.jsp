

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }
            .container {
                padding-top: 120px;
                overflow-x: hidden;
            }
            #myCarousel {
                padding-top: 115px;
            }
            
            .col-sm-7 {
                background-color: lightgray;
                padding: 15px 15px;
                border-radius: 15px;
                
            }
            

        </style>

    </head>
    <body>
       
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="mb-3">
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" role="listbox">
                                    <div class="item active">
                                        <img src="images/legacy_background.jpg" alt="MOUSE" width="1200" height="500">
                                        <div class="carousel-caption">
                                        </div>      
                                    </div>

                                    <div class="item">
                                        <img src="images/background2.jpg" alt="MOUSE" width="1200" height="500">
                                        <div class="carousel-caption">
                                        </div>      
                                    </div>

                                    <div class="item">
                                        <img src="images/background3.jpg" alt="MOUSE" width="1200" height="500">
                                        <div class="carousel-caption">
                                        </div>      
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-9">
                        <c:set value="${detailProduct}" var="p"/>
                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-5 border-right">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap">
                                                <div> <a href="images/fnatic-gear-x-lamzu-thorn-4k-special-edition.jpg"><img src="images/${p.image}"></a></div>
                                            </div> <!-- slider-product.// -->                                      
                                        </article> <!-- gallery-wrap .end// -->
                                    </aside>
                                    <aside class="col-sm-7">
                                    
                                        <article class="card-body p-5">
                                            <h3 class="title mb-3">${p.name}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency">₫</span><span class="num">${p.price}</span>
                                            </span>  
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>${p.description} </p></dd>
                                        </dl>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <dl class="param param-inline">
                                                    <dt>Quantity:</dt>
                                                    <dd>
                                                        <select class="form-control form-control-sm" style="width:70px;">
                                                            <option> 1 </option>
                                                            <option> 2 </option>
                                                            <option> 3 </option>
                                                        </select>
                                                    </dd>
                                                </dl>  <!-- item-property .// -->
                                            </div> <!-- col.// -->

                                        </div> <!-- row.// -->
                                        <hr>
                                        <a href="#" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
                                        <a href="#" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                                    </article> <!-- card-body.// -->
                                </aside>
                            </div>
                        </div>                       
                    </div>              
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>

<%-- 
    Document   : carousel
    Created on : Oct 26, 2023, 3:18:15 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .carousel-inner img {
                -webkit-filter: grayscale(90%);
                filter: grayscale(90%); /* make all photos black and white */
                width: 100%; /* Set width to 100% */
                margin: auto;
            }
</style>

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
            <img src="img/sliding-home-iphone15.png" alt="MOUSE" width="1200" height="500">
            <div class="carousel-caption">
                <h3>MOUSE</h3>
                <p>Chuột gaming, chuột văn phòng hay những chú chuột không dây, có dây mới nhất bạn có thể tìm thấy tại Phong Cách Xanh sẽ xuất hiện tại đây.</p>
            </div>      
        </div>

        <div class="item">
            <img src="images/background2.jpg" alt="MOUSE" width="1200" height="500">
            <div class="carousel-caption">
                <h3>MOUSE</h3>
                <p>Chuột gaming, chuột văn phòng hay những chú chuột không dây, có dây mới nhất bạn có thể tìm thấy tại Phong Cách Xanh sẽ xuất hiện tại đây.</p>
            </div>      
        </div>

        <div class="item">
            <img src="images/background3.jpg" alt="MOUSE" width="1200" height="500">
            <div class="carousel-caption">
                <h3>MOUSE</h3>
                <p>Chuột gaming, chuột văn phòng hay những chú chuột không dây, có dây mới nhất bạn có thể tìm thấy tại Phong Cách Xanh sẽ xuất hiện tại đây.</p>
            </div>      
        </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

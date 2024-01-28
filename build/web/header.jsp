<%-- 
    Document   : header
    Created on : Oct 26, 2023, 3:12:40 PM
    Author     : Admin
--%>


<style>
    .all-ulli ul{
        list-style: none;
    }

    .all-ulli li {
        text-align: center;
        margin: 25px;
        border-radius: 20px;

    }
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
        margin-bottom: 0;
        border-radius: 0;
    }


    /* Set gray background color and 100% height */
    .sidenav {
        padding-top: 20px;
        background-color: #f1f1f1;
        height: 100%;
    }

    /* Set black background color, white text and some padding */


    .header_main {
        margin-bottom: 0;
        background-color: #2d2d30;
        border: 0;
        font-size: 11px !important;
        letter-spacing: 1px;
        opacity: 0.9;
    }

    li:hover {
        background: #ccc;
    }
    
    /* Định nghĩa màu chủ đạo là trắng và đen */
    .btn-custom {
        background-color: #FFFFFF; /* Màu nền trắng */
        color: #000000; /* Màu chữ đen */
        margin-top: 1%;
    }

    /* Định nghĩa màu chủ đạo cho badge */
    .badge-custom {
        background-color: #000000; /* Màu nền đen cho badge */
        color: #FFFFFF; /* Màu chữ trắng cho badge */
    }



</style>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="header_main navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <img class="navbar-brand" src="images/Logo_PCX-line-white.jpg"/>
        </div>
        <div class="all-ulli collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-left">
                <li><a class="active" href="list"><i class="glyphicon glyphicon-home"></i> HOME</a></li>
            </ul>
            <c:set value="${sessionScope.size}" var="size"/>
            <ul class="nav navbar-nav navbar-right">
                <li><a class="btn btn-custom " href="detailCart.jsp">
                        <i class="fa fa-shopping-cart text-white"></i> Cart
                        <span class="badge badge-custom">${not empty size?size:0}</span>
                    </a></li>               
                    <c:if test="${empty sessionScope.account}">
                    <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </c:if>                
                <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                <c:if test="${not empty sessionScope.account}">
                <li class="dropdown">
                    <a class="dropdown-toggle " data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> Tài Khoản
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu ">
                        <li><a href="manager">Thông tin</a></li>
                        <li><a href="#"> web 2</a></li>
                        <li><a href="#"> web 3</a></li>

                    </ul>
                </li>
                </c:if> 
                <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
            </ul>
        </div>
    </div>
</nav>















<!--<nav class="navbar navbar-inverse ">
    <div class="container-fluid">
        <div class="navbar-header ">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand " href="#"><img src="images/Logo_PCX-line-white.jpg" /></a>

            <a class="btn btn-custom " href="show">
                <i class="fa fa-shopping-cart text-white"></i> Cart
                <span class="badge badge-custom">3</span>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar">
                <li class="active"><a href="list">Home</a></li>
    <li><a href="#"></a></li>
    <li><a href="#"></a></li>               
</ul>
<ul class="nav navbar-nav navbar-right">
    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    <li class="dropdown">
        <a class="dropdown-toggle " data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> Account
            <span class="caret"></span></a>
        <ul class="dropdown-menu ">
            <li><a href="#"> web 1</a></li>
            <li><a href="#"> web 2</a></li>
            <li><a href="#"> web 3</a></li>

        </ul>
    </li>


</ul>
</div>
</div>
</nav>-->

<%-- 
    Document   : list
    Created on : Oct 3, 2023, 10:17:39 PM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <style>
            h3, h4 {
                margin: 5px 0 30px 0;
                letter-spacing: 2px;
                font-size: 20px;
                color: #111;
            }

            ul{
                list-style: none;
            }

            li {
                text-align: center;
                margin: 25px;
                border-radius: 20px;

            }

            li img {
                width: 80%;

            }

            li a {
                text-decoration: none;

            }

            .old {
                text-decoration: line-through;
                color: red;
            }

            input[type=submit]:hover {
                background-color: #2d2d30;
                color: white;
            }

            input[type=submit] {
                width: 200px;
                height: 40px;
                color: black;
                border-radius: 5px;

            }
            .name-pro {
                height: 5em;

            }
            .content-left.form {
                border: 1px solid #111;

            }
            .carousel-inner img {
                -webkit-filter: grayscale(90%);
                filter: grayscale(90%); /* make all photos black and white */
                width: 100%; /* Set width to 100% */
                margin: auto;
            }

        </style>

        <script type="text/javascript">
            function change() {
                document.getElementById("f1").submit();
            }
        </script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">

            <jsp:include page="carousel.jsp"></jsp:include>

                <div class="content row">

                    <div class="content-left col-md-3">               
                            Tìm kiếm
                        </h3>
                    <c:set var="fromprice" value="${fromprice}" />
                    <c:set var="toprice" value="${toprice}" /> 
                    <c:set var="todate" value="${todate}" />
                    <c:set var="fromdate" value="${fromdate}" />    
                    <c:set var="page" value="${page}" />
                    <c:set var="cid" value="${requestScope.cid}"/>
                    <c:set var="search" value="${requestScope.search}"/>
                    <form class="form" id="f1" action="list">

                        <span style="font-weight: bold">Thương hiệu :</span>

                        <select name="key">                   
                            <option value="0">All</option>
                            <c:forEach items="${requestScope.categories}" var="c">
                                <option ${cid == c.id ?'selected':''} value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>


                        <div class="row">
                            <div class="col-md-8">                               
                                <div class="form-group has-feedback">
                                    <input type="text" class="form-control" name="search" placeholder="search">
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                </div>                               
                            </div>
                        </div>
                        <!--<input type="text" name="key2" placeholder="nhập tên, miêu tả"/>-->

                        Từ giá: <br/><input type="number" name="fromprice"/> <br/>               
                        Đến giá: <br/><input type="number" name="toprice"/> <br/>

                        Từ ngày: <br/><input type="date" name="fromdate"/> <br/>
                        Đến ngày: <br/><input type="date" name="todate"/> <br/><br/>

                        <input class="" type="submit" value="SEARCH"/>
                    </form>

                </div>

                <div class="content-right col-md-9">   
                    <div class="content-right-head row">
                        <div class="col-md-4">
                            <c:forEach items="${requestScope.categories}" var="c">
                                <h3>
                                    ${cid == c.id?c.name:''}
                                </h3>
                            </c:forEach>
                        </div>

                        <div class="col-md-8">
                            <ul class="pagination">

                                <c:forEach begin="1" end="${requestScope.num}" var="i">
                                    <li class="${i == page?'active':''}">
                                        <a href="list?page=${i}&key=${cid}&search=${search}&fromdate=${fromdate}&todate=${todate}&fromprice=${fromprice}&toprice=${toprice}">${i}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                    </div>


                    <ul class="row">
                        <form>
                            
                        
                        <c:forEach items="${requestScope.products}" var="p">
                            <a href="detail?id=${p.id}">
                                <li class="col-md-3">
                                    <img src="images/${p.image}" class="img-circle"/>                   
                                    <p style="font-weight: bold" class="name-pro"> ${p.name}</p>
                                    <a href="buy?id=${p.id}">+ Thêm Nhanh</a>
                                    
                                    <p>Giá gốc: <span class="old">${(p.price*2)}</span><span>₫</span></p>
                                    <p>Giá bán (sales): ${(p.price)} <span>₫</span></p>
                                </li>

                            </a>
                        </c:forEach>
                        </form>        
                    </ul>

                </div>
            </div> 
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>

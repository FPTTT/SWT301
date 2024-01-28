<%-- 
    Document   : detailCart
    Created on : Dec 31, 2023, 9:35:36 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        table {
            border-collapse: collapse;
        }
        
        a {
            text-decoration: none;

        }
    </style>
    <body>
        <h1 style="color: blue">Giỏ hàng</h1>
        <table border="1px" width="60%">
            <tr>
                <th>No</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Money</th>
                <th>Action</th>
            </tr>

            <c:set value="${sessionScope.cart}" var="o"/>
            <c:set value="0" var="count"/>
            
            <c:forEach items="${o.item}" var="i">
                <c:set value="${count + 1}" var="count"/>
                <tr>
                    <td>${count}</td>
                    <td>${i.product.name}</td>
                    <td>
                        <button> <a href="process?numa=-1&ida=${i.product.id}">-</a> </button>
                        ${i.quantity}
                        <button><a href="process?numa=1&ida=${i.product.id}">+</a></button>
                    </td>
                    <td>${i.price}</td> 
                    <td>${i.price * i.quantity}</td>
                    <td>return</td>
                </tr>
            </c:forEach>

        </table>
            
            <hr/>
            <h2 style="color: chocolate"> <a href="list">Click to continue shopping  </a></h2>
    </body>
</html>

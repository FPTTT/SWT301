<%-- 
    Document   : profileAccount
    Created on : Nov 3, 2023, 3:58:34 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

        <style>
            body {
                
            }

            /* Profile container */
            .profile {
                margin: 20px 0;
            }

            /* Profile sidebar */


            .profile-userpic img {
                float: none;
                margin: 0 auto;
                width: 50%;
                height: 50%;
                -webkit-border-radius: 50% !important;
                -moz-border-radius: 50% !important;
                border-radius: 50% !important;
            }

            .profile-usertitle {
                text-align: center;
                margin-top: 20px;
            }

            .profile-usertitle-name {
                color: #5a7391;
                font-size: 16px;
                font-weight: 600;
                margin-bottom: 7px;
            }

            .profile-usertitle-job {
                text-transform: uppercase;
                color: #5b9bd1;
                font-size: 12px;
                font-weight: 600;
                margin-bottom: 15px;
            }

            .profile-userbuttons {
                text-align: center;
                margin-top: 10px;
            }

            .profile-userbuttons .btn {
                text-transform: uppercase;
                font-size: 11px;
                font-weight: 600;
                padding: 6px 15px;
                margin-right: 5px;
            }

            .profile-userbuttons .btn:last-child {
                margin-right: 0px;
            }

            .profile-usermenu {
                margin-top: 30px;
            }

            .profile-usermenu ul li {
                border-bottom: 1px solid #f0f4f7;
            }

            .profile-usermenu ul li:last-child {
                border-bottom: none;
            }

            .profile-usermenu ul li a {
                color: #93a3b5;
                font-size: 14px;
                font-weight: 400;
            }

            .profile-usermenu ul li a i {
                margin-right: 8px;
                font-size: 14px;
            }

            .profile-usermenu ul li a:hover {
                background-color: #fafcfd;
                color: #5b9bd1;
            }

            .profile-usermenu ul li.active {
                border-bottom: none;
            }

            .profile-usermenu ul li.active a {
                color: #5b9bd1;
                background-color: #f6f9fb;
                border-left: 2px solid #5b9bd1;
                margin-left: -2px;
            }

            /* Profile Content */
            .profile-content {
                padding: 20px;
                background: #fff;
                min-height: 460px;
            }
            
            .row-profile {
                padding: 100px 0;
                }
            .content-account{
                padding-top: 100px;
                padding-bottom: 60px;
            }
        </style>
        <script type="text/javascript">
            function showSection(sectionId) {
                // Hiển thị phần được chọn

                document.getElementById(sectionId).style.display = 'block';
                // Ẩn tất cả các phần
                if (sectionId !== 'WelcomeToGo')
                    document.getElementById('WelcomeToGo').style.display = 'none';
                if (sectionId !== 'manageProduct')
                    document.getElementById('manageProduct').style.display = 'none';
                if (sectionId !== 'account-settings')
                    document.getElementById('account-settings').style.display = 'none';
                if (sectionId !== 'manageStaff')
                    document.getElementById('manageStaff').style.display = 'none';
                if (sectionId !== 'help')
                    document.getElementById('help').style.display = 'none';




            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container-fluid content-account">
                <div class="row-profile">
                    <div class="col-md-2">
                        <div class="profile-sidebar">
                            <!-- SIDEBAR USERPIC -->
                            <div class="profile-userpic">
                                <img src="images/testA.jpg" class="img-responsive" alt="">
                            </div>
                            <!-- END SIDEBAR USERPIC -->
                            <!-- SIDEBAR USER TITLE -->
                            <div class="profile-usertitle">
                            <c:set value="${sessionScope.account}" var="acc"/>
                            <div class="profile-usertitle-name">
                                ${acc.nameUser}
                            </div>
                            <div class="profile-usertitle-job">
                                <c:if test="${acc.role == 1}">ADMIN</c:if>
                                <c:if test="${acc.role == 2}">Nhân viên</c:if>
                                <c:if test="${acc.role == 0}">Khách hàng</c:if>
                                </div>
                            </div>
                            <!-- END SIDEBAR USER TITLE -->
                            <!-- SIDEBAR BUTTONS -->
                            <div class="profile-userbuttons">
                                <button type="button" class="btn btn-success btn-sm">Follow</button>
                                <button type="button" class="btn btn-danger btn-sm">Message</button>
                            </div>
                            <!-- END SIDEBAR BUTTONS -->
                            <!-- SIDEBAR MENU -->
                            <div class="profile-usermenu">
                                <ul class="nav">
                                    <li>
                                        <a href="#" onclick="showSection('account-settings')">
                                            <i class="glyphicon glyphicon-user"></i>
                                            Account Settings </a>
                                    </li>
                                <c:if test="${acc.role == 1 || acc.role == 2}">
                                    <li class="">
                                        <a href="#" onclick="showSection('manageProduct')">                                            
                                            <i class="fas fa-tasks"></i>
                                            Manage Product </a>
                                    </li>

                                    <li>
                                        <a href="#" onclick="showSection('manageStaff')">
                                            <i class="fas fa-users-cog"></i>
                                            Manage staff </a>
                                    </li>

                                </c:if>

                                <li>
                                    <a href="#" onclick="showSection('help')">
                                        <i class="glyphicon glyphicon-ok"></i>
                                        Task </a>
                                </li>
                            </ul>
                        </div>

                        <!-- END MENU -->
                    </div>
                </div>
                <div id="WelcomeToGo">
                    <div style="color: green; font-size: 100px" >Welcome to go account setting</div>
                    <br>
                    </div>

                    <div class="col-md-10">

                        <div id="manageProduct" style="display: none;">
                        <jsp:include page="managerDisplay.jsp"></jsp:include>
                        </div>

                        <div id="account-settings" style="display: none;">
                            hien thi len day account 
                        </div>

                        <div id="manageStaff" style="display: none;">
                        <jsp:include page="manageStaff.jsp"></jsp:include>
                        </div>

                        <div id="help" style="display: none;">
                            help se o day
                        </div>


                    </div>
                </div>
            </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>


</html>

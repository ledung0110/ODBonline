<%-- 
    Document   : HomePage
    Created on : Feb 3, 2023, 9:54:39 PM
    Author     : phanv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="./icon/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./asset/css/HomePage.css">      
        <link rel="stylesheet" href="./asset/css/addDebtor.css">
    </head>

    <body>
        <img src="img/home4.jpg" alt="alt" style="animation: fadeIn ease 1s;
             animation-fill-mode: forwards; max-width: 100%"/>
        <header>

            <div class="row">
                <div class="fixed-top">

                    <div class="wraper">
                        <div class="sidebar">

                            <div class="profile">
                                <img src="./img/logo.png" alt="profile image">
                                <h3>ODB Tín Dụng</h3>
                                <p>Sổ ghi nợ ONLINE</p>
                            </div>
                            <!-- side menu bar -->
                            <ul>
                                <li><a href="home">
                                        <span class="icon"><i class="fas fa-home"></i></span>
                                        <span class="Item">Trang chủ</span></a>
                                </li>
                                <li><a href="DebtsListServlet">
                                        <span class="icon"><i class="fas fa-desktop"></i></span>
                                        <span class="Item">Dịch vụ</span></a>
                                </li>
                               
                                 <c:if test="${sessionScope.isAdmin==true}">
                               <li>
                                    <div class="ad">
                                        <a ><span class="icon"><i class="fas fa-user-shield"></i></span>
                                        <span class="admin-btn Item">Admin</span></a>
                                        <div class="admin-dropdown">
                                            <a href="ConfigManagerServlet"><span class="icon"><i class="fas fab fa-adversal"></i></span>
                                            <span class="admin-btn Item">Quản lý cấu hình</span></a>
                                            <a href="AccountManagerServlet"><span class="icon"><i class="fas fab fa-yahoo"></i></span>
                                            <span class="admin-btn Item">Quản lý tài khoản</span></a>
                                        </div>
                                    </div>

                                </li>
                                </c:if>
                                <li><a href="accControl">
                                        <span class="icon"><i class="fas fa-cog"></i></span>
                                        <span class="Item">Trang cá nhân</span></a>
                                </li>

                            </ul>
                        </div>
                        <!-- top menu bar -->
                        <div class="section">
                            <div class="top_navbar">
                                <div class="col-6">
                                    <div class="hamburger">
                                        <a href="#">
                                            <i class="fas fa-bars"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="d-f" style="text-align: end;">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Login As: ${sessionScope.username}
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="accControl">Thông tin tài khoản</a>

                                                <a class="dropdown-item" href="logout">Đăng Xuất</a>
                                            </div>
                                        </div>
                                    </div>                               
                                </div>
                            </div>
                            <div class="container"
                                 style="margin-top: 70px ; font-weight: 600; font-size: 30px; text-align: center;">
                                <!--<p style="font-family: 'Trocchi', serif;">Chào mừng bạn đến với ODB </p>-->
                                <h2 style="color: #ffffff; font-family: 'Trocchi', serif; font-size: 45px; font-weight: normal; line-height: 45px; margin: 0;">Xin chào! Chào mừng bạn đến với  </h2>
                                <h1 style=" color: #ffffff; font-family: 'Impact', fantasy; font-size: 60px; font-weight: 400; line-height: 75px; margin: 0 0 24px; "> "Online Debit Book"</h1>
                            </div>        
                        </div>                                
                    </div>   
                </div><!-- comment -->
            </div>
        </header>

    </body>
    <script src="node_modules/jquery/dist/jquery.min.js"></script>
    <script src="node_modules/popper.js/dist/popper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@2.9.3/dist/umd/popper.min.js" integrity="sha384-9apDh2e7scHlvpgEAGzgKx88huhp5Y3q5b5P5G5A5vdaS2U6Cfzpwod+tU6Pn4l4" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"></script>
    <script src="./asset/js/screen.js"></script>
    <script src="./asset/js/addDebtor.js"></script>

</html>

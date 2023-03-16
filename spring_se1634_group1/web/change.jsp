<%-- 
    Document   : change.jsp
    Created on : Feb 3, 2023, 9:51:38 PM
    Author     : phanv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="./icon/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./asset/css/HomePage.css">      
        <link rel="stylesheet" href="./asset/css/addDebtor.css">
        <!--<link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">-->

        <link rel="stylesheet" href="./asset/css/change.css">


    </head>
    <style>
        .rc-anchor-normal{
            width: 250px;
            max-width: 90%;
            align-items: center;
        }

        .modal-backdrop{
            position: unset;
        }


    </style>
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
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="left-card card" >
                                            <div class="card-header"> 
                                                <form action="HomePage.jsp">
                                                    <button type="submit" class="close" data-dismiss="modal" aria-label="Close" id="close-button">
                                                        <span aria-hidden="true" >&times; </span>
                                                    </button>
                                                </form>
                                            </div>
                                            <div class="row">
                                                <div class="card-body"> 
                                                    <div class="col-12">
                                                        <div class="card border-light mb-3" style="max-width:100%;">
                                                            <div class="card-header"><h4>User Information</h4></div>
                                                            <div class="card-body">
                                                                <h5 class="card-title">
                                                                    <form action="accControl" method="post" id="updateForm">
                                                                        <c:set var="u" value="${user}"></c:set>
                                                                            <div class="form-group row">

                                                                                <label for="staticEmail" class="col-sm-4 col-form-label">Account Code</label>
                                                                                <div class="col-sm-8">
                                                                                    <input type="text" name="id" class="form-control-plaintext" id="id" value="${u.id}" readonly>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label for="staticEmail" class="col-sm-4 col-form-label">Fullname</label>
                                                                            <div class="col-sm-8">
                                                                                <input type="text" name="name" class="form-control" id="fullname" value="${u.fullName}">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label for="staticEmail" class="col-sm-4 col-form-label">Phone Number</label>
                                                                            <div class="col-sm-8">
                                                                                <input type="text" name="phone" class="form-control" id="phonenumber" value="${u.phone}" >
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label for="inputPassword" class="col-sm-4 col-form-label">Email</label>
                                                                            <div class="col-sm-8">
                                                                                <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" value="${u.email}" readonly>
                                                                            </div>
                                                                        </div>
                                                                        <!--                                                            <div class="form-group row">
                                                                                                                                        <label for="inputPassword" class="col-sm-4 col-form-label">Description</label>
                                                                                                                                        <div class="col-sm-8">
                                                                                                                                            <textarea class="form-control" name="description" id="exampleFormControlTextarea1" rows="3" ></textarea>
                                                                                                                                        </div>
                                                                                                                                    </div>-->
                                                                        <div class="button-update"  style="text-align: center;">

                                                                            <button type="submit" id="updateButton" class="btn btn-light" value="Update"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                                                                                <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                                                                                </svg>Update</button>
                                                                        </div>
                                                                        <div style="font-size: 16px;margin-top: 20px">${ms}</div>
                                                                    </form>


                                                                </h5> 

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- --------------------------------------------------------------------------------------------------------------- -->
                                    <div class="col-6">

                                        <div class="right-card card" >

                                            <div class="row">
                                                <div class="card-body"> 
                                                    <div class="col-12">
                                                        <div class="card border-light mb-3" style="max-width:100%;">
                                                            <div class="card-header"><h4>Change password</h4></div>
                                                            <div class="card-body">
                                                                <div class="card-title">

                                                                    <form action="change" method="post" id="changeForm">
                                                                        <c:set var="account" value="${account}"></c:set>
                                                                            <div class="form-group row">
                                                                                <label for="" class="col-sm-4 col-form-label">Account: </label>
                                                                                <div class="col-sm-8">
                                                                                    <input type="text" name="username" class="form-control" id="accountName" value="${account.username}" readonly>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label for="inputPassword" class="col-sm-4 col-form-label">Old Password</label>
                                                                            <div class="col-sm-8">
                                                                                <input type="password" name="password" class="form-control" id="oldPassword" value="" >
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label for="inputPassword" class="col-sm-4 col-form-label">New Password</label>
                                                                            <div class="col-sm-8">
                                                                                <input type="password" name="newPass" class="form-control" id="newPassword">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label for="inputPassword" class="col-sm-4 col-form-label">Re-type new password</label>
                                                                            <div class="col-sm-8">
                                                                                <input type="password" name="reType" class="form-control" id="reInputPassword">
                                                                            </div>
                                                                        </div>
                                                                        <!--alert-->

                                                                        <!--capcha-->
                                                                        <div class="form-row">

                                                                            <div class=" form-group-prepend col-md-12 col-sm-8 col-xs-5" style="max-width: 200px;" >
                                                                                <div class="g-recaptcha" data-sitekey="6LfmnoEkAAAAABOUgIhNz6MpA-xs2ABmGyRc3225" style="max-width: 200px;">

                                                                                </div>
                                                                            </div>


                                                                        </div>

                                                                        <!--.-->
                                                                        <div class="button-update"  style="text-align: center;margin-top: 30px;">

                                                                            <button type="submit" id="changePassButton" class="btn btn-light">
                                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                                                                                <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                                                                                </svg>
                                                                                Change password
                                                                            </button>

                                                                        </div>
                                                                    </form>
                                                                    <!-- Button to Open the Modal -->

                                                                    <!-- The Modal -->
                                                                    <div class="modal" id="informModal">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">

                                                                                <!-- Modal Header -->
                                                                                <div class="modal-header">
                                                                                    <h5>Notice from ODB </h5>
                                                                                    <button type="button" class="close" data-dismiss="modal" id="closeModalButton">&times;</button>
                                                                                </div>

                                                                                <!-- Modal body -->

                                                                                <div class="modal-body">
                                                                                    <p id="modalMessage" style="font-size: 15px;"></p>
                                                                                </div>

                                                                                <!-- Modal footer -->
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="closeModalButton">Close</button>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>     
                        </div>                                
                    </div>   
                </div>
            </div>
        </header>
    </body>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"  ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  ></script>
    <script src="./asset/js/screen.js"></script>
    <script src="asset/js/changePassword.js"></script>
    <script src="asset/js/changeInfor.js"></script>


</html>

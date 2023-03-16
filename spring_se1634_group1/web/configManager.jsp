<%-- 
    Document   : HomePage
    Created on : Feb 3, 2023, 9:54:39 PM
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
        <link rel="stylesheet" href="./asset/css/debtList.css">

    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 10px;
        }
        .table td,.table th{
            padding: 0.15rem;
        }
        .btn{
            padding: .2rem .45rem;
            font-size: 1rem;
            font-size: 13px;
        }
        .form-control{
            font-size: 13px;
            padding: .25rem .55rem;

        }
        .table-responsive{
            max-height:450px;
            overflow: auto;
            flex-direction: column;

        }
        .dropdown-menu{
            padding:0;
            font-size:12px;
        }
        .my-custom-size .modal-dialog {
            max-width: 1200px;
            max-height: 600px;
        }

        .modal {


            background-color: rgba(34, 33, 33, 0.4);
            z-index: 10000;

        }
    </style>
    <body>
        <div class="d-flex" id="wrapper">

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
                                                <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
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

                                <div class="container" >
                                    <div class="debit-manage card" ">
                                        <div class="card-header">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="left">
                                                        <h3 class="mb-0 ">Account</h3>
                                                    </div>
                                                </div>
                                                <div class="col-6" style="text-align: end">
                                                    <!--                                         Button to trigger the modal -->
                                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#addConfig">
                                                        <i class="fa fa-plus-square" aria-hidden="true"></i> 
                                                        Thêm Cấu Hình</button>

                                                </div>
                                            </div>
                                        </div>
                                        <form action="configuration" method="post">
                                            <div class="card-body" style="text-align: center;padding:1.5rem;">
                                                <div class="row">

                                                    <div class="table-responsive" >

                                                        <table id="configTable" class="table table-bordered table-striped">
                                                            <thead >
                                                                <tr >

                                                                    <th class="col-1">Id</th>
                                                                    <th class="col-2">Key</th>
                                                                    <th class="col-2">Value</th>
                                                                    <th class="col-1">Thời gian tạo</th>
                                                                    <th class="col-3">Thời gian sửa</th>
                                                                    <th class="col-3">Action</th>

                                                                </tr>
                                                                <tr>
                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>  
                                                                        <div class="centered-content">
                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <input placeholder="From" type="text" id="idFrom" class="form-control Config" value="">
                                                                                </div>
                                                                                <div class="col-lg-12">
                                                                                    <input placeholder="To" type="text" id="idTo" class="form-control Config" value="">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>

                                                                        <input type="text"  id="filterKey" class="form-control Config" value="" style="width: 100%;">

                                                                    </td>
                                                                    <!--                                                    /*----------------------------*/-->



                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>

                                                                        <input type="text" id="filterValue" class="form-control Config" value="" style="width: 100%;">

                                                                    </td>

                                                                    <td>
                                                                        <div class="row">
                                                                            <div class="col-lg-12">
                                                                                <input placeholder="From" id="createdFrom" type="datetime-local" class="form-control Config" value="">
                                                                            </div>
                                                                            <div class="col-lg-12">
                                                                                <input placeholder="To" id="createdTo" type="datetime-local" class="form-control Config" value="">
                                                                            </div>
                                                                        </div>
                                                                    </td>

                                                                    <td>  
                                                                        <div class="row">
                                                                            <div class="col-lg-12">
                                                                                <input placeholder="From" id="updatedFrom" type="datetime-local" class="form-control Config" value="">
                                                                            </div>
                                                                            <div class="col-lg-12">
                                                                                <input placeholder="To" id="updatedTo" type="datetime-local" class="form-control Config" value="">
                                                                            </div>
                                                                        </div>
                                                                    </td>

                                                                    <td  style="padding-bottom: 4px">
                                                                        <div class="button-container">
                                                                            <button type="button" id="clearFilter" class="btn btn-outline-danger btn-block">Clear filter</button>
                                                                        </div>
                                                                        <div class="button-container">
                                                                            <div class="dropdown">
                                                                                <button class="btn btn-outline-success btn-block dropdown-toggle" type="button" id="dropdownMenuButtonn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sort List By:</button>
                                                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="ID" href="#">Sort By ID</a>
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="[Key]"href="#">Sort By Key</a>
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="[Value]"href="#">Sort By Value</a>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </td> 
                                                                </tr>

                                                            </thead>
                                                            <tbody>


                                                            </tbody>

                                                        </table>
                                                    </div>      
                                                </div>
                                                <div class="under-card row" >
                                                    <div class="col-3">
                                                        <div class="previous"  style="margin-top: 10px;">
                                                            <button type="button" disabled="" class="btn">Previous</button>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="row" style="align-items: flex-end;">
                                                            <div class="col-6">
                                                                <div class="pagination-bottom">
                                                                    <div id="pagination">
                                                                        <div class="center"  style="margin-top: 10px;">

                                                                            <span class="pageInfo">
                                                                                <div class="row">
                                                                                    <div class="col-6" style="text-align: end"> Page</div>


                                                                                    <div class="pageJump ">
                                                                                        <div class="col-3">
                                                                                            <input id="jumpToPage" type="number" value="1" min="1" max="0">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div>
                                                                                        /  <span class="totalPages">0</span>  

                                                                                    </div>
                                                                                </div>
                                                                            </span></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-6">
                                                                <span class="select-wrap"  style="margin-top: 10px;">
                                                                    <select id="pageSize">
                                                                        <option value="5">5 Records</option>
                                                                        <option value="10">10 Records</option>
                                                                        <option value="20">20 Records</option>
                                                                        <option value="25">25 Records</option>
                                                                        <option value="50">50 Records</option>
                                                                        <option value="100">100 Records</option>
                                                                    </select>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-3" style="text-align: center;">
                                                        <div class="next" style="text-align: center; margin-top: 10px;"  >
                                                            <button type="button" class="btn" >Next</button>
                                                        </div></div>
                                                </div>
                                            </div>
                                        </form>

                                    </div>

                                </div>                   
                            </div>   
                        </div><!-- comment -->
                    </div>
                </div> 
                <!--                 fix-->
                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="sua"
                     aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-body ttnnbody">
                                <div class="row ">
                                    <div class=" col-sm-12">
                                        <div class="card">
                                            <div class="card-header ttnn">
                                                <h3>Thông tin cấu hình <i class="fa fa-credit-card" aria-hidden="true"> </i>
                                                </h3>

                                            </div>
                                            <div class="card-body">
                                                <form class="needs-validation" action="updateConfig" method="post" >
                                                    <input type="hidden" id="inputID" name="id"/>
                                                    <div class="form-group">
                                                        
                                                        <label for="inputKeyy"> <i class="fa fa-user" aria-hidden="true"></i> Key
                                                            (*)</label>
                                                        <input type="text" class="form-control " id="inputKeyy" name="key"
                                                               readonly>
                                                      
                                                    </div>
                                                      <div class="form-group">
                                                        
                                                        <label for="inputValuee"> <i class="fa fa-user" aria-hidden="true"></i> Value
                                                            (*)</label>
                                                        <input type="text" class="form-control " id="inputValuee" name="value"
                                                               >
                                                      
                                                    </div>
                                                   
                                                    <button type="submit" class="btn btn-outline-primary">Gửi <i
                                                            class="fa fa-check" aria-hidden="true"></i></button>


                                                </form>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>

                            <div class="modal-footer ttnnfooter">
                                <button type="button" class="btn  btn-danger" data-dismiss="modal">Đóng</button>
                            </div>
                        </div>

                    </div>
                </div>
            </header>


        </div>
        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="addConfig"
             aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-body ttnnbody">
                        <div class="row ">
                            <div class=" col-sm-12">
                                <div class="card">
                                    <div class="card-header ttnn">
                                        <h3>Thêm Cấu Hình <i class="fa fa-credit-card" aria-hidden="true"> </i>
                                        </h3>

                                    </div>
                                    <div class="card-body">
                                        <form class="" action="addConfig" method="post" name="myForm"  novalidate >
                                            <div class="form-group">

                                                <label for="inputKey"> <i class="fa fa-user" aria-hidden="true"></i> Key
                                                    (*)</label>
                                                <input type="text" class="form-control " id="inputKey" name="key"
                                                       required>
                                            </div>
                                            <div class="form-group">

                                                <label for="inputKey"> <i class="fa fa-user" aria-hidden="true"></i> Value
                                                    (*)</label>
                                                <input type="text" class="form-control " id="intputValue" name="value"
                                                       required>
                                            </div>
                                            <button type="submit" class="btn btn-outline-primary">Gửi</button>


                                        </form>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                    <div class="modal-footer ttnnfooter">
                        <button type="button" class="btn  btn-danger" data-dismiss="modal">Đóng</button>
                    </div>
                </div>

            </div>
        </div>
    </body>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"  ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  ></script>
    <script src="./asset/js/screen.js"></script>
    <script src="asset/js/configManager.js"></script>


</html>

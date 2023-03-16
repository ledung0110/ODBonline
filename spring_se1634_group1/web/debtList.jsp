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
                                                        <h3 class="mb-0 ">Danh sách người nợ</h3>
                                                        <p class="small text-muted m-0">Total: </p>
                                                    </div>
                                                </div>
                                                <div class="col-6" style="text-align: end">
                                                    <!--                                         Button to trigger the modal -->
                                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#themnguoino">
                                                        <i class="fa fa-plus-square" aria-hidden="true"></i> 
                                                        Thêm người nợ</button>

                                                </div>
                                            </div>
                                        </div>
                                        <form action="" method="">
                                            <div class="card-body" style="text-align: center;padding:1.5rem;">
                                                <div class="row">

                                                    <div class="table-responsive" >

                                                        <table id="debtTable" class="table table-bordered table-striped">
                                                            <thead >
                                                                <tr >

                                                                    <th class="col-1">Id</th>
                                                                    <th class="col-2">Name</th>
                                                                    <th class="col-1">Address</th>
                                                                    <th class="col-1">Phone Number</th>
                                                                    <th class="col-1">Email</th>
                                                                    <th class="col-1">Total Debt</th>
                                                                    <th class="col-1">Created At</th>
                                                                    <th class="col-1">Updated At</th>
                                                                    <th class="col-3">Action</th>

                                                                </tr>
                                                                <tr>
                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>  
                                                                        <div class="centered-content">
                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <input placeholder="From" type="text" id="idFrom" class="form-control filter" value="">
                                                                                </div>
                                                                                <div class="col-lg-12">
                                                                                    <input placeholder="To" type="text" id="idTo" class="form-control filter" value="">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>

                                                                        <input type="text"  id="filterName" class="form-control filter" value="" style="width: 100%;">

                                                                    </td>
                                                                    <!--                                                    /*----------------------------*/-->


                                                                    <td>

                                                                        <input type="text" id="filterAddress" class="form-control filter" value="" style="width: 100%;">

                                                                    </td>
                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>

                                                                        <input type="text" id="filterPhone" class="form-control filter" value="" style="width: 100%;">

                                                                    </td>
                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>

                                                                        <input type="text" id="filterEmail" class="form-control filter" value="" style="width: 100%;">

                                                                    </td>
                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>
                                                                        <div class="row">
                                                                            <div class="col-lg-12">
                                                                                <input placeholder="From" type="text" id="totalFrom" class="form-control filter" value="">
                                                                            </div>
                                                                            <div class="col-lg-12">
                                                                                <input placeholder="To" type="text" id="totalTo" class="form-control filter" value="">
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>
                                                                        <div class="row">
                                                                            <div class="col-lg-12">
                                                                                <input placeholder="From" id="createdFrom" type="datetime-local" class="form-control filter" value="">
                                                                            </div>
                                                                            <div class="col-lg-12">
                                                                                <input placeholder="To" id="createdTo" type="datetime-local" class="form-control filter" value="">
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>  
                                                                        <div class="row">
                                                                            <div class="col-lg-12">
                                                                                <input placeholder="From" id="updatedFrom" type="datetime-local" class="form-control filter" value="">
                                                                            </div>
                                                                            <div class="col-lg-12">
                                                                                <input placeholder="To" id="updatedTo" type="datetime-local" class="form-control filter" value="">
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
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="Address"href="#">Sort By Address</a>
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="Name"href="#">Sort By Name</a>
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="Phone"href="#">Sort By Phone</a>
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="TotalDebt"href="#">Sort By TotalDebt</a>
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="CreatedAt"href="#">Sort By CreatedAt</a>
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="UpdatedAt"href="#">Sort By UpdateddAt</a>
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
            </header>

            <!--modal chi tiet-->
            <div class="modal fade my-custom-size" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
                 aria-hidden="true" id="chitiet">
                <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="section">

                            <div class="container">
                                <div class="debit-manage card" ">
                                    <div class=" card-header">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="left">
                                                    <h3 id="DebtName" class="mb-0 ">Tên người nợ : </h3>
                                                    <p id="DebtTotal" class="small text-muted m-0">Total: </p>
                                                </div>
                                            </div>
                                            <div class="col-6" style="text-align: end">
                                                <button type="button" id="addDD" class="btn btn-danger" data-toggle="modal"
                                                        data-target="#themphieuno">
                                                    <i class="fa fa-plus-square" aria-hidden="true"></i>
                                                    Tạo phiếu nợ </button>

                                            </div>
                                        </div>
                                    </div>
                                    <form action="" method="">
                                        <div class="card-body" style="text-align: center;padding:1.5rem;">
                                            <div class="row">

                                                <div class="table-responsive">

                                                    <table id="debtDetailTable" class="table table-bordered table-striped">
                                                        <thead>
                                                            <tr>

                                                                <th class="col-1">Id</th>
                                                                <th class="col-2">Ghi chú</th>
                                                                <th class="col-1">Loại nợ</th>
                                                                <th class="col-2">Số tiền</th>
                                                                <th class="col-1">Ngày lập phiếu</th>
                                                                <th class="col-1">Thời gian tạo</th>
                                                                <th class="col-3">Action</th>

                                                            </tr>
                                                            <tr>

                                                                <td>

                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <input placeholder="From" type="text" id="idFromDD"
                                                                                   class="form-control debtDetailsList" value="">
                                                                        </div>
                                                                        <div class="col-lg-12">
                                                                            <input placeholder="To" type="text" id="idToDD" class="form-control debtDetailsList"
                                                                                   value="">
                                                                        </div>
                                                                    </div>

                                                                </td>
                                                                <!--                                                    /*----------------------------*/-->


                                                                <td>

                                                                    <input type="text" id="filterNote" value="" class="form-control debtDetailsList" style="width: 100%;">

                                                                </td>
                                                                <!--                                                    /*----------------------------*/-->
                                                                <td>
                                                                    <select id="debtType" class="form-control debtDetailsList" >
                                                                        <option>All</option>
                                                                        <option>+</option>
                                                                        <option>-</option>

                                                                    </select>
                                                                </td>
                                                                <!--                                                    /*----------------------------*/-->

                                                                <!--                                                    /*----------------------------*/-->
                                                                <td>
                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <input id="amountFrom" placeholder="From" type="text"
                                                                                   class="form-control debtDetailsList" value="">
                                                                        </div>
                                                                        <div class="col-lg-12">
                                                                            <input id="amountTo" placeholder="To" type="text" class="form-control debtDetailsList"
                                                                                   value="">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <!--                                                    /*----------------------------*/-->
                                                                <td>
                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <input id="debtCreatedFrom" placeholder="From"  type="datetime-local"
                                                                                   class="form-control debtDetailsList" value="">
                                                                        </div>
                                                                        <div class="col-lg-12">
                                                                            <input id="debtCreatedTo" placeholder="To" type="datetime-local" class="form-control debtDetailsList"
                                                                                   value="">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <!--                                                    /*----------------------------*/-->
                                                                <td>
                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <input id="createdFromDD" placeholder="From" type="datetime-local"
                                                                                   class="form-control debtDetailsList" value="">
                                                                        </div>
                                                                        <div class="col-lg-12">
                                                                            <input id="createdToDD" placeholder="To" type="datetime-local" class="form-control debtDetailsList"
                                                                                   value="">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td style="padding-bottom: 4px">

                                                                    <!--                                                                    <div class="row">-->
                                                                    <div class="button-container">
                                                                        <button id="clearFilterDD" type="button"
                                                                                class="btn btn-outline-danger btn-block">Clear
                                                                            filter</button>
                                                                    </div>

                                                                    <div class="button-container">
                                                                        <div class="dropdown">

                                                                            <button
                                                                                class="btn  btn-outline-success btn-block dropdown-toggle"
                                                                                style="padding: 2px;;" type="button"
                                                                                id="dropdownMenuButtonDD" data-toggle="dropdown"
                                                                                aria-haspopup="true" aria-expanded="false"
                                                                                style="color:yellowgreen;">
                                                                                Sort List By:
                                                                            </button>
                                                                            <div class="dropdown-menu"
                                                                                 aria-labelledby="dropdownMenuButton">
                                                                                <a class="dropdown-item sort-link sortDD" data-field="ID" href="#">Sort by ID</a>
                                                                                <a class="dropdown-item sort-link sortDD" data-field="Note" href="#">Sort by Note</a>
                                                                                <a class="dropdown-item sort-link sortDD" data-field="DebtType" href="#">Sort by Debt Type</a>
                                                                                <a class="dropdown-item sort-link sortDD" data-field="Amount" href="#">Sort by Amount</a>
                                                                                <a class="dropdown-item sort-link sortDD" data-field="DebtCreatedAt" href="#">Sort by Debt Created Time</a>
                                                                                <a class="dropdown-item sort-link sortDD" data-field="DateCreateAt" href="#">Sort by Time Created </a>
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
                                            <div class="under-card row">
                                                <div class="col-3">
                                                    <div id="previousDD" style="margin-top: 10px;">
                                                        <button type="button" disabled="" class="btn">Previous</button>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="row" style="align-items: flex-end;">
                                                        <div class="col-6">
                                                            <div class="pagination-bottom">
                                                                <div id="pagination">
                                                                    <div class="center" style="margin-top: 10px;">

                                                                        <span class="pageInfo">
                                                                            <div class="row">
                                                                                <div class="col-6" style="text-align: end"> Page
                                                                                </div>


                                                                                <div class="pageJump ">
                                                                                    <div class="col-3">
                                                                                        <input id="jumpToPageDD" type="number"
                                                                                               value="1" min="1" max="0">
                                                                                    </div>
                                                                                </div>
                                                                                <div>
                                                                                    / <span id="totalPagesDD">0</span>

                                                                                </div>
                                                                            </div>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <span class="select-wrap" style="margin-top: 10px;">
                                                                <select id="pageSizeDD">
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
                                                    <div id="nextDD"  style="text-align: center;margin-top: 10px;">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--        modal them nguoi no-->
            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="themnguoino"
                 aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-body ttnnbody">
                            <div class="row ">
                                <div class=" col-sm-12">
                                    <div class="card">
                                        <div class="card-header ttnn">
                                            <h3>Thêm người nợ <i class="fa fa-credit-card" aria-hidden="true"> </i>
                                            </h3>

                                        </div>
                                        <div class="card-body">
                                            <form class="" action="adddebtor" method="post" name="myForm" id="addDebts" novalidate onsubmit="return(validate());">
                                                <div class="form-group">
                                                    <label for="inputName"> <i class="fa fa-user" aria-hidden="true"></i> Họ
                                                        và tên
                                                        (*)</label>
                                                    <input type="text" class="form-control " id="inputName" name="name"
                                                           required>



                                                </div>
                                                <div class="form-group ">
                                                    <label for="inputEmail"><i class="fa fa-envelope-o fa-fw"></i> Email
                                                    </label>
                                                    <input type="text" class="form-control" id="inputEmail" name="email">
                                                    <!-- <p class="text-danger" id="AlertEmail"></p> -->

                                                </div>
                                                <div class="form-group">
                                                    <label for="inputAddress"> <i class="fa fa-map-marker"aria-hidden="true"></i>
                                                        Địa chỉ</label>
                                                    <input type="text" class="form-control" id="inputAddress" name="address">

                                                </div>

                                                <div class="form-group">
                                                    <label for="inputSdt"><i class="fa fa-phone" aria-hidden="true"></i>
                                                        Số Điện thoại </label>
                                                    <input type="text" class="form-control" id="inputSdt" name="phone" onkeypress="return onlyNumberKey(event)" 
                                                           maxlength="11">
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
            <!--   modal them phieu no -->
            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
                 id="themphieuno" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-body ttnnbody">
                            <div class="row ">
                                <div class=" col-sm-12">
                                    <div class="card">
                                        <div class="card-header ttnn">
                                            <h3 class="text-center">Thêm phiếu nợ <i class="fa fa-money"
                                                                                     aria-hidden="true"></i></h3>
                                            <h3 id="nameDebt" ></h3>
                                            <h3 id="currentTotalDebt" ></h3>
                                        </div>
                                        <div class="card-body">
                                            <form class="needs-validation" action="addDebtDetail" id="addDebtDetailForm" method="Post" enctype="multipart/form-data" novalidate>
                                                <input type="hidden" name="id"id="inputIDAdd" >
                                                <div class="form-group">
                                                    <label for=""> <i class="fa fa-user" aria-hidden="true"></i> Loại
                                                        nợ:(*)</label>
                                                    <div class="btn-group btn-group-toggle col-md-12" data-toggle="buttons">

                                                        <label class="btn btn-outline-success active" data-value="true" style="width:49%">
                                                            <input type="radio" name="debtType" id="positiveType" value="true"
                                                                   autocomplete="off" checked >
                                                            +
                                                        </label>

                                                        <label class="btn btn btn-outline-danger" data-value="false" style="width:49%">
                                                            <input type="radio" name="debtType" id="negativeType" value="false"
                                                                   autocomplete="off"> -
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputNote"> <i class="fa fa-comment"
                                                                               aria-hidden="true"></i>
                                                        Ghi chú </label>

                                                    <textarea name="note" id="inputNote" class="form-control" cols="30"
                                                              rows="5"></textarea>

                                                    <div class="valid-feedback">Hợp lệ.</div>
                                                    <div class="invalid-feedback">Điền đầy đủ thông tin.</div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputAmount"><i class="fa fa-money"
                                                                                aria-hidden="true"></i>
                                                        Số tiền </label>
                                                    <input type="text" class="form-control" name="amount" id="inputAmount" onkeypress="return onlyNumberKey(event)" 
                                                           placeholder="nhập số tiền... " >
                                                    <div id="readAmount"> </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="debtCreatedAt"><i class="fa fa-calendar" aria-hidden="true"></i>
                                                        Ngày lập phiếu </label>
                                                    <input type="datetime-local" name="debtCreatedAt" class="form-control" id="debtCreatedAt"
                                                           placeholder="enter Number">
                                                </div>
                                                <div class="form-group">

                                                    <label for="image-input"><i class="fa fa-picture-o" aria-hidden="true"></i>
                                                        Hình ảnh xác minh: </label>
                                                    <input type="file" name="image" id="image-input" accept="image/*">

                                                    <div id="image-preview">

                                                    </div>
                                                    <button class="btn btn-primary" id="cancel-button" 
                                                            style="display:none;">Cancel</button>


                                                </div>

                                                <button type="submit" id="sendForm" class="btn btn-outline-info">Gửi</button>


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
            <!--modal sua-->
            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="sua"
                 aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-body ttnnbody">
                            <div class="row ">
                                <div class=" col-sm-12">
                                    <div class="card">
                                        <div class="card-header ttnn">
                                            <h3>THÔNG TIN NGƯỜI NỢ <i class="fa fa-credit-card" aria-hidden="true"> </i>
                                            </h3>

                                        </div>
                                        <div class="card-body">
                                            <form class="needs-validation" action="updatedebtor" method="post" name="myForm2" novalidate onsubmit="return(validate2());">
                                                <div class="form-group">
                                                    <input type="hidden" id="inputIDUpdate" name="id"/>
                                                    <label for="inputNamee"> <i class="fa fa-user" aria-hidden="true"></i> Họ
                                                        và tên
                                                        (*)</label>
                                                    <input type="text" class="form-control " id="inputNamee" name="name"
                                                           required>
                                                    <!-- <p class="text-danger" id="Alertname"></p> -->
                                                </div>
                                                <div class="form-group ">
                                                    <label for="inputEmaill"><i class="fa fa-envelope-o fa-fw"></i> Email
                                                    </label>
                                                    <input type="email" class="form-control" id="inputEmaill" name="email"
                                                           required>
                                                    <!-- <p class="text-danger" id="AlertEmail"></p> -->

                                                </div>
                                                <div class="form-group">
                                                    <label for="inputAddresss"> <i class="fa fa-map-marker"
                                                                                   aria-hidden="true"></i>
                                                        Địa chỉ</label>
                                                    <input type="text" class="form-control" id="inputAddresss"  name="address">

                                                </div>

                                                <div class="form-group">
                                                    <label for="inputSdtt"><i class="fa fa-phone" aria-hidden="true"></i>
                                                        Số điện thoại </label>
                                                    <input type="text" class="form-control" id="inputSdtt"  name="phone"
                                                           onkeypress="return onlyNumberKey(event)" maxlength="11">
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputTotalDebt"><i class="fa fa-money"
                                                                                   aria-hidden="true"></i>
                                                        Total debt </label>
                                                    <input type="text" class="form-control" id="inputTotalDebtt" value=""
                                                           readonly>
                                                    <div class="textTotal"> </div>
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

            <!--   modal chiTietThanhToanPhieuNo -->
            <div class="modal fade bd-example-modal-lg " tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
                 id="chitietthanhtoanphieuno" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-body ttnnbody">
                            <div class="row ">
                                <div class=" col-sm-12">
                                    <div class="card">
                                        <div class="card-header ttnn">
                                            <h3 class="text-center">Chi tiết nợ <i class="fa fa-money" aria-hidden="true"></i>
                                            </h3>


                                        </div>
                                        <div class="card-body">
                                            <form class="needs-validation" action="" method="" novalidate>
                                                <div class="form-group">
                                                    <label for=""> <i class="fa fa-user" aria-hidden="true"></i> Loại
                                                        nợ:(*) </label>
                                                    <div class="btn-group btn-group-toggle col-md-12" data-toggle="buttons"
                                                         disabled>

                                                        <label class="btn btn-outline-success active disabled" style="width:49%">
                                                            <input type="radio" name="debtType" value="true"
                                                                   autocomplete="off" checked>
                                                            +
                                                        </label>

                                                        <label class="btn btn btn-outline-danger" style="width:49%">
                                                            <input type="radio" name="debtType" value="false"
                                                                   autocomplete="off"> -
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputNote"> <i class="fa fa-comment" aria-hidden="true"></i>
                                                        Ghi chú </label>

                                                    <textarea name="" id="inputNote" class="form-control" cols="30" rows="5"
                                                              disabled></textarea>


                                                </div>
                                                <div class="form-group">
                                                    <label for="inputTotalDebt"><i class="fa fa-money" aria-hidden="true"></i>
                                                        Số tiền </label>
                                                    <input type="text" class="form-control" id="inputTotalDebt"
                                                           onkeypress="return onlyNumberKey(event)" disabled>
                                                    <div class=""> </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputSdt"><i class="fa fa-calendar" aria-hidden="true"></i>
                                                        Ngày lập phiếu </label>
                                                    <input type="datetime-local" class="form-control" id=""
                                                           placeholder="enter Number" disabled>
                                                </div>
                                                <div class="form-group">

                                                    <label for="image-input"><i class="fa fa-picture-o" aria-hidden="true"></i>
                                                        Hình ảnh xác minh: </label>
                                                    <input type="file" name="imageInput" id="image-input" accept="image/*">

                                                    <div id="image-preview">

                                                    </div>
                                                    <button class="btn btn-primary" id="cancel-button"
                                                            style="display:none;">Cancel</button>


                                                </div>

                                                <button type="submit" class="btn btn-outline-info">Gửi</button>


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
            <!--               modal thanhtoanphieuno 
                        <div class="modal fade bd-example-modal-lg " tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
                             id="thanhtoanphieuno" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-body ttnnbody">
                                        <div class="row ">
                                            <div class=" col-sm-12">
                                                <div class="card">
                                                    <div class="card-header ttnn">
                                                        <h3 class="text-center">Chi tiết nợ <i class="fa fa-money" aria-hidden="true"></i>
                                                        </h3>
            
            
                                                    </div>
                                                    <div class="card-body">
                                                        <form class="needs-validation" action="" method="" novalidate>
                                                            <div class="form-group">
                                                                <label for=""> <i class="fa fa-user" aria-hidden="true"></i> Loại
                                                                    nợ:(*)</label>
                                                                <div class="btn-group btn-group-toggle col-md-12" data-toggle="buttons">
            
                                                                    <label class="btn btn-outline-success   " style="width:49%">
                                                                        <input type="radio" name="options" id="option1" autocomplete="off"
                                                                               >
                                                                        +
                                                                    </label>
            
                                                                    <label class="btn btn btn-outline-danger" style="width:49%">
                                                                        <input type="radio" name="options" id="option2" autocomplete="off">
                                                                        -
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="inputNote"> <i class="fa fa-comment" aria-hidden="true"></i>
                                                                    Ghi chú </label>
            
                                                                <textarea name="" id="inputNote" class="form-control" cols="30"
                                                                          rows="5"></textarea>
            
                                                                <div class="valid-feedback">Hợp lệ.</div>
                                                                <div class="invalid-feedback">Điền đầy đủ thông tin.</div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="inputTotalDebt"><i class="fa fa-money" aria-hidden="true"></i>
                                                                    Số tiền </label>
                                                                <input type="text" class="form-control" id="inputTotalDebt"
                                                                       onkeypress="return onlyNumberKey(event)" placeholder="nhập số tiền... ">
                                                                <div class=""> </div>
                                                            </div>
            
                                                            <div class="form-group">
                                                                <label for="inputSdt"><i class="fa fa-calendar" aria-hidden="true"></i>
                                                                    Ngày lập phiếu </label>
                                                                <input type="datetime-local" class="form-control" id=""
                                                                       placeholder="enter Number">
                                                            </div>
                                                            <div class="form-group">
            
                                                                <label for="image-input"><i class="fa fa-picture-o" aria-hidden="true"></i>
                                                                    Hình ảnh xác minh: </label>
                                                                <input type="file" id="image-input" accept="image/*">
            
                                                                <div id="image-preview">
            
                                                                </div>
                                                                <button class="btn btn-primary" id="cancel-button"
                                                                        style="display:none;">Cancel</button>
            
            
                                                            </div>
            
                                                            <button type="submit" class="btn btn-outline-info">Gửi</button>
            
            
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
                        </div>-->

        </div>

    </body>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"  ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  ></script>
    <script src="./asset/js/screen.js"></script>
    <script src="asset/js/addDebtor.js"></script>
    <script src="asset/js/debtList.js"></script>


</html>




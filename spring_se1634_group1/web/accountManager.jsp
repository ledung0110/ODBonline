<%-- 
    Document   : HomePage
    Created on : Feb 3, 2023, 9:54:39 PM
    Author     : phanv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

                                            </div>
                                        </div>
                                        <form action="" method="">
                                            <div class="card-body" style="text-align: center;padding:1.5rem;">
                                                <div class="row">

                                                    <div class="table-responsive" >

                                                        <table id="accountTable" class="table table-bordered table-striped">
                                                            <thead >
                                                                <tr >

                                                                    <th class="col-1">Id</th>
                                                                    <th class="col-2">User Name</th>
                                                                    <th class="col-2">Access</th>
                                                                    <th class="col-1">Active</th>
                                                                    <th class="col-3">Action</th>

                                                                </tr>
                                                                <tr>
                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>  
                                                                        <div class="centered-content">
                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <input placeholder="From" type="text" id="idFrom" class="form-control" value="">
                                                                                </div>
                                                                                <div class="col-lg-12">
                                                                                    <input placeholder="To" type="text" id="idTo" class="form-control" value="">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <!--                                                    /*----------------------------*/-->
                                                                    <td>

                                                                        <input type="text"  id="filterUserName" class="form-control" value="" style="width: 100%;">

                                                                    </td>
                                                                    <!--                                                    /*----------------------------*/-->



                                                                    <!--                                                    /*----------------------------*/-->
                                                                    
                                                                    <td>
                                                                    <select id="filterAccess" class="form-control" style="width: 100%;" >
                                                                        <option>All</option>
                                                                        <option>Admin</option>
                                                                        <option>User</option>

                                                                    </select>
                                                                        </td>

                                                                    <!--                                                    /*----------------------------*/-->

                                                                     <td>
                                                                    <select id="filterActive" class="form-control" style="width: 100%;" >
                                                                        <option>All</option>
                                                                        <option>Activated</option>
                                                                        <option>Not Activated</option>

                                                                    </select>
                                                                        </td>
                                                                    <!--                                                    /*----------------------------*/-->

                                                                    <!--                                                    /*----------------------------*/-->

                                                                    <!--                                                    /*----------------------------*/-->

                                                                    <td  style="padding-bottom: 4px">
                                                                        <div class="button-container">
                                                                            <button type="button" id="clearFilter" class="btn btn-outline-danger btn-block">Clear filter</button>
                                                                        </div>
                                                                        <div class="button-container">
                                                                            <div class="dropdown">
                                                                                <button class="btn btn-outline-success btn-block dropdown-toggle" type="button" id="dropdownMenuButtonn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sort List By:</button>
                                                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="ID" href="#">Sort By ID</a>
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="UserName"href="#">Sort By User Name</a>
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="IsAdmin"href="#">Sort By Admin</a> 
                                                                                    <a class="dropdown-item sort-link sortD"  data-field="IsConfirmed"href="#">Sort By Confirmed</a>
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
                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="fixAdmin"
                     aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-body ttnnbody">
                                <div class="row ">
                                    <div class=" col-sm-12">
                                        <div class="card">
                                            <div class="card-header ttnn">
                                                <h3>ACCOUT INFORMATION <i class="fa fa-credit-card" aria-hidden="true"> </i>
                                                </h3>

                                            </div>
                                            <div class="card-body">
                                                <form class="needs-validation" action="UpdateAccount" method="post" name="myForm2">
                                                    <div class="form-group">
                                                        <input type="hidden" id="inputID" name="id"/>
                                                        <label for="inputUser"> <i class="fa fa-user" aria-hidden="true"></i> User Name
                                                            (*)</label>
                                                        <input type="text" class="form-control " id="inputUser" name="name"
                                                               required>
                
                                                    </div>
                                                    <div class="form-group">
                                                    <select class="custom-select" name="access">
                                                        <option value="1">Admin</option>
                                                        <option value="0">User</option>
                                                    </select>
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
    </body>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"  ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  ></script>
    <script src="./asset/js/screen.js"></script>
    <script src="asset/js/accountManager.js"></script>


</html>

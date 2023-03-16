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
        <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="./icon/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./asset/css/HomePage.css">      
        <link rel="stylesheet" href="./asset/css/addDebtor.css">
    </head>
    <body>
        <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Simple Sidebar - Start Bootstrap Template</title>
            <!-- Favicon-->
            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <!-- Core theme CSS (includes Bootstrap)-->
            <link href="css/styles.css" rel="stylesheet" />
        </head>
        <body>
            <div class="d-flex" id="wrapper">
                <!-- Sidebar-->
                <div class="sidebar">

                    <div class="profile">
                        <img src="./img/logo.png" alt="profile image">
                        <h3>ODB Tín Dụng</h3>
                        <p>Sổ ghi nợ ONLINE</p>
                    </div>
                    <!-- side menu bar -->
                    <ul>
                        <li><a href="#">
                                <span class="icon"><i class="fas fa-home"></i></span>
                                <span class="Item">Trang chủ</span></a>
                        </li>
                        <li><a href="debtList.jsp">
                                <span class="icon"><i class="fas fa-desktop"></i></span>
                                <span class="Item">Dịch vụ</span></a>
                        </li>

                        <li><a href="#">
                                <span class="icon"><i class="fas fa-user-shield"></i></span>
                                <span class="Item">Admin</span></a>
                        </li>
                        <li><a href="#">
                                <span class="icon"><i class="fas fa-cog"></i></span>
                                <span class="Item">Setting</span></a>
                        </li>

                    </ul>
                </div>
                <!-- Page content wrapper-->
                <div id="page-content-wrapper">
                    <!-- Top navigation-->
            
                    <!-- Page content-->
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
                                <div class="card-body">
                                    <div class="row">
                                        <div class="table-responsive">
                                            <table id="debtTable" class="table table-bordered table-striped">
                                                <thead >
                                                    <tr >

                                                        <th class="col-1">Id</th>
                                                        <th class="col-2">Name</th>
                                                        <th class="col-1">Địa chỉ</th>
                                                        <th class="col-1">SDT</th>
                                                        <th class="col-1">Email</th>
                                                        <th class="col-1">Tổng nợ</th>
                                                        <th class="col-1">Ngày tạo</th>
                                                        <th class="col-1">Cập nhật</th>
                                                        <th class="col-3">Action</th>

                                                    </tr>

                                                </thead>
                                                <tbody>

                                                    <tr>
                                                        <!--                                                    /*----------------------------*/-->
                                                        <td>  

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <input placeholder="From" type="text" class="form-control" value="">
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <input placeholder="To" type="text" class="form-control" value="">
                                                                </div>
                                                            </div>

                                                        </td>
                                                        <!--                                                    /*----------------------------*/-->
                                                        <td>

                                                            <input type="text" value="" style="width: 100%;">

                                                        </td>
                                                        <!--                                                    /*----------------------------*/-->


                                                        <td>

                                                            <input type="text" value="" style="width: 100%;">

                                                        </td>
                                                        <!--                                                    /*----------------------------*/-->
                                                        <td>

                                                            <input type="text" value="" style="width: 100%;">

                                                        </td>
                                                        <!--                                                    /*----------------------------*/-->
                                                        <td>

                                                            <input type="text" value="" style="width: 100%;">

                                                        </td>
                                                        <!--                                                    /*----------------------------*/-->
                                                        <td>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <input placeholder="From" type="text" class="form-control" value="">
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <input placeholder="To" type="text" class="form-control" value="">
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <!--                                                    /*----------------------------*/-->
                                                        <td>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <input placeholder="From" type="text" class="form-control" value="">
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <input placeholder="To" type="text" class="form-control" value="">
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <!--                                                    /*----------------------------*/-->
                                                        <td>  
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <input placeholder="From" type="text" class="form-control" value="">
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <input placeholder="To" type="text" class="form-control" value="">
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td  style="padding-bottom: 4px">
                                                            <button type="button" class="btn btn-outline-danger btn-block">Clear filter</button>
                                                            <button type="button" class="btn btn-outline-primary btn-block">Hide &gt;&gt;</button>
                                                        </td> 
                                                    </tr>




                                                </tbody>

                                            </table>
                                        </div>      
                                    </div>
                                    <div class="row">
                                        <div class="col-3">
                                            <div class="previous">
                                                <button type="button" disabled="" class="btn">Previous</button>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="pagination-bottom">
                                                        <div id="pagination">
                                                            <div class="center">

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
                                                    <span class="select-wrap">
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
                                        <div class="col-3" style="text-align: end;">
                                            <div class="next">
                                                <button type="button" class="btn" >Next</button>
                                            </div></div>
                                    </div>
                                </div>
                            </form>

                        </div>

                    </div>
                    
                </div>
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
                                            <a class="dropdown-item" href="accControl">User Information</a>
                                            <a class="dropdown-item" href="#">Option 2</a>
                                            <a class="dropdown-item" href="logout">Logout</a>
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                        </div>
                    </div>
            </div>
            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="js/scripts.js"></script>
        </body>
    </html>

</body>
</html>

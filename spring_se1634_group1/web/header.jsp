<%-- 
    Document   : header
    Created on : Feb 26, 2023, 9:17:43 PM
    Author     : nvash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <img src="era-of-online-accounting-software-for-small-business-1582100462170148143462.jpg" alt=""
         style="transform: scale(1.5,1.4) ">
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
            </div><!-- comment -->
        </div>
    </header>
</html>

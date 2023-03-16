<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=div, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>ForgotPassword</title>
        <link rel="stylesheet" href="asset/css/forgetPassword.css"/>
        <link rel="stylesheet" href="asset/css/modal.css">

    </head>

    <body>
        <div class="background-image"> 
            <div class="container  mt-5">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10 main ">
                        <div class="forgot">

                            <h2>Forgot your password?</h2>
                            <p>Change your password in three easy steps. This will help you to secure your password!</p>
                            <ol class="list-unstyled">
                                <li><span class="text-primary text-medium">1. </span>Enter the your account's username below.</li>
                                <li><span class="text-primary text-medium">2. </span>Our system will send you a link to email link with this account
                                </li>
                            </ol>

                        </div>
                        <!-- be nho sua phan action-->
                        <form class="card mt-4 " id="forgotform" action="forgot" method="post">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="email-for-pass">Enter your account's username</label>
                                    <input class="form-control" type="text" name="username" id="username" required/>
                                    <small class="form-text text-muted">Enter the your account's username . Then we'll email a link to
                                        email link with this account.</small>
                                </div>
                                <div class="g-recaptcha" data-sitekey="6LfmnoEkAAAAABOUgIhNz6MpA-xs2ABmGyRc3225"></div>
                            </div>
                            <!--h6 hien thi khi mail chua dc dang ki,backend nho dien vao nhe !-->


                            <div class="card-footer">
                                <button class="btn btn-outline-light" id="getnewpassword">Get New Password</button>
                            </div>
                        </form>
                        <form class="card mt-4 mb-3" action="login" method="get">
                            <button class="btn btn-outline-light " type="submit">Back to Login</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <div id="informModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Inform</h2>
                </div>
                <div class="modal-body">
                    <p id="modalMessage"></p>
                </div>
                <div class="modal-footer">
                    <button id="closeModalButton">Close</button>
                </div>
            </div>
        </div>

    </body>

</html>
<script src="asset/js/forgotpassword.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>




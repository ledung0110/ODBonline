<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <meta name="viewport" content="width=div, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>ForgotPassword</title>
        <link rel="stylesheet" href="asset/css/OTP.css">
         <link rel="stylesheet" href="asset/css/modal.css">

    </head>

    <body>
        <div class="background-image"> 
            <!-- <div class="form-group"> -->
            <div class="d-flex justify-content-center align-items-center mt-5">
                <form action="reset" id="resetform" method="post" class="col-md-8">

                    <div class="card">
                            <h5 class="card-header">Reset Password</h5>
                            <div class="card-body">
                                <form>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">Account</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="username" id="username" value="${username}" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">New Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" name="password" id="password" placeholder="New Password">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        <div class="g-recaptcha d-flex justify-content-center mb-4" data-sitekey="6LfmnoEkAAAAABOUgIhNz6MpA-xs2ABmGyRc3225"></div>



                        <div class="card-footer text-center">
                            <button class="btn btn-outline-light" id="resetbutton" type="submit" >Reset</button>
                        </div>
                    </div>
                </form>
            </div>
            <!--</div>-->

        </div> 
        <!-- resend otp -->
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
<script src="asset/js/resetpassword.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

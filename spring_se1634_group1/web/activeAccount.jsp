<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=div, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>ForgotPassword</title>
        <link rel="stylesheet" href="asset/css/activeAccount.css"/>

    </head>

    <body>
        <div class="background-image"> 
            <!-- <div class="form-group"> -->
            <div class="d-flex justify-content-center align-items-center mt-5">
                <form action="" method="" class="col-md-4">

                    <div class="card py-5 px-5 ">
                        <h5 class="m-0">Reset Password</h5>
                        <input type="text" id="username" name="username" value="${param.username}">
                        <input  type="hidden" id="token" name="token" value="${param.token}">
                        <span class="mobile-text">enter the New Password</span>
                        <div class="d-flex flex-row mt-5">

                            <input type="text" class="form-control" name="" autofocus />

                        </div>
                        <div class="text-color mt-5">
                            <span class="d-block mobile-text" id="countdown"></span>

                            <span class="d-block mobile-text" id="resend"></span>

                        </div>
                        <!--h6 hien thi khi otp nhap vao khong khop,backend nho dien vao nhe !-->
                        <!--   <h6>$...</h6>-->
                        <div class="card-footer">
                            <button class="btn btn-success" type="submit" >Send OTP</button>
                        </div>
                    </div>
                </form>
            </div>
            <!--</div>-->

        </div> 

    </body>

</html>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
crossorigin="anonymous"></script>
<script  src="script.js" ></script>
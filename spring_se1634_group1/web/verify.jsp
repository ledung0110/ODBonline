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


                <div class="card py-5 px-5 ">
                    <div class="card-header">
                        <h5 class="m-0 text-white">Verify Account</h5>
                    </div>

                    <div class="card-body">
                        <form action="verifyacc" id="verifyform" method="post" class="">
                            <div class="form-group">
                                <div class="row mb-2">
                                    <div class="col-4"><p class="text-white">Username(*)</p></div>
                                    <input class="form-control col-8"  type="text" value="${username}" readonly name="username">
                                </div>
                            </div>
                            <div class="row ml-3 mb-3">
                                <input  type="hidden" id="token" name="token" value="${param.token}">

                                <div class="g-recaptcha" data-sitekey="6LfmnoEkAAAAABOUgIhNz6MpA-xs2ABmGyRc3225"></div>

                            </div>
                                <div class="form-group">
                                 <button class="btn btn-outline-light" id="verifybutton" type="submit">Verify</button>   
                                 </div>
                        </form>
                             
                    </div>

                    <!--h6 hien thi khi otp nhap vao khong khop,backend nho dien vao nhe !-->
                    <!--   <h6>$...</h6>-->
                    <!--<div class="card-footer">-->
                   
                    <!--</div>-->
                </div>

            </div>
            <!--</div>-->

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
        <!-- resend otp -->
    </body>

</html>
<script src="asset/js/verify.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

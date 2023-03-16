<%-- 
    Document   : login
    Created on : Jan 27, 2023, 12:37:15 PM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <link rel="stylesheet" href="./asset/css/loginPage.css">
        <link rel="stylesheet" href="asset/css/modal.css">

    </head>
    <body>

        <div class="container" id="container">

            <div class="form-container sign-in-container">
                <form id="signupForm" action="signup" method="post">
                    <h1>Create Account</h1>
                    <input type="text" placeholder="Name" id="username" name="username" required/>
                    <input type="email" placeholder="Email" id="email" name="email"required/>
                    <input type="password" placeholder="Password" id="password" name="password" required/>
                    <div id="recaptcha-2" class="g-recaptcha" data-sitekey="6LfmnoEkAAAAABOUgIhNz6MpA-xs2ABmGyRc3225" ></div>
                    <button id="signupButton">Sign Up</button>


                </form>
               
            </div>
            <div class="overlay-container">
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
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp" onclick="window.location.href='login';">Sign In</button>
                    </div>

                </div>
            </div>
        </div>

    </body>
    
    
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="asset/js/signup.js"></script>

</html>

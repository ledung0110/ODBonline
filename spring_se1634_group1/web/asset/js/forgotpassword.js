const getNewPassword = document.getElementById("getnewpassword");
const informModal = document.getElementById("informModal");
const closeModalButton = document.getElementById("closeModalButton");
const modalMessage = document.getElementById("modalMessage");
const forgotForm = document.getElementById("forgotform");


document.addEventListener('click', function (event) {
    if (event.target.closest('#closeModalButton') || !event.target.closest('.modal-content')) {
        hideModal();
    }
});

function showModal() {
    informModal.style.display = "block";
    localStorage.setItem("modalShown", "true");
    localStorage.setItem("content", modalMessage.innerHTML);
}

function hideModal() {
    informModal.style.display = "none";
    localStorage.setItem("modalShown", "false");
}

getNewPassword.addEventListener("click", function (event) {
    event.preventDefault();
    const username = document.getElementById("username").value;
    const recaptchaResponse = grecaptcha.getResponse();

    isValidForgot(username,recaptchaResponse);
});


function isValidForgot(username,recaptchaResponse) {
    $.ajax({
        url: "checkAccountName",
        type: "POST",
        data: {
            username: username
        },
        success: function (response) {
             if (username.length === 0) {
                modalMessage.innerHTML = "please enter username!";
                showModal();
            }
            else if (response !== "taken") {
                modalMessage.innerHTML = "username was not existed";
                showModal();
            } else {
                $.ajax({
                    url: "checkCaptcha",
                    type: "POST",
                    data: {
                        captcha: recaptchaResponse
                    },
                    success: function (response) {
                        if (response === "true") {
                            modalMessage.innerHTML = "Please check your email to reset your password!";
                            showModal();
                            forgotForm.submit();
                        } else {
                            modalMessage.innerHTML = "Please verify that you're not a robot.";
                            showModal();
                        }
                    }
                });

            }
            

        },
        error: function () {
            console.log("Error checking username availability");
        }
    });
}






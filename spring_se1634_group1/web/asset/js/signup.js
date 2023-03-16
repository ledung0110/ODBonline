const signupButton = document.getElementById("signupButton");
const informModal = document.getElementById("informModal");
const closeModalButton = document.getElementById("closeModalButton");
const modalMessage = document.getElementById("modalMessage");
const signupForm = document.getElementById("signupForm");

function isValidUsername(username) {
    const usernameRegex = /[a-zA-Z0-9_]{5,20}/g;
    return usernameRegex.test(username);
}

// Check if the password is at least 8 characters long and contains at least one uppercase letter, one lowercase letter, and one number
function isValidPassword(password) {
    const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
    return passwordRegex.test(password);
}

function isValidEmail(email) {
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return emailRegex.test(email);
}

function showModal() {
    informModal.style.display = "block";
    localStorage.setItem("modalShown", "true");
    localStorage.setItem("content",modalMessage.innerHTML);
}

function hideModal() {
    informModal.style.display = "none";
    localStorage.setItem("modalShown", "false");
}

signupButton.addEventListener("click", function (event) {
    event.preventDefault();
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const email = document.getElementById("email").value;
    const recaptchaResponse = grecaptcha.getResponse();

    isValidSignUp(username, password, email, recaptchaResponse);
});
 

function isValidSignUp(username, password, email, recaptchaResponse) {
    $.ajax({
        url: "checkAccountName",
        type: "POST",
        data: {
            username: username 
        },
        success: function (response) {

            if (!isValidUsername(username)) {
                modalMessage.innerHTML =
                        "the username must be between 5 and 20 characters and only contains letters, numbers, underscores";
            } else if (!isValidPassword(password)) {
                modalMessage.innerHTML =
                        "password must be at least 8 characters long and contains at least one uppercase letter, one lowercase letter, and one number";
            } else if (!isValidEmail(email)) {
                modalMessage.innerHTML = "email invalid";
            } else if (response === "taken") {
                modalMessage.innerHTML = "username duplicated!";
            } else {
                $.ajax({
                    url: "checkCaptcha",
                    type: "POST",
                    data: {
                       captcha: recaptchaResponse
                    },
                    success: function (response) {
                        if (response === "true") {
                            modalMessage.innerHTML = "Please check your email to activate your account";
                            showModal();
                             signupForm.submit();
                        } else {
                            modalMessage.innerHTML ="Please verify that you're not a robot.";
                            grecaptcha.reset();
                        }
                    }
                });
                
            }
            showModal();

        },
        error: function () {
            console.log("Error checking username availability");
        }
    });
}
document.addEventListener('click', function (event) {
    if (event.target.closest('#closeModalButton') || !event.target.closest('.modal-content')) {
        hideModal();
    }
});







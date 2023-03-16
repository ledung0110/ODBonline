const signinButton = document.getElementById("signinButton");
const informModal = document.getElementById("informModal");
const closeModalButton = document.getElementById("closeModalButton");
const modalMessage = document.getElementById("modalMessage");
const signinForm = document.getElementById("signinForm");



document.addEventListener('click', function (event) {
    if (event.target.closest('#closeModalButton') || !event.target.closest('.modal-content')) {
        hideModal();
    }
});

function showModal() {
    informModal.style.display = "block";
    localStorage.setItem("modalShown", "true");
    localStorage.setItem("content", modalMessage.innerHTML);
    setTimeout(function () {
        hideModal();
    }, 10000);
}

function hideModal() {
    informModal.style.display = "none";
    localStorage.removeItem('modalShown');
}

signinButton.addEventListener("click", function (event) {
    event.preventDefault();
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const recaptchaResponse = grecaptcha.getResponse();
    isValidSignIn(username, password, recaptchaResponse);
});


function isValidSignIn(username, password, recaptchaResponse) {
    $.ajax({
        url: "checkauth",
        type: "POST",
        data: {
            username: username, password: password, captcha: recaptchaResponse
        },
        success: function (response) {
            if (username.length === 0) {
                modalMessage.innerHTML = "please enter username!";
                showModal();
            } else if (password.length === 0) {
                modalMessage.innerHTML = "please enter password!";
                showModal();
            } else {
                if (response === "false") {
                    modalMessage.innerHTML = "Captcha required";
                    showModal();
                } else {
                    if (response === "not confirmed") {
                        modalMessage.innerHTML = "This account has not been activated, select forgot password to activate this account!";
                        grecaptcha.reset();
                        showModal();
                    } else if (response === "invalid") {
                        modalMessage.innerHTML = "This account is invalid!";
                        grecaptcha.reset();
                        showModal();
                    } else {
                        grecaptcha.reset();
                        signinForm.submit();

                    }


                }

            }

        },
        error: function () {
            console.log("Error checking username availability");
        }
    });
}
// window.addEventListener('beforeunload', function() {
//     localStorage.removeItem('modalShown');
//     localStorage.removeItem('content');
//   });
window.addEventListener('pageshow', function (event) {
    const modalShown = localStorage.getItem("modalShown");
    if (modalShown === "true") {
        modalMessage.innerHTML = localStorage.getItem("content");
        showModal();

    }
});

// Check if modal has been shown before
// const modalShown = localStorage.getItem("modalShown");

// if (modalShown === "true") {
//     modalMessage.innerHTML = localStorage.getItem("content");

//     showModal();

// }
const resetButton = document.getElementById("resetbutton");
const informModal = document.getElementById("informModal");
const closeModalButton = document.getElementById("closeModalButton");
const modalMessage = document.getElementById("modalMessage");
const resetForm = document.getElementById("resetform");


function isValidPassword(password) {
    const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
    return passwordRegex.test(password);
}
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

resetButton.addEventListener("click", function (event) {
    event.preventDefault();
    const password = document.getElementById("password").value;
    const recaptchaResponse = grecaptcha.getResponse();

    isValidReset(password, recaptchaResponse);
});


function isValidReset(password, recaptchaResponse) {


    $.ajax({
        url: "checkCaptcha",
        type: "POST",
        data: {
            captcha: recaptchaResponse
        },
        success: function (response) {
            if (!isValidPassword(password)) {
                modalMessage.innerHTML ="password must be at least 8 characters long and contains at least one uppercase letter, one lowercase letter, and one number";
                showModal();
            } else if (response === "true") {
                modalMessage.innerHTML = "this Account has been updated";
                showModal();
                resetForm.submit();
            } else {
                modalMessage.innerHTML = "Please verify that you're not a robot.";
                grecaptcha.reset();
                showModal();
            }
        }, error: function () {
            console.log("Error checking captcha availability");
        }
    });

}





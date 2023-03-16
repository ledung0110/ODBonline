const verifyButton = document.getElementById("verifybutton");
const informModal = document.getElementById("informModal");
const closeModalButton = document.getElementById("closeModalButton");
const modalMessage = document.getElementById("modalMessage");
const verifyForm = document.getElementById("verifyform");

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

verifyButton.addEventListener("click", function (event) {
    event.preventDefault();

    const recaptchaResponse = grecaptcha.getResponse();

    isValidVerify(recaptchaResponse);
});


function isValidVerify(recaptchaResponse) {


    $.ajax({
        url: "checkCaptcha",
        type: "POST",
        data: {
            captcha: recaptchaResponse
        },
        success: function (response) {
            if (response === "true") {
                modalMessage.innerHTML = "this Account has been updated";
                showModal();
                verifyForm.submit();
            } else {
                modalMessage.innerHTML = "Please verify that you're not a robot.";
                showModal();
            }
        }, error: function () {
            console.log("Error checking captcha availability");
        }
    });

}






closeModalButton.addEventListener("click", function () {
    hideModal();
});





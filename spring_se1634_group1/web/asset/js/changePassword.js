const changePassButton = document.getElementById('changePassButton');
var informModal = document.getElementById("informModal");
var modalMessage = document.getElementById("modalMessage");
const changeForm = document.getElementById("changeForm");

document.addEventListener('click', function (event) {
    if (event.target.closest('#closeModalButton') || !event.target.closest('.modal-content')) {
        hideModal();
        
    }
});
$('#closeModalButton').on("click", function () {
    hideModal();
   
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
    localStorage.removeItem("modalShown");
}


changePassButton.addEventListener("click", function (event) {
    event.preventDefault();
    const username = document.getElementById("accountName").value;
    const oldpassword = document.getElementById("oldPassword").value;
    const newpassword = document.getElementById("newPassword").value;
    const repassword = document.getElementById("reInputPassword").value;
    const recaptchaResponse = grecaptcha.getResponse();
    isValidPassword(newpassword);
    isValidAccount(username, oldpassword, newpassword, repassword, recaptchaResponse);
    
});

function isValidPassword(newpassword) {
    const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
    return passwordRegex.test(newpassword);
}

function isValidAccount(username, oldpassword, newpassword, repassword, recaptchaResponse) {
    $.ajax({
        url: "changecheckauth",
        type: "POST",
        data: {
            username: username, password: oldpassword, newPass: newpassword, reType: repassword, 'g-recaptcha-response': recaptchaResponse
        },
        success: function (response) {
      
            if (oldpassword.length === 0 || newpassword.length === 0 || repassword.length === 0) {
                modalMessage.innerHTML = "Please fill all blank !";
                showModal();
                grecaptcha.reset();
            } else {
                if (response === "notfoundacc") {
                    modalMessage.innerHTML = "Account is not found !";
                    showModal();
                }else if(!isValidPassword(newpassword)){
                    modalMessage.innerHTML = "Password requires more than 8 characters, has at least 1 uppercase letter and 1 special character!";
                  
                    showModal();
                } else if (response === "notsame") {
                    modalMessage.innerHTML = "The new password must be retype correctly";
                  
                    showModal();
                    grecaptcha.reset();
                } else if (response === "captchafalse") {
                    modalMessage.innerHTML = "Captcha required !";
                    showModal();
                    grecaptcha.reset();
                } else {
                    //changeForm.submit();
                    modalMessage.innerHTML = "Change password successfull !";
                    showModal();
                    grecaptcha.reset();
                   
                    
                }
            }
        },
        error: function () {
            console.log("Error checking username availability");
        }

    });
}
window.addEventListener('pageshow', function (event) {
    const modalShown = localStorage.getItem("modalShown");
    if (modalShown === "true") {
        modalMessage.innerHTML = localStorage.getItem("content");
        showModal();

    }
});
        
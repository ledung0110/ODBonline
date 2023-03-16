//const updateButton = document.getElementById('updateButton');
//var informModal = document.getElementById("informModal");
//var modalMessage = document.getElementById("modalMessage");
//const updateForm = document.getElementById("updateForm");
//
//document.addEventListener('click', function (event) {
//    if (event.target.closest('#closeModalButton') || !event.target.closest('.modal-content')) {
//        hideModal();
//    }
//});
//
//function showModal() {
//    informModal.style.display = "block";
//    localStorage.setItem("modalShown", "true");
//    localStorage.setItem("content", modalMessage.innerHTML);
//    setTimeout(function () {
//        hideModal();
//    }, 10000);
//}
//
//
//function hideModal() {
//    informModal.style.display = "none";
//    localStorage.removeItem("modalShown");
//}
//$('#closeModalButton').on("click", function () {
//    hideModal();
//});
//function isValidUsername(fullname) {
//    const fullnameRegex = /^(?=.*[a-zA-Z])(?=.*\d)?[a-zA-Z\d]+$/;
//    return fullnameRegex.test(fullname);
//}
//
//
//$('#updateForm').on("submit", function (event) {
//    event.preventDefault();
//    const id = document.getElementById("id").value;
//    const fullname = document.getElementById("fullname").value;
//    const phonenumber = document.getElementById("phonenumber").value;
//    const email = document.getElementById("email").value;
//    isValidUser(id, fullname, phonenumber, email);
//});
//
//
//function isValidUser(id, fullname, phonenumber, email) {
//    $.ajax({
//        url: "accControlCheckAuth",
//        type: "POST",
//        data: {
//            id: id, name: fullname, phone: phonenumber, email: email
//        },
//        success: function (response) {
//
//            if (response === "success") {
//                modalMessage.innerHTML = "User information have already update !";
//                showModal();
//
//            }
//        },
//        error: function () {
//            console.log("Error checking username availability");
//        }
//
//    });
//}
//        
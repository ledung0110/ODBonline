var hamburger = document.querySelector(".hamburger");
        hamburger.addEventListener("click", function () {
            document.querySelector("body").classList.toggle("active");
        });
        
$(document).ready(function() {
  $('.dropdown-toggle').dropdown();
});
const adminBtn = document.querySelector('.admin-btn');
const adminDropdown = document.querySelector('.admin-dropdown');

adminBtn.addEventListener('click', function() {
  adminDropdown.classList.toggle('show');
});
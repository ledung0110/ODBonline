function validate() {

    if (document.myForm.name.value == "") {

        alert("Điền họ và tên !");
        
        // document.getElementById("Alertname").innerHTML = "Điền họ và tên !";
        document.myForm.name.focus();
        return false;
    }
    if (document.myForm.email.value == "") {

        return true;

    }
    var x = document.myForm.email.value;
    var atposition = x.indexOf("@");
    var dotposition = x.lastIndexOf(".");
    if (atposition < 1 || dotposition < (atposition + 2)
        || (dotposition + 2) >= x.length) {
            alert("Định dạng email chưa đúng !");
        // document.getElementById("AlertEmail").innerHTML = "Email không đúng định dạng !";
        return false;
    }


    return (true);
}
function onlyNumberKey(evt) {
    var ASCIICode = (evt.which) ? evt.which : evt.keyCode;
    
    // Check if input is a digit or a dot and allow it
    if ((ASCIICode >= 48 && ASCIICode <= 57) || ASCIICode === 46 || ASCIICode <=32 ) { 
        
        // Formatting logic goes here...
        
        return true;
    }
    return false;  
}
function validate2() {

    if (document.myForm2.name.value == "") {
        alert("Điền họ và tên !");
        // document.getElementById("Alertname2").innerHTML = "Điền họ và tên !";
        document.myForm2.name.focus();

        return false;
    }
    if (document.myForm2.email.value == "") {

        return true;

    }
    var x = document.myForm2.email.value;
    var atposition = x.indexOf("@");
    var dotposition = x.lastIndexOf(".");
    if (atposition < 1 || dotposition < (atposition + 2)
        || (dotposition + 2) >= x.length) {
            alert("Please enter a valid e-mail address.");
        // document.getElementById("AlertEmail2").innerHTML = "Email không đúng định dạng !";
        return false;
    }


    return (true);
}

const loadAddDebtor =()=>{


const imageInput = document.getElementById('image-input');
const imagePreview = document.getElementById('image-preview');
const cancelButton = document.getElementById('cancel-button');
imageInput.addEventListener('change', handleImageSelect);
cancelButton.addEventListener('click', cancelImageSelect);
function handleImageSelect(event) {
    imagePreview.innerHTML = '';
  const file = event.target.files[0];
  const reader = new FileReader();
  reader.onload = (event) => {
    const image = new Image();
    image.src = event.target.result;
     // Xóa hình ảnh hiện có trong phần xem trước
    imagePreview.appendChild(image); // Thêm hình ảnh mới vào phần xem trước
    cancelButton.style.display = 'inline-block'; // Hiển thị nút hủy
    
  };
  reader.readAsDataURL(file);
}


function cancelImageSelect(event) {

    event.preventDefault();

  imagePreview.innerHTML = ''; // Xóa hình ảnh trong phần xem trước
  imageInput.value = null; // Xóa tệp hình ảnh đã chọn
  cancelButton.style.display = 'none'; // Ẩn nút hủy
  //heyyyyy
}
};
loadAddDebtor();


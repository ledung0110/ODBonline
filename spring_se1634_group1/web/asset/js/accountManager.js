// khởi tạo biến lưu trữ thông tin phân trang
var currentPage = 1;
var pageSize = 5;
var sortField = "ID";
var sortOrder = "";
var timeoutId;
var idFrom = "";
var idTo = "";
var filterUserName = "";
var filterAccess = "";
var filterActive = "";
var filterPhone = "";
var filterEmail = "";


function getDebtName(debt) {
    return debt.name;
}
$(".form-control").on('input', function () {
    clearTimeout(timeoutId); // Hủy bỏ từ bộ đếm thời gian hiện tại

    // Đợi 2 giây trước khi gửi yêu cầu AJAX.
    timeoutId = setTimeout(function () {
        idFrom = $("#idFrom").val();
        idTo = $("#idTo").val();
        filterUserName = $("#filterUserName").val();
        filterAccess = $("#filterAccess").val();
        filterActive = $("#filterActive").val();
        if (filterAccess == "Admin") {
            filterAccess = 1;
        } else if (filterAccess == "User") {
            filterAccess = 0;
        } else {
            filterAccess = "";
        }
        if (filterActive == "Activated") {
            filterActive = 1;
        } else if (filterActive == "Not Activated") {
            filterActive = 0;
        } else {
            filterActive = "";
        }
        currentPage = 1;

        $("#jumpToPage").val(currentPage);
        loadData();
    }, 1000);
});

// hàm lấy dữ liệu và hiển thị lên trang
function loadData() {


    $.ajax({
        url: "AccountManagerServlet",
        method: "POST",
        data: {
            page: currentPage,
            pageSize: pageSize,
            filterUserName: filterUserName,
            filterAccess: filterAccess,
            filterActive: filterActive,
            sortField: sortField,
            sortOrder: sortOrder,
            idFrom: idFrom,
            idTo: idTo
        },
        success: function (data) {
            let accountList = JSON.parse(data.account);
            totalPages = data.totalPages;
            let tableBody = '';


            for (const acc of accountList) {
                tableBody +=
                        `<tr>
                        <td>${acc.id}</td>
                        <td>${acc.username}</td>
                        <td>${acc.admin ? "Admin" : "User"}</td>
                        <td>${acc.confirmed ? "Activated" : "Not Active"}</td>

                        <td class="d-flex justify-content-center"  >

                                       


                                        

                                        <button onclick="return loadInfor('${acc.id}','${acc.username}')" type="button" class="btn btn-warning action" data-toggle="modal" data-target="#fixAdmin" >
                                            <i class="fa fa-wrench" aria-hidden="true"></i> Fix</button>
                                    </td>
                    </tr>`;
            }



            $("#accountTable tbody").html(tableBody);

            // hiển thị thông tin phân trang
            $("#total").html("Total: " + data.totalAccount + " Record(s)");
            $("#jumpToPage").attr("max", totalPages);
            $(".totalPages").html(totalPages);
            $(".next").html("<li class='page-item " + (currentPage == totalPages ? "disabled" : "") + "'><a class='page-link pageD' href='javascript:void(0);' data-page='" + (currentPage + 1) + "'>Next</a></li>");
            $(".previous").html("<li class='page-item " + (currentPage == 1 ? "disabled" : "") + "'><a class='page-link pageD' href='javascript:void(0);' data-page='" + (currentPage - 1) + "'>Previous</a></li>");
        },
        error: function () {
            alert("Error loading debt list.");
        }
    });
}
function loadInfor(id,username){
    $('#inputID').val(id);
    $('#inputUser').val(username);
}

$(document).on("click", ".sortD", function () {
    sortFieldd = $(this).data("field");
    if (sortFieldd != sortField) {
        sortOrder = "ASC";

    } else {
        sortOrder = sortOrder == "" || sortOrder == "DESC" ? "ASC" : "DESC";
    }
    sortField = sortFieldd;
    document.getElementById("dropdownMenuButtonn").textContent = "Sort List By: " + sortField + " " + sortOrder;

    currentPage = 1;
    $("#jumpToPage").val(currentPage);
    loadData();
});

$("#clearFilter").click(function () {
    idFrom = "";
    $("#idFrom").val("");
    idTo = "";
    $("#idTo").val("");
    filterName = "";
    $("#filterUserName").val("");
    filterAccess = "";
    $("#filterAccess").val();
    filterActive = "";
    $("#filterActive").val();
    sortField = "ID";
    sortOrder = "";
    document.getElementById("dropdownMenuButtonn").textContent = "Sort List By";
    currentPage = 1;
    $("#jumpToPage").val(currentPage);
    loadData();

});
// xử lý sự kiện khi nhấn nút phân trang
$(document).on("click", ".pageD", function () {
    var page = parseInt($(this).data("page"));

    if (isNaN(page)) {
        return;
    }
    $("#jumpToPage").val(page);
    currentPage = page;
    loadData();
});

// xử lý sự kiện khi thay đổi kích thước trang
$("#pageSize").on("change", function () {
    pageSize = parseInt($(this).val());
    currentPage = 1;
    $("#jumpToPage").val(currentPage);
    loadData();
});


$("#jumpToPage").on("change", function () {

    var value = parseInt($(this).val());

    if (value >= 1 && value <= totalPages) {
        currentPage = value;
        $("#jumpToPage").val(currentPage);
        loadData();
    }
});


// load dữ liệu lần đầu khi trang được load
loadData();
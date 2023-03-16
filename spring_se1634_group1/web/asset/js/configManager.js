// khởi tạo biến lưu trữ thông tin phân trang
let currentPage = 1;
let pageSize = 5;
let sortField = "ID";
let sortOrder = "";
let timeoutId;
let idFrom = "";
let idTo = "";
let filterKey = "";
let filterValue = "";
let createdFrom = "";
let createdTo = "";
let updatedFrom = "";
let updatedTo = "";


$(".Config").on('input', function () {
    clearTimeout(timeoutId); // Hủy bỏ từ bộ đếm thời gian hiện tại

    // Đợi 2 giây trước khi gửi yêu cầu AJAX.
    timeoutId = setTimeout(function () {
        idFrom = $("#idFrom").val();
        idTo = $("#idTo").val();
        filterKey = $("#filterKey").val();
        filterValue = $("#filterValue").val();
        createdFrom = $("#createdFrom").val();
        createdTo = $("#createdTo").val();
        updatedFrom = $("#updatedFrom").val();
        updatedTo = $("#updatedTo").val();
        currentPage = 1;

        $("#jumpToPage").val(currentPage);
        loadData();
    }, 1000);
});

// hàm lấy dữ liệu và hiển thị lên trang
function loadData() {
    $.ajax({
        url: "ConfigManagerServlet",
        method: "POST",
        data: {
            page: currentPage,
            pageSize: pageSize,
            sortField: sortField,
            sortOrder: sortOrder,
            idFrom: idFrom,
            idTo: idTo,
            filterKey: filterKey,
            filterValue: filterValue,
            createdFrom: createdFrom,
            createdTo: createdTo,
            updatedFrom: updatedFrom,
            updatedTo: updatedTo
        },
        success: function (data) {
            let configList = JSON.parse(data.configList);

            let totalPages = data.totalPages;
            let tableBody = '';

            for (const config of configList) {
                tableBody +=
                    `<tr>                        
                        <td>${config.id}</td>
                        <td>${config.key}</td>
                        <td>${config.value}</td>
                        <td>${config.createdAt}</td>
                        <td>${config.updatedAt}</td>
                        <td class="d-flex justify-content-center"  >
                            <button " type="button" onclick="return loadConfig('${config.id}','${config.key}','${config.value}')" class="btn btn-warning action" data-toggle="modal" data-target="#sua" >
                                <i class="fa fa-wrench" aria-hidden="true"></i> Fix
                            </button>
                        </td>
                    </tr>`;
            }

            $("#configTable tbody").html(tableBody);

            // hiển thị thông tin phân trang
            $("#total").html("Total: " + data.totalAccount + " Record(s)");
            $("#jumpToPage").attr("max", totalPages);
            $(".totalPages").html(totalPages);
            $(".next").html("<li class='page-item " + (currentPage == totalPages ? "disabled" : "") + "'><a class='page-link pageD' href='javascript:void(0);' data-page='" + (currentPage + 1) + "'>Next</a></li>");
            $(".previous").html("<li class='page-item " + (currentPage == 1 ? "disabled" : "") + "'><a class='page-link pageD' href='javascript:void(0);' data-page='" + (currentPage - 1) + "'>Previous</a></li>");
        },
        error: function () {
            alert("Error loading configuration.");
        }
    });
}

function loadConfig(id,key,value){
   $('#inputID').val(id);
   $('#inputKeyy').val(key); 
   $('#inputValuee').val(value); 
}

$(document).on("click", ".sortD", function () {
    let sortFieldd = $(this).data("field");
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
    $(".Config").val("");
    sortOrder = "";
    idFrom = "";
    idTo = "";
    filterKey = "";
    filterValue = "";
    createdFrom = "";
    createdTo = "";
    updatedFrom = "";
    updatedTo = "";
    sortField = "ID";
    sortOrder = "";
    document.getElementById("dropdownMenuButtonn").textContent = "Sort List By";
    currentPage = 1;
    $("#jumpToPage").val(currentPage);
    loadData();

});
// xử lý sự kiện khi nhấn nút phân trang
$(document).on("click", ".pageD", function () {
    let page = parseInt($(this).data("page"));

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

    let value = parseInt($(this).val());

    
        currentPage = value;
        $("#jumpToPage").val(currentPage);
        loadData();
    
});


// load dữ liệu lần đầu khi trang được load
loadData();

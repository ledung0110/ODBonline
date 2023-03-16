// khởi tạo biến lưu trữ thông tin phân trang
let currentPage = 1;
let pageSize = 5;
let sortField = "ID";
let sortOrder = "";
let timeoutId;
let idFrom = "";
let idTo = "";
let filterName = "";
let filterAddress = "";
let filterPhone = "";
let filterEmail = "";
let totalFrom = "";
let totalTo = "";
let createdFrom = "";
let createdTo = "";
let updatedFrom = "";
let updatedTo = "";
let number = 10000000;

let DOCSO = function () {
    let t = [" không", " một", " hai", " ba", " bốn", " năm", " sáu", " bảy", " tám", " chín"],
        r = function (r, n) {
            let o = "",
                a = Math.floor(Math.abs(r) / 10),
                e = Math.abs(r) % 10;
            if (r < 0) {
                o += "âm ";
            }
            return a > 1 ? (o += t[a] + " mươi", 1 == e && (o += " mốt")) : 1 == a ? (o += " mười", 1 == e && (o += " một")) : n && e > 0 && (o += " lẻ"),
                5 == e && a >= 1 ? o += " lăm" : 4 == e && a >= 1 ? o += " tư" : (e > 1 || 1 == e && 0 == a) && (o += " " + t[e]), o;

        },
        n = function (n, o) {
            let a = "",
                e = Math.floor(n / 100);
            n = n % 100;
            return o || e > 0 ? (a = " " + t[e] + " trăm", a += r(n, !0)) : a = r(n, !1), a;
        },
        o = function (t, r) {
            let o = "",
                a = Math.floor(t / 1e6);
            t = t % 1e6;
            if (a > 0) {
                o = n(a, r) + " triệu";
                r = !0;
            }
            let e = Math.floor(t / 1e3);
            t = t % 1e3;
            return e > 0 && (o += n(e, r) + " nghìn", r = !0), t > 0 && (o += n(t, r)), o;
        };
    return {
        doc: function (r) {
            if (0 == r)
                return t[0];
            let isNegative = false;
            if (r < 0) {
                r = -r;
                isNegative = true;
            }
            let n = "",
                a = "";
            do {
                let ty = r % 1e9;
                r = Math.floor(r / 1e9);
                n = r > 0 ? o(ty, !0) + a + n : o(ty, !1) + a + n;
                a = " tỷ";
            } while (r > 0);
            if (isNegative) {
                n = "âm " + n;
            }
            return n.trim();
        }
    };
}();

function getDebtName(debt) {
    return debt.name;
}
$(".filter").on('input', function () {
    clearTimeout(timeoutId); // Hủy bỏ từ bộ đếm thời gian hiện tại

    // Đợi 2 giây trước khi gửi yêu cầu AJAX.
    timeoutId = setTimeout(function () {
        idFrom = $("#idFrom").val();
        idTo = $("#idTo").val();
        filterName = $("#filterName").val();
        filterAddress = $("#filterAddress").val();
        filterPhone = $("#filterPhone").val();
        filterEmail = $("#filterEmail").val();
        totalFrom = $("#totalFrom").val();
        totalTo = $("#totalTo").val();
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
        url: "DebtsListServlet",
        method: "POST",
        data: {
            page: currentPage,
            pageSize: pageSize,
            filterName: filterName,
            filterAddress: filterAddress,
            filterPhone: filterPhone,
            filterEmail: filterEmail,
            totalFrom: totalFrom,
            totalTo: totalTo,
            createdFrom: createdFrom,
            createdTo: createdTo,
            updatedFrom: updatedFrom,
            updatedTo: updatedTo,
            sortField: sortField,
            sortOrder: sortOrder,
            idFrom: idFrom,
            idTo: idTo
        },
        success: function (data) {
            let debtslist = JSON.parse(data.debts);

            let totalPages = data.totalPages;
            let tableBody = '';


            for (const debt of debtslist) {
                tableBody +=
                    `<tr>
                        <td>${debt.id}</td>
                        <td>${debt.name}</td>
                        <td>${debt.address}</td>
                        <td>${debt.phone}</td>
                        <td>${debt.email}</td>
                        <td>${debt.totalDebt.toLocaleString("vi-VN")}</td>
                        <td>${debt.createAt}</td>
                        <td>${debt.updateAt}</td>
                        <td class="d-flex justify-content-center"  >

                                        <button onclick="return debtDetail(${debt.id})" type="button" class=" btn btn-secondary action" data-toggle="modal" data-target="#chitiet">
                                            Chi tiết 
                                        </button>


                                        <button onclick="return addDebtDetail(${debt.id},${debt.totalDebt},'${debt.name}')" type="button" class="btn btn-info action" data-toggle="modal" data-target="#themphieuno" >
                                            <i class="fa fa-address-card-o" aria-hidden="true"></i>  Thêm phiếu nợ</button>

                                        <button  onclick="return updateDebt(${debt.id})" type="button" class="btn btn-warning action" data-toggle="modal" data-target="#sua" >
                                            <i class="fa fa-wrench" aria-hidden="true"></i> Sửa</button>
                                    </td>
                    </tr>`;

            }



            $("#debtTable tbody").html(tableBody);

            // hiển thị thông tin phân trang
            $("#total").html("Total: " + data.totalDebts + " Record(s)");
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
function debtDetail(id) {
    let currentPageDD = 1;
    let pageSizeDD = 5;
    let sortFieldDD = "ID";
    let sortOrderDD = "";
    let timeoutIdDD;
    let idFromDD = "";
    let idToDD = "";
    let filterNoteDD = "";
    let debtTypeDD = "";
    let amountFrom = "";
    let amountTo = "";
    let debtCreatedFrom = "";
    let debtCreatedTo = "";
    let createdFrom = "";
    let createdTo = "";
    $(".debtDetailsList").on('input', function () {
        clearTimeout(timeoutIdDD); // Hủy bỏ từ bộ đếm thời gian hiện tại

        // Đợi 2 giây trước khi gửi yêu cầu AJAX.
        timeoutIdDD = setTimeout(function () {
            idFromDD = $("#idFromDD").val();
            idToDD = $("#idToDD").val();
            filterNoteDD = $("#filterNote").val();
            debtTypeDD = $("#debtType").val();
            if (debtTypeDD == "+") {
                debtTypeDD = 1;
            } else if (debtTypeDD == "-") {
                debtTypeDD = 0;
            } else {
                debtTypeDD = "";
            }
            amountFrom = $("#amountFrom").val();
            amountTo = $("#amountTo").val();
            debtCreatedFrom = $("#debtCreatedFrom").val();
            debtCreatedTo = $("#debtCreatedTo").val(); //
            createdFrom = $("#createdFromDD").val();
            createdTo = $("#createdToDD").val();
            currentPageDD = 1;

            $("#jumpToPageDD").val(currentPageDD);
            loadDataDebtDetail();
        }, 1000);
    });

    function loadDataDebtDetail() {
        $.ajax({
            url: "DebtDetailsListServlet",
            method: "GET",
            data: {
                id: id,
                page: currentPageDD,
                pageSize: pageSizeDD,
                sortField: sortFieldDD,
                sortOrder: sortOrderDD,
                idFrom: idFromDD,
                idTo: idToDD,
                debtType: debtTypeDD,
                amountFrom: amountFrom,
                amountTo: amountTo,
                debtCreatedFrom: debtCreatedFrom,
                debtCreatedTo: debtCreatedTo,
                createdFrom: createdFrom,
                createdTo: createdTo,
                filterNote: filterNoteDD
            },
            success: function (data) {
                let debtDetailslist = JSON.parse(data.debtDetails);

                let totalPages = data.totalPages;
                let tableBody = '';

                for (const debtDetails of debtDetailslist) {
                    tableBody +=
                        `<tr ${debtDetails.debtType == false ? "style='color:red;'" : ""}>
                        <td>${debtDetails.id}</td>
                        <td>${debtDetails.note}</td>
                        <td>${debtDetails.debtType == true ? "+" : "-"}</td>
                        <td>${debtDetails.amount.toLocaleString("vi-VN")}</td>
                        <td>${debtDetails.debtCreatedAt}</td>
                        <td>${debtDetails.dateCreateAt}</td>
                        <td style="text-align: center" >
                        <div class="button-container">
                            <button type="button" onclick="return showDebtDetails('${debtDetails.note}','${debtDetails.debtType}','${debtDetails.amount}','${debtDetails.debtCreatedAt}','${debtDetails.image}')" class="btn btn-secondary"
                                    data-toggle="modal" data-target="#themphieuno">
                                Chi tiết
                            </button>

                            <button type="button"  onclick="return payTheBill('${id}','${debtDetails.amount}','${debtDetails.debtType}')" class="btn btn-info btn " data-toggle="modal"
                                    data-target="#themphieuno" ${debtDetails.debtType == true ? "disabled" : ""}>
                                <i class="fa fa-plus" aria-hidden="true"></i></button>

                            <button type="button" onclick="return payTheBill('${id}','${debtDetails.amount}','${debtDetails.debtType}')"class="btn btn-warning "
                                    data-toggle="modal" data-target="#themphieuno" ${debtDetails.debtType == true ? "" : "disabled"}>
                                <i class="fa fa-minus" aria-hidden="true"></i></button>
                        </div>
                        </td>
                    </tr>`;

                }
                $("#debtDetailTable tbody").html(tableBody);
                $("#DebtName").html("Tên người nợ : " + data.debtName);
                $("#DebtTotal").html("Total: " + data.totalDebtDetails + " Record(s)");
                $("#jumpToPageDD").attr("max", totalPages);
                $("#totalPagesDD").html(totalPages);
                $("#nextDD").html("<li class='page-item " + (currentPageDD == totalPages ? "disabled" : "") + "'><a class='page-link pageDD' href='javascript:void(0);' data-page='" + (currentPageDD + 1) + "'>Next</a></li>");
                $("#previousDD").html("<li class='page-item " + (currentPageDD == 1 ? "disabled" : "") + "'><a class='page-link pageDD' href='javascript:void(0);' data-page='" + (currentPageDD - 1) + "'>Previous</a></li>");
            },
            error: function () {
                alert("Error loading debt list.");
            }
        });
    }
    $(document).on("click", ".pageDD", function () {
        let page = parseInt($(this).data("page"));

        if (isNaN(page)) {
            return;
        }
        $("#jumpToPageDD").val(page);
        currentPageDD = page;
        loadDataDebtDetail();
    });
    $("#pageSizeDD").on("change", function () {
        pageSizeDD = parseInt($(this).val());
        currentPageDD = 1;
        $("#jumpToPage").val(currentPageDD);
        loadDataDebtDetail();
    });
    $("#jumpToPageDD").on("change", function () {

        let value = parseInt($(this).val());
        currentPageDD = value;
        $("#jumpToPageDD").val(currentPageDD);
        loadDataDebtDetail();

    });

    $("#pageSizeDD").on("change", function () {
        pageSizeDD = parseInt($(this).val());
        currentPageDD = 1;
        $("#jumpToPageDD").val(currentPageDD);
        loadDataDebtDetail();
    });
    $("#addDD").on("click", function () {
        $('#inputIDAdd').val(id);

    });
    $(document).on("click", ".sortDD", function () {
        let sortField = $(this).data("field");
        if (sortFieldDD != sortField) {
            sortOrderDD = "ASC";

        } else {
            sortOrderDD = sortOrderDD == "" || sortOrderDD == "DESC" ? "ASC" : "DESC";
        }
        sortFieldDD = sortField;
        document.getElementById("dropdownMenuButtonDD").textContent = "Sort List By: " + sortFieldDD + " " + sortOrderDD;

        currentPageDD = 1;
        $("#jumpToPageDD").val(currentPageDD);
        loadDataDebtDetail();
    });
    $("#clearFilterDD").click(function () {
        idFromDD = "";
        $("#idFromDD").val("");
        idToDD = "";
        $("#idToDD").val("");
        filterNoteDD = "";
        $("#filterNote").val("");
        debtTypeDD = "";
        $("#debtType").val("All");
        amountFrom = "";
        $("#amountFrom").val("");
        amountTo = "";
        $("#amountTo").val("");
        debtCreatedFrom = "";
        $("#debtCreatedFrom").val("");
        debtCreatedTo = "";
        $("#debtCreatedTo").val(""); 
        createdFrom = "";
        $("#createdFromDD").val("");
        createdTo = "";
        $("#createdToDD").val("");
        sortFieldDD = "ID";
        sortOrderDD = "";
        document.getElementById("dropdownMenuButtonDD").textContent = "Sort List By";
        currentPageDD = 1;
        $("#jumpToPageDD").val(currentPageDD);
        loadDataDebtDetail();

    });
    loadDataDebtDetail();
}

function showDebtDetails(note,debtType,amount,debtCreatedAt,image){
    if(debtType=="true"){
    $('#positiveType').prop('checked', true).prop('disabled',false).parent().addClass('active').removeClass('disabled');
    $('#negativeType').prop('checked', false).prop('disabled',true).parent().removeClass('active').addClass('disabled');
    }else{
    $('#negativeType').prop('checked', true).prop('disabled',false).parent().addClass('active').removeClass('disabled');
    $('#positiveType').prop('checked', false).prop('disabled',true).parent().removeClass('active').addClass('disabled');
    }
    $('#inputNote').val(note).prop('readonly', true);
    $('#inputAmount').val(parseFloat(amount).toLocaleString('vi-VN')).prop('readonly', true);
    $("#readAmount").html(DOCSO.doc(amount)).prop('readonly', true);
    $('#image-input').prop('disabled', true);
    $("#debtCreatedAt").prop('type','text').val(debtCreatedAt).prop('readonly', true);
    if (image !== '') {
        let imageUrl = 'uploads/' + image;
        $('#image-preview').html('<img src="' + imageUrl + '">');
      }
      $('#sendForm').css("display","none");
}



function payTheBill(id, amount, debtype) {
    $('#inputIDAdd').val(id);
    $('#inputNote').val("Thanh toán cho phiếu nợ số: " + id);
    $('#inputAmount').val(parseFloat(amount).toLocaleString('vi-VN'));
    $("#readAmount").html(DOCSO.doc(amount));
    if (debtype == "false") {
        $('#positiveType').prop('checked', true).parent().addClass('active');
        $('#negativeType').prop('checked', false).parent().removeClass('active');

    } else {
        $('#positiveType').prop('checked', false).parent().removeClass('active');
        $('#negativeType').prop('checked', true).parent().addClass('active');
    }
}

const originalHTML = $('#themphieuno').html();
let setupCode = function() {
    $("#inputAmount").on("keyup", function (e) {
        let inputVal = $(this).val().replace(/\./g, "");
        if (isNaN(parseFloat(inputVal)) && !e.key == "Backspace") {
            return;
        } else {
            if (inputVal == "") {
                $("#readAmount").html("");
                return;
            }
            let formattedVal = parseFloat(inputVal).toLocaleString('vi-VN');
            $("#readAmount").html(DOCSO.doc(inputVal));
            $(this).val(formattedVal);
        }
    });
    $("#addDebtDetailForm").submit(function (e) {
        e.preventDefault();
        let inputVal = $("#inputAmount").val().replace(/\./g, "");
        $("#inputAmount").val(inputVal);
        
        this.submit();
    });
};

$('#themphieuno').on('hidden.bs.modal', function () {
    $('#themphieuno').html(originalHTML);
    setupCode();
    loadAddDebtor();
});

setupCode();

function addDebtDetail(id, totalDebt, debtname) {
    $('#inputIDAdd').val(id);
    $('#currentTotalDebt').html("Curent Total Debt: " + totalDebt);
    $('#nameDebt').html("Name: " + debtname);
}
function updateDebt(id) {
    $('#inputIDUpdate').val(id);
    $.ajax({
        url: "getDebt",
        method: "GET",
        data: {
            id: id
        },
        success: function (data) {

            $('#inputNamee').val(data.name);
            $('#inputEmaill').val(data.email);
            $('#inputAddresss').val(data.address);
            $('#inputIdd').val(data.id);
            $('#inputSdtt').val(data.phone);
            $('#inputTotalDebtt').val(data.totalDebt.toLocaleString("vi-VN"));
            $('.textTotal').html(DOCSO.doc(data.totalDebt));
            ;
        },
        error: function () {
            alert("Error loading debt list.");
        }
    });
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
    idFrom = "";
    $("#idFrom").val("");
    idTo = "";
    $("#idTo").val("");
    filterName = "";
    $("#filterName").val("");
    filterAddress = "";
    $("#filterAddress").val("");
    filterPhone = "";
    $("#filterPhone").val("");
    filterEmail = "";
    $("#filterEmail").val("");
    totalFrom = "";
    $("#totalFrom").val("");
    totalTo = "";
    $("#totalTo").val("");
    createdFrom = "";
    $("#createdFrom").val("");
    createdTo = "";
    $("#createdTo").val("");
    updatedFrom = "";
    $("#updatedFrom").val("");
    updatedTo = "";
    $("#updatedTo").val("");
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

    if (value >= 1 && value <= totalPages) {
        currentPage = value;
        $("#jumpToPage").val(currentPage);
        loadData();
    }
});


// load dữ liệu lần đầu khi trang được load
loadData();

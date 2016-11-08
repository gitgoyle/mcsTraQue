var activeAdd;
var activeEdit;
var activeItemID;

$(document).ready(function () {

    $("#divWelcomeBack").html("<strong>Welcome back </strong> " + localStorage.getItem("username"));

    $('#inpDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true
    }).on('changeDate', function (ev) {
        $(this).datepicker('hide');
    });

    $("[id^=add]").click(function () {
        var myID = this.id;

        if (myID.indexOf("Cert") > -1) {
            $("#headerAddH4").html("Add New Certificate");
            activeAdd = "CERT";
            $("#spanFileName").html("");
            ifrBtnClick();
            $(".modal-body").css("height", "23em");
        } else if (myID.indexOf("Train") > 1) {
            $("#headerAddH4").html("Add Training");
            activeAdd = "TRAIN";
            $("#spanFileName").html("");
            ifrBtnClick();
            $(".modal-body").css("height", "20em");
        } else {
            $("#headerAddH4").html("Add Equipment Purchase");
            activeAdd = "EQUIP";
            $("#spanFileName").html("");
            ifrBtnClick();
            $(".modal-body").css("height", "20em");
        }
        //console.log('adding ' + activeAdd);
    });

    $("[id^=edit]").click(function () {
        var myID = this.id;

        if (myID.indexOf("Cert") > -1) {
            activeEdit = "CERT";
        } else if (myID.indexOf("Train") > -1) {
            activeEdit = "TRAIN";
        } else if (myID.indexOf("Equip") > -1) {
            activeEdit = "EQUIP";
        }

        if (activeEdit == "CERT") {
            $("#headerEditH4").html("Edit Certificate");
            activeEdit = "CERT";
        } else if (activeEdit == "TRAIN") {
            $("#headerEditH4").html("Edit Training");
            activeEdit = "TRAIN";
        } else if (activeEdit == "EQUIP") {
            $("#headerEditH4").html("Edit Equipment Purchase");
            activeEdit = "EQUIP";
        }
        loadAllItems(activeEdit, function () { return });
        //console.log('adding ' + activeEdit);
    });


    $("#btnAddSubmit").click(function (e) {
        //console.log('submitted ' + activeAdd);
        saveSubmission(function () {
            $("#spanTinyMSG").html("<i class='fa fa-check fa-3x'></i><br />" + activeAdd + '<br /> saved!');
            $("#msgTinyModal").modal("show");
        }, activeAdd);
        setTimeout(function () {
            $("#spanFileName").html("");
        }, 500);
    });

    //$("#tblItemList").on("click","tr",function() {
    //    alert('now retrieve data for id = ' + fc);
    //});

    $(document).on("click", "td", function () {
        var fc; // = $(this).find("tr td:eq(0)").text();
        var iClass = $(this).prop("class");
        var msg;

        fc = $(this).closest('tr').children('td:first').text();
        //console.log(iClass);
        if (iClass.indexOf("tblDeleteItem") > -1) {
            msg = "delete ";
            activeItemID = fc;
            deletePrompt(fc, function () { return; })
        } else if (iClass.indexOf("tblEditItem") > -1) {
            var delim = " | ";
            var f1, f2, f3, f4, f5, f6, f7;
            f1 = $(this).closest('tr').children('td:nth-child(4)').text();
            f2 = $(this).closest('tr').children('td:nth-child(5)').text();
            f3 = $(this).closest('tr').children('td:nth-child(6)').text();
            f4 = $(this).closest('tr').children('td:nth-child(7)').text();
            f5 = $(this).closest('tr').children('td:nth-child(8)').text();
            f6 = $(this).closest('tr').children('td:nth-child(9)').text();
            f7 = $(this).closest('tr').children('td:nth-child(10)').text();
            var pass = f1 + delim + f2 + delim + f3 + delim + f4 + delim + f5 + delim + f6 + delim + f7;
            msg = "edit ";
            console.log(pass);
            activeItemID = fc;
            modifyPrompt(fc, pass, function () { return; });
        }
    });
    
    $("#btnPromptOK").click(function () {
        //deleting an entry
        var parmFinal;
        var uid;
        uid = localStorage.getItem("traqid");
        parmFinal = activeItemID + "|" + activeEdit + "|" + uid;
        var sRunAjax = $.ajax({
            type: "POST",
            url: '../member.aspx/deleteItem',
            data: '{"vParms":"' + parmFinal + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var ret = data.d;
                $("#tblItemList").html("");
                setTimeout(function() {
                    $("#tblItemList").html(ret[1]);
                    $("#promptModal").modal("hide");
                }, 1000);
            }
        })
    });

    $("#btnModifyOK").click(function () {
        var delim = '~';
        var m1, m2, m3, m3a, m4, m5;
        m1 = $("#modifyTitle").val();
        m2 = $("#modifyDate").val();
        activeEdit == "CERT" ? m3 = $("#modifyType").val() : m3 = $("#modifyAmount").val();
        m4 = $("#modifyNotes").val();
        m5 = $("#modifyFile").val();
        //alert(m1 + delim + m2 + delim + m3 + delim + m4 + delim + m5);
    })


    //$("[id^=tr][id$=Edit").click(function () {
    $("#profileTable").on("mouseenter", function () {
        $("#icoEditProfile").css('visibility', 'visible');
    }).on("mouseleave", function () {
        $("#icoEditProfile").css('visibility', 'hidden');
    });

    $("#icoEditProfile").click(function () {
        $("#headerTinyMSGH4").html("Update Profile");
        $("#spanTinyMSG").html("<h2>make changes to your profile</h2>");
        //$("#msgModal").css("width", "200px");
        $("#msgTinyModal").modal('show');
    });


});// do not delete

function saveSubmission(callBack, varIn) {
    var sfn;
    sfn = $("#spanFileName").html();
    var parmFinal;
    parmFinal = localStorage.getItem("traqid") + "|" + localStorage.getItem("traquser") + "|" + activeAdd + "|nodata|";
    parmFinal += $("#inpNotes").val() + "|" + $("#inpDate").val() + "|" + $("#inpTitle").val() + "|";
    parmFinal += $("#inpCategory option:selected").text() + "|" + $("#inpNotificationType option:selected").text() + "|";
    parmFinal += $("#purchaseAmount").val() + "|" + sfn;

    $("#inpNotes").val("");
    $("#inpDate").val("");
    $("#inpTitle").val("");
    $("#purchaseAmount").val("");

    var sRunAjax = $.ajax({
        type: "POST",
        url: '../member.aspx/addNewItem',
        data: '{"vParms":"' + parmFinal + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            ret = data.d;
            if (ret[0] = "OK") {
                doGetCounts(function () { return;})
            }
            if (callBack) {
                setTimeout(function () {
                    $("#modAddModal").modal("hide");
                    ifrUploadFile();
                    //$("#btnFileUpload").trigger("click");
                    callBack();
                }, 1000);
            }
        }
    });
}

function doGetCounts(callBack) {
    var parmFinal;
    parmFinal = localStorage.getItem("traqid");
    var sRunAjax = $.ajax({
        type: "POST",
        url: '../index.aspx/getCTECounts',
        data: '{"vParms":"' + parmFinal + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (data) {
            var ret;
            ret = data.d;
            localStorage.setItem("certCount", ret[0]);
            localStorage.setItem("trainCount", ret[1]);
            localStorage.setItem("equipCount", ret[2]);
            $("#spanCertCount").html(ret[0]);
            $("#spanTrainCount").html(ret[1]);
            $("#spanEquipCount").html(ret[2]);
            if (callBack) {
                callBack();
            }
        }
    })
}

function loadAllItems(editType, callBack) {
    //alert(activeEdit + ": " + itemID);
    var parmFinal;
    parmFinal = localStorage.getItem("traqid") + "|" + editType;
    var sRunAjax = $.ajax({
        type: "POST",
        url: '../member.aspx/loadItems',
        data: '{"vParms":"' + parmFinal + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (data) {
            var ret;
            ret = data.d;
            $("#tblItemList").html(ret[1]);
            if (callBack) {
                callBack();
            }
        }
    })
}


function deletePrompt(vid, callBack) {
    $("#pTheID").text("");
    var myP = $("#pTheID").text();
    myP += vid;
    $("#pTheID").text("Press DELETE to remove selected item or CANCEL to exit");
    $("#modEditModal").modal("hide");
    $("#promptModal").modal("show");

    if (callBack) {
        callBack();
    }
}

function modifyPrompt(vid, vdata, callBack) {
    var arrdata = [];
    var sdata = vdata;
    arrdata = vdata.split('|');
    //alert(arrdata[0]);
    $("#pTheModifyID").text("");
    var myP = $("#pTheModifyID").text();
    myP += vid;
    //$("#pTheModifyID").text(vid + " Press SUBMIT to accept changes or CANCEL to exit without saving");
    $("#modEditModal").modal("hide");
    $("#modModifyModal").modal("show");
    if (activeEdit == "CERT") {
        $("#trModCertType").show();
        $("#trAmountHours").hide();
        $("#modifyType").val(arrdata[3]);
    } else if (activeEdit == "TRAIN" || activeEdit == "EQUIP") {
        $("#trModCertType").hide();
        $("#trAmountHours").show();
        activeEdit == "TRAIN" ? $("#modiAmountHours").html("HOURS") : $("#modiAmountHours").html("PRICE");
        $("#modifyAmount").val(arrdata[3]);
    }

    $("#modifyTitle").val(arrdata[0]);
    $("#modifyDate").val(arrdata[1]);
    $("#modifyNotes").val(arrdata[2]);
    //console.log(arrdata);
    $("#modifyFile").html(activeEdit == 'CERT' ? arrdata[6] : arrdata[5]);
    var flref = activeEdit == "CERT" ? arrdata[6] : arrdata[5];
    flref = flref.trim();
    $("#modifyFile").attr("href", "userUploads/" + flref);
    $("#modifyFile").css({ "color": "#000", "text-decoration": "none", "font-size": "medium", "font-weight": "bold" });

    if (callBack) {
        callBack();
    }
}

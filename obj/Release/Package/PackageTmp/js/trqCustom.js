
var isTesting = "Y";

$(document).ready(function () {

    $("#inpPassword").html("");
    $("#inpUserName").html("");
    $("#divLoginMSG").html("");

    $(document).on("keyup","#inpPassword", function (e) {
        var key = e.which;
        if (key == 13)  // the enter key code
        {
            $('#btnLogin').trigger("click");
        }
    });

    $("#inpFindUser").keyup(function (e) {
        var key = e.which;
        if (key == 13)  // the enter key code
        {
            alert("searching...");
        }
    });


    $("#btnLogin").click(function () {
        var un = $("#inpUserName").val();
        var pw = $("#inpPassword").val();

        if (un == "" || pw == "") {
            $("#divLoginMSG").html("<span style='color:red; font-weight:bold'>Invalid Credentials!</span>")
        } else {
            var logParms = $("#inpUserName").val() + "|" + $("#inpPassword").val();
            doLogin(logParms, function () { return true });
        }
    });

    var logged;
    logged = localStorage.getItem("isLoggedIn");

    console.log(logged);
    console.log(isTesting);

    if (logged == "Y") {
        setSessionVar("s_curuserid:" + sessionStorage.getItem("s_curuserid"));
        if (isTesting == "Y") {
            if (localStorage.getItem("plantype") == "TA") {
                window.location.replace("adminDashboard.aspx");
            } else {
                window.location.replace("member.aspx#dashboard");
            }
        }
        else {
            window.location.replace("https://www.traque.net/member.aspx#dashboard");
        }
    };

}); //do not delete


//start of functions
function doLogin(parmFinal, callBack) {
    //alert('in here');
    var sRunAjax = $.ajax({
        type: "POST",
        url: '../index.aspx/checkLogin',
        data: '{"vParms":"' + parmFinal + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (data) {
            var ret = data.d;
            if (ret[0] == "BAD") {
                $("#divLoginMSG").html("<span style='color:red; font-weight:bold; background-color:#FFF'>Invalid Credentials!</span>");
            } else {
                //alert('welcome back ' + ret[2] + ' ' + ret[3]);
                localStorage.setItem("isLoggedIn", "Y");
                sessionStorage.setItem("username", ret[2] + ' ' + ret[3]);
                localStorage.setItem("username", ret[2] + ' ' + ret[3]);
                localStorage.setItem("traquser", ret[5]);
                sessionStorage.setItem("contact", ret[8]);
                sessionStorage.setItem("s_curuserid", ret[5]);
                localStorage.setItem("traqid", ret[1]);
                sessionStorage.setItem("certCount", ret[9]);
                localStorage.setItem("certCount", ret[9]);
                sessionStorage.setItem("trainCount", ret[10]);
                localStorage.setItem("trainCount", ret[10]);
                sessionStorage.setItem("equipCount", ret[11]);
                localStorage.setItem("equipCount", ret[11]);
                sessionStorage.setItem("planType", ret[7]);
                localStorage.setItem("planType", ret[7]);
                $("#divWelcomeBack").html('Welcome Back ' + ret[2] + ' ' + ret[3]);
                $("#divLoginMSG").html("<span>Entering TraQue ...</span>");
                setTimeout(function () {
                    $("#myLogin").modal('hide');
                    if (ret[7] == "TA") {
                        if (isTesting == "Y") {
                            window.location.replace("adminDashboard.aspx");
                        }
                        else {
                            window.location.replace("https://www.traque.net/adminDashboard.aspx");
                        }
                    } else if (isTesting == "Y") {
                            window.location.replace("member.aspx#dashboard");
                        }
                        else {
                            window.location.replace("https://www.traque.net/member.aspx#dashboard");
                        }
                }, 1000);
            }
        }
    });
};

function setSessionVar(vParms) {
    var parmFinal = vParms;
    var sRunAjax = $.ajax({
        type: "POST",
        url: '../index.aspx/setSessionVar',
        data: '{"vParms":"' + parmFinal + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            //alert(vParms + '    ' + 'saved');
        }
    });
};

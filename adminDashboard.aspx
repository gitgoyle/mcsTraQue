<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminDashboard.aspx.vb" Inherits="traque2.adminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TraQue Admin Dashboard</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Template Title -->

    <!--scripts -->
    <script src="js/jquery.js"></script>
    <script src="js/admin.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!--scripts -->

    <link rel="icon" href="images/favicon.ico" type="image/x-icon" />
    <!-- Bootstrap 3.2.0 stylesheet -->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <!-- Font Awesome Icon stylesheet -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Owl Carousel stylesheet -->
    <link href="css/owl.carousel.css" rel="stylesheet" />
    <!-- Pretty Photo stylesheet -->
    <link href="css/prettyPhoto.css" rel="stylesheet" />
    <!-- Custom stylesheet -->
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/white.css" rel="stylesheet" type="text/css" />
    <!-- Custom Responsive stylesheet -->
    <link href="css/responsive.css" rel="stylesheet" />
    <!-- datepicker-->
    <link href="css/datepicker.css" rel="Stylesheet" />

    <!-- Styles specific to TraQue -->
    <link href="css/traque.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            $("[id^=adminDB_").hover(function () {
                // $("[id^=adminDB_").css("background-color", "transparent");
                // var myid = this.id;
                // $("#" + myid).css({ "background-color": "#DCE5F0", "border-radius": "10px" });
            });

            $("#_spanADBModal").click(function () {
                getRowCount();
            });

            jQuery("#modADBModal").on("shown.bs.modal", function () {
                $("#inpSearch").focus();
            });

            $(document).on("click", "[id^='adb_']", function () {
                var el = this.id;
                el = el.replace("adb_", "");
                doGetDetails(el, function () { console.log('returned details') });
                $("#headerADB").html(el);
                $("#modADBModal").modal("show");
            });

            $("#btnSearch").click(function (e) {
                e.preventDefault();
                e.stopPropagation();
                var srch = $("#inpSearch").val();
                if (srch.trim == "") {
                    return true;
                }
                //var nbr = parseInt($(this).text());
                $("#tblModalDetail").find(">tbody > tr").each(function () {
                    var thisrow = $(this).text();
                    thisrow = thisrow.toUpperCase();
                    srch = srch.toUpperCase();
                    if (thisrow.indexOf(srch) == -1) {
                        $(this).css('display', 'none');
                    }
                });
            });

            $("#btnShowAll").click(function (e) {
                e.preventDefault();
                e.stopPropagation();
                var srch = $("#inpSearch").val();
                //var nbr = parseInt($(this).text());
                $("#tblModalDetail").find(">tbody > tr").each(function () {
                    $(this).css("display", "table-row");
                });
                $("#inpSearch").val("");
                $("#inpSearch").focus();
            });

        }); //do not delete

        function getRowCount() {
            var rowcount = 0;
            var rowdata = "";
            $("#tblModalDetail").find(">tbody > tr").each(function () {
                if ($(this).is(":visible")) {
                    rowcount++
                    $(this).find("td").each(function () {
                        rowdata += '°' + $(this).text() + '°,';
                    });
                    rowdata = rowdata.substring(0, rowdata.length - 1);
                    rowdata += "²";
                }
            });
            //alert(rowcount);
            exportRowdata(rowdata, function () { console.log('data exported'); });
        }


        function applyBG() {
            var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
            var h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
            var i = 1;
            var divname = "";
            var el = "";
            for (i = 1; i <= 8; i++) {
                divname = "adminDB_" + i;
                if (i <= 4) {
                    el = document.getElementById(divname);
                    // el.style.backgroundColor = "transparent";
                    el.innerHTML = "<i class='fa fa-heart-o fa-2x'></i><br /><b>dashboard " + i + " option</b>";
                }
                if (i > 4 && i < 9) {
                    el = document.getElementById(divname);
                    // el.style.backgroundColor = "transparent";
                    el.innerHTML = "<i class='fa fa-heart fa-2x'></i><br /><b>dashboard " + i + " option</b>";
                }
                if (i > 8) {
                    el = document.getElementById(divname);
                    // el.style.backgroundColor = "transparent";
                    el.innerHTML = "<i class='fa fa-heartbeat fa-2x'></i><br /><b>dashboard " + i + " option</b>";
                }

                // if (w < 600) {
                //     el.style.height = "200px";
                // } else if (w < 1000) {
                //     el.style.height = "150px";
                // } else {
                //     el.style.height = "100px";
                // }
                // el.style.paddingTop = "4px";
                // el.style.padingBottom = "2px";
                // el.style.marginBottom = "10px";
            }
            doGetTotals(function () { console.log('did totals'); });
        };


        function exportRowdata(vrowdata, callBack) {
            var parmFinal = vrowdata;
            parmFinal = '' + parmFinal + '';
            var sRunAjax = $.ajax({
                type: "POST",
                url: '../index.aspx/makeExportFile',
                data: '{"vParms":"' + parmFinal + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var xdat = [];
                    xdat = data.d;
                    if (xdat[0] == "OK") {
                        $("#aDownFile").attr("href", xdat[1]);
                        $("#aDownFile").html("view file");
                    } else {
                        $("#aDownFile").attr("href", "#");
                        $("#aDownFile").html("no file");
                    }
                    if (callBack) {
                        callBack();
                    }
                }
            });
        }

        function doGetDetails(vtype, callBack) {
            var parmFinal = vtype;
            var sRunAjax = $.ajax({
                type: "POST",
                url: '../index.aspx/getDashboardDetail',
                data: '{"vParms":"' + parmFinal + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var ret;
                    ret = data.d;
                    var arrData = [];
                    var filler = "";
                    for (var x = 0; x < ret.length; x++) {
                        if ( ret[x] == "STOP") {
                            break;
                        }
                        arrData = ret[x].split("²");
                        filler += "<tr><td>" + arrData[0] + "</td><td>" + arrData[1] + "</td><td>" + arrData[2] + "</td><td>" + arrData[3] + "</td><td>" + arrData[4] + "</td></tr>";
                    }
                    //filler = "<table>" + filler + "</table>";
                    $("#bodyADB #tblModalDetail").html(filler);
                    if (callBack) {
                        callBack();
                    }
                }
            })
        };

        function fcnSignOut() {
            localStorage.setItem("isLoggedIn", "N");
            window.location.replace("index.aspx");
        };

        function fcnGetGreeting() {
            var sp = document.getElementById("spWelcome");
            sp.innerHTML = "<strong>Welcome " + localStorage.getItem("username") + "</strong>";
        }
    </script>
    <style type="text/css">
        /*[id^='adminDB_']:hover {
            background:yellow;
            border: 5px solid #808080;
        }*/

        th {
            text-align:center;
            font-size: 12pt;
        }

        td {
            width:50px;
            border: 1px solid #000;
            font-size: 10pt;
        }

        .tblLabel {
            text-align:right;
            /*color:darkred;*/
        }
        .tblLabel span::after {
            content: ":";
        }
        .tblRow {
            line-height:2em;
            height:2em;
        }

        .inputPad {
            padding-left:5px;
        }

        input {
            width: 200px;
        }

        @media (max-width: 500px) {
            .editRow {
                visibility: hidden;
            }
            .detailRow {
                visibility: hidden;
                display:none;
            }
        }

        @media (min-width: 700px) {
            .editRow {
                visibility: visible;
            }
            .detailRow {
                visibility: hidden;
                display:none;
            }
        }

    </style>
</head>
<body onload="applyBG()">
    <form id="form1" runat="server">
    <div>
    <!-- ====== Menu Section ====== -->
    <section id="menu">
      <div class="navigation">
        <div id="main-nav" class="navbar navbar-default" role="navigation">
          <div class="container">

            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href=""><img src="images/logo.png"/></a>
              <div id="divWelcomeBack" style="position:absolute; background-color:transparent; top:90px; width:260px">&nbsp;</div>
            </div> <!-- end .navbar-header -->
            <div style="float:right; text-align:right"><span id="spWelcome" style="font-size:medium"></span></div>

            <div class="navbar-collapse collapse">
              <ul id="ulnav" class="nav navbar-nav navbar-right">
                <!-- <li class="active"><a href="#top">Home</a></li> -->
                <!-- <li><a href="#uploads">Uploads</a></li> -->
                <li class="active" ><a id="memberExit" href="#" onclick="fcnSignOut()">Sign Out</a></li>
              </ul>
            </div><!-- end .navbar-collapse -->

          </div> <!-- end .container -->
        </div> <!-- end #main-nav -->
      </div> <!-- end .navigation -->
    </section>
    <!-- ====== End Menu Section ====== -->

    <!-- ====== Start Dashboard Section ====== -->

    <div id="admin">
      <div class="col-sm-12 col-md-6 col-lg-3">
        <div id="adminDB_1" class="col-sm-6 col-md-6 col-lg-3"></div><!--users-->
        <div id="adminDB_2" class="col-sm-6 col-md-6 col-lg-3"></div><!-- total certs tracking -->
        <div id="adminDB_3" class="col-sm-6 col-md-6 col-lg-3"></div><!-- total training tracking -->
        <div id="adminDB_4" class="col-sm-6 col-md-6 col-lg-3"></div><!-- total equip spend -->
        <div id="adminDB_5" class="col-sm-6 col-md-6 col-lg-3"></div><!-- -->
        <div id="adminDB_6" class="col-sm-6 col-md-6 col-lg-3"></div><!-- -->
        <div id="adminDB_7" class="col-sm-6 col-md-6 col-lg-3"></div><!-- -->
        <div id="adminDB_8" class="col-sm-6 col-md-6 col-lg-3"></div><!-- -->
        <!-- <div id="adminDB_9" class="col-sm-6 col-md-6 col-lg-3"></div>
        <div id="adminDB_10" class="col-sm-6 col-md-6 col-lg-3"></div>
        <div id="adminDB_11" class="col-sm-6 col-md-6 col-lg-3"></div>
        <div id="adminDB_12" class="col-sm-6 col-md-6 col-lg-3"></div> -->
      </div>
    </div>

    <!-- ====== End Dashboard Section ====== -->


        <div id="modADBModal" class="modal fade" role="dialog">
            <div class="modal-dialog" style="border:1px solid #707070">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="text-shadow:none">&times;</button>
                        <h2 id="headerADB"  class="modal-title"></h2>
                        <span id="spanADBModal" style="float:right"><i id="_spanADBModal" class="fa fa-download fa-2x"></i></span>
                        <section id="sectSearch" style="width:100%">
                            <input id="inpSearch" type="search" placeholder="search results" />
                        </section>
                        <section style="width:50%">
                            <button id="btnSearch">search</button><button id="btnShowAll">reset</button>
                        </section>
                        <section style="height:1em; background-color:lightgoldenrodyellow"><a id="aDownFile" href="#"></a></section>
                    </div>
                    <div id ="bodyADB"   class="modal-body" style="height:400px">
                        <table id="tblModalDetail"></table>
                    </div>
                    <!-- <div class="modal-footer"></div> -->
                </div>
            </div>
        </div>

    </form>
</body>
</html>

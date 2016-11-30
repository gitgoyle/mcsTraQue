<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminDashboard.aspx.vb" Inherits="traque2.adminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TraQue Admin Dashboard</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Template Title -->

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

        function applyBG() {
            var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
            var h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
            var i = 1;
            var divname="";
            var el = "";
            for (i = 1; i <= 12; i++) {
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
                // el.style.padding = "1.25em";
            }
        }

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

        /**[id^='adminDB_']:hover {
            border: 5px solid #808080;
        }*/

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
                <div id="adminDB_1" class="col-sm-6 col-md-6 col-lg-3"></div>
                <div id="adminDB_2" class="col-sm-6 col-md-6 col-lg-3"></div>
                <div id="adminDB_3" class="col-sm-6 col-md-6 col-lg-3"></div>
                <div id="adminDB_4" class="col-sm-6 col-md-6 col-lg-3"></div>
                <div id="adminDB_5" class="col-sm-6 col-md-6 col-lg-3"></div>
                <div id="adminDB_6" class="col-sm-6 col-md-6 col-lg-3"></div>
                <div id="adminDB_7" class="col-sm-6 col-md-6 col-lg-3"></div>
                <div id="adminDB_8" class="col-sm-6 col-md-6 col-lg-3"></div>
                <div id="adminDB_9" class="col-sm-6 col-md-6 col-lg-3"></div>
                <div id="adminDB_10" class="col-sm-6 col-md-6 col-lg-3"></div>
                <div id="adminDB_11" class="col-sm-6 col-md-6 col-lg-3"></div>
                <div id="adminDB_12" class="col-sm-6 col-md-6 col-lg-3"></div>
            </div>
        </div>
    <!-- ====== End Dashboard Section ====== -->

    </div>
    </form>
</body>
</html>

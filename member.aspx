<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="member.aspx.vb" Inherits="traque2.member" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>TraQue Member</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <link href="css/traque.css" rel="stylesheet">

    <script type="text/javascript">
        function setProfile() {
            doGetCounts(function () { return; });
            var n = document.getElementById("tdProfileName");
            n.innerHTML = "<span>" + localStorage.getItem("traquser") + "</span><br />";
            var f = document.getElementById("tdFullName");
            f.innerHTML = "<span>" + localStorage.getItem("username") + "</span><br />";
            var myPlan;
            myPlan = localStorage.getItem("planType");
            var pt = document.getElementById("tdPlan");
            if (myPlan == "IF") {
                pt.innerHTML = "<span>INDIVIDUAL FREE</span>"
            } else if (myPlan == "IP") {
                pt.innerHTML = "<span>INDIVIDUAL PREMIUM</span>"
            } else {
                pt.innerHTML = "<span>AGENCY</span>"
            }
            var cc = document.getElementById("spanCertCount");
            cc.innerHTML = localStorage.getItem("certCount");
            var tc = document.getElementById("spanTrainCount");
            tc.innerHTML = localStorage.getItem("trainCount");
            var ec = document.getElementById("spanEquipCount");
            ec.innerHTML = localStorage.getItem("equipCount");
        }

        function fcnSignOut() {
            localStorage.setItem("isLoggedIn", "N");
            window.location.replace("index.aspx");
        };

        function fcnGetGreeting() {
            var sp = document.getElementById("spWelcome");
            sp.innerHTML = "<strong>Welcome " + localStorage.getItem("username") + "</strong>";
        }

        function filechange() {
            var fu1 = document.getElementById('<%= fileUpload.ClientID %>');
            document.getElementById('<%= btnSaveFile.ClientID %>').click();
        }

        function ifrBtnClick() {
            document.getElementById('ifrFileUpload').contentWindow.document.forms[0].submit();
        }

        function ifrUploadFile() {
            var ifr = document.getElementById("ifrFileUpload").contentWindow;
            ifr.callButtonClick() //.document.getElementById("btnSaveFile").addEventListener("click", functionToRun, false);
            setTimeout(function () {
                ifrBtnClick();
            }, 500);
            return false;
        }

        function showFileName(vfn) {
            var fn = document.getElementById("spanFileName");
            fn.innerHTML = vfn;
        }

    </script>
    <style type="text/css">
        .tblLabel {
            text-align:right;
            color:darkred;
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
<body onload="setProfile()">
    <form id="form2" runat="server">
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
            <div style="width:50%; float:right; text-align:right"><span id="spWelcome" style="font-size:medium"></span></div>

            <div class="navbar-collapse collapse">
              <ul id="ulnav" class="nav navbar-nav navbar-right">
                <li class="active"><a href="#top">Home</a></li>
                <li><a href="#dashboard">Activity</a></li>
                <li><a href="#uploads">Uploads</a></li>
                <li><a href="#profile">My Profile</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a id="memberExit" href="#" onclick="fcnSignOut()">Sign Out</a></li>
              </ul>
            </div><!-- end .navbar-collapse -->

          </div> <!-- end .container -->
        </div> <!-- end #main-nav -->
      </div> <!-- end .navigation -->
    </section>
    <!-- ====== End Menu Section ====== -->

    <!-- ====== Profile Section ====== -->
    <section id="profile" style="padding-top:3em">
      <div class="description">
        <div class="description-one section-padding">
          <div class="container">
            <div class="row">
              <div> <!--class="col-sm-6 col-md-6"-->
                <div class="content">
                  <div class="header">
                  <%--<h1>Member Profile</h1>--%>
                    <p>Update your Email address or password.  <br />Or modify your TraQue plan.  <br />Changing your plan may incur additional charges.</p>
                    <table id="profileTable" style="width:80%; margin-left:auto; margin-right:auto;">
                        <tr><td colspan="3"><i id='icoEditProfile' class="fa fa-edit fa-2x" title="edit profile" style="float:right; visibility:hidden"></i></td></tr>
                        <tr class="tblRow" id="trEmailEdit">
                            <td class="tblLabel"><span>Email</span></td><td style="width:2em">&nbsp</td><td id="tdProfileName" style="text-align:left; padding:3px"><span>profile name here</span></td><%--<td><span><i class="fa fa-edit fa-2x"></i></span></td>--%>
                        </tr>
                        <tr class="tblRow" id="trFullNameEdit">
                            <td class="tblLabel"><span>Full Name</span></td><td style="width:2em">&nbsp</td><td id="tdFullName" style="text-align:left; padding:3px"><span>full name here</span></td><%--<td><span><i class="fa fa-edit fa-2x"></i></span></td>--%>
                        </tr>
                        <tr class="tblRow" id="trPlanEdit">
                            <td class="tblLabel"><span>Plan</span></td><td style="width:2em">&nbsp</td><td id="tdPlan" style="text-align:left; padding:3px"><span>selected plan here</span></td><%--<td><span><i class="fa fa-edit fa-2x"></i></span></td>--%>
                        </tr>
                    </table>
                  </div>
                </div>
              </div>
            </div> <!-- .container> .row -->
          </div> <!-- .container -->
        </div> <!-- end .description-one -->
      </div> <!-- end .description -->
    </section>
    <!-- ====== End Profile Section ====== -->

    <!-- ====== Activity Section ====== -->
    <section id="dashboard">
      <div class="price section-padding dark-bg" style="background-image:url('../images/pop.jpg'); background-repeat:no-repeat; background-position:left; background-size:cover">
        <div class="container">

          <div class="header" >
            <!--<h1>DASHBOARD</h1>-->
            <%--<div class="underline"><i class="fa fa-dashboard"></i></div>--%>
          </div> <!-- end .container> .header -->
          <div class="row">
            <div class="price-list">
              <div class="col-md-4">
            <!--
                <div class="price-table" > style="background-image:url('../images/cert.png')"
                  <div class="rate"><span style="font-size:xx-large">0</span></div>
                  <h2 style="background-color:#000; opacity:.75; font-weight:bold; border-radius:10px; padding:5px">CERTIFICATES</h2><br /><br />
                 <h2></h2>
                 <p></p>
            </div> --%>
                <!-- end .price-table -->
                <div class="price-table" style="background-color:lightgray">
                  <div class="rate" style="background-color:transparent; margin-top:1em"><span style="font-size:xx-large; color:#000;" id="spanCertCount" >0</span></div>
                  <h2 style="font-weight:bold; color:darkred">CERTIFICATES <br />ENTERED</h2>
                  <div id="certFooter" style="bottom:0; height:3em">
                      <a href="#" id="addCert" class="btn btn-default" data-toggle="modal" data-target="#modAddModal">
                          <i class="fa fa-plus-circle"></i>
                          ADD
                      </a>
                      <a href="#" id="editCert" class="btn btn-default" data-toggle="modal" data-target="#modEditModal">
                          <i class="fa fa-edit"></i>
                          EDIT
                      </a>
                  </div>
                </div>
              </div> <!-- end .price-list> .col-md-4 (1) -->

              <div class="col-md-4">
                <div class="price-table" style="background-color:lightgray">
                    <div class="rate" style="background-color:transparent; margin-top:1em"><span style="font-size:xx-large; color:#000;" id="spanTrainCount">0</span></div>
                    <h2 style="font-weight:bold; color:darkred">TRAINING <br />HOURS</h2>
                    <div id="trainFooter" style="bottom:0; height:3em">
                        <a href="#" id="addTraining" class="btn btn-default" data-toggle="modal" data-target="#modAddModal">
                            <i class="fa fa-plus-circle"></i>
                            ADD
                        </a>
                        <a href="#" id="editTraining" class="btn btn-default" data-toggle="modal" data-target="#modEditModal">
                            <i class="fa fa-edit"></i>
                            EDIT
                        </a>
                    </div>
                </div>
              </div> <!-- end .price-list> .col-md-4 (2) -->

              <div class="col-md-4">
                <div class="price-table" style="background-color:lightgray">
                <div class="rate" style="background-color:transparent; margin-top:1em"><span style="font-size:xx-large; color:#000;" id="spanEquipCount">0</span></div>
                  <h2 style="font-weight:bold; color:darkred">EQUIPMENT <br />PURCHASES</h2>
                  <div id="equipFooter" style="bottom:0; height:3em">
                      <a href="#" id="addEquipment" class="btn btn-default" data-toggle="modal" data-target="#modAddModal">
                          <i class="fa fa-plus-circle"></i>
                          ADD
                      </a>
                      <a href="#" id="editEquipment" class="btn btn-default" data-toggle="modal" data-target="#modEditModal">
                          <i class="fa fa-edit"></i>
                          EDIT
                      </a>
                  </div>
                </div>
              </div> <!-- end .price-list> .col-md-4 (3) -->

            </div> <!-- end .price-list -->
          </div> <!-- end .container> .row -->

        </div> <!-- end .container -->
      </div> <!-- end .price -->
    </section>
    <!-- ====== End Activity Section ====== -->

    <!-- ====== Contact Section ====== -->
    <footer id="contact">
      <div class="footer section-padding">
        <div class="container">
          <h1>Contact Us</h1>
          <form action="" class="form contact">

            <div class="row">
              <div>
                <div class="form-group">
                  <label for="name" class="sr-only">Name</label>
                  <input type="text" class="form-control" id="name" placeholder="Name">
                </div> <!-- end .form-group -->

                <div class="form-group">
                  <label for="email" class="sr-only">Email</label>
                  <input type="email" class="form-control" id="email" placeholder="Email" />
                </div> <!-- end .form-group -->

                <div class="form-group">
                  <label for="subject" class="sr-only">Subject</label>
                  <input type="text" class="form-control" id="subject" placeholder="Subject" />
                </div> <!-- end .form-group -->
              </div> <!-- end .form> .row> .col-md-4 -->

              <div>
                <div class="form-group">
                  <label for="message" class="sr-only">Message</label>
                  <textarea name="message" id="message" placeholder="Message"></textarea>
                </div> <!-- end .form-group -->
              </div>
            </div> <!-- end .form> .row -->

            <button class="btn btn-default contact-submit custom-btn" type="submit"><i class="fa fa-hand-o-right"></i>SUBMIT</button>
          </form> <!-- end .form -->
        </div> <!-- end .container -->
      </div> <!-- end .footer -->
    </footer>
    <!-- ====== End Contact Section ====== -->

    <!-- ====== Copyright Section ====== -->
    <section class="copyright">
      &copy; 2016 <a href="https://www.traque.net">cozmek solutions, llc</a>, All Rights Reserved
    </section>
    <!-- ====== End Copyright Section ====== -->

    <!-- jQuery -->
    <!--<script src="js/jquery.min.js"></script>-->
    <script src="js/jquery.min.js"></script>
    <!-- Modernizr js -->
    <script src="js/modernizr-latest.js"></script>
    <!-- Bootstrap 3.2.0 js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Owl Carousel plugin -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- ScrollTo js -->
    <script src="js/jquery.scrollto.min.js"></script>
    <!-- LocalScroll js -->
    <script src="js/jquery.localScroll.min.js"></script>
    <!-- jQuery Parallax plugin -->
    <script src="js/jquery.parallax-1.1.3.js"></script>
    <!-- jQuery One Page Nav Plugin -->
    <script src="js/jquery.nav.js"></script>
    <!-- jQuery Pretty Photo Plugin -->
    <script src="js/jquery.prettyPhoto.js"></script>
    <!-- Custom JS -->
    <script src="js/main.js"></script>
    <script src="js/member.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>

    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            "use strict";

            jQuery("a[data-rel^='prettyPhoto']").prettyPhoto({ social_tools: false });

            jQuery("#promptModal").on('hide.bs.modal', function () {
                $("#modEditModal").modal("show");
            });

            jQuery("#modEditModal").on('hide.bs.modal', function () {
                doGetCounts(function () { return; })
            });

            jQuery("#msgTinyModal").on("show.bs.modal", function (e) {
                if (e.keyCode == 27) { // escape key maps to keycode `27`
                    jQuery("#btnTinyMSGClose").trigger("click");
                    // <DO YOUR WORK HERE>
                }
                setTimeout(function () {
                    jQuery("#btnTinyMSGClose").focus();
                }, 500);
            });

            jQuery("#modAddModal").keyup(function (e) {
                if (e.keyCode == 27) { // escape key maps to keycode `27`
                    jQuery(this).datepicker('hide');
                    // <DO YOUR WORK HERE>
                }
            });

            jQuery('#modAddModal').on('shown.bs.modal', function () {
                var atype = activeAdd;
                if (atype == "CERT") {
                    $("#dateType").text("Renewal Date");
                    $("#inpDate").attr("placeholder", "renewal date");
                    $("#inpCategory").show();
                    $("#tdCategory").show();
                    $('#inpCategory').focus();
                    $("#tdAlertType").show();
                    $("#inpNotificationType").show();
                    $("#trPurchaseAmount").hide();
                } else if (atype == "TRAIN") {
                    $("#dateType").text("Train Date");
                    $("#inpDate").attr("placeholder", "training date");
                    $("#inpCategory").hide();
                    $("#tdCategory").hide();
                    $("#tdAlertType").hide();
                    $("#inpNotificationType").hide();
                    $("#tdAmountHours").html("Hours");
                    $("#tdAmountHours").focus();
                    $("#trPurchaseAmount").show();
                    $("#purchaseAmount").val("0");
                } else if (atype == "EQUIP") {
                    $("#dateType").text("Purchase Date");
                    $("#inpDate").attr("placeholder", "purchase date");
                    $("#inpCategory").hide();
                    $("#tdCategory").hide();
                    $("#tdAlertType").hide();
                    $("#inpNotificationType").hide();
                    $("#tdAmountHours").html("Price");
                    $("#tdAmountHours").focus();
                    $("#trPurchaseAmount").show();
                    $("#purchaseAmount").val("0");
                }
                $("#inpTitle").val("");
                $("#inpNotes").val("");
            })

            jQuery("#spanCertCount").click(function () {
                jQuery("#editCert").trigger("click");
                activeEdit = "CERT";
            });

            jQuery("#spanTrainCount").click(function () {
                jQuery("#editTraining").trigger("click");
                activeEdit = "TRAIN";
            });

            jQuery("#spanEquipCount").click(function () {
                jQuery("#editEquipment").trigger("click");
                activeEdit = "EQUIP";
            });

        });
    </script>
    <style>
        #tblAddModal td {
            font-weight:bold;
            color:#000;
            text-align:left;
            min-width:6em;
        }

        #tblAddModal {
            width:60%;
            margin-left:auto;
            margin-right:auto;
        }

        th {
            background-color:#FFF;
            font-size:small;
        }

        #modEditSelect table tr {
            line-height:16px;
        }

        #modEditSelect table tr :hover {
            outline:solid 1px #ff9400;
        }

        #modEditSelect table td {
            border:solid 1px lightgray;
            padding:3px;
            color:#050404;
            font-family:verdana;
            font-weight:bold;
            font-size:x-small;
        }

        .tblEditItem, .tblDeleteItem {
            width:50px;
            text-align:center;
        }

        #modModifyModal table {
            font-size:small;
            font-weight:bold;
        }
    </style>

    <!-- this is a message from the application -->
        <div id="msgTinyModal" class="modal fade" role="dialog">
            <div class="modal-dialog" style="width:300px" >
                <div class="modal-content" style="width:300px" >
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="headerTinyMSGH4" class="modal-title"></h4>
                  </div>
                  <div class="modal-body" style="background-image:url('images/pop.jpg'); background-position:center; background-size:cover; background-repeat:no-repeat;">
                    <span id="spanTinyMSG" style="color:white"></span>
                  </div>
                  <div class="modal-footer" style="border:none">
                    <button id="btnTinyMSGClose" type="button" class="btn btn-danger" data-dismiss="modal" data-backdrop="false">CLOSE</button>
                  </div>
                </div>
            </div>
        </div>



    <!-- this is the grid to select from -->
        <div id="msgModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="headerMSGH4" class="modal-title">msgModal</h4>
                  </div>
                  <div class="modal-body" style="height:20em; background-image:url('images/pop.jpg'); background-position:center; background-size:cover; background-repeat:no-repeat; overflow-y:scroll">
                    <span id="spanMSG" style="background-color:#ffffff"></span>
                  </div>
                  <div class="modal-footer" style="border:none">
                    <button id="btnMSGClose" type="button" class="btn btn-danger" data-dismiss="modal" data-backdrop="false">CLOSE</button>
                  </div>
                </div>
            </div>
        </div>


        <div id="promptModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="promptH4" class="modal-title">promptModal</h4>
                  </div>
                  <div class="modal-body" style="height:20em; background-image:url('images/pop.jpg'); background-position:center; background-size:cover; background-repeat:no-repeat; overflow-y:scroll">
                    <p id="pTheID">the id is: </p>
                  </div>
                  <div class="modal-footer" style="border:none">
                    <button id="btnPromptCancel" type="button" class="btn btn-danger" data-dismiss="modal" data-backdrop="false">CANCEL</button>
                    <button id="btnPromptOK" type="button" class="btn btn-primary">DELETE</button>
                  </div>
                </div>
            </div>
        </div>

    <!-- this is the grid to select from -->
        <div id="modEditModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="headerEditH4" class="modal-title">modEditModal</h4>
                  </div>
                  <div class="modal-body" style="height:20em; background-image:url('images/pop.jpg'); background-position:center; background-size:cover; background-repeat:no-repeat;">
                    <div id="modEditSelect" style="padding:10px;"><table id="tblItemList" style="font-size:x-small"></table></div>
                  </div>
                </div>
            </div>
        </div>

    <!-- these are the field that can be modified -->
        <div id="modModifyModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="modifyH4" class="modal-title">modModifyModal</h4>
                  </div>
                  <div class="modal-body" style="height:20em; background-image:url('images/pop.jpg'); background-position:center; background-size:cover; background-repeat:no-repeat; overflow-y:scroll">
                    <p id="pTheModifyID">the id is: </p>
                    <table style="width:60%; margin-left:auto; margin-right:auto">
                        <tr><td>TITLE</td><td><input id="modifyTitle" class="inputPad" title="title" /></td></tr>
                        <tr><td>DATE</td><td><input id="modifyDate" title="date" /></td></tr>
                        <tr id="trModCertType"><td>TYPE</td><td><input id="modifyType" title="type" /></td></tr>
                        <tr id="trAmountHours"><td id="modiAmountHours">AMOUNT</td><td><input id="modifyAmount" title="amount" /></td></tr>
                        <tr><td>NOTES</td><td><textarea id="modifyNotes" style="min-width:200px" title="notes"></textarea></td></tr>
                        <tr><td>ATTACHED</td><td><a href="" target="_blank" id="modifyFile"></a></td></tr>
                        <%--<span style="height:50px; width:100px; background-color:#ffffff">&nbsp;<a id="modiFileDelete"><i class="fa fa-trash"></i></a><a id="modiFileView"><i class="fa fa-download"></i></a></span> --%>
                    </table>
                  </div>
                  <div class="modal-footer" style="border:none">
                    <button id="btnModifyCancel" type="button" class="btn btn-danger" data-dismiss="modal" data-backdrop="false">CANCEL</button>
                    <button id="btnModifyOK" type="button" class="btn btn-primary">ACCEPT</button>
                  </div>

                </div>
            </div>
        </div>

        <div id="modAddModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="headerAddH4"  class="modal-title">Add New Item</h4>
              </div>
              <div class="modal-body" style=" background-image:url('images/pop.jpg'); background-position:center; background-size:cover; background-repeat:no-repeat">
                <!--<p><img src="images/pop.jpg" height="200" width="150" style="float:left; padding-right:8px"/></p> -->
                    <div style="width:100%; margin-left:auto; margin-right:auto; text-align:center">
                    <table id="tblAddModal" style="width:80%">
                        <tr>
                            <td id="tdCategory" class="col-xs-10">Category</td>
                            <td>
                                <select id="inpCategory">
                                  <option value="0"></option>
                                  <option value="1">IT</option>
                                  <option value="2">Acct/Finance</option>
                                  <option value="3">Medical</option>
                                  <option value="4">Police</option>
                                  <option value="5">Fire Fighter</option>
                                  <option value="6">Teacher</option>
                                  <option value="7">Real Estate</option>
                              </select>
                            </td>
                        </tr>
                        <tr>
                            <td id="dateType" class="col-xs-10" style="min-width:140px">Renewal Date</td>
                            <td><input readonly class="datepicker" id="inpDate" name="addDate" type="text" placeholder="renewal date" style="margin-top:5px;" /></td>
                        </tr>
                        <tr>
                            <td class="col-xs-10">Title</td>
                            <td><input id="inpTitle" name="addName" placeholder="title" style="margin-top:5px;" /></td>
                        </tr>
                        <tr id="trPurchaseAmount">
                            <td id="tdAmountHours" class="col-xs-10">Amount</td>
                            <td>
                              <input id="purchaseAmount" type="number"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-xs-10">Notes</td>
                            <td><textarea id="inpNotes" name="addNotes" placeholder="comments" rows="3" cols="25" style="min-width:250px; max-width:250px; max-height:90px; margin-top:5px"></textarea></td>
                        </tr>
                        <tr>
                            <td id="tdAlertType" class="col-xs-10" style="min-width:140px">Alert Type</td>
                            <td>
                                <select id="inpNotificationType">
                                  <option value="1">Standard Notifications</option>
                                  <option value="2">Custom Notifications</option>
                              </select>
                            </td>
                        </tr>
                        <!--<tr id="trFileUpload" style="visibility:hidden"><td colspan="4"><asp:FileUpload runat="server" ID="fileUpload" Width="300px" onchange="filechange()" /></td></tr> -->
                        <tr>
                            <td style="visibility:hidden"><button id="btnFileUpload" onclick="ifrBtnClick()">submit iframe form</button></td>
                            <td style="height:40px">
                                <section style="height:30px; margin-left:-.5em; width:340px; overflow:hidden">
                                   <iframe id="ifrFileUpload" src="frmUpload.aspx" style="border:1px solid transparent; height:50px; width:360px; margin-top:-5px; overflow:hidden"></iframe>
                                </section>
                                <span style="padding-left:10px" id="spanFileName"></span>
                            </td>
                            <!--<td><asp:Button runat="server" ID="btnSaveFile" UseSubmitBehavior="false" Text="save file" /></td>-->
                        </tr>
                </table>
                </div>
                <%--</p>--%>
              </div>
              <div class="modal-footer" style="border:none">
                <button id="btnAddCancel" type="button" class="btn btn-danger" data-dismiss="modal" data-backdrop="false">Close</button>
                <button id="btnAddSubmit" type="button" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="agencyDashboard.aspx.vb" Inherits="traque2.agencyDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Template Title -->
    <title>TraQue</title>
    <link rel="icon" href="images/favicon.ico" type="image/x-icon" />
    <!-- Bootstrap 3.2.0 stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
    <form id="form1" >
    <!-- ====== Header Section ====== -->
    <header id="top" class="carousel-inner">
      <div class="bg-color">
        <div class="top section-padding">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-md-6">
<%--
                <div class="photo-slide">
                 <div id="carousel" class="carousel slide" data-ride="carousel"></div> <!-- end #carousel -->
                </div> <!-- end .photo-slide -->
 --%>
              </div> <!-- end .top > .container> .row> .col-md-5 -->
              <div class="col-sm-11 col-md-11">
                <div class="content">
                  <%--<h1>TraQue</h1>--%>
                  <h2>AGENCY DASHBOARD</h2>
<%--                    
                    <ul class="social-network social-circle">
                        <li><a href="https://www.facebook.com/cjevolution" target="_blank" class="icoFacebook" title="Facebook"><i class="fa fa-facebook fa-2x"></i></a></li>
                        <li><a href="https://twitter.com/TraQueLLC2" target="_blank"" class="icoTwitter" title="Twitter"><i class="fa fa-twitter fa-2x"></i></a></li>
                        <li><a href="http://www.cozmek.com/index.aspx" target="_blank" class="icoDeveloper" title="developer"><i class="fa fa-navicon fa-2x"></i></a></li>
                    </ul>
--%>
                    <br />
                    <div class="col-sm-4" style="background-color:transparent; border:1px solid black; height:200px; text-align:center">Manage Users<br />
                        <div style="background-color:transparent; margin-top:1em"><span style="font-size:xx-large; color:#ffffff;" id="usrDB" >0</span></div> 
                        <input id="inpFindUser" type="text" placeholder="find user" style="width:80%; margin-right:1em; padding-left:5px; color:blue" /><span><i class="fa fa-search" title="search" style="color:red"></i></span>
                    </div>
                    <div class="col-sm-4" style="background-color:transparent; border:1px solid black; height:200px; text-align:center">Assign Alerts
                        <div class="rate" style="background-color:transparent; margin-top:1em"><span style="font-size:xx-large; color:#ffffff;" id="altDB" >0</span></div> 
                    </div>
                    <div class="col-sm-4" style="background-color:transparent; border:1px solid black; height:200px; text-align:center">Reports
                        <div class="rate" style="background-color:transparent; margin-top:1em"><span style="font-size:xx-large; color:#ffffff;" id="rptDB" >0</span></div> 
                    </div>
                  </div> <!-- end .button -->
                </div> <!-- end .content -->
              </div> <!-- end .top > .container> .row> .col-md-7 -->

            </div> <!-- end .top> .container> .row -->
          </div> <!-- end .top> .container -->
        </div> <!-- end .top -->
    </header>
    <!-- ====== End Header Section ====== -->

    <!-- ====== Menu Section ====== --> 
    <section id="menu">
      <div class="navigation">
        <div id="main-nav" class="navbar navbar-default navbar-fixed-top" role="navigation">
          <div class="container">

            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" style="margin-top:-.35em" href="#"><img src="images/logo.png" /></a>
            </div> <!-- end .navbar-header -->

            <div class="navbar-collapse collapse">
              <ul id="ulnav" class="nav navbar-nav navbar-right">
                <li class="active"><a href="#top">Home</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="">Exit TraQue</a></li>
              </ul>
            </div><!-- end .navbar-collapse -->

          </div> <!-- end .container -->
        </div> <!-- end #main-nav -->
      </div> <!-- end .navigation -->
    </section>
    <!-- ====== End Menu Section ====== -->



    <!-- ====== Contact Section ====== -->
    <footer id="contact">
      <div class="footer section-padding">
        <div class="container">
          <h1><strong>Contact Us</strong></h1>
            <div class="underline"><i class="fa fa-envelope"></i></div>
          <form action="" class="form contact">

            <div class="row">
              <div class="col-xs-12 col-md-6">
                <div class="form-group">
                  <label for="name" class="sr-only">Name</label>
                  <input type="text" class="form-control" id="name" placeholder="Name" />
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
              
              <div class="col-xs-12 col-md-6">
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
    <section class="copyright dark-bg">
      <div class="container">
      <div class="row">
      <div class="col-lg-5 col-md-5" style="text-align:center; width:100%">
        <p><span style="font-size:x-small">&copy; 2016 COZMEK SOLUTIONS, All Rights Reserved</span></p>
        </div>
         <div class="col-lg-5 col-md-5">
        <p><strong style="font-size:small"></strong></p>
        </div>
        </div>
      </div> <!-- end .container -->
    </section>
    <!-- ====== End Copyright Section ====== -->
    <!-- jQuery -->
    <!--<script src="http://code.jquery.com/jquery.min.js"></script>-->
    <script src="js/jquery.js"></script>
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
    <script src="js/trqCustom.js"></script>

    <script>
        jQuery(document).ready(function ($) {
            "use strict";

            jQuery("a[data-rel^='prettyPhoto']").prettyPhoto({ social_tools: false });

            //jQuery('#myLogin').on('shown.bs.modal', function () {});

        })
    </script>
    </form>

    <!-- ================= MODALS ================= -->

    <!-- ================= MODALS ================= -->
   
</body>
</html>

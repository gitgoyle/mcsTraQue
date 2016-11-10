<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="traque2.index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Template Title -->
    <title>TraQue</title>
    <link rel="icon" href="images/favicon.ico" type="image/x-icon" />
    <!-- Bootstrap 3.2.0 stylesheet -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- Font Awesome Icon stylesheet -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Owl Carousel stylesheet -->
    <link href="css/owl.carousel.css" rel="stylesheet">
    <!-- Pretty Photo stylesheet -->
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <!-- Custom stylesheet -->
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/white.css" rel="stylesheet" type="text/css" />
    <!-- Custom Responsive stylesheet -->
    <link href="css/responsive.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <!-- ====== Header Section ====== -->
    <header id="top" class="carousel-inner">
      <div class="bg-color">
        <div class="top section-padding">
          <div class="container">
            <div class="row">
              <div class="col-sm-5 col-md-5">
                <div class="photo-slide">
                 <div id="carousel" class="carousel slide" data-ride="carousel">
                  <!--
                  <ol class="carousel-indicators">
                    <li data-target="#carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel" data-slide-to="1" class=""></li>
                    <li data-target="#carousel" data-slide-to="2" class=""></li>
                    <li data-target="#carousel" data-slide-to="3" class=""></li>
                    <li data-target="#carousel" data-slide-to="4" class=""></li>
                    <li data-target="#carousel" data-slide-to="5" class=""></li>
                  </ol> -->
                     <!--
                  <div class="carousel-inner">
                    <div class="item">
                      <img src="images/tab-slider1.jpg" alt="" />
                    </div>
                    <div class="item active left">
                      <img src="images/tab-slider2.jpg" alt="" />
                    </div>
                    <div class="item next left">
                      <img src="images/tab-slider3.jpg" alt="" />
                    </div>
                    <div class="item next left">
                      <img src="images/tab-slider4.jpg" alt="" />
                    </div>
                    <div class="item next left">
                      <img src="images/tab-slider5.jpg" alt="" />
                    </div>                    
                    <div class="item next left">
                      <img src="images/tab-slider6.jpg" alt="" />
                    </div>
                  </div> --><!--end .carousel-inner -->
                </div> <!-- end #carousel -->
                </div> <!-- end .photo-slide -->
              </div> <!-- end .top > .container> .row> .col-md-5 -->
              <div class="col-sm-11 col-md-11">
                <div class="content">
                  <%--<h1>TraQue</h1>--%>
                  <h2>RELAX, WE'VE GOT THIS.</h2>
                   <ul class="social-network social-circle">
<%--                    <li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
                                <li class="social-facebook"><a href="https://www.facebook.com/cjevolution" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <li class="social-twitter"><a href="https://twitter.com/TraQueLLC2" target="_blank"><i class="fa fa-twitter"></i></a></li>
    --%>


                    <li><a href="https://www.facebook.com/cjevolution" target="_blank" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a>
                    </li>
                    <li><a href="https://twitter.com/TraQueLLC2" target="_blank"" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a>
                    </li>
<%--                    <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i>
                    </a></li>
                    <li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a>
                    </li>--%>
                </ul>
                    <div>
                  <p style="min-width:440px;margin-left:50px">We know how valuable your time is.  <br />Let TraQue handle all your certification reminders, training schedules and equipment purchases.<br /><br />
<%--                      <a href="#" style="text-decoration:none; background-color:transparent; color:cyan !important"><i class="fa fa-video-camera"></i>&nbsp;&nbsp;See TraQue In Action</a>--%>
                    <iframe width="360" height="315" src="https://www.youtube.com/embed/cliUPvNKOEM?rel=0" frameborder="0" allowfullscreen></iframe><br />
<%--                      <video src="../media/TraQueVideo.mp4" width="300" height="300" controls></video><br /><br />--%>
                    <a id="aLoginLink" class="btn btn-default btn-custom" data-toggle="modal" data-target="#myLogin"><span style="font-size:medium; color:#000">MEMBERS</span></a>
                    <a href="#price" class="btn btn-default btn-custom"><span style="font-size:medium; color:#000">JOIN TraQue</span></a>

                  </p>
                </div>
                  <%--<div class="button" id="download-app1">
                    <div id="download-app1">
                   <a class="btn btn-default btn-custom" data-toggle="modal" data-target="#myLogin"><span style="font-size:medium; color:#fff">MEMBERS</span></a>
                   <a href="#price" class="btn btn-default btn-custom"><span style="font-size:medium; color:#fff">JOIN TraQue</span></a> --%>
                      <!--<i class="fa fa-cloud-download"></i> -->
                  </div> <!-- end .button -->
                </div> <!-- end .content -->
              </div> <!-- end .top > .container> .row> .col-md-7 -->

            </div> <!-- end .top> .container> .row -->
          </div> <!-- end .top> .container -->
        </div> <!-- end .top -->
      <!--</div> <!-- end .bg-color --> -->
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
                <li><a href="#screenshots">Why</a></li>
                <li><a href="#features">Features</a></li>
<%--                <li><a href="#description">Product</a></li>
                <li><a href="#testimonial">Reviews</a></li>
                <li><a href="#team">Team</a></li>--%>
                <li><a href="#price">Pricing</a></li>
<%--                <li><a href="#download">Download</a></li>--%>
                <li><a href="#contact">Contact</a></li>
              </ul>
            </div><!-- end .navbar-collapse -->

          </div> <!-- end .container -->
        </div> <!-- end #main-nav -->
      </div> <!-- end .navigation -->
    </section>
    <!-- ====== End Menu Section ====== -->

    <!-- ====== Screenshots Section ====== -->
    <section id="screenshots">
      <div class="screenshots section-padding dark-bg" style="padding-top:2em">
        <div class="container">
          <div class="header">
            <h1>Why <strong>T</strong>ra<strong>Q</strong>ue?</h1>
            <p>A lapse in certification renewal and continuing education can cost you employment opportunities.  Companies may encourage or require employees to hold certifications 
                and expired credentials can mean a loss of business.  Let TraQue handle your certification renewal notifications so you are alerted by text and email as renewal dates 
                approach.  Customized notification schedules conveniently remind you months, weeks and days in advance so you don't have to worry about missing any important dates.</p>
            <div class="underline"><i class="fa fa-universal-access"></i></div>
          </div>

          <div class="owl-carousel owl-theme">
            <div class="item">
                <!--app and app2 -->
              <a href="images/frCustomImage1.png" data-rel="prettyPhoto"><img src="images/tab-slider1.jpg" alt=""></a>
              <p style="text-align:center">First Responders</p>
            </div> <!-- end item -->
            <div class="item">
              <a href="images/medCustomImage.png" data-rel="prettyPhoto"><img src="images/tab-slider2.jpg" alt=""></a>
              <p style="text-align:center">Medical Professionals</p>  
            </div> <!-- end item -->
            <div class="item">
              <a href="images/rrCustomImage.png" data-rel="prettyPhoto"><img src="images/tab-slider3.jpg" height="300" alt=""></a>
              <p style="text-align:center">Realtors</p>
            </div> <!-- end item -->
            <div class="item">
              <a href="images/itCustomImage.png" data-rel="prettyPhoto"><img src="images/tab-slider4.jpg" alt=""></a>
              <p style="text-align:center">Technology</p>
            </div> <!-- end item -->
            <div class="item">
              <a href="images/finCustomImage.png" data-rel="prettyPhoto"><img src="images/tab-slider5.jpg" alt=""></a>
              <p style="text-align:center">Finance</p>
            </div> <!-- end item -->
            <div class="item">
              <a href="images/eduCustomImage.png" data-rel="prettyPhoto"><img src="images/tab-slider6.jpg" alt=""></a>
              <p style="text-align:center">Education</p>
            </div> <!-- end item -->
          </div> <!-- end owl carousel -->

        </div> <!-- .container -->
      </div> <!-- end .screenshots -->  
    </section>
    <!-- ====== End Screenshots Section ====== -->

    <!-- ====== Features Section ====== -->
    <section id="features">
      <div class="features section-padding" style="padding-top:2em">
        <div class="container">

          <div class="header">
            <h1><strong>T</strong>ra<strong>Q</strong>ue Features</h1>
            <%--<p>You will get all our <strong>' Features '</strong> .</p>--%>
            <div class="underline">
              <i class="fa fa-ellipsis-h"></i>
            </div>
          </div> <!-- end .container> .header -->

          <div class="row">
            <div class="col-md-4">
              <div class="featured-item-img">
                <img src="images/vertical-slider2.png" height="450" alt="">
              </div>
            </div>
            <div class="col-md-8 feature-list">
              <div class="row">

                <div class="col-sm-6 col-md-6">
                  <div class="featured-item">
                    <div class="icon">
                      <div class="icon-style"><i class="fa fa-refresh fa-spin fa-3x fa-fw"></i></div>
                    </div> <!-- end icon -->
                    <div class="meta-text">
                      <h3>Responsive Design</h3>
                      <p>Update your settings and view status from your phone, tablet, laptop or desktop.</p>
                    </div> <!-- end .meta-text -->
                  </div> <!-- end .featured-item -->
                </div> <!-- end .feature-list> .row > .col-md-6 (1st item) -->

                <div class="col-sm-6 col-md-6">
                  <div class="featured-item">
                    <div class="icon">
                      <div class="icon-style"><i class="fa fa-lock"></i></div>
                    </div> <!-- end icon -->
                    <div class="meta-text">
                      <h3>Security</h3>
                      <p>Our site uses HTTPS (HTTP over SSL).  
                                This protocol encrypts and decrypts subscriber requests as well as web pages which are delivered from our server.  </p>
                    </div> <!-- end .meta-text -->
                  </div> <!-- end .featured-item -->
                </div> <!-- end .feature-list> .row > .col-md-6 (2nd item) -->

                <div class="col-sm-6 col-md-6">
                  <div class="featured-item">
                    <div class="icon">
                      <div class="icon-style"><i class="fa fa-dashboard"></i></div>
                    </div> <!-- end icon     fa-refresh fa-spin fa-3x fa-fw"           -->
                    <div class="meta-text">
                      <h3>Dashboard</h3>
                      <p>Premium and Agency members can view reports about their own account or accounts they administer.</p>
                    </div> <!-- end .meta-text -->
                  </div> <!-- end .featured-item -->
                </div> <!-- end .feature-list> .row > .col-md-6 (3rd item) -->

                <div class="col-sm-6 col-md-6">
                  <div class="featured-item">
                    <div class="icon">
                      <div class="icon-style"><i class="fa fa-sliders"></i></div>
                    </div> <!-- end icon -->
                    <div class="meta-text">
                      <h3>Custom Setup</h3>
                      <p>Need custom settings or a plan that you don't see advertised?  Contact TraQue and we'll take care of you.</p>
                    </div> <!-- end .meta-text -->
                  </div> <!-- end .featured-item -->
                </div> <!-- end .feature-list> .row > .col-md-6 (4th item) -->

                <div class="col-sm-6 col-md-6">
                  <div class="featured-item">
                    <div class="icon">
                      <div class="icon-style"><i class="fa fa-video-camera"></i></div>
                    </div> <!-- end icon -->
                    <div class="meta-text">
                      <h3>Video Tutorial</h3>
                      <p>View our getting started video to better understand how TraQue can help you.</p>
                    </div> <!-- end .meta-text -->
                  </div> <!-- end .featured-item -->
                </div> <!-- end .feature-list> .row > .col-md-6 (5th item) -->

                <div class="col-sm-6 col-md-6">
                  <div class="featured-item">
                    <div class="icon">
                      <div class="icon-style"><i class="fa fa-support"></i></div>
                    </div> <!-- end icon -->
                    <div class="meta-text">
                      <h3>Excellent Support</h3>
                      <p>Suggestions, feedback, problems with your account?  Contact TraQue and you'll hear back from us within 24hrs, if not sooner.</p>
                    </div> <!-- end .meta-text -->
                  </div> <!-- end .featured-item -->
                </div> <!-- end .feature-list> .row > .col-md-6 (6th item) -->

              </div> <!-- end .feature-list> .row -->
            </div> <!-- end .feature-list -->
          </div> <!-- end .container> .row -->

        </div> <!-- end .container -->
      </div> <!-- end .features -->
    </section>
    <!-- ====== End Features Section ====== -->

    <section id="team">
      <div class="team section-padding">
        <div class="container">

          <div class="header">
            <h1><strong>What A Great Idea</strong></h1>
            <p>Meet The TraQue Team</p>
            <div class="underline"><i class="fa fa-users"></i></div>
          </div> <!-- end .container> .header -->

          <div class="row">
            <div class="app-dev">

              <div class="col-sm-6 col-md-6 col-lg-3 info">
                <div class="member">
                  <img src="images/team1.jpg" alt="" />
                  <div class="details">
                    <p>Patrick is an experienced law enforcement professional, educator, podcast host and creator of TraQue</p>
                    <div class="social icon">
                      <ul>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                      </ul>
                    </div> <!-- end .icon -->
                  </div> <!-- end .details -->
                </div> <!-- end .member -->
                <div class="title">
                  <h4>Patrick Fitzgibbons</h4>
                  <h5>Founder</h5>
                </div> <!-- end .title -->
              </div> <!-- end .info (1) -->

              <div class="col-sm-6 col-md-6 col-lg-3 info">
                <div class="member">
                  <img src="images/team2.jpg" alt="">
                  <div class="details">
                    <p>Jennifer is a successful entrepreneur and creative collaborator with TraQue</p>
                    <div class="social icon">
                      <ul>
                        <li><a href=""><i class="fa fa-twitter"></i></a></li>
                        <li><a href=""><i class="fa fa-facebook"></i></a></li>
                        <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                        <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                      </ul>
                    </div> <!-- end .icon -->
                  </div> <!-- end .details -->
                </div> <!-- end .member -->
                <div class="title">
                  <h4>Jennifer Fitzgibbons</h4>
                  <h5>Co-Founder</h5>
                </div> <!-- end .title -->
              </div> <!-- end .info (2) -->

              <div class="col-sm-6 col-md-6 col-lg-3 info">
                <div class="member">
                  <img src="images/team3.jpg" alt="">
                  <div class="details">
                    <p>Kelly is an experienced finance and business professional</p>
                    <div class="social icon">
                      <ul>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                      </ul>
                    </div> <!-- end .icon -->
                  </div> <!-- end .details -->
                </div> <!-- end .member -->
                <div class="title">
                  <h4>Kelly Arnold</h4>
                  <h5>Marketing</h5>
                </div> <!-- end .title -->
              </div> <!-- end .info (2) -->

              <div class="col-sm-6 col-md-6 col-lg-3 info">
                <div class="member">
                  <img src="images/cozmek.png" alt="cozmek solutions, llc" style="height:300px; width:300px">
                  <div class="details">
                    <p>Mike is an experienced software developer and founder of Cozmek Solutions, LLC</p>
                    <div class="social icon">
                      <ul>
                        <li><a href=""><i class="fa fa-twitter"></i></a></li>
                        <li><a href=""><i class="fa fa-facebook"></i></a></li>
                        <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                        <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                      </ul>
                    </div> <!-- end .icon -->
                  </div> <!-- end .details -->
                </div> <!-- end .member -->
                <div class="title">
                  <h4>Mike Salvidio</h4>
                  <h5>Development and Technology</h5>
                </div> <!-- end .title -->
              </div> <!-- end .info (2) -->


            </div> <!-- end .app-dev -->
          </div> <!-- end .container> .row -->

        </div> <!-- end .container -->
      </div> <!-- end .team -->
    </section>
    <!-- ====== Team Section ====== -->
    <!-- ====== Price Section ====== -->
    <section id="price">
      <div class="price section-padding dark-bg" style="padding-top:2em">
        <div class="container">

          <div class="header">
            <h1><strong>TraQue Plans</strong></h1>
            <p>TraQue offers a variety of plans to suit your individual or business needs.  Just learning about TraQue?  Our FREE individual plan is a perfect way to find out how valuable TraQue can be to you. 
                Our PREMIUM individual plan at only $3/month allows you to track unlimited certificate renewals, equipment purchases and training.  If you're part of a business, small or large, the AGENCY tiered 
                plans are perfect to keep your entire organization on track.  Tiered annual pricing allows you to choose the plan that fits your organization with the greatest cost savings.  Scroll down to see the features!</p>
            <div class="underline"><i class="fa fa-flash"></i></div>
          </div> <!-- end .container> .header -->

          <div class="row">
            <div class="price-list">

              <div class="col-md-4"> 
                <div class="price-table featured-price">
                  <div class="rate">$0.00</div>
                  <h2><i class="fa fa-user"></i>Free Usage</h2>      
<%--                  <p>Single User, one notification, one upload</p>--%>
                  <ul style="width:80%; text-align:left; margin-left:15%">
                    <li><i class="fa fa-check-circle"></i>One Certification</li>
                    <li><i class="fa fa-check-circle"></i>One Equipment</li>
                    <li><i class="fa fa-check-circle"></i>One Training</li>
                    <li><i class="fa fa-check-circle"></i>One Upload</li>
                    <li><i class="fa fa-check-circle"></i>Standard Notifications</li>
                    <li><i class="fa fa-times"></i>Convenient Dashboard<span style="font-size:small"><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Premium and Agency Only)</span></li>
                  </ul>
                  <a href="#" class="btn btn-default buy-now" data-toggle="modal" data-target="#myFreeSignUp">Sign Up</a>
                </div> <!-- end .price-table -->
              </div> <!-- end .price-list> .col-md-4 (1) -->

              <div class="col-md-4"> 
                <div class="price-table featured-price">
                  <div class="rate" style="text-align:center">$36/YR<br /><span style="font-size:small">USD</span></div>
                  <h2><i class="fa fa-user-plus"></i>Premium</h2>
 <%--                 <p>Single User, unlimited notifications and uploads</p>--%>
                  <ul style="width:80%; text-align:left; margin-left:15%">
                    <li><i class="fa fa-check-circle"></i>Unlimited Certifications</li>
                    <li><i class="fa fa-check-circle"></i>Unlimited Equipment</li>
                    <li><i class="fa fa-check-circle"></i>Unlimited Training</li>
                    <li><i class="fa fa-check-circle"></i>Unlimited Uploads</li>
                    <li><i class="fa fa-check-circle"></i>Custom Notifications</li>
                    <li><i class="fa fa-check-circle"></i>Convenient Dashboard</li>
                  </ul>
                  <a href="#" class="btn btn-default buy-now" data-toggle="modal" data-target="#myIndPremium">Purchase</a>
                </div> <!-- end .price-table -->
              </div> <!-- end .price-list> .col-md-4 (2) -->

              <div class="col-md-4">
                <div class="price-table featured-price">
                  <div class="rate" style="text-align:center;">TIERED<br /><span style="font-size:small">ANNUAL</span></div> 
                  <h2><i class="fa fa-group"></i>AGENCY</h2>
                  <p style="font-size:small; text-align:center">All <strong style="font-size:large">Premium</strong> Features For Every Member Of Your Organization</p>
                    <table style="background-color:transparent; margin-left:auto; margin-right:auto; width:90%;height:201px">
                          <tr><td>1 - 50 Users $999/yr ($19.98/User)</td></tr>
                          <tr><td>51 - 100 Users $1900/yr ($19/User)</td></tr>
                          <tr><td>101 - 200 Users $3600/yr ($18/User)</td></tr>
                          <tr><td>201 - 500 Users $8500/yr ($17/User)</td></tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr><td style="padding:5px">
                            Don't See A Plan That Suits You? <br /> Contact <a class="btn btn-warning" href="mailto:admin@traque.net"><span style="color:#000">TraQue</span></a></td></tr>
                    </table>
                    <br /><br />
                  <ul style="height:147px">
                  </ul>
                   <a href="#" class="btn btn-default buy-now" data-toggle="modal" data-target="#myAgency">Purchase</a>
                </div> <!-- end .price-table -->
              </div> <!-- end .price-list> .col-md-4 (3) -->

            </div> <!-- end .price-list -->
          </div> <!-- end .container> .row -->

        </div> <!-- end .container -->
      </div> <!-- end .price -->
    </section>
    <!-- ====== End Price Section ====== -->

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
                  <input type="text" class="form-control" id="name" placeholder="Name">
                </div> <!-- end .form-group -->

                <div class="form-group">
                  <label for="email" class="sr-only">Email</label>
                  <input type="email" class="form-control" id="email" placeholder="Email">
                </div> <!-- end .form-group -->

                <div class="form-group">
                  <label for="subject" class="sr-only">Subject</label>
                  <input type="text" class="form-control" id="subject" placeholder="Subject">
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

            jQuery('#myLogin').on('shown.bs.modal', function () {
                $("#inpUserName").html("");
                $("#inpPassword").html("");
                $("#inpUserName").focus();
            });
        })
    </script>
    </form>

    <!-- ================= MODALS ================= -->
          <div id="myLogin" class="modal fade" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="max-width:552px">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="H1"  class="modal-title">Sign In</h4>
              </div>
              <div class="modal-body">
                  <p><img src="images/pop.jpg" height="200" width="150" style="float:left; padding-right:8px"/>
                  <table>
                    <tr>
                        <td style="text-align:left;">User Name&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td><input id="inpUserName" placeholder="email address" style="margin-top:5px; margin-right:5px;padding:3px; border:1px solid lightgray; width:200px" /></td>        
                    </tr>
                    <tr>
                        <td style="text-align:left">Password&nbsp;&nbsp;</td></tr>
                      <tr>
                        <td><input id="inpPassword" type="password" placeholder="password"  style="margin-top:5px; border:1px solid lightgray; padding:3px; width:200px"  /></td>
                    </tr>
                  </table>
                  <%--<input id="divWelcomeBack" style="border:none" /> --%>
                </p>
              </div>
              <div class="modal-footer" style="border:none">
                    <a id="btnLoginCancel" class="btn btn-default btn-custom" data-dismiss="modal"><span style="font-size:medium; color:#000">Close</span></a>
                    <a id="btnLogin" href="#price" class="btn btn-info"><span style="font-size:medium; color:#000">Enter TraQue</span></a>
                <%--
                <button id="_btnLoginCancel" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="_btnLogin" type="button" class="btn btn-default">Enter TraQue</button>
              --%>

              </div>
              <div id="divLoginMSG" style="width:100%; padding-left:5px"></div>
            </div>
          </div>
        </div>     

        <div id="myFreeSignUp" class="modal fade" role="dialog">
          <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="mod_header_free"  class="modal-title">Single Basic <span style="color:red">FREE</span></h4>
              </div>
              <div class="modal-body">
                  <input class="input-lg" style="width:80%" id="inpFirstName_free" placeholder="first name" />
                  <input class="input-lg" style="width:80%" id="inpLastName_free" placeholder="last name" />
                  <input class="input-lg" style="width:80%" id="inpEmail_free" placeholder="email address" />
                  <input class="input-lg" style="width:80%" id="inpMobile" placeholder="mobile phone" />
              </div>

                <div style="width:100%; text-align:center">
                 <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
                <input type="hidden" name="cmd" value="_s-xclick" />
                <input type="hidden" name="hosted_button_id" value="9ETNBWRXXYDCQ" />
                <table style="margin-left:auto; margin-right:auto">
                <tr><td><input type="hidden" name="on0" value="free"><strong>FREE</strong></td></tr><tr><td><select name="os0"><br /><br />
	                <option value="cheap">cheap $0.01 USD</option>
	                <option value="more">more $0.02 USD</option>
	                <option value="most">most $0.03 USD</option>
                </select> </td></tr>
                </table>
                     <br /><br />
                <input type="hidden" name="currency_code" value="USD" />
                <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!" />
                <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1" />
                </form>
                </div>

              <div class="modal-footer">
                <button id="btnFreeClose" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="btnFreeSubmit" type="button" class="btn btn-default">Sign Up</button>
              </div>
            </div>
          </div>
        </div>             <!--end modal  -->


        <div id="myIndPremium" class="modal fade" role="dialog">
          <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="mod_header_indpre"  class="modal-title">Single Premium<span style="color:red">$36/YR</span></h4>
              </div>
              <div class="modal-body">
                  <span style="color:red; margin-right:5px">required</span><input class="input-lg" style="width:80%" id="inpFirstName_premium" placeholder="first name" /><br />
                  <span style="color:red; margin-right:5px">required</span><input class="input-lg" style="width:80%" id="inpLastName_premium" placeholder="last name" /><br />
                  <span style="color:red; margin-right:5px">required</span><input class="input-lg" style="width:80%" id="inpEmail_premium" placeholder="email address" /><br />
              </div>

                <div id="ppIndy" style="width:100%; text-align:center">
                    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
                    <input type="hidden" name="cmd" value="_s-xclick" />
                    <input type="hidden" name="hosted_button_id" value="EQLX54R548LVU" />
                    <p><strong>TraQue Individual Premium Plan - $36/yr</strong></p>
                    <input id="btnIndy" type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" alt="PayPal - The safer, easier way to pay online" />
                        <!--name="submit" -->
                    <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1" />
                    </form>
                </div>

              <div class="modal-footer">
                <button id="btnIndPremiumClose" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               <%-- <button id="btnIndPremiumSubmit" type="button" class="btn btn-default">Sign Up</button>--%>
              </div>
            </div>
          </div>
        </div>             <!--end modal  -->


        <div id="myAgency" class="modal fade" role="dialog">
          <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content"  style="background-image:url('img/bg22.jpg')">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="mod_header_agency"  class="modal-title"></h4>
              </div>
              <div class="modal-body">
                  <input class="input-lg" style="width:80%" id="Text1" placeholder="first name" />
                  <input class="input-lg" style="width:80%" id="Text2" placeholder="last name" />
                  <input class="input-lg" style="width:80%" id="Text3" placeholder="email address" />
              </div>

            <div id="ppAgency" style="width:100%; text-align:center">
                <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
                <input type="hidden" name="cmd" value="_s-xclick" />
                <input type="hidden" name="hosted_button_id" value="WHCZETZLT8XGE" />
                    <br />

                    <table style="margin-left:auto; margin-right:auto;">
                    <tr><td><input type="hidden" name="on0" value="Tiers"><strong>TraQue Agency</strong></td></tr><tr><td></td></tr>
                    <tr><td><select name="os0">
	                <option value="Tier 1 (1 to 50 users)">Tier 1 (1 to 50 users) $999.00 USD</option>
	                <option value="Tier 2 (51 - 100 users)">Tier 2 (51 - 100 users) $1,900.00 USD</option>
	                <option value="Tier 3 (101 - 200 users)">Tier 3 (101 - 200 users) $3,600.00 USD</option>
	                <option value="Tier 4 (201 to 500 users)">Tier 4 (201 to 500 users) $8,500.00 USD</option>
                    </select> </td></tr>
                    </table>

                <br /><br />
                <input type="hidden" name="currency_code" value="USD" />
                <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" style="border:none" name="submit" alt="PayPal - The safer, easier way to pay online!" />
                <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1" />
                </form>
            </div>
              <div class="modal-footer">
                <button id="btnTierClose" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>             <!--end modal  -->

    <!-- ================= MODALS ================= -->
   
</body>
</html>

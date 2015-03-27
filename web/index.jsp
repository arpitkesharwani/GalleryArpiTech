<%--
    Document   : index
    Created on : Feb 17, 2015, 5:51:28 PM
    Author     : Arpit Kesharwani
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<s:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/gallery" user="root" password="root"/>

<s:query var="q" sql="select * from friend"/>
<s:query var="qq" sql="select albumName from album"/>
<s:query var="qqq" sql="select * from friend"/>
<s:query var="v" sql="SELECT * FROM album ORDER BY `albumDate` DESC LIMIT 12"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> <!--<![endif]-->  
    <head>
        <title>Arpit's Gallery | Creative One</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico">

        <!-- CSS Global Compulsory -->
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/plugins/jquery-ui.css">
        <!-- CSS Implementing Plugins -->
        <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
        <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">    
        <link rel="stylesheet" href="assets/plugins/pace/pace-flash.css">
        <link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">    
        <link rel="stylesheet" href="assets/plugins/revolution-slider/examples-sources/rs-plugin/css/settings.css" type="text/css" media="screen">

        <!-- load css for cubeportfolio -->
        <link rel="stylesheet" type="text/css" href="assets/plugins/cbp-plugin/cubeportfolio/css/cubeportfolio.min.css">

        <!-- load main css for this page -->
        <link rel="stylesheet" type="text/css" href="assets/plugins/cbp-plugin/templates/lightbox-gallery/css/main.css">

        <!-- CSS Customization -->
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/plugins/sky-forms/version-2.0.1/css/custom-sky-forms.css">
        <link rel="stylesheet" href="assets/Image_crop/style.css"/>

    </head>
    <!-- The #page-top ID is part of the scrolling feature - the data-spy and data-target are part of the built-in Bootstrap scrollspy function -->
    <body id="body" data-spy="scroll" data-target=".navbar-fixed-top" class="demo-lightbox-gallery" style="background: url(assets/img/2.png) repeat;">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand " href="#intro">
                        <span>A</span>rpit's Gallery
                        <!-- <img src="assets/img/logo1.png" alt="Logo"> -->
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <li class="page-scroll home">
                            <a href="#body">Home</a>
                        </li>
                        <li class="page-scroll">
                            <a href="#about">Friends
                            </a>
                        </li>
                        <li class="page-scroll">
                            <a href="#portfolio">Gallery</a>
                        </li>
                        <li class="page-scroll">
                            <a href="#contact">Contact</a>
                        </li>  
                        <li class="">
                            <c:if test="${sessionScope.user eq null}">
                                <a href="" data-toggle="modal" data-target="#login">Login&Register</a>
                            </c:if>                         
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
                <c:if test="${sessionScope.user ne null}">
                    <div class="btn-group pull-right margin-bottom-10">
                        <button type="button" class="btn-u btn-u-blue">
                            <i class="fa fa-user"></i>  ${sessionScope.user}
                        </button>
                        <button type="button" class="btn-u btn-u-blue btn-u-split-blue dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-angle-down"></i>
                            <span class="sr-only">Toggle Dropdown</span>                            
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li class="" data-toggle="modal" data-target="#responsive">
                                <a href="" data-toggle="modal" data-target="#newFriend"><i class="fa fa-reddit"></i>   Upload New Friend Details</a>
                            </li>                          
                            <li class="" >
                                <a href="" data-toggle="modal" data-target="#albumCreate" onclick="createAlbum()">
                                    <i class="fa fa-language"></i>   Create New Album</a>
                            </li>
                            <li class="">
                                <a href="" data-toggle="modal" data-target="#imageUpload"><i class="fa fa-image"></i>   Upload Images to an Album</a>
                            </li>
                            <li class="">
                                <a href="" onclick="logout()"><i class="fa fa-unlink"></i>   LogOut</a>
                            </li> 
                        </ul>
                    </div>
                </c:if>  
            </div>
            <!-- /.container -->
        </nav>    
        <!-- Intro Section -->
        <section id="intro" class="intro-section">
            <div class="fullscreenbanner-container">
                <div class="fullscreenbanner">
                    <ul>
                        <!-- SLIDE  -->
                        <li data-transition="curtain-1" data-slotamount="5" data-masterspeed="700">
                            <!-- MAIN IMAGE -->
                            <img src="MyImage/cover.jpg" alt="slidebg1" data-bgfit="cover" data-bgposition="center center" data-bgrepeat="no-repeat">

                            <!-- LAYERS -->
                            <div class="tp-caption rs-caption-1 sft start"
                                 data-x="center"
                                 data-hoffset="0"
                                 data-y="200"
                                 data-speed="800"
                                 data-start="2000"
                                 data-easing="Back.easeInOut"
                                 data-endspeed="300">
                                DO GOOD AND GOOD WILL COME TO YOU
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption rs-caption-2 sft"
                                 data-x="center"
                                 data-hoffset="0"
                                 data-y="300"
                                 data-speed="1000"
                                 data-start="3000"
                                 data-easing="Power4.easeOut"
                                 data-endspeed="300"
                                 data-endeasing="Power1.easeIn"
                                 data-captionhidden="off"
                                 style="z-index: 6">
                                Creative freedom matters user experience.<br>
                                We minimize the gap between technology and its audience.
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption rs-caption-3 sft"
                                 data-x="center"
                                 data-hoffset="0"
                                 data-y="460"
                                 data-speed="800"
                                 data-start="3500"
                                 data-easing="Power4.easeOut"
                                 data-endspeed="300"
                                 data-endeasing="Power1.easeIn"
                                 data-captionhidden="off"
                                 style="z-index: 6">
                                <span class="page-scroll"><a href="#about" class="btn-u btn-brd btn-brd-hover btn-u-light">Learn More</a></span>
                                <span class="page-scroll"><a href="#portfolio" class="btn-u btn-brd btn-brd-hover btn-u-light">Our Work</a></span>
                            </div>
                        </li>

                        <!-- SLIDE -->
                        <li data-transition="slideup" data-slotamount="5" data-masterspeed="1000">
                            <!-- MAIN IMAGE -->
                            <img src="MyImage/cover2.jpg" alt="slidebg1"  data-bgfit="cover" data-bgposition="center center" data-bgrepeat="no-repeat">

                            <!-- LAYERS -->
                            <div class="tp-caption rs-caption-1 sft start"
                                 data-x="center"
                                 data-hoffset="0"
                                 data-y="100"
                                 data-speed="800"
                                 data-start="1500"
                                 data-easing="Back.easeInOut"
                                 data-endspeed="300">
                                DEDICATED ADVANCED TEAM
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption rs-caption-2 sft"
                                 data-x="center"
                                 data-hoffset="0"
                                 data-y="200"
                                 data-speed="1000"
                                 data-start="2500"
                                 data-easing="Power4.easeOut"
                                 data-endspeed="300"
                                 data-endeasing="Power1.easeIn"
                                 data-captionhidden="off"
                                 style="z-index: 6">
                                We are creative technology company providing<br> 
                                key digital services on web and mobile.                            
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption rs-caption-3 sft"
                                 data-x="center"
                                 data-hoffset="0"
                                 data-y="360"
                                 data-speed="800"
                                 data-start="3500"
                                 data-easing="Power4.easeOut"
                                 data-endspeed="300"
                                 data-endeasing="Power1.easeIn"
                                 data-captionhidden="off"
                                 style="z-index: 6">
                                <span class="page-scroll"><a href="#about" class="btn-u btn-brd btn-brd-hover btn-u-light">Learn More</a></span>
                                <span class="page-scroll"><a href="#portfolio" class="btn-u btn-brd btn-brd-hover btn-u-light">Our Work</a></span>
                            </div>
                        </li>

                        <!-- SLIDE -->
                        <li data-transition="slideup" data-slotamount="5" data-masterspeed="700">
                            <!-- MAIN IMAGE -->
                            <img src="MyImage/cover3.JPG"  alt="slidebg1"  data-bgfit="cover" data-bgposition="center center" data-bgrepeat="no-repeat">

                            <!-- LAYERS -->
                            <div class="tp-caption rs-caption-1 sft start"
                                 data-x="center"
                                 data-hoffset="0"
                                 data-y="110"
                                 data-speed="800"
                                 data-start="1500"
                                 data-easing="Back.easeInOut"
                                 data-endspeed="300">
                                WE DO THINGS DIFFERENTLY
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption rs-caption-2 sfb"
                                 data-x="center"
                                 data-hoffset="0"
                                 data-y="210"
                                 data-speed="800"
                                 data-start="2500"
                                 data-easing="Power4.easeOut"
                                 data-endspeed="300"
                                 data-endeasing="Power1.easeIn"
                                 data-captionhidden="off"
                                 style="z-index: 6">
                                Creative freedom matters user experience.<br>
                                We minimize the gap between technology and its audience.
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption rs-caption-3 sfb"
                                 data-x="center"
                                 data-hoffset="0"
                                 data-y="370"
                                 data-speed="800"
                                 data-start="3500"
                                 data-easing="Power4.easeOut"
                                 data-endspeed="300"
                                 data-endeasing="Power1.easeIn"
                                 data-captionhidden="off"
                                 style="z-index: 6">
                                <span class="page-scroll"><a href="#about" class="btn-u btn-brd btn-brd-hover btn-u-light">Learn More</a></span>
                                <span class="page-scroll"><a href="#portfolio" class="btn-u btn-brd btn-brd-hover btn-u-light">Our Work</a></span>
                            </div>
                        </li>                    
                    </ul>
                    <div class="tp-bannertimer tp-bottom"></div>
                    <div class="tp-dottedoverlay twoxtwo"></div>
                </div>
            </div>

        </section>
        <!-- End Intro Section -->
        <!--  About Section -->
        <section id="about" class="about-section section-first">
            <div class="parallax-quote parallaxBg">
                <div class="container">
                    <div class="parallax-quote-in">
                        <p>If you can design one thing <span class="color-green">you can design</span> everything. <br> Just Believe It.</p>
                        <small>- Arpit Kesharwani -</small>
                    </div>
                </div>
            </div>        

            <div class="team content-lg" style="padding-bottom:0px">
                <div class="container">
                    <div class="title-v1">
                        <h2>Meet My Friends</h2>

                        <p>We <strong>meet</strong> and get to know you. You tell us and we listen. <br> 
                            We build your website to realise your vision and we <strong>deliver</strong> the ready product.</p>
                    </div>
                    <!--=== Search Block Version 2 ===-->
                    <div class="search-block-v2 margin-bottom-40">
                        <div class="container">
                            <div class="col-md-6 col-md-offset-3">
                                <h2 align="center">SEARCH</h2>
                                <div class="input-group">
                                    <input type="text" id="friendcomplete" class="form-control" placeholder="Search Friend ...">
                                    <span class="input-group-btn">
                                        <button class="btn-u" type="button"><i class="fa fa-search"></i></button>
                                    </span>
                                </div>
                            </div>
                        </div>    
                    </div><!--/container-->     
                    <!--=== End Search Block Version 2 ===-->
                    <ul class="list-unstyled row">
                        <c:forEach items="${qqq.rows}" var="e" >                               
                            <li class="col-sm-2 col-xs-6 md-margin-bottom-30">
                                <div class="team-img box-shadow shadow-effect-2" >
                                    <img class="img-responsive" src="${e.image}" alt="${e.name}" width="100%">
                                    <ul>
                                        <li><a href="${e.twitterUrl}"><i class="icon-custom icon-sm rounded-x fa fa-twitter"></i></a></li>
                                        <li><a href="${e.fbUrl}"><i class="icon-custom icon-sm rounded-x fa fa-facebook"></i></a></li>
                                        <li><a href="${e.linkedInUrl}"><i class="icon-custom icon-sm rounded-x fa fa-google-plus"></i></a></li>
                                    </ul>
                                </div>
                                <h3>${e.name}</h3>
                                <h4>/ ${e.designation}</h4>
                                <p>${e.companyName}</p>
                            </li>
                        </c:forEach>
                    </ul>                                    
                </div>
            </div>  
        </section>
        <!--  About Section -->
        <!-- Gallery Section -->
        <section id="portfolio" class="">
            <div class="container content-lg">
                <div class="title-v1">
                    <h2>My Gallery</h2>
                    <p>We do <strong>things</strong> differently company providing key digital services. <br> 
                        Focused on helping our clients to build a <strong>successful</strong> business on web and mobile.</p>                
                </div>
                <div class="wrapper-portfolio">
                    <div id="filters-container" class="cbp-l-filters-alignLeft">
                        <div data-filter="*" class="cbp-filter-item-active cbp-filter-item">All (<span class="cbp-filter-counter"></span> items)</div>
                        <div data-filter=".print" class="cbp-filter-item">Print (<span class="cbp-filter-counter"></span> items)</div>
                        <div data-filter=".web-design" class="cbp-filter-item">Web Design (<span class="cbp-filter-counter"></span> items)</div>
                        <div data-filter=".motion" class="cbp-filter-item">Motion (<span class="cbp-filter-counter"></span> items)</div>
                    </div>
                    <!--=== Search Block Version 2 ===-->
                    <div class="search-block-v2 margin-bottom-40">
                        <div class="container">
                            <div class="col-md-6 col-md-offset-3">
                                <h2 align="center">SEARCH</h2>
                                <div class="input-group">
                                    <input type="text" id="input" class="form-control" placeholder="Search Albums with regular expressions ...">
                                    <span class="input-group-btn">
                                        <button class="btn-u" type="button"><i class="fa fa-search"></i></button>
                                    </span>
                                </div>
                            </div>
                        </div>    
                    </div><!--/container-->     
                    <!--=== End Search Block Version 2 ===-->

                    <div id="grid-container" class="cbp-l-grid-gallery">
                        <ul id="list">
                            <c:forEach items="${v.rows}" var="e" varStatus="loopCount" > 
                                <li class="cbp-item print motion" >
                                    <a href="assets/ajax/albumDetail.jsp?albumName=${e.albumName}&albumCover=${e.albumCover}&albumDate=${e.albumDate}&albumDetail=${e.albumDetail}" class="cbp-caption cbp-singlePageInline" data-title="World Clock Widget<br>by Paul Flavius Nechita">                                    
                                        <div class="cbp-caption-defaultWrap">
                                            <img src="${e.albumCover}" alt="" width="100%" class="">
                                        </div>
                                        <div class="cbp-caption-activeWrap">
                                            <div class="cbp-l-caption-alignLeft">
                                                <div class="cbp-l-caption-body">
                                                    <div class="cbp-l-caption-title" >${e.albumName} </div>
                                                    <div class="cbp-l-caption-desc">${e.albumDate}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>                                 
                                </li>                                
                            </c:forEach>                                 
                        </ul>
                    </div>
                    <div class="cbp-l-loadMore-button">
                        <a href="assets/ajax/loadMore.jsp?lastAlbumDate=${v.rows[11].albumDate}" class="cbp-l-loadMore-button-link">LOAD MORE</a>
                    </div>

                </div>
            </div>                
        </section>

        <!-- End GAllery Section -->
        <!-- Contact Section -->
        <section id="contact" class="contacts-section">
            <div class="container content-lg">
                <div class="title-v1">
                    <h2>Contact Us</h2>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. <br>
                        It has been the industry's standard dummy text.</p>
                </div>

                <div class="row contacts-in">
                    <div class="col-md-6 md-margin-bottom-40">
                        <ul class="list-unstyled">
                            <li><i class="fa fa-home"></i> 8/28 Sadar Bazar Sagar[M.P.]</li>
                            <li><i class="fa fa-phone"></i> +91-8982830800</li>
                            <li><i class="fa fa-envelope"></i> <a href="info@example.com">arpitanshul@gmail.com</a></li>
                            <li><i class="fa fa-globe"></i> <a href="http://htmlstream.com">www.arpitech.in</a></li>
                        </ul>
                    </div>

                    <div class="col-md-6">
                        <form action="contactServlet" method="post">
                            <label>Name</label>
                            <div class="row margin-bottom-20">
                                <div class="col-md-7 col-md-offset-0">
                                    <input type="text" name="name" class="form-control" required="true">
                                </div>                
                            </div>

                            <label>Email <span class="color-red">*</span></label>
                            <div class="row margin-bottom-20">
                                <div class="col-md-7 col-md-offset-0">
                                    <input type="text" name="email" class="form-control" required="true">
                                </div>                
                            </div>

                            <label>Message</label>
                            <div class="row margin-bottom-20">
                                <div class="col-md-11 col-md-offset-0">
                                    <textarea rows="8" class="form-control" name="message" required="true"></textarea>
                                </div>                
                            </div>

                            <p><button type="submit" class="btn-u btn-brd btn-brd-hover btn-u-dark">Send Message</button></p>
                        </form> 
                    </div>
                </div>            
            </div>

            <div class="copyright-section">
                <p>2014 &copy; All Rights Reserved. ArpiTech's by <a target="_blank" href="https://gmail.com">Arpit kesharwani</a></p>
                <ul class="social-icons">
                    <li><a href="#" data-original-title="Facebook" class="social_facebook rounded-x"></a></li>
                    <li><a href="#" data-original-title="Twitter" class="social_twitter rounded-x"></a></li>
                    <li><a href="#" data-original-title="Goole Plus" class="social_googleplus rounded-x"></a></li>
                    <li><a href="#" data-original-title="Pinterest" class="social_pintrest rounded-x"></a></li>
                    <li><a href="#" data-original-title="Linkedin" class="social_linkedin rounded-x"></a></li>
                </ul>
                <span class="page-scroll"><a href="#intro"><i class="fa fa-angle-double-up back-to-top"></i></a></span>
            </div>
        </section>
        <!-- End Contact Section -->
        <!--Uploads Friends Details -->
        <div class="modal fade" id="newFriend" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <!-- Begin Content -->

                        <div class="row margin-bottom-40">
                            <!-- REgistration-Form -->
                            <div class="col-md-12">
                                <!-- Reg-Form -->
                                <form action="InsertNewFriendServ" id="sky-form4" class="sky-form" enctype="multipart/form-data">
                                    <header>Insert New Friend Details</header>
                                    <fieldset>   
                                        <h4> Personal Details</h4>
                                        <div class="row">
                                            <section class="col-md-6">
                                                <label class="input">
                                                    <i class="icon-append fa fa-user"></i>
                                                    <input type="text" name="name" placeholder="Name" required="true">
                                                    <b class="tooltip tooltip-bottom-right">Enter Your Friend's Name</b>
                                                </label>
                                            </section>
                                            <section class="col-md-6">
                                                <label class="select">
                                                    <select name="gender" required="true">
                                                        <option value="0" selected disabled>Gender</option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                    <i></i>
                                                </label>
                                            </section>
                                        </div>                                       
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-envelope"></i>
                                                <input type="email" name="email" placeholder="Email address" required="true">
                                                <b class="tooltip tooltip-bottom-right">Needed to Connect</b>
                                            </label>
                                        </section>
                                        <div class="row">
                                            <section class="col-md-6">
                                                <label class="input">
                                                    <i class="icon-append fa fa-cube"></i>
                                                    <input type="text" name="companyName" placeholder="Company Name" required="true">
                                                    <b class="tooltip tooltip-bottom-right">Enter Company name</b>
                                                </label>
                                            </section>
                                            <section class="col-md-6">
                                                <label class="input">
                                                    <i class="icon-append fa  fa-pied-piper-alt"></i>
                                                    <input type="text" name="designation" placeholder="Designation" required="true">
                                                    <b class="tooltip tooltip-bottom-right">Enter Designation</b>
                                                </label>
                                            </section>
                                        </div>
                                        <h4> Social Details</h4>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-link"></i>
                                                <input type="text" name="LinkedInUrl" placeholder="LinkedInUrl" required="true">
                                                <b class="tooltip tooltip-bottom-right">Enter LinkedInUrl</b>
                                            </label>
                                        </section>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-link"></i>
                                                <input type="text" name="FacebookUrl" placeholder="FacebookUrl" required="true">
                                                <b class="tooltip tooltip-bottom-right">Enter FacebookUrl</b>
                                            </label>
                                        </section>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-link"></i>
                                                <input type="text" name="twitterUrl" placeholder="twitterUrl" required="true">
                                                <b class="tooltip tooltip-bottom-right">Enter twitterUrl</b>
                                            </label>
                                        </section>
                                    </fieldset>


                                    <footer>
                                        <button type="submit" class="btn-u">Insert</button>
                                        <button type="Reset" class="btn-u">Reset</button>
                                        <button data-dismiss="modal" class="btn-u btn-u-default" type="button">Close</button>
                                    </footer>
                                </form>         
                                <!-- End Reg-Form -->
                            </div>

                        </div><!--/end row-->

                        <!-- End Content -->
                    </div>
                </div>
            </div>
        </div>
        <!--End Uploads Friends Details -->
        <!--Uploads Friends Image -->
        <div class="modal" id="image" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <!-- Begin Content -->
                        <div class="row margin-bottom-40">
                            <!-- REgistration-Form -->
                            <div class="col-md-12">
                                <!-- Reg-Form -->
                                <form action="InsertNewFriendServ" method="post" id="sky-form4" class="sky-form">
                                    <header>Insert Friend Image</header>
                                    <fieldset>
                                        <section> 
                                            <label class="input">
                                                <i class="icon-append fa fa-envelope"></i>
                                                <input type="file" id="file" required="true" accept="image/*"/> 

                                                <b class="tooltip tooltip-bottom-right">Upload Friend's Image</b>
                                            </label>
                                        </section>
                                        <section>
                                            <div class="container1 margin-bottom-40 funny-boxes">
                                                <div class="imageBox col-md-12">
                                                    <div class="thumbBox"></div>
                                                    <div class="spinner" style="display: none">Choose Image</div>
                                                </div>
                                                <div class="col-md-12 margin-bottom-20" >                                          
                                                    <input type="button" id="btnCrop" value="Crop" style="float: right">
                                                    <input type="button" id="btnZoomIn" value="+" style="float: right">
                                                    <input type="button" id="btnZoomOut" value="-" style="float: right">
                                                </div>
                                                <div class="cropped col-md-12" >

                                                </div>
                                            </div>
                                            <footer>
                                                <button type="submit" class="btn-u">Upload</button> 
                                                <button type="reset" class="btn-u">Reset</button>   
                                                <button data-dismiss="modal" class="btn-u btn-u-default" type="button">Close</button>
                                            </footer>
                                        </section>                                      
                                    </fieldset>

                                </form>         
                                <!-- End Reg-Form -->
                            </div>

                        </div><!--/end row-->

                        <!-- End Content -->
                    </div>
                </div>
            </div>
        </div>     
        <!--End Uploads Friends Image -->
        <!--Create an album -->
        <div class="modal fade" id="albumCreate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <!-- Begin Content -->

                        <div class="row margin-bottom-40">
                            <!-- Create New Album-Form -->
                            <div class="col-md-12">
                                <form action="InsertNewAlbum" method="post" id="sky-form4" class="sky-form">
                                    <header>Create New Album</header>
                                    <fieldset>
                                        <div class="row">
                                            <section class="col-md-6"> 
                                                <label class="input">
                                                    <i class="icon-append fa  fa-language"></i>
                                                    <input type="text" name="albumName" required="true" placeholder="Enter Album Name"/>                                                
                                                    <b class="tooltip tooltip-bottom-right">Enter Album Name</b>
                                                </label>
                                            </section>
                                            <section class="col-md-6">
                                                <label class="input">
                                                    <i class="icon-append fa fa-calendar"></i>
                                                    <input type="text" name="albumDate" id="start" placeholder="Select Album date">
                                                </label>
                                            </section>
                                        </div>
                                        <section>
                                            <label class="textarea">
                                                <i class="icon-append fa fa-pencil"></i>
                                                <textarea row="2" type="text" name="albumDetail" placeholder="Album Details"></textarea>
                                            </label>
                                        </section>
                                        <section> 
                                            <label class="input">
                                                <i class="icon-append fa  fa-file-image-o"></i>
                                                <input type="file" id="file1" required="true" accept="image/*"/> 
                                                <b class="tooltip tooltip-bottom-right">Browse Cover Image</b>
                                            </label>
                                        </section>
                                        <section>
                                            <div class="container1 margin-bottom-40 funny-boxes">
                                                <div class="imageBox1 col-md-12">
                                                    <div class="thumbBox1"></div>
                                                    <div class="spinner1" style="display: none">Choose Image</div>
                                                </div>
                                                <div class="col-md-12 margin-bottom-20" >                                          
                                                    <input type="button" id="btnCrop1" value="Crop" style="float: right">
                                                    <input type="button" id="btnZoomIn1" value="+" style="float: right">
                                                    <input type="button" id="btnZoomOut1" value="-" style="float: right">
                                                </div>
                                                <div class="cropped1 col-md-12" >

                                                </div>
                                            </div>     

                                        </section>                                      
                                        <section>                                           
                                            <footer>
                                                <button type="submit" class="btn-u">Create</button> 
                                                <button type="reset" class="btn-u">Reset</button>   
                                                <button data-dismiss="modal" class="btn-u btn-u-default" type="button">Close</button>
                                            </footer>
                                        </section>                                      
                                    </fieldset>

                                </form> 
                            </div>                        
                        </div><!--/end row-->

                        <!-- End Content -->
                    </div>
                </div>
            </div>
        </div>
        <!--End Create an album -->
        <!--Uploads Gallery Images -->
        <div class="modal fade" id="imageUpload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <!-- Begin Content -->
                        <div class="row margin-bottom-40">
                            <!-- Create New Album-Form -->
                            <div class="col-md-12">
                                <!-- upload Images-Form -->
                                <form action="InsertAlbumServlet" method="post" id="sky-form4" class="sky-form" enctype="multipart/form-data">
                                    <header>Upload Photos to an Album</header>
                                    <fieldset>
                                        <section> 

                                            <label class="select">
                                                <select onchange="albumName(this.value)">
                                                    <option value="0" selected disabled>Choose Album Name</option>
                                                    <c:forEach var="e" items="${qq.rows}">
                                                        <option value="${e.albumName}">${e.albumName}</option>
                                                    </c:forEach>
                                                </select>
                                                <i></i>
                                            </label>

                                        </section>                                       
                                        <section> 
                                            <label class="input">
                                                <i class="icon-append fa fa-image"></i>
                                                <input type="file" name="fileName" id="FileUpload1" required="true" multiple="multiple" accept="image/*" /> 
                                                <b class="tooltip tooltip-bottom-right">Choose multiple photos</b>
                                            </label>
                                        </section>                                     
                                        <section>                                           
                                            <footer>
                                                <button type="" class="btn-u" id="Button1">Upload</button> 
                                                <button type="reset" class="btn-u">Reset</button>   
                                                <button data-dismiss="modal" class="btn-u btn-u-default" type="button">Close</button>
                                            </footer>
                                        </section>   
                                        <section>
                                            <div id="progressbar" class="progress-bar progress-bar-u" style="width: 100%">
                                                <div id="progresslabel" class="progressbarlabel"></div>
                                            </div>
                                        </section>
                                    </fieldset>

                                </form>         
                                <!-- End upload Images-Form -->
                            </div>

                        </div><!--/end row-->

                        <!-- End Content -->
                    </div>
                </div>
            </div>
        </div>
        <!--End Uploads Gallery Images -->
        <!--Login & Registration Modal -->
        <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="tab-v1">
                            <ul class="nav nav-justified nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#Login">Login</a></li>
                                <li><a data-toggle="tab" href="#register">Register</a></li>
                            </ul>  
                            <div class="tab-content">
                                <div id="Login" class="profile-edit tab-pane fade in active">                                   
                                    <div class="row margin-bottom-40">
                                        <div class="col-md-12">
                                            <form action="loginServlet" id="sky-form1" class="sky-form">
                                                <header>Login form</header>
                                                <fieldset>                  
                                                    <section>
                                                        <div class="row">
                                                            <label class="label col col-4">E-mail</label>
                                                            <div class="col col-8">
                                                                <label class="input">
                                                                    <i class="icon-append fa fa-user"></i>
                                                                    <input type="email" name="email" required="true">
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </section>
                                                    <section>
                                                        <div class="row">
                                                            <label class="label col col-4">Password</label>
                                                            <div class="col col-8">
                                                                <label class="input">
                                                                    <i class="icon-append fa fa-lock"></i>
                                                                    <input type="password" name="password" required="true">
                                                                </label>
                                                                <div class="note" data-dismiss="modal"><a href="" data-toggle="modal" data-target="#forgotPassword">Forgot password?</a></div>
                                                            </div>
                                                        </div>
                                                    </section>

                                                    <section>
                                                        <div class="row">
                                                            <div class="col col-4"></div>
                                                            <div class="col col-8">
                                                                <label class="checkbox"><input type="checkbox" name="remember" checked><i></i>Keep me logged in</label>
                                                            </div>
                                                        </div>
                                                    </section>
                                                </fieldset>
                                                <footer>
                                                    <button type="submit" class="btn-u">Log in</button>
                                                    <button data-dismiss="modal" class="btn-u btn-u-default" type="button">Close</button>
                                                </footer>
                                            </form>         
                                        </div>
                                        <!-- End Login-Form -->
                                    </div>
                                </div>
                                <div id="register" class="profile-edit tab-pane fade in active">
                                    <div class="row margin-bottom-40">
                                        <!-- REgistration-Form -->
                                        <div class="col-md-12">
                                            <!-- Reg-Form -->
                                            <form action="registerServlet" method="post" id="sky-form4" class="sky-form">
                                                <header>Registration form</header>
                                                <fieldset>                  
                                                    <section>
                                                        <label class="input">
                                                            <i class="icon-append fa fa-envelope"></i>
                                                            <input type="email" name="email" placeholder="Email address" required="true">
                                                            <b class="tooltip tooltip-bottom-right">Needed to verify your account</b>
                                                        </label>
                                                    </section>
                                                    <section>
                                                        <label class="input">
                                                            <i class="icon-append fa fa-lock"></i>
                                                            <input type="password" name="password" placeholder="Password" id="password" required="true">
                                                            <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
                                                        </label>
                                                    </section>
                                                    <section>
                                                        <label class="input">
                                                            <i class="icon-append fa fa-lock"></i>
                                                            <input type="password" name="passwordConfirm" placeholder="Confirm password" required="true"> 
                                                            <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
                                                        </label>
                                                    </section>
                                                </fieldset>
                                                <fieldset>
                                                    <div class="row">
                                                        <section class="col col-6">
                                                            <label class="input">
                                                                <input type="text" name="firstname" placeholder="First name" required="true">
                                                            </label>
                                                        </section>
                                                        <section class="col col-6">
                                                            <label class="input">
                                                                <input type="text" name="lastname" placeholder="Last name" required="true">
                                                            </label>
                                                        </section>
                                                    </div>

                                                    <section>
                                                        <label class="select">
                                                            <select name="gender">
                                                                <option value="0" selected disabled>Gender</option>
                                                                <option value="Male">Male</option>
                                                                <option value="Female">Female</option>
                                                                <option value="Other">Other</option>
                                                            </select>
                                                            <i></i>
                                                        </label>
                                                    </section>

                                                    <section>
                                                        <label class="checkbox"><input type="checkbox" name="subscription" id="subscription"><i></i>I want to receive news and  special offers</label>
                                                        <label class="checkbox"><input type="checkbox" name="terms" id="terms"><i></i>I agree with the Terms and Conditions</label>
                                                    </section>
                                                </fieldset>
                                                <footer>
                                                    <button type="submit" class="btn-u">Submit</button>
                                                    <button data-dismiss="modal" class="btn-u btn-u-default" type="button">Close</button>

                                                </footer>
                                            </form>         
                                            <!-- End Reg-Form -->
                                        </div>
                                    </div>
                                </div>                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>       
        <div class="modal fade" id="forgotPassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <form action="" class="sky-form">
                            <header>Password recovery</header>
                            <fieldset>                  
                                <section>
                                    <label class="label">E-mail</label>
                                    <label class="input">
                                        <i class="icon-append icon-user"></i>
                                        <input type="email" name="email" id="email">
                                    </label>
                                </section>
                            </fieldset>

                            <footer>
                                <button type="submit" name="submit" class="btn-u">Submit</button>
                                <button class="btn-u btn-u-default" data-dismiss="modal">Close</button>
                            </footer>

                            <div class="message">
                                <i class="rounded-x fa fa-check"></i>
                                <p>Your request successfully sent!<br><a href="#" class="modal-closer">Close window</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="message" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="messageClose()"><span aria-hidden="true" class="icon-close"></span></button>
                        <h4 class="modal-title" id="myModalLabel">${sessionScope.message}</h4>
                    </div>
                </div>
            </div>
        </div>
        <!--End Login & Registration Modal -->
        <!-- JS Global Compulsory -->
        <script type="text/javascript" src="assets/plugins/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="assets/plugins/jquery-ui.js"></script>
        <script type="text/javascript" src="assets/plugins/jquery-migrate-1.2.1.min.js"></script>    
        <script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <!-- JS Implementing Plugins -->
        <script type="text/javascript" src="assets/plugins/jquery.easing.min.js"></script>
        <script type="text/javascript" src="assets/plugins/pace/pace.min.js"></script>
        <script type="text/javascript" src="assets/plugins/jquery.parallax.js"></script>
        <script type="text/javascript" src="assets/plugins/counter/waypoints.min.js"></script>
        <script type="text/javascript" src="assets/plugins/counter/jquery.counterup.min.js"></script>
        <script type="text/javascript" src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>    
        <script type="text/javascript" src="assets/plugins/revolution-slider/examples-sources/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
        <script type="text/javascript" src="assets/plugins/revolution-slider/examples-sources/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
        <!-- load caPortfolio plugin -->
        <script type="text/javascript" src="assets/plugins/cbp-plugin/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
        <!-- load main js -->
        <script type="text/javascript" src="assets/plugins/cbp-plugin/templates/lightbox-gallery/js/main.js"></script>
        <script src="assets/plugins/sky-forms/version-2.0.1/js/jquery.form.min.js"></script>
        <!-- Validation Form -->
        <script src="assets/plugins/sky-forms/version-2.0.1/js/jquery.validate.min.js"></script>

        <!-- JS Page Level-->

        <script type="text/javascript" src="assets/js/app.js"></script>
        <script type="text/javascript" src="assets/js/plugins/owl-carousel.js"></script>    
        <script type="text/javascript" src="assets/Image_crop/cropbox.js"></script>
        <script src="assets/plugins/sky-forms/version-2.0.1/js/jquery-ui.min.js"></script>
        <script src="assets/plugins/sky-forms/version-2.0.1/js/jquery.form.min.js"></script>
        <script type="text/javascript">
                            jQuery(document).ready(function() {
                                App.init();
                                App.initCounter();
                                App.initParallaxBg();
                                OwlCarousel.initOwlCarousel();
                            });</script>
        <script>
            var i = '<%= session.getAttribute("success")%>';
            if (i == 'success') {
                $(window).load(function() {
                    $('#image').modal('show');
                });
            }
            var j = '<%= session.getAttribute("message")%>';
            if (j != 'null') {
                $(window).load(function() {
                    $('#message').modal('show');
                });
            }
        </script>

        <script>
            //Search Implementation
            var lis = $("#list li");
            var list = $.makeArray(lis.map(function(k, v) {
                return  $(v).text().toLowerCase();
            }))
            $("#input").keyup(function() {
                var userInput = $(this).val();
                lis.each(function(index, value) {
                    $(value).toggle(list[index].indexOf(userInput) >= 0);
                });
            });

            //Revolution Slider API
            var revapi;
            jQuery(document).ready(function() {
                revapi = jQuery('.fullscreenbanner').revolution(
                        {
                            delay: 15000,
                            startwidth: 1170,
                            startheight: 500,
                            hideThumbs: 10,
                            fullWidth: "on",
                            fullScreen: "on",
                            dottedOverlay: "twoxtwo",
                            fullScreenOffsetContainer: ""
                        });
            });
            paceOptions = {
                // Disable the 'elements' source
                elements: false,
                // Only show the progress on regular and ajax-y page navigation,
                // not every request
                restartOnRequestAfter: false
            };

            //Crop Image Implementation for Friend Image
            window.onload = function() {
                var options =
                        {
                            imageBox: '.imageBox',
                            thumbBox: '.thumbBox',
                            spinner: '.spinner'
                                    //    imgSrc: 'MyImage/FrndsImage/Anuj.jpg'
                        };
                var cropper = new cropbox(options);
                document.querySelector('#file').addEventListener('change', function() {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        options.imgSrc = e.target.result;
                        cropper = new cropbox(options);
                    };
                    reader.readAsDataURL(this.files[0]);
                    this.files = [];
                });
                document.querySelector('#btnCrop').addEventListener('click', function() {
                    var img = cropper.getDataURL();
                    document.querySelector('.cropped').innerHTML = '<img class="img-responsive funny-boxes-img" src="' + img + '">';
                    document.querySelector('.cropped').innerHTML += '<input type="hidden" value="' + img + '" name="cropImg" >';
                });
                document.querySelector('#btnZoomIn').addEventListener('click', function() {
                    cropper.zoomIn();
                });
                document.querySelector('#btnZoomOut').addEventListener('click', function() {
                    cropper.zoomOut();
                });
            };

            //Crop Image Implementation for Crete album Cover
            createAlbum = function() {
                var options =
                        {
                            imageBox: '.imageBox1',
                            thumbBox: '.thumbBox1',
                            spinner: '.spinner1'
                                    //   imgSrc: 'avatar.png'
                        };
                var cropper = new cropbox(options);
                document.querySelector('#file1').addEventListener('change', function() {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        options.imgSrc = e.target.result;
                        cropper = new cropbox(options);
                    };
                    reader.readAsDataURL(this.files[0]);
                    this.files = [];
                });
                document.querySelector('#btnCrop1').addEventListener('click', function() {
                    var img = cropper.getDataURL();
                    document.querySelector('.cropped1').innerHTML = '<img src="' + img + '">';
                    document.querySelector('.cropped1').innerHTML += '<input type="hidden" value="' + img + '" name="coverImg" >';
                });
                document.querySelector('#btnZoomIn1').addEventListener('click', function() {
                    cropper.zoomIn();
                });
                document.querySelector('#btnZoomOut1').addEventListener('click', function() {
                    cropper.zoomOut();
                });
            };
            //DOB Picker
            jQuery(document).ready(function() {
                $('#start').datepicker({
                    dateFormat: 'dd.mm.yy',
                    prevText: '<i class="fa fa-angle-left"></i>',
                    nextText: '<i class="fa fa-angle-right"></i>'
                });
            });

            // Ajax album Name Inserter
            function albumName(str)
            {
                var xmlhttp;
                if (str == "")
                {
                }
                xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "InsertAlbumServlet?q=" + str, true);
                xmlhttp.send();
            }
            function messageClose()
            {
                var xmlhttp;
                xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "DeleteImageServlet", true);
                xmlhttp.send();
            }

        </script>
        <script>
            // Script for File Upload Progress Bar
            $(document).ready(function()
            {
                $("#Button1").click(function(evt)
                {
                    var xhr = new XMLHttpRequest();
                    var data = new FormData();
                    var files = $("#FileUpload1").get(0).files;
                    for (var i = 0; i < files.length; i++) {
                        data.append(files[i].name, files[i]);
                    }
                    xhr.upload.addEventListener("progress", function(evt) {
                        if (evt.lengthComputable) {
                            var progress = Math.round(evt.loaded * 100 / evt.total);
                            $("#progressbar").progressbar("value", progress);
                        }
                    }, false);
                    xhr.onreadystatechange = function()
                    {
                        if (xhr.readyState == 4 && xhr.status == 200)
                        {
                            $('#imageUpload').modal('hide');
                            //window.location.reload();
                            $('#message').modal('show');
                        }
                    };
                    xhr.open("POST", "InsertAlbumServlet");
                    xhr.send(data);
                    $("#progressbar").progressbar({
                        max: 100,
                        change: function(evt, ui) {
                            $("#progresslabel").text($("#progressbar").progressbar("value") + "%");
                        },
                        complete: function(evt, ui) {
                            $("#progresslabel").text("File uploaded Please Wait for Server Response....");
                        }
                    });
                    evt.preventDefault();
                });
            });
            // script for autoComplete Via Ajax
            $(document).ready(function() {
                $("#friendcomplete").autocomplete({
                    width: 300,
                    max: 10,
                    delay: 100,
                    minLength: 1,
                    autoFocus: true,
                    cacheLength: 1,
                    scroll: true,
                    highlight: false,
                    source: function(request, response) {
                        $.ajax({
                            url: "AjaxFriendList",
                            dataType: "json",
                            data: request,
                            success: function(data, textStatus, jqXHR) {
                                var items = data;
                                response(items);
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.log(textStatus);
                            }
                        });
                    }

                });
                $("#input").autocomplete({
                    width: 300,
                    max: 10,
                    delay: 100,
                    minLength: 1,
                    autoFocus: true,
                    cacheLength: 1,
                    scroll: true,
                    highlight: false,
                    source: function(request, response) {
                        $.ajax({
                            url: "AjaxAlbumList",
                            dataType: "json",
                            data: request,
                            success: function(data, textStatus, jqXHR) {
                                var items = data;
                                response(items);
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.log(textStatus);
                            }
                        });
                    }

                });
            });
        </script>
        <script type="text/javascript" src="custom.js"></script>


        <!--[if lt IE 9]>
            <script src="assets/plugins/respond.js"></script>
            <script src="assets/plugins/html5shiv.js"></script>
        <![endif]-->   

    </body>

</html>

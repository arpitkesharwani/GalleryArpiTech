<%-- 
    Document   : viewProject
    Created on : Feb 23, 2015, 1:23:04 PM
    Author     : Arpit Kesharwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<s:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/gallery" user="root" password="root"/>
<s:query var="qq" sql="select choice,imageName from userimagefeedback where userId='${sessionScope.user}' and albumName='${sessionScope.albumName}'"/>
<!DOCTYPE html>
<head>
    <title>${sessionScope.albumName} Gallery | ArpiTech</title>

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

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fancybox/source/jquery.fancybox.css">           

    <!-- CSS Customization -->
    <link rel="stylesheet" href="assets/css/custom.css">

</head> 
<body id="body" data-spy="scroll" data-target=".navbar-fixed-top" class="demo-lightbox-gallery" style="background: url(assets/img/1.png) repeat;">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#" >
                    <span style="text-transform: uppercase">${sessionScope.albumName}</span>
                    <!-- <img src="assets/img/logo1.png" alt="Logo"> -->
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <c:if test="${sessionScope.user eq null}">
                    <ul class="nav navbar-nav">
                        <li class="page-scroll home">
                            <a href="index.jsp">Home</a>
                        </li> 
                    </ul>
                </c:if>                        
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
                            <a href="" onclick="logout()"><i class="fa fa-unlink"></i>   LogOut</a>
                        </li>                                 
                    </ul>
                </div>
            </c:if>  
        </div>
        <!-- /.container -->
    </nav>    
    <div class="margin-bottom-60"></div>
    <!--=== Content Part ===-->
    <div class="container content">				
        <div class="gallery-page">
            <div class="row margin-bottom-10">
                <c:forEach var="e" items="${RecordList}">
                    <div class="col-md-3 col-sm-6">
                        <a class="thumbnail fancybox-button zoomer" data-rel="fancybox-button" title="${e.imagepath}" href="${e.imagepath}">
                            <span class="overlay-zoom">  
                                <img alt="" src="${e.thumbImage}" class="img-responsive" width="100%">
                                <span class="zoom-icon"></span>
                            </span>                                              
                        </a>
                        <c:set var="choice1" value=""/>    
                        <c:if test="${sessionScope.user ne null}">
                            <c:forEach var="ee" items="${qq.rows}">                           
                                <c:if test="${ee.imageName eq e.imagepath}">
                                    <c:set var="choice1" value="like"/>
                                    <c:if test="${ee.choice eq 'like'}">
                                        <i class=" icon-sm icon-bg-black fa fa-thumbs-up" style="color:green"></i> ${e.totalLike}&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="" onclick="choice('unlike', '${e.imagepath}')"> <i class=" icon-sm icon-bg-black fa fa-thumbs-down" style="color:black"></i></a>${e.totalUnlike}
                                        </c:if>
                                        <c:if test="${ee.choice eq 'unlike'}">
                                        <a href="" onclick="choice('like', '${e.imagepath}')"><i class=" icon-sm icon-bg-black fa fa-thumbs-up" style="color:black"></i> </a>${e.totalLike}&nbsp;&nbsp;&nbsp;&nbsp;
                                        <i class=" icon-sm icon-bg-black fa fa-thumbs-down" style="color:green"></i>${e.totalUnlike}
                                    </c:if>                                      
                                </c:if>  
                            </c:forEach>                                    
                            <c:if test="${choice1 ne 'like'}">
                                <a href="" onclick="choice('like', '${e.imagepath}')"><i class=" icon-sm icon-bg-black fa fa-thumbs-up" style="color:black"></i> </a>${e.totalLike}&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="" onclick="choice('unlike', '${e.imagepath}')"> <i class=" icon-sm icon-bg-black fa fa-thumbs-down" style="color:black"></i></a>${e.totalUnlike}
                            </c:if>&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="rounded-4x btn-u btn-u-xs btn-u-red" type="button" onclick="deletePhoto(${e.id})"><i class="fa fa-times-circle"></i> Delete</button>
                        </c:if> 
                        <c:if test="${sessionScope.user eq null}">
                            Total <i class=" icon-sm icon-bg-black fa fa-thumbs-up" style="color:black"></i> ${e.totalLike}&nbsp;&nbsp;&nbsp;&nbsp;
                            Total <i class=" icon-sm icon-bg-black fa fa-thumbs-down" style="color:black"></i></a>${e.totalUnlike}
                        </c:if>
                    </div>                   
                </c:forEach>
            </div>
        </div><!--/gallery-page-->
    </div><!--/container-->		
    <!--=== End Content Part ===-->
    <!--=== Pagination Code ===-->
    <%--For displaying Previous link except for the 1st page --%>
    <%--For displaying Page numbers.
    The when condition does not display a link for the current page--%>
    <div class="text-center">
        <ul class="pagination">
            <c:if test="${currentPage != 1}">
                <li><a href="PaginationServlet?page=${currentPage - 1}">«</a></li>
                <b class="tooltip tooltip-bottom-right">Previous</b>
            </c:if>
            <%--Iteration for obtain no. of Pages--%>
            <c:forEach begin="1" end="${noOfPages}" var="i">
                <c:choose>
                    <c:when test="${currentPage eq i}">
                        <li class="active"><a href="#">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                        <li><a href="PaginationServlet?page=${i}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${currentPage lt noOfPages}">
                <li><a href="PaginationServlet?page=${currentPage + 1}">»</a></li>
                <b class="tooltip tooltip-bottom-right">Next</b>
            </c:if>
        </ul>                                                            
    </div>

    <!-- JS Global Compulsory -->           

    <script type="text/javascript" src="assets/plugins/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery-migrate-1.2.1.min.js"></script>    
    <script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- JS Implementing Plugins -->           
    <script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
    <script type="text/javascript" src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
    <!-- JS Page Level -->           
    <script type="text/javascript" src="assets/js/app.js"></script>
    <script type="text/javascript">
                                jQuery(document).ready(function() {
                                    App.init();
                                    App.initFancybox();
                                });
    </script>
    <script>
        function choice(str, imageName)
        {
            var xmlhttp;
            if (str == "")
            {
            }
            if (window.XMLHttpRequest)
            {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else
            {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                }
            }
            xmlhttp.open("GET", "ImageFeedbackServlet?q=" + str + "&r=" + imageName, true);
            xmlhttp.send();
        }
        function deletePhoto(id)
        {
            var xmlhttp;
            if (id == "")
            {
            }
            if (window.XMLHttpRequest)
            {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else
            {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    window.location.reload();
                }
            }
            xmlhttp.open("GET", "DeleteImageServlet?q=" + id, true);
            xmlhttp.send();
        }
    </script>
    <script type="text/javascript" src="custom.js"></script>
</body>
<%-- 
    Document   : ErrorPage
    Created on : Feb 25, 2015, 12:12:16 PM
    Author     : Arpit Kesharwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">

    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="assets/css/page_404_error.css">

    <!-- CSS Theme -->    
    <link rel="stylesheet" href="assets/css/default.css" id="style_color">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="assets/css/custom.css">
        <title>ArpiTech's Error Page</title>
    </head>
    <body>
        <div class="container content">		
        <!--Error Block-->
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="error-v1">
                    <span class="error-v1-title">404</span>
                    <span>That’s an error!</span>
                    <p>${sessionScope.Error}</p>
                    <p>The requested URL was not found on this server. That’s all we know.</p>
                    <a class="btn-u btn-bordered" href="index.jsp">Back Home</a>
                </div>
            </div>
        </div>
        <!--End Error Block-->
    </div>	
    <!--=== End Content Part ===-->
    <!-- JS Global Compulsory -->           
<script type="text/javascript" src="assets/plugins/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
<!-- JS Implementing Plugins -->           
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
    });
</script>
    </body>
    
</html>

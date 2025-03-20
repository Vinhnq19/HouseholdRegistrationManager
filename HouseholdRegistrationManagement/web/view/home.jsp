<%-- 
    Document   : home
    Created on : 2 thg 3, 2025, 15:19:18
    Author     : Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    
<!-- Mirrored from htmlbeans.com/html/egovt/home.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Mar 2025 07:35:43 GMT -->
<head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- set the page title -->
        <title>Vienamese Public Services</title>
        <!-- inlcude google nunito sans font cdn link -->
        <link rel="preconnect" href="https://fonts.gstatic.com/" />
        <link
            href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,wght@0,300;0,400;0,600;0,700;1,300;1,400;1,600;1,700&amp;display=swap"
            rel="stylesheet"
        />
        <!-- inlcude google cabin font cdn link -->
        <link
            href="https://fonts.googleapis.com/css2?family=Cabin:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&amp;display=swap"
            rel="stylesheet"
        />
        <!-- include the site bootstrap stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <!-- include theme color setting stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css" />
        <!-- include the site responsive stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
        <!-- include the rtl version stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rtl.css" />
    </head>
    <body>
        <!-- pageWrapper -->
        <div id="pageWrapper" class="ltr">
            <!-- phStickyWrap -->
            <div class="phStickyWrap">
                <!-- pageHeader -->
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="./common/header.jsp"></jsp:include>
                </header>
                
            </div>
            <main>
                <!-- ibSlider -->
                <div class="introBlock ibSlider">
                    <jsp:include page="./common/ibSlider.jsp"></jsp:include>
                </div>
                <aside id="featuresAsideBlock" class="featuresAsideBlock position-relative text-white">
                    <jsp:include page="./common/featuresAsideBlock.jsp"></jsp:include>

                </aside>
                <section
                    class="meetCouncilBlock position-relative pt-7 pt-md-9 pt-lg-14 pt-xl-20 pb-6"
                >
                    <jsp:include page="./common/meetCouncilBlock.jsp"></jsp:include>
                    </section>
                    </main>
                    <!-- ftAreaWrap -->
                    <div class="ftAreaWrap position-relative bg-gDark fontAlter">
                    <jsp:include page="./common/ftAreaWrap.jsp"></jsp:include>
                    </div>
        </div>
        <!-- include jQuery library -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <!-- include custom JavaScript -->
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <!-- include plugins JavaScript -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- include fontAwesome -->
        <script src="../../../kit.fontawesome.com/391f644c42.js"></script>
    </body>

<!-- Mirrored from htmlbeans.com/html/egovt/home.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Mar 2025 07:36:10 GMT -->
</html>
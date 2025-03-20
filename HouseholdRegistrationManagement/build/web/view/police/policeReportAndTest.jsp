<%-- 
    Document   : home
    Created on : 2 thg 3, 2025, 15:19:18
    Author     : Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <!-- Mirrored from htmlbeans.com/html/egovt/home.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Mar 2025 07:35:43 GMT -->
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- set the page title -->
        <title>Đăng ký hộ khẩu - Vietnamese Public Services</title>
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
        <style>
            #pageWrapper {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

main {
    flex-grow: 1;
}

        </style>
    </head>
    <body>
        <!-- pageWrapper -->
        <div id="pageWrapper" class="ltr">
            <!-- phStickyWrap -->
            <div class="phStickyWrap">
                <!-- pageHeader -->
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../police/policeHeader.jsp"></jsp:include>   
                    </header>
                </div>
                <main>
                   <div class="container mt-4">
        <h2 class="text-center mb-4">Báo cáo & Thống kê</h2>
        
        <table class="table table-bordered">
            <thead class="table-primary">
                <tr>
                    <th>Loại báo cáo</th>
                    <th>Số lượng</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Cư dân thường trú</td>
                    <td>120</td>
                </tr>
                <tr>
                    <td>Cư dân tạm trú</td>
                    <td>45</td>
                </tr>
                <tr>
                    <td>Cư dân lưu trú</td>
                    <td>30</td>
                </tr>
                <tr>
                    <td>Chuyển hộ khẩu</td>
                    <td>15</td>
                </tr>
                <tr>
                    <td>Tách hộ khẩu</td>
                    <td>10</td>
                </tr>
            </tbody>
        </table>
        
        <div class="text-center">
            <a href="ExportServlet?format=pdf" class="btn btn-danger">Xuất PDF</a>
            <a href="ExportServlet?format=excel" class="btn btn-success">Xuất Excel</a>
        </div>
                   </div>
                </main>
                <!-- Footer -->
                <footer
                    id="pageFooter"
                    class="text-center bg-danger pt-6 pb-3 pt-md-8 pb-md-5"
                    >
                    <div class="container">
                        <p>
                        <jsp:include page="../citizen/ftAreaWrap.jsp"></jsp:include>
                    </p>
                </div>
                    </footer>
        </div>
            <!-- include jQuery library -->
            <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <!-- include custom JavaScript -->
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <!-- include plugins JavaScript -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- include fontAwesome -->
        <script src="../../../kit.fontawesome.com/391f644c42.js"></script>
        <!-- Thêm jQuery và jQuery UI -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


    </body>

    <!-- Mirrored from htmlbeans.com/html/egovt/home.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Mar 2025 07:36:10 GMT -->
</html>
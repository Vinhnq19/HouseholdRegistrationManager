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
        <title>Quản trị viên</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
                        <h2 class="text-center mb-4">Quản lý thông tin cư dân</h2>

                        <form action="ResidentServlet" method="GET" class="mb-3">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control" placeholder="Nhập mã định danh hoặc thông tin cá nhân">
                                <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                            </div>
                        </form>

                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Họ Tên</th>
                                    <th>Loại cư trú</th>
                                    <th>Địa chỉ</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Dữ liệu giả -->
                                <tr>
                                    <td>1</td>
                                    <td>Nguyễn Văn A</td>
                                    <td>Thường trú</td>
                                    <td>Hà Nội</td>
                                    <td>
                                        <button class="btn btn-warning btn-sm">Sửa</button>
                                        <button class="btn btn-danger btn-sm">Xóa</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Trần Thị B</td>
                                    <td>Tạm trú</td>
                                    <td>TP. Hồ Chí Minh</td>
                                    <td>
                                        <button class="btn btn-warning btn-sm">Sửa</button>
                                        <button class="btn btn-danger btn-sm">Xóa</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Phạm Văn C</td>
                                    <td>Lưu trú</td>
                                    <td>Đà Nẵng</td>
                                    <td>
                                        <button class="btn btn-warning btn-sm">Sửa</button>
                                        <button class="btn btn-danger btn-sm">Xóa</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <a href="addResident.jsp" class="btn btn-success">Thêm cư dân mới</a>
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
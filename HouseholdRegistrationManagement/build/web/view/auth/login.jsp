<%-- 
    Document   : login
    Created on : Mar 12, 2025, 10:26:55 PM
    Author     : athuu
--%>
<%-- 
    Document   : leaderHome
    Created on : Mar 12, 2025, 4:19:41 PM
    Author     : athuu
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vietnamese Public Services - Sign in/Sign up</title>
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
        <link rel="stylesheet" href="styles.css"> 
        <style>
                        .container {
        width: 80%;
        margin: auto;
        padding-top: 20px;
    }
    .button-container {
        display: flex;
        justify-content: center;
        gap: 20px;
    }
    .card {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        width: 250px;
        text-align: center;
    }
    .card h2 {
        font-size: 18px;
        margin-bottom: 10px;
    }
    .btn {
        display: block;
        padding: 10px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
        font-weight: bold;
        color: white;
    }
    .btn-approve {
        background-color: red;
    }
    .btn-manage {
        background-color: green;
    }
    .btn-report {
        background-color: orange;
    }
    .bg-container {
        background-image: url(${pageContext.request.contextPath}/img/trongdong.jpg);
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        height: 100vh; /* Chiều cao full màn hình */
    }
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
        <div id="pageWrapper" class="ltr">
            <!-- Header -->
            <div class="phStickyWrap">
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../auth/authHeader.jsp"></jsp:include>   
                    </header>
                </div>
                <main>
                    <section class="login_section py-8 py-md-15 py-xl-22 fontAlter">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-12 col-md-6 col-xl-4">
                                    <!-- Tabs -->
                                    <ul class="nav nav-tabs tabset justify-content-center mb-4" id="authTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link tablink active" id="login-tab" data-toggle="tab" href="#login" role="tab"><h3>Đăng nhập</h1></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link tablink" id="register-tab" data-toggle="tab" href="#register" role="tab"><h3>Đăng ký</h3></a>
                                        </li>
                                    </ul>

                                    <div class="tab-content">
    <!-- Tab Đăng nhập -->
    <div class="tab-pane fade show active" id="login" role="tabpanel">
        <c:if test="${not empty requestScope.message}">
            <div class="alert alert-success">${requestScope.message}</div>
        </c:if>
        <c:if test="${not empty requestScope.error}">
            <div class="alert alert-danger">${requestScope.error}</div>
        </c:if>
        <form action="${pageContext.request.contextPath}/auth" method="post">
            <input type="hidden" name="action" value="login">
            <div class="form-group">
                <label for="loginEmail">Email <span class="text-danger">*</span></label>
                <input type="email" id="loginEmail" name="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="loginPass">Mật khẩu <span class="text-danger">*</span></label>
                <input type="password" id="loginPass" name="password" class="form-control" required>
            </div>
            <div class="form-check mb-5 p-0">
                <span class="customCheckboxLabel">
                    <input class="form-check-input fakeInput" type="checkbox" id="save-password" name="remember">
                    <label class="form-check-label cuFakeLabel" for="save-password">Ghi nhớ tôi</label>
                </span>
                <a href="auth?action=forgotPassword" class="float-right text-body txtLink">Quên mật khẩu?</a>
            </div>
            <button type="submit" class="btn btnTheme fwMedium w-100 d-block text-capitalize position-relative border-0 p-0" data-hover="Đăng nhập">
                <span class="d-block btnText">Đăng nhập</span>
            </button>
        </form>
                                    </div>
                                    <!-- Tab Đăng ký -->
                                    <div class="tab-pane fade" id="register" role="tabpanel">
                                        <c:if test="${not empty requestScope.message}">
                                            <div class="alert alert-success">${requestScope.message}</div>
                                        </c:if>
                                        <c:if test="${not empty requestScope.error}">
                                            <div class="alert alert-danger">${requestScope.error}</div>
                                        </c:if>
                                        <form action="${pageContext.request.contextPath}/auth" method="post">
                                            <input type="hidden" name="action" value="register">
                                            <div class="form-group">
                                                <label for="fullName">Họ và tên <span class="text-danger">*</span></label>
                                                <input type="text" id="fullName" name="fullName" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="registerEmail">Email <span class="text-danger">*</span></label>
                                                <input type="email" id="registerEmail" name="email" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="registerPass">Mật khẩu <span class="text-danger">*</span></label>
                                                <input type="password" id="registerPass" name="password" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="address">Địa chỉ <span class="text-danger">*</span></label>
                                                <input type="text" id="address" name="address" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="role">Vai trò</label>
                                                <select name="role" id="role" class="form-control">
                                                    <option name="role" value="Citizen">Công dân</option>
                                                    <option name="role" value="AreaLeader">Tổ trưởng khu phố</option>
                                                    <option name="role" value="Police">Công an</option>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btnTheme fwMedium w-100 d-block text-capitalize position-relative border-0 p-0" data-hover="Đăng ký">
                                                <span class="d-block btnText">Đăng ký</span>
                                            </button>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
                <!-- Meet Council -->
                <section class="meetCouncilBlock position-relative pt-7 pt-md-9 pt-lg-14 pt-xl-20 pb-6">
                    <jsp:include page="../common/meetCouncilBlock.jsp"></jsp:include>
                    </section>
                </main>       
                <!-- Footer -->
                <footer
                    id="pageFooter"
                    class="text-center bg-danger pt-6 pb-3 pt-md-8 pb-md-5"
                    >
                    <div class="container">
                        <p>
                        <jsp:include page="../common/ftAreaWrap.jsp"></jsp:include>
                        </p>
                    </div>
                </footer>
                    </div>
    </body>
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="https://kit.fontawesome.com/391f644c42.js"></script>
</html>

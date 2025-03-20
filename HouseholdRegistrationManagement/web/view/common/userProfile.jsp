<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <!-- Metadata -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Vietnamese Public Services - Thông tin cá nhân</title>

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com/" />
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin:wght@400;500;600;700&display=swap" rel="stylesheet" />

        <!-- Stylesheets -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rtl.css" />
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
                    <jsp:include page="../citizen/citizenHeader.jsp"></jsp:include>   
                </header>
            </div>

            <!-- Main Content -->
            <main>
               <div class="container mt-5">
        <h2 class="text-center">👤 Thông tin cá nhân</h2>

        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/profile" method="post">
            <div class="mb-3">
                <label class="form-label">Họ và tên</label>
                <input type="text" class="form-control" name="fullName" value="${user.fullName}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" value="${user.email}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Địa chỉ</label>
                <input type="text" class="form-control" name="address" value="${user.address}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Chức vụ</label>
                <input type="text" class="form-control" name="role" 
                       value="<c:choose>
                           <c:when test='${user.role == "Citizen"}'>Công dân</c:when>
                           <c:when test='${user.role == "Admin"}'>Quản trị viên</c:when>
                           <c:when test='${user.role == "AreaLeader"}'>Cán bộ khu vực</c:when>
                           <c:when test='${user.role == "Police"}'>Công an</c:when>
                           <c:otherwise>Không xác định</c:otherwise>
                       </c:choose>" readonly>
            </div>
            <button type="submit" class="btn btn-primary">Cập nhật</button>
               </form>
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

        <!-- Scripts -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="https://kit.fontawesome.com/391f644c42.js"></script>
    </body>
</html>
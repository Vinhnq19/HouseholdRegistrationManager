<%-- 
    Document   : register
    Created on : Mar 12, 2025, 10:27:02 PM
    Author     : athuu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vietnamese Public Services - Register</title>
        <link rel="preconnect" href="https://fonts.gstatic.com/" />
        <link
            href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700&amp;display=swap"
            rel="stylesheet"
        />
        <link
            href="https://fonts.googleapis.com/css2?family=Cabin:wght@400;500;600;700&amp;display=swap"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rtl.css" />
        <link rel="stylesheet" href="styles.css"> 
    </head>
    <body>
    <div class="container">
        <h2 class="text-center mt-4">Đăng ký</h2>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
            <form action="${pageContext.request.contextPath}/auth" method="post">
                <input type="hidden" name="action" value="register">
                <div class="mb-3">
                    <label class="form-label">Họ và Tên</label>
                    <input type="text" name="fullName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Mật khẩu</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Địa chỉ</label>
                    <input type="text" name="address" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Vai trò</label>
                    <select name="role" class="form-control">
                        <option value="Citizen">Công dân</option>
                        <option value="AreaLeader">Tổ trưởng khu phố</option>
                        <option value="Police">Công an</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success">Đăng ký</button>
                <a href="${pageContext.request.contextPath}/view/auth/login.jsp" class="btn btn-link">Đã có tài khoản? Đăng nhập</a>
            </form>
    </div>
    </body>
</html>

<%@ page import="java.sql.*" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Lấy ID từ URL
    int userId = Integer.parseInt(request.getParameter("id"));
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserById(userId);

    if (user == null) {
        out.println("<h3>Không tìm thấy người dùng!</h3>");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Chỉnh sửa người dùng</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />

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
                display: inline-block;
                width: 100%;
                text-align: center;
                margin: 20px;
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
                    <jsp:include page="../admin/adminHeader.jsp"></jsp:include>   
                    </header>
                </div>

                <div class="container mt-5">
                    <h2>Chỉnh sửa thông tin người dùng</h2>
                    <form action="updateUser.jsp" method="post">
                        <input type="hidden" name="userId" value="<%= user.getUserId() %>">

                    <div class="mb-3">
                        <label for="fullName" class="form-label">Họ và tên:</label>
                        <input type="text" class="form-control" name="fullName" value="<%= user.getFullName() %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" name="email" value="<%= user.getEmail() %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="role" class="form-label">Vai trò:</label>
                        <select class="form-control" name="role">
                            <option value="Admin" <%= user.getRole().equals("Admin") ? "selected" : "" %>>Admin</option>
                            <option value="User" <%= user.getRole().equals("User") ? "selected" : "" %>>User</option>
                            <option value="Citizen" <%= user.getRole().equals("Citizen") ? "selected" : "" %>>Citizen</option>
                            <option value="Police" <%= user.getRole().equals("Police") ? "selected" : "" %>>Police</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Địa chỉ:</label>
                        <input type="text" class="form-control" name="address" value="<%= user.getAddress() %>">
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-success flex-grow-1">Cập nhật</button>
                        <a href="manageUsers.jsp" class="btn btn-secondary flex-grow-1 text-center">Hủy</a>
                    </div>
                </form>

            </div>

            <footer
                id="pageFooter"
                class="text-center bg-danger pt-6 pb-3 pt-md-8 pb-md-5"
                >
                <div class="container">
                    <p>
                        <jsp:include page="../admin/ftAreaWrap.jsp"></jsp:include>
                    </p>
                </div>
            </footer>
    </body>
</html>

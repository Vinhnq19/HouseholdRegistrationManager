<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String searchQuery = request.getParameter("searchQuery") != null ? request.getParameter("searchQuery") : "";
String roleFilter = request.getParameter("roleFilter") != null ? request.getParameter("roleFilter") : "";
UserDAO userDAO = new UserDAO();
List<User> userList = (!searchQuery.isEmpty() || !roleFilter.isEmpty()) ?
                     userDAO.searchUsersByNameAndRole(searchQuery, roleFilter) : userDAO.getAllUsers();
%>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Quản lý người dùng</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <style>
            body {
                font-family: 'Nunito Sans', sans-serif;
                background-color: #f8f9fa;
            }
            .table-container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                overflow-x: auto;
            }
            .search-wrapper input,
            .search-wrapper select,
            .search-wrapper button {
                height: 45px;
                font-size: 16px;
                padding: 5px 15px;
                border-radius: 8px;
                border: 1px solid #ccc;
            }
            .search-wrapper button {
                background-color: #162a52;
                color: white;
                border: none;
                transition: all 0.3s ease;
            }
            .search-wrapper button:hover {
                background-color: #0d1b3c;
            }
            .table-bordered {
    width: 100%;
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
                    <jsp:include page="../admin/adminHeader.jsp"></jsp:include>   
                    </header>

                    <div class="container mt-4">
                        <h2 class="text-center">Quản lý người dùng</h2>
                        <form id="filterForm" action="manageUsers.jsp" method="GET" class="row g-3 justify-content-center">
                            <div class="col-md-5">
                                <input type="text" name="searchQuery" class="form-control" placeholder="Tìm kiếm theo tên..." value="<%= searchQuery %>">
                        </div>
                        <div class="col-md-3">
                            <select name="roleFilter" class="form-select">
                                <option value="">Tất cả vai trò</option>
                                <option value="Citizen" <%= "Citizen".equals(roleFilter) ? "selected" : "" %>>Citizen</option>
                                <option value="Police" <%= "Police".equals(roleFilter) ? "selected" : "" %>>Police</option>
                                <option value="AreaLeader" <%= "AreaLeader".equals(roleFilter) ? "selected" : "" %>>Area Leader</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-primary w-100">Lọc</button>
                        </div>
                    </form>

                    <div class="table-container mt-4">
                        <table class="table-bordered">
                            <thead class="table-dark text-center">
                                <tr>
                                    <th>ID</th>
                                    <th>Tên</th>
                                    <th>Email</th>
                                    <th>Vai trò</th>
                                    <th>Địa chỉ</th>
                                    <th>Chức năng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (User user : userList) { %>
                                <tr>
                                    <td><%= user.getUserId() %></td>
                                    <td><%= user.getFullName() %></td>
                                    <td><%= user.getEmail() %></td>
                                    <td><%= user.getRole() %></td>
                                    <td><%= user.getAddress() %></td>
                                    <td class="text-center">
                                        <a href="editUser.jsp?id=<%= user.getUserId() %>" class="btn btn-warning btn-sm">Sửa</a>
                                        <a href="deleteUser.jsp?id=<%= user.getUserId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

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

                </body>
                </html>

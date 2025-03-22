<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>

<%
    String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=HouseholdRegistrationManagement;user=sa;password=123";
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection conn = DriverManager.getConnection(dbURL);
    Statement stmt = conn.createStatement();

    // Lấy dữ liệu từ database
    request.setAttribute("totalUsers", stmt.executeQuery("SELECT COUNT(*) FROM Users").next() ? stmt.getResultSet().getInt(1) : 0);
    request.setAttribute("approvedRequests", stmt.executeQuery("SELECT COUNT(*) FROM Registrations WHERE status='approved'").next() ? stmt.getResultSet().getInt(1) : 0);
    request.setAttribute("pendingRequests", stmt.executeQuery("SELECT COUNT(*) FROM Registrations WHERE status='pending'").next() ? stmt.getResultSet().getInt(1) : 0);
    
    ResultSet rs = stmt.executeQuery("SELECT LOWER(role) AS role, COUNT(*) AS count FROM Users GROUP BY LOWER(role)");
    int citizenCount = 0, leaderCount = 0, policeCount = 0;
    while (rs.next()) {
        String role = rs.getString("role");
        int count = rs.getInt("count");
        if (role.equals("citizen")) citizenCount = count;
        if (role.equals("arealeader")) leaderCount = count;
        if (role.equals("police")) policeCount = count;
    }
    request.setAttribute("citizenCount", citizenCount);
    request.setAttribute("leaderCount", leaderCount);
    request.setAttribute("policeCount", policeCount);
    
    stmt.close();
    conn.close();
%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <!-- Metadata -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Vietnamese Public Services - Quản trị viên</title>

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

        <!-- pageWrapper -->
        <div id="pageWrapper" class="ltr">
            <!-- phStickyWrap -->
            <div class="phStickyWrap">
                <!-- pageHeader -->
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../admin/adminHeader.jsp"></jsp:include>   
                    </header>
                    
                    <main>
                        <div class="container mt-4">
                            <h2 class="text-center mb-4">Admin Dashboard</h2>
                            <table class="table table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Chỉ số</th>
                                        <th>Giá trị</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Tổng số người dùng</td>
                                        <td>${totalUsers}</td>
                                </tr>
                                <tr>
                                    <td>Số đơn đã duyệt</td>
                                    <td>${approvedRequests}</td>
                                </tr>
                                <tr>
                                    <td>Số đơn chưa duyệt</td>
                                    <td>${pendingRequests}</td>
                                </tr>
                                <tr>
                                    <td>Số người dùng theo vai trò</td>
                                    <td>
                                        <ul>
                                            <li>Citizen: ${citizenCount}</li>
                                            <li>Area Leader: ${leaderCount}</li>
                                            <li>Police: ${policeCount}</li>
                                        </ul>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </main>
                                        
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

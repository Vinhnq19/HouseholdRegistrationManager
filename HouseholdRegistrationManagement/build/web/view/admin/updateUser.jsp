<%@ page import="dao.UserDAO" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String userIdParam = request.getParameter("userId");
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String role = request.getParameter("role");
    String address = request.getParameter("address");

    // Debug - Ki?m tra d? li?u nh?n ???c t? form
    out.println("UserID: " + userIdParam + "<br>");
    out.println("Full Name: " + fullName + "<br>");
    out.println("Email: " + email + "<br>");
    out.println("Role: " + role + "<br>");
    out.println("Address: " + address + "<br>");

    // Ki?m tra n?u userId b? null ho?c không h?p l?
    if (userIdParam == null || userIdParam.isEmpty()) {
        out.println("<h3>L?i: Không có userId</h3>");
        return;
    }

    int userId = Integer.parseInt(userIdParam);
    UserDAO userDAO = new UserDAO();
    boolean isUpdated = userDAO.updateUser(userId, fullName, email, role, address);

    if (isUpdated) {
        response.sendRedirect("manageUsers.jsp?msg=C?p nh?t thành công!");
    } else {
        out.println("<h3>C?p nh?t th?t b?i!</h3>");
    }
%>

<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int userId = Integer.parseInt(request.getParameter("id"));
    UserDAO userDAO = new UserDAO();
    boolean isDeleted = userDAO.deleteUser(userId);

    if (isDeleted) {
        response.sendRedirect("manageUsers.jsp?msg=Xóa thành công!");
    } else {
        out.println("<h3>Xóa thất bại!</h3>");
    }
%>

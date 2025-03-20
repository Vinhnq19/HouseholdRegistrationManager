<%-- 
    Document   : index.jsp
    Created on : 22 thg 2, 2025, 22:27:44
    Author     : Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% response.sendRedirect(request.getContextPath() + "/auth"); %>
    </body>
</html>

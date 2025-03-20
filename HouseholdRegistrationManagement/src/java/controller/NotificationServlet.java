package controller;

import dao.NotificationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet; // Thêm annotation
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Notification;

public class NotificationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        NotificationDAO notificationDAO = new NotificationDAO();
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Notification> notifications = new ArrayList<>();
        notifications  = notificationDAO.getNotificationsByUser(userId);
        request.setAttribute("notifications", notifications);
        request.getRequestDispatcher("/view/citizen/citizenNotifications.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        NotificationDAO notificationDAO = new NotificationDAO();
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        if ("markAll".equals(action)) {
            notificationDAO.markAllAsRead(userId);
        } else {
            int notificationId = Integer.parseInt(request.getParameter("notificationId"));
            notificationDAO.markAsRead(notificationId);
        }

        // Gọi lại logic của doGet để hiển thị trang notifications sau khi xử lý
        List<Notification> notifications = notificationDAO.getNotificationsByUser(userId);
        request.setAttribute("notifications", notifications);
        request.getRequestDispatcher("/view/citizen/citizenNotifications.jsp").forward(request, response);
    }
}
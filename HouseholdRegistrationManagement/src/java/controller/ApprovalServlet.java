/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.RegistrationDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import model.Registration;
import java.sql.SQLException;
import model.User;


/**
 *
 * @author Vinh
 */
public class ApprovalServlet extends HttpServlet {
    RegistrationDAO registrationDAO = new RegistrationDAO();
    UserDAO userDAO = new UserDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        List<User> userList = userDAO.getAllUsers();
        // Map để ánh xạ userId → fullName
        Map<Integer, String> userMap = new HashMap<>();
        for (User user : userList) {
            userMap.put(user.getUserId(), user.getFullName());
        }
        List<Registration> householdRegistrations = registrationDAO.getPendingHouseholdRegistrations();
        List<Registration> separationRegistrations = registrationDAO.getPendingSeparationRegistrations();

        // Nhận giá trị filter từ URL
        String filter = request.getParameter("filter");
        if (filter == null) {
            filter = "household"; // Mặc định hiển thị đăng ký hộ khẩu
        }
 
        request.setAttribute("fullname", userMap);
        request.setAttribute("householdRegistrations", householdRegistrations);
        request.setAttribute("separationRegistrations", separationRegistrations);
        request.setAttribute("filter", filter);

        request.getRequestDispatcher("/view/leader/profileApproval.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        int registrationId = Integer.parseInt(request.getParameter("registrationId"));
        String action = request.getParameter("action");
        String status = action.equals("approve") ? "Approved" : "Rejected";
        
    boolean updated = registrationDAO.updateRegistrationStatus(registrationId, status, userId);

    if (updated) {
        request.setAttribute("message", "✅ Đã " + (action.equals("approve") ? "duyệt" : "từ chối") + " hồ sơ!");
    } else {
        request.setAttribute("error", "❌ Không thể cập nhật trạng thái hồ sơ.");
    }

    request.getRequestDispatcher("/view/leader/profileApproval.jsp").forward(request, response);
}
    

    private void sendNotification(int registrationId, String message) {
        // Gửi thông báo đến người dân (có thể dùng Email hoặc Notification Table)
        System.out.println("Thông báo gửi đến đơn " + registrationId + ": " + message);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}


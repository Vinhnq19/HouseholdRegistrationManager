package controller;

import dao.UserDAO;
import model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import utils.EmailUtil;

public class AuthServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        //Xu ly dang xuat
        if ("logout".equals(action)) {
            HttpSession session = request.getSession();
            session.invalidate();
            request.getRequestDispatcher("auth").forward(request, response);
            return;
        } else {
            request.getRequestDispatcher("/view/auth/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        //dang ky hoac dang nhap
        switch (action) {
            case "login":
                handleLogin(request, response);
                break;
            case "register":
                handleRegister(request, response);
                break;
            case "forgotPassword":
                handleForgotPassword(request, response);
                break;
            case "verifyCode":
                handleVerifyCode(request, response);
                break;
            case "resetPassword":
                handleResetPassword(request, response);
                break;
            default:
                response.sendRedirect("auth");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        //Cookie luu mật khẩu
        Cookie emailCookie = new Cookie("userEmail", email);
        if(request.getParameter("remember") != null) {
            emailCookie.setMaxAge(7 * 24 * 60 * 80); //7 ngày
        }else {
            emailCookie.setMaxAge(0); // Xóa cookie nếu không chọn
        }
        response.addCookie(emailCookie);

        UserDAO userDao = new UserDAO();
        User user = userDao.authenticate(email, password);
        
        //Dang nhap, nhap thong tin 
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getFullName());
            session.setAttribute("role", user.getRole());
            //Chuyển đến trang chủ của từng chức năng
            String role = request.getParameter("role");
            if("AreaLeader".equals(user.getRole())) {
                response.sendRedirect("view/leader/leaderHome.jsp");
            } else if("Police".equals(user.getRole())) {
                response.sendRedirect("view/police/policeHome.jsp");
            } else if("Admin".equals(user.getRole())) {
                response.sendRedirect("view/admin/adminHome.jsp");
            } 
            else {
                response.sendRedirect("view/citizen/citizenHome.jsp");
            }
        } else {
            request.setAttribute("error", "❌ Email hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String role = request.getParameter("role");
        
        if(role == null || role.isEmpty()) {
            role = "Citizen"; //Mặc định là công dân nếu không có role
        }

        UserDAO userDao = new UserDAO();
        boolean success = userDao.register(new User(fullName, email, password, role, address));

        if (success) {
            request.setAttribute("message", "✅ Đăng ký thành công! Vui lòng đăng nhập.");
            request.getRequestDispatcher("/view/auth/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "❌ Email đã tồn tại. Vui lòng thử lại.");
            request.getRequestDispatcher("/view/auth/register.jsp").forward(request, response);
        }
    }

    private void handleResetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("resetEmail");
        String newPassword = request.getParameter("newPassword");

        if (UserDAO.updatePassword(email, newPassword)) {
            request.getRequestDispatcher("auth").forward(request, response);
        } else {
            request.setAttribute("error", "Không thể đặt lại mật khẩu!");
            request.getRequestDispatcher("view/auth/resetPassword.jsp").forward(request, response);
        }
    }

    private void handleForgotPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String email = request.getParameter("email");
        //mã xác thực
        String code = String.valueOf(new Random().nextInt(900000) + 10000);
        HttpSession session = request.getSession();
        session.setAttribute("resetCode", code);
        session.setAttribute("resetEmail", email);

        EmailUtil.sendEmail(email, "Mã xác nhận", "Mã của bạn là: " + code);
        request.getRequestDispatcher("view/auth/verifyCode.jsp").forward(request, response);
    }

    private void handleVerifyCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String inputCode = request.getParameter("code");
        String sessionCode = (String) request.getSession().getAttribute("resetCode");

        if (inputCode.equals(sessionCode)) {
            request.getRequestDispatcher("view/auth/resetPassword.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Mã xác nhận không đúng!");
            request.getRequestDispatcher("view/auth/verifyCode.jsp").forward(request, response);
        }
    }
}

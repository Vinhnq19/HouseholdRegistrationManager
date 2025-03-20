
package controller;

import com.sun.jdi.connect.spi.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import dao.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import model.Registration;

/**
 *
 * @author Vinh
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class RegistrationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        try {
            String action = request.getParameter("action");
            if ("householdRegistration".equals(action)) {
                handleHouseholdRegistration(request, response, session);
            } else if ("separatingRegistration".equals(action)) {
                handleSeparatingRegistration(request, response, session);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "❌ Lỗi hệ thống: " + e.getMessage());
            request.setAttribute("success", false);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void handleHouseholdRegistration(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException, SQLException {
        // Kiểm tra userId
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/view/auth/login.jsp");
            return;
        }

        // Lấy dữ liệu từ form
        String registrationType = request.getParameter("registrationType");
        String address = request.getParameter("address");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        // Xử lý file upload
        Part filePart = request.getPart("document");
        String filename = (filePart != null && filePart.getSubmittedFileName() != null)
                ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString() // Lấy tên file gốc
                : "";

        String documentPath = null;
        if (!filename.isEmpty()) {
            String uploadDir = "uploads"; // Thư mục lưu trữ trong ứng dụng web
            String uploadPath = getServletContext().getRealPath("/") + uploadDir;
            Files.createDirectories(Paths.get(uploadPath)); // Tạo thư mục nếu chưa có

            // Lưu file vào thư mục uploads
            File file = new File(uploadPath, filename);
            filePart.write(file.getAbsolutePath());

            // Lưu đường dẫn tương đối vào DB để dễ truy xuất từ web
            documentPath = uploadDir + "/" + filename;
        }

        // Tạo đối tượng Registration
        Registration r = new Registration();
        r.setUserId(userId);
        r.setRegistrationType(registrationType);
        r.setAddress(address);
        r.setStartDate(startDate);
        r.setEndDate(endDate);
        r.setStatus("Pending");
        r.setDocumentPath(documentPath);

        // Gọi insertRegistration()
        boolean success = RegistrationDAO.insertRegistration(r);

        if (success) {
            session.setAttribute("registration", r);
            request.setAttribute("message", "✅ Đăng ký thành công! Vui lòng chờ xét duyệt.");
            request.setAttribute("success", true);
        } else {
            request.setAttribute("message", "❌ Đăng ký thất bại, vui lòng thử lại.");
            request.setAttribute("success", false);
        }
        // Chuyển hướng lại trang đăng ký để hiển thị thông báo
        request.getRequestDispatcher("/view/citizen/HouseholdRegistration.jsp").forward(request, response);
    }

    private void handleSeparatingRegistration(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws IOException, ServletException, SQLException {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/view/auth/login.jsp");
            return;
        }
        RegistrationDAO dao = new RegistrationDAO();

        // Lấy địa chỉ hộ khẩu hiện tại
        String currentAddress = dao.getCurrentAddress(userId);

        if (currentAddress == null) {
            request.setAttribute("message", "❌ Không tìm thấy địa chỉ hiện tại. Bạn chưa đăng ký hộ khẩu.");
            request.setAttribute("requestSaved", false);
            request.getRequestDispatcher("/view/citizen/separatingRegistration.jsp").forward(request, response);
            return;
        }

        // Lưu địa chỉ cũ vào session để hiển thị
        session.setAttribute("currentAddress", currentAddress);

        // Lấy địa chỉ mới từ form
        String newAddress = request.getParameter("newAddress");

        // Xử lý file upload
        Part filePart = request.getPart("document");
        String filename = (filePart != null && filePart.getSubmittedFileName() != null)
                ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString() // Lấy tên file gốc
                : "";

        String documentPath = null;
        if (!filename.isEmpty()) {
            String uploadDir = "uploads"; // Thư mục lưu trữ trong ứng dụng web
            String uploadPath = getServletContext().getRealPath("/") + uploadDir;
            Files.createDirectories(Paths.get(uploadPath)); // Tạo thư mục nếu chưa có

            // Lưu file vào thư mục uploads
            File file = new File(uploadPath, filename);
            filePart.write(file.getAbsolutePath());

            // Lưu đường dẫn tương đối vào DB để dễ truy xuất từ web
            documentPath = uploadDir + "/" + filename;
        }

        // Tạo đối tượng Registration mới
        Registration newRegistration = new Registration();
        newRegistration.setUserId(userId);
        newRegistration.setRegistrationType("HouseholdSeparation");
        newRegistration.setAddress(newAddress);
        newRegistration.setStartDate(java.time.LocalDate.now().toString());
        newRegistration.setStatus("Pending"); // Trạng thái chờ duyệt
        newRegistration.setDocumentPath(documentPath);
        newRegistration.setComments(currentAddress);

        // Lưu yêu cầu tách hộ khẩu vào DB
        boolean requestSaved = dao.insertRegistration(newRegistration);

        if (requestSaved) {
            request.setAttribute("message", "✅ Đơn tách hộ khẩu đã được gửi! Trạng thái: Chờ duyệt.");
            request.setAttribute("requestSaved", true);
            request.setAttribute("newAddress", newAddress);
            request.setAttribute("createdDate", java.time.LocalDate.now());
            request.setAttribute("documentPath", documentPath);
        } else {
            request.setAttribute("message", "❌ Gửi yêu cầu thất bại. Vui lòng thử lại.");
            request.setAttribute("requestSaved", false);
        }

        request.getRequestDispatcher("/view/citizen/separatingRegistration.jsp").forward(request, response);
    }

}

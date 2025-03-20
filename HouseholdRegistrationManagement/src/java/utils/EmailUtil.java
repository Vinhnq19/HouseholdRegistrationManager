/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.util.*;
import jakarta.mail.*;
import jakarta.mail.internet.*;

/**
 *
 * @author Vinh
 */
public class EmailUtil {

    public static void sendEmail(String to, String subject, String content) {
    // Địa chỉ email và mật khẩu của người gửi
    final String username = "your-email@gmail.com"; // Thay thế bằng địa chỉ email của bạn
    final String password = "your-password"; // Thay thế bằng mật khẩu của bạn

    // Cấu hình các thuộc tính để kết nối đến máy chủ SMTP của Gmail
    Properties props = new Properties();
    props.put("mail.smtp.auth", "true"); // Bật chế độ xác thực
    props.put("mail.smtp.starttls.enable", "true"); // Bật chế độ mã hóa TLS
    props.put("mail.smtp.host", "smtp.gmail.com"); // Máy chủ SMTP của Gmail
    props.put("mail.smtp.port", "587"); // Cổng kết nối SMTP của Gmail

    // Tạo một phiên làm việc (session) với máy chủ SMTP
    Session session = Session.getInstance(props, new Authenticator() {
        // Phương thức này trả về thông tin xác thực (email và mật khẩu)
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });

    try {
        // Tạo một đối tượng Message để đại diện cho email
        Message message = new MimeMessage(session);
        // Đặt địa chỉ email người gửi
        message.setFrom(new InternetAddress(username));
        // Đặt địa chỉ email người nhận
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        // Đặt tiêu đề của email
        message.setSubject(subject);
        // Đặt nội dung của email
        message.setText(content);

        // Gửi email
        Transport.send(message);
    } catch (MessagingException e) {
        // Xử lý ngoại lệ nếu có lỗi xảy ra trong quá trình gửi email
        e.printStackTrace();
    }
}
    
}

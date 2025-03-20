/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.Notification;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
/**
 *
 * @author Vinh
 */
public class NotificationDAO{
    public boolean sendNotification(int userId, String registrationType, boolean approved) {
    if (userId <= 0) {
        System.out.println("❌ Lỗi: userId không hợp lệ: " + userId);
        return false;
    }

    DBContext db = DBContext.getInstance();
    String statusMessage = approved ? "đã được duyệt" : "bị từ chối";
// Chuyển loại đăng ký sang tiếng Việt
    String translatedType = translateRegistrationType(registrationType);
    String message = "📢 Đơn đăng ký " + translatedType + " của bạn " + statusMessage + ".";

    String sql = "INSERT INTO Notifications (UserID, Message, SentDate, IsRead) VALUES (?, ?, GETDATE(), 0)";
    
    try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
        statement.setInt(1, userId);
        statement.setString(2, message);
        
        int rowsInserted = statement.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("✅ Thông báo đã gửi thành công: " + message);
            return true;
        } else {
            System.out.println("⚠️ Không thể gửi thông báo.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("❌ Lỗi khi gửi thông báo.");
    }
    return false;
}
    public List<Notification> getNotificationsByUser(int userId) {
        List<Notification> notifications = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = "SELECT * FROM Notifications WHERE UserID = ? ORDER BY SentDate DESC";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Notification notification = new Notification();
                notification.setNotificationId(rs.getInt("NotificationID"));
                notification.setUserId(rs.getInt("UserID"));
                notification.setMessage(rs.getString("Message"));
                notification.setSentDate(rs.getString("SentDate"));
                notification.setRead(rs.getBoolean("IsRead"));
                notifications.add(notification);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

    public boolean markAsRead(int notificationId) {
        DBContext db = DBContext.getInstance();
        String sql = "UPDATE Notifications SET IsRead = 1 WHERE NotificationID = ?";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, notificationId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean markAllAsRead(int userId) {
        DBContext db = DBContext.getInstance();
        String sql = "UPDATE Notifications SET IsRead = 1 WHERE UserID = ? AND IsRead = 0";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, userId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void main(String[] args) {
        NotificationDAO notificationDAO = new NotificationDAO();
        List<Notification> list = notificationDAO.getNotificationsByUser(23);
        System.out.println(list);

    // Trường hợp 1: Gửi thông báo duyệt thành công
    boolean test1 = notificationDAO.sendNotification(11, "Thường trú", true);
    System.out.println("🎯 Test 1 (Duyệt đơn) → " + (test1 ? "Thành công" : "Thất bại"));
    }

    private String translateRegistrationType(String registrationType) {
        Map<String, String> typeMap = new HashMap<>();
    typeMap.put("Permanent", "Thường trú");
    typeMap.put("Temporary", "Tạm trú");
    typeMap.put("TemporaryStay", "Lưu trú");
    typeMap.put("HouseholdSeparation", "Tách hộ khẩu");

    return typeMap.getOrDefault(registrationType, "Không xác định");
    }

}

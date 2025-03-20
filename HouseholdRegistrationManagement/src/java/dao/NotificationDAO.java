/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.Notification;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author Vinh
 */
public class NotificationDAO{
    public boolean insertNotification(int userId, String message) throws SQLException {
        DBContext db = DBContext.getInstance();
        String sql = "INSERT INTO Notifications (UserID, Message,SentDate, isRead) VALUES (?, ?, GETDATE(),0)";
        try(PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.setString(2, message);
            return statement.executeUpdate() > 0;
        }catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    

}

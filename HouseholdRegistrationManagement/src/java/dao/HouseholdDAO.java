/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import model.Household;

/**
 *
 * @author Vinh
 */
public class HouseholdDAO{

    public int createNewHousehold(Integer userId, String newAddress) {
        //Kết nối db
        DBContext db = DBContext.getInstance();
        //Câu lệnh sql
        String sql = "INSERT INTO Households (HeadOfHouseholdID, Address) VALUES (?, ?)";
        //set data(try..)
         try (PreparedStatement statement = db.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, userId);
            statement.setString(2, newAddress);
            int affectedRows = statement.executeUpdate();
            if (affectedRows > 0) {
                ResultSet rs = statement.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // Trả về HouseholdID mới
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
         return -1; // Trả về false nếu có lỗi
    }

    public boolean removeFromOldHousehold(Integer userId) {
        DBContext db = DBContext.getInstance();
        String sql = "DELETE FROM HouseholdMembers WHERE UserID = ?";

        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, userId);
            return statement.executeUpdate() > 0; // Trả về true nếu xóa thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
}

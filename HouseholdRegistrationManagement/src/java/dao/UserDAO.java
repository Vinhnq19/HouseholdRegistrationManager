package dao;

import model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private static final DBContext db = DBContext.getInstance();

    // Kiểm tra thông tin đăng nhập
    public User authenticate(String email, String password) {
        String sql = "SELECT * FROM Users WHERE Email = ? AND Password = ?";
        try (PreparedStatement stmt = db.getConnection().prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Role"),
                        rs.getString("Address")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Đăng ký tài khoản mới
    public boolean register(User user) {
        if (checkEmailExists(user.getEmail())) {
            return false;
        }

        String sql = "INSERT INTO Users (FullName, Email, Password, Role, Address) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = db.getConnection().prepareStatement(sql)) {
            stmt.setString(1, user.getFullName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getRole());
            stmt.setString(5, user.getAddress());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Kiểm tra email đã tồn tại chưa
    public boolean checkEmailExists(String email) {
        String sql = "SELECT Email FROM Users WHERE Email = ?";
        try (PreparedStatement stmt = db.getConnection().prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy thông tin người dùng theo email
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM Users WHERE Email = ?";
        try (PreparedStatement stmt = db.getConnection().prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Role"),
                        rs.getString("Address")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Cập nhật mật khẩu
    public static boolean updatePassword(String email, String newPassword) {
        String sql = "UPDATE Users SET Password = ? WHERE Email = ?";
        try (PreparedStatement stmt = db.getConnection().prepareStatement(sql)) {
            stmt.setString(1, newPassword);
            stmt.setString(2, email);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //show tất cả người dùng    
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = "SELECT * FROM Users";
        try (PreparedStatement stmt = db.getConnection().prepareStatement(sql);) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getString("Role"),
                        rs.getString("Address")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    // Lấy thông tin user theo ID
    public User getUserById(int userId) {
        User user = null;
        try (Connection conn = db.getConnection()) {
            String sql = "SELECT * FROM Users WHERE UserID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User(
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Role"),
                        rs.getString("Address")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // Cập nhật thông tin user
    public boolean updateUser(int userId, String fullName, String email, String role, String address) {
        try (Connection conn = db.getConnection()) {
            String sql = "UPDATE Users SET FullName = ?, Email = ?, Role = ?, Address = ? WHERE UserID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullName);
            stmt.setString(2, email);
            stmt.setString(3, role);
            stmt.setString(4, address);
            stmt.setInt(5, userId);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa user
    public boolean deleteUser(int userId) {
        try (Connection conn = db.getConnection()) {
            String sql = "DELETE FROM Users WHERE UserID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //tìm theo tên
    public List<User> searchUsersByName(String name) {
        List<User> users = new ArrayList<>();
        try (Connection conn = db.getConnection()) {
            String sql = "SELECT * FROM Users WHERE FullName LIKE ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + name + "%"); // Tìm kiếm gần đúng
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                users.add(new User(
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Role"),
                        rs.getString("Address")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public List<User> searchUsersByNameAndRole(String name, String role) {
        List<User> users = new ArrayList<>();
        try (Connection conn = db.getConnection()) {
            String sql = "SELECT * FROM users WHERE 1=1";

            if (!name.isEmpty()) {
                sql += " AND fullName LIKE ?";
            }
            if (!role.isEmpty()) {
                sql += " AND role = ?";
            }

            PreparedStatement stmt = conn.prepareStatement(sql);
            int paramIndex = 1;

            if (!name.isEmpty()) {
                stmt.setString(paramIndex++, "%" + name + "%");
            }
            if (!role.isEmpty()) {
                stmt.setString(paramIndex++, role);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("email"),
                        rs.getString("role"),
                        rs.getString("address")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        List<User> users = userDAO.getAllUsers();

        for (User user : users) {
            System.out.println("User: " + user.getFullName() + ", Email: " + user.getEmail());
        }
    }
}

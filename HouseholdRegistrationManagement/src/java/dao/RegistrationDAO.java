/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import model.Registration;

/**
 *
 * @author Vinh
 */
public class RegistrationDAO{

    public static boolean insertRegistration(Registration registration) {
        DBContext db = DBContext.getInstance();
        String sql = "INSERT INTO Registrations (UserID, RegistrationType, Address, StartDate, EndDate, Status, Comments, DocumentPath) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, registration.getUserId());
            statement.setString(2, registration.getRegistrationType());
            statement.setString(3, registration.getAddress());
            statement.setString(4, registration.getStartDate());
            statement.setString(5, registration.getEndDate());
            statement.setString(6, registration.getStatus());
            statement.setString(7, registration.getComments());
            statement.setString(8, registration.getDocumentPath());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

//
//    public static boolean insertHouseholdSeparation(Integer userId, String newAddress) {
//        DBContext db = DBContext.getInstance();
//        String sql = "INSERT INTO Registrations (UserID, RegistrationType, Address, StartDate, Status, DocumentPath) VALUES (?, ?, ?, NOW(), ?, ?)";
//
//        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
//            statement.setInt(1, userId);
//            statement.setString(2, "Household Separation");
//            statement.setString(3, newAddress);
//            statement.setString(4, "Pending"); // Trạng thái chờ duyệt
//
//            return statement.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
    public static String getCurrentAddress(int userId) {
        DBContext db = DBContext.getInstance();
        String sql = "SELECT TOP 1 Address FROM Registrations WHERE UserID = ? AND Status = 'Pending' ORDER BY StartDate DESC";

        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getString("Address");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không có dữ liệu
    }
    
    public List<Registration> getStatus(int userId) {
        List<Registration> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = """
                     SELECT RegistrationID, RegistrationType, Address, StartDate, EndDate, Status, DocumentPath
                     FROM Registrations
                     WHERE UserID = ? 
                     AND RegistrationType IN ('Permanent', 'Temporary', 'TemporaryStay')
                     ORDER BY StartDate DESC;""";
        try{
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Registration r = new Registration();
                r.setRegistrationId(rs.getInt("RegistrationID"));
                r.setRegistrationType(rs.getString("RegistrationType"));
                r.setAddress(rs.getString("Address"));
                r.setStartDate(rs.getString("StartDate"));
                r.setEndDate(rs.getString("EndDate"));
                r.setStatus(rs.getString("Status"));
                r.setDocumentPath(rs.getString("DocumentPath"));
                list.add(r);
            }
            
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Registration> getSeparationStatus(int userId) {
        List<Registration> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = """
                 SELECT RegistrationID, Address, Comments, Status, DocumentPath
                 FROM Registrations
                 WHERE UserID = ? AND RegistrationType = 'HouseholdSeparation'
                 ORDER BY StartDate DESC;
                 """;
        try {
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Registration r = new Registration();
                r.setRegistrationId(rs.getInt("RegistrationID"));
                r.setAddress(rs.getString("Address")); // Địa chỉ mới
                r.setComments(rs.getString("Comments")); // Địa chỉ cũ
                r.setStatus(rs.getString("Status"));
                r.setDocumentPath(rs.getString("DocumentPath"));
                list.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Registration> getPendingRegistration(){
        List<Registration> pendingRegistrations = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = "SELECT * FROM Registrations WHERE status = 'Pending'";
    try {
        PreparedStatement statement = db.getConnection().prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            Registration r = new Registration();
            r.setRegistrationId(rs.getInt("RegistrationID"));
            r.setUserId(rs.getInt("UserID"));
            r.setRegistrationType(rs.getString("RegistrationType"));
            r.setAddress(rs.getString("Address"));
            r.setStartDate(rs.getString("StartDate"));
            r.setEndDate(rs.getString("EndDate"));
            r.setStatus(rs.getString("Status"));
            r.setDocumentPath(rs.getString("DocumentPath"));
            pendingRegistrations.add(r);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return pendingRegistrations;
    }
    public List<Registration> getPendingHouseholdRegistrations() {
        List<Registration> pendingRegistrations = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = "SELECT * FROM Registrations WHERE status = 'Pending' and RegistrationType IN ('Permanent', 'Temporary', 'TemporaryStay')";
        try{
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
            Registration r = new Registration();
            r.setRegistrationId(rs.getInt("RegistrationID"));
            r.setUserId(rs.getInt("UserID"));
            r.setRegistrationType(rs.getString("RegistrationType"));
            r.setAddress(rs.getString("Address"));
            r.setStartDate(rs.getString("StartDate"));
            r.setEndDate(rs.getString("EndDate"));
            r.setStatus(rs.getString("Status"));
            r.setDocumentPath(rs.getString("DocumentPath"));
            pendingRegistrations.add(r);
        }
        }catch(SQLException e) {
            e.printStackTrace();
        }
        return pendingRegistrations;
    }

    public List<Registration> getPendingSeparationRegistrations() {
        List<Registration> pendingRegistrations = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = "SELECT * FROM Registrations WHERE status = 'Pending' "
                + "AND registrationType = 'HouseholdSeparation'";
        try{
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
            Registration r = new Registration();
            r.setRegistrationId(rs.getInt("RegistrationID"));
            r.setUserId(rs.getInt("UserID"));
            r.setRegistrationType(rs.getString("RegistrationType"));
            r.setAddress(rs.getString("Address"));
            r.setStartDate(rs.getString("StartDate"));
            r.setEndDate(rs.getString("EndDate"));
            r.setStatus(rs.getString("Status"));
            r.setComments(rs.getString("Comments"));
            r.setDocumentPath(rs.getString("DocumentPath"));
            pendingRegistrations.add(r);
        }
        }catch(SQLException e) {
            e.printStackTrace();
        }
        return pendingRegistrations;
    }
    
    //Thay đổi trạng thái hồ sơ
    public boolean updateRegistrationStatus(int registrationId, String status, int approvedBy){
        DBContext db = DBContext.getInstance();
        String sql = "UPDATE Registrations SET Status = ?, ApprovedBy = ? WHERE RegistrationID = ?";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {

            statement.setString(1, status);
            statement.setInt(2, approvedBy);
            statement.setInt(3, registrationId);
            int rowsUpdated = statement.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void main(String[] args) {
        RegistrationDAO dao = new RegistrationDAO();

        // Test lấy danh sách hồ sơ chờ duyệt (Hộ khẩu)
        System.out.println("🔹 Testing getPendingHouseholdRegistrations...");
        List<Registration> householdRegistrations = dao.getPendingHouseholdRegistrations();
        if (householdRegistrations.isEmpty()) {
            System.out.println("❌ Không có đơn đăng ký hộ khẩu nào đang chờ duyệt.");
        } else {
            for (Registration r : householdRegistrations) {
                System.out.println("✅ Hộ khẩu chờ duyệt: " + r.getRegistrationId() + " - " + r.getAddress() + "-" + r.getDocumentPath());
            }
        }

        // Test lấy danh sách hồ sơ chờ duyệt (Tách hộ khẩu)
        System.out.println("\n🔹 Testing getPendingSeparationRegistrations...");
        List<Registration> separationRegistrations = dao.getPendingSeparationRegistrations();
        if (separationRegistrations.isEmpty()) {
            System.out.println("❌ Không có đơn tách hộ khẩu nào đang chờ duyệt.");
        } else {
            for (Registration r : separationRegistrations) {
                System.out.println("✅ Tách hộ khẩu chờ duyệt: " + r.getRegistrationId() + " - " + r.getAddress());
            }
        }

        // Test cập nhật trạng thái hồ sơ
        if (!householdRegistrations.isEmpty()) {
            int testRegistrationId = householdRegistrations.get(0).getRegistrationId();
            System.out.println("\n🔹 Testing updateRegistrationStatus...");
            boolean updateSuccess = dao.updateRegistrationStatus(testRegistrationId, "Approved", 1);
            if (updateSuccess) {
                System.out.println("✅ Đã cập nhật trạng thái hồ sơ ID " + testRegistrationId + " thành 'Approved'.");
            } else {
                System.out.println("❌ Không thể cập nhật trạng thái.");
            }
        }
        
    }


}

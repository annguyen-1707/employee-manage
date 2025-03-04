/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author -Asus-
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Application;

public class ApplicationDAO extends DBContext {

    public List<Application> getAll() {
        List<Application> list = new ArrayList<>();
        String sql = "SELECT * FROM Application";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Application app = new Application(
                        rs.getInt("application_id"),
                        rs.getString("title"),
                        rs.getDate("start_date"),
                        rs.getDate("end_date"),
                        rs.getString("reason"),
                        rs.getString("status"),
                        rs.getInt("created_by"),
                        rs.getInt("processed_by"),
                        rs.getString("note")
                );
                list.add(app);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Application getById(int id) {
        String sql = "SELECT * FROM Application WHERE application_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Application(
                        rs.getInt("application_id"),
                        rs.getString("title"),
                        rs.getDate("start_date"),
                        rs.getDate("end_date"),
                        rs.getString("reason"),
                        rs.getString("status"),
                        rs.getInt("created_by"),
                        rs.getInt("processed_by"),
                        rs.getString("note")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(Application app) {
        String sql = "INSERT INTO Application (application_id, title, start_date, end_date, reason, status, created_by, processed_by, note) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, app.getApplicationId());
            st.setString(2, app.getTitle());
            st.setDate(3, app.getStartDate());
            st.setDate(4, app.getEndDate());
            st.setString(5, app.getReason());
            st.setString(6, app.getStatus());
            st.setInt(7, app.getCreatedBy());
            st.setInt(8, app.getProcessedBy());
            st.setString(9, app.getNote());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Application app) {
        String sql = "UPDATE Application SET title = ?, start_date = ?, end_date = ?, reason = ?, status = ?, " +
                     "created_by = ?, processed_by = ?, note = ? WHERE application_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, app.getTitle());
            st.setDate(2, app.getStartDate());
            st.setDate(3, app.getEndDate());
            st.setString(4, app.getReason());
            st.setString(5, app.getStatus());
            st.setInt(6, app.getCreatedBy());
            st.setInt(7, app.getProcessedBy());
            st.setString(8, app.getNote());
            st.setInt(9, app.getApplicationId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM Application WHERE application_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        ApplicationDAO dao = new ApplicationDAO();
        List<Application> list = dao.getAll();
        for (Application app : list) {
            System.out.println(app);
        }

        // Test getById
        Application a = dao.getById(1);
        if (a != null) {
            System.out.println("Found application: " + a);
        } else {
            System.out.println("Application not found.");
        }
    }
}

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
import model.EmployeeRole;

public class EmployeeRoleDAO extends DBContext {

    // Lấy danh sách tất cả Employee_Role
    public List<EmployeeRole> getAll() {
        List<EmployeeRole> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee_Role";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                EmployeeRole er = new EmployeeRole(
                        rs.getInt("role_id"),
                        rs.getInt("employee_id")
                );
                list.add(er);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy danh sách vai trò theo employee_id
    public List<Integer> getRolesByEmployeeId(int employeeId) {
        List<Integer> roles = new ArrayList<>();
        String sql = "SELECT role_id FROM Employee_Role WHERE employee_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, employeeId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                roles.add(rs.getInt("role_id"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return roles;
    }

    // Thêm mới 1 dòng Employee_Role
    public void insert(EmployeeRole er) {
        String sql = "INSERT INTO Employee_Role (role_id, employee_id) VALUES (?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, er.getRoleId());
            st.setInt(2, er.getEmployeeId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Xóa 1 dòng theo role_id và employee_id
//    public void delete(int roleId, int employeeId) {
//        String sql = "DELETE FROM Employee_Role WHERE role_id = ? AND employee_id = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, roleId);
//            st.setInt(2, employeeId);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }

    // Xóa tất cả vai trò của 1 nhân viên
    public void deleteByEmployeeId(int employeeId) {
        String sql = "DELETE FROM Employee_Role WHERE employee_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, employeeId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Test DAO
    public static void main(String[] args) {
        EmployeeRoleDAO dao = new EmployeeRoleDAO();

        // Thêm mới
        dao.insert(new EmployeeRole(1, 1));
        dao.insert(new EmployeeRole(2, 1));

        // Lấy tất cả
        List<EmployeeRole> list = dao.getAll();
        for (EmployeeRole er : list) {
            System.out.println(er);
        }

        // Lấy role theo employee_id
        System.out.println("Roles for employee 1: " + dao.getRolesByEmployeeId(1));

        // Xóa 1 dòng
//        dao.delete(2, 1);

        // Xóa toàn bộ vai trò của employee 1
        dao.deleteByEmployeeId(1);
    }
}


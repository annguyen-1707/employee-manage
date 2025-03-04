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
import model.Role;

public class RoleDAO extends DBContext {

    public List<Role> getAll() {
        List<Role> list = new ArrayList<>();
        String sql = "SELECT * FROM Role";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role role = new Role(rs.getInt("role_id"),
                        rs.getString("name"));
                list.add(role);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Role getRoleById(int roleId) {
        String sql = "SELECT * FROM Role WHERE role_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Role(rs.getInt("role_id"),
                        rs.getString("name"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(Role role) {
        String sql = "INSERT INTO Role (role_id, name) VALUES (?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, role.getRoleId());
            st.setString(2, role.getName());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    public void delete(int roleId) {
//        String sql = "DELETE FROM Role WHERE role_id=?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, roleId);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }

    public void update(Role role) {
        String sql = "UPDATE Role SET name=? WHERE role_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, role.getName());
            st.setInt(2, role.getRoleId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        RoleDAO dao = new RoleDAO();

        // Thêm mới một Role
        dao.insert(new Role(1, "Admin"));
        dao.insert(new Role(2, "User"));

        // Lấy tất cả roles
        List<Role> roles = dao.getAll();
        for (Role role : roles) {
            System.out.println(role);
        }

        // Lấy role theo ID
        Role role = dao.getRoleById(1);
        System.out.println("Role ID 1: " + role);

        // Update role
        dao.update(new Role(1, "Super Admin"));

        // Xóa role
        // In danh sách sau khi thay đổi
        roles = dao.getAll();
        for (Role r : roles) {
            System.out.println(r);
        }
    }
}

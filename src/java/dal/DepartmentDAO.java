/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Department;

public class DepartmentDAO extends DBContext {

    // Lấy toàn bộ danh sách Department
    public List<Department> getAll() {
        List<Department> list = new ArrayList<>();
        String sql = "SELECT * FROM Department";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Department d = new Department(rs.getInt("department_id"),
                                              rs.getString("name"));
                list.add(d);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy Department theo ID
    public Department getDepartmentById(int departmentId) {
        String sql = "SELECT * FROM Department WHERE department_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, departmentId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Department(rs.getInt("department_id"),
                                      rs.getString("name"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Thêm mới Department
    public void insert(Department d) {
        String sql = "INSERT INTO Department (department_id, name) VALUES (?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, d.getDepartmentId());
            st.setString(2, d.getName());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Xóa Department theo ID
//    public void delete(int departmentId) {
//        String sql = "DELETE FROM Department WHERE department_id=?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, departmentId);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }

    // Cập nhật Department
    public void update(Department d) {
        String sql = "UPDATE Department SET name=? WHERE department_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getName());
            st.setInt(2, d.getDepartmentId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Main để kiểm thử các hàm
    public static void main(String[] args) {
        DepartmentDAO dao = new DepartmentDAO();

        // Thêm dữ liệu mẫu
        dao.insert(new Department(1, "IT"));
        dao.insert(new Department(2, "HR"));

        // Lấy và in ra danh sách department
        List<Department> departments = dao.getAll();
        for (Department d : departments) {
            System.out.println(d);
        }

        // Lấy thông tin department theo id
        Department d = dao.getDepartmentById(1);
        System.out.println("Department with ID 1: " + d);

        // Cập nhật tên department
        dao.update(new Department(1, "Information Technology"));

        // Xóa department có id = 2

        // In ra danh sách sau khi cập nhật
        departments = dao.getAll();
        for (Department dep : departments) {
            System.out.println(dep);
        }
    }
}



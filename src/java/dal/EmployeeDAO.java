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
import model.Employee;
import model.EmployeeRole;

public class EmployeeDAO extends DBContext {

    public Employee check(String email, String password) {
        String sql = "SELECT * FROM Employee WHERE email = ? AND password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee e = new Employee(
                        rs.getInt("employee_id"),
                        rs.getString("name"),
                        rs.getString("gender").equals("Male"),
                        rs.getInt("phone_number"),
                        rs.getString("address"),
                        rs.getInt("department_id"),
                        rs.getInt("manager_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getDate("start_workDate")
                );
                return e;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Employee> getAll() {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee(
                        rs.getInt("employee_id"),
                        rs.getString("name"),
                        rs.getString("gender").equals("Male"),
                        rs.getInt("phone_number"),
                        rs.getString("address"),
                        rs.getInt("department_id"),
                        rs.getInt("manager_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getDate("start_workDate")
                );
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Employee getByEmployeeId(int employeeId) {
        String sql = "SELECT * FROM Employee where employee_id = " + employeeId;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee e = new Employee(
                        rs.getInt("employee_id"),
                        rs.getString("name"),
                        rs.getString("gender").equals("Male"),
                        rs.getInt("phone_number"),
                        rs.getString("address"),
                        rs.getInt("department_id"),
                        rs.getInt("manager_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getDate("start_workDate")
                );
                return e;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Employee checkOnlyEmail(String email) {
        String sql = "SELECT * FROM Employee WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee e = new Employee(
                        rs.getInt("employee_id"),
                        rs.getString("name"),
                        rs.getString("gender").equals("Male"),
                        rs.getInt("phone_number"),
                        rs.getString("address"),
                        rs.getInt("department_id"),
                        rs.getInt("manager_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getDate("start_workDate")
                );
                return e;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void signEmployee(Employee e) {
        String sql = "INSERT INTO Employee (employee_id, name, gender, phone_number, address, department_id, manager_id, email, password, start_workDate) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, e.getEmployeeId());
            st.setString(2, e.getName());
            st.setString(3, e.isGender() ? "Male" : "Female");
            st.setInt(4, e.getPhoneNumber());
            st.setString(5, e.getAddress());
            st.setInt(6, e.getDepartmentId());
            st.setInt(7, e.getManagerId());
            st.setString(8, e.getEmail());
            st.setString(9, e.getPassword());
            st.setDate(10, e.getStartWorkDate());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void changePassword(String email, String newPass) {
        String sql = "UPDATE Employee SET password = ? WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating password: " + e.getMessage());
        }
    }

    public void updateInformation(String email, String name, String gender, String phone, String address, Integer departmentId, Integer managerId) {
        StringBuilder sql = new StringBuilder("UPDATE Employee SET ");
        boolean first = true;

        if (name != null && !name.isEmpty()) {
            if (!first) {
                sql.append(", ");
            }
            sql.append("name = ?");
            first = false;
        }
        if (gender != null && !gender.isEmpty()) {
            if (!first) {
                sql.append(", ");
            }
            sql.append("gender = ?");
            first = false;
        }
        if (phone != null && !phone.isEmpty()) {
            if (!first) {
                sql.append(", ");
            }
            sql.append("phone_number = ?");
            first = false;
        }
        if (address != null && !address.isEmpty()) {
            if (!first) {
                sql.append(", ");
            }
            sql.append("address = ?");
            first = false;
        }
        if (departmentId != null) {
            if (!first) {
                sql.append(", ");
            }
            sql.append("department_id = ?");
            first = false;
        }
        if (managerId != null) {
            if (!first) {
                sql.append(", ");
            }
            sql.append("manager_id = ?");
            first = false;
        }

        sql.append(" WHERE email = ?");

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());
            int index = 1;

            if (name != null && !name.isEmpty()) {
                st.setString(index++, name);
            }
            if (gender != null) {
                if ("true".equalsIgnoreCase(gender)) {
                    gender = "Male";
                } else if ("false".equalsIgnoreCase(gender)) {
                    gender = "Female";
                }
            }
            if (phone != null && !phone.isEmpty()) {
                st.setString(index++, phone);
            }
            if (address != null && !address.isEmpty()) {
                st.setString(index++, address);
            }
            if (departmentId != null) {
                st.setInt(index++, departmentId);
            }
            if (managerId != null) {
                st.setInt(index++, managerId);
            }

            st.setString(index, email); // cuối cùng là email để xác định dòng cập nhật
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteEmployee(String username) {
        String sql = "DELETE FROM [dbo].[Admin] WHERE [username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi khi xoá nhân viên: " + e.getMessage());
        }
    }

    public List<Employee> getEmloyeesForDivisionLeader(Employee employee) {
        List<Employee> list = new ArrayList<>();
        String sql = "                     SELECT * FROM Employee WHERE employee_id IN                           "
                + "                                               (SELECT e.employee_id \n"
                + "                                                FROM Employee e\n"
                + "                                                FULL JOIN Employee_Role er \n"
                + "                                                ON e.employee_id = er.employee_id\n"
                + "                                                WHERE e.department_id = ?\n"
                + "                                                GROUP BY e.employee_id, e.name\n"
                + "                                                HAVING MIN(er.role_id) > ?  \n"
                + ")";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, employee.getDepartmentId());
            st.setInt(2, employee.getRoleId());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee(
                        rs.getInt("employee_id"),
                        rs.getString("name"),
                        rs.getString("gender").equals("Male"),
                        rs.getInt("phone_number"),
                        rs.getString("address"),
                        rs.getInt("department_id"),
                        rs.getInt("manager_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getDate("start_workDate")
                );
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        EmployeeDAO aO = new EmployeeDAO();
        List<Employee> employees = aO.getEmloyeesForDivisionLeader(aO.getByEmployeeId(2));
        for (Employee employee : employees) {
            System.out.println(employee);
        }
    }

}

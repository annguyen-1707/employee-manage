/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ApplicationDAO;
import dal.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import model.Employee;
import java.util.List;
import java.util.HashMap;
import java.util.Calendar;
import java.util.ArrayList;

/**
 *
 * @author -Asus-
 */
@WebServlet(name = "ViewAgendaServlet", urlPatterns = {"/viewAgenda"})
public class ViewAgendaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewAgendaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewAgendaServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ApplicationDAO applicationDAO = new ApplicationDAO();
        HashMap<Integer, List<Date>> absentDates = applicationDAO.absentDates();
        request.setAttribute("absentDates", absentDates);
        request.getRequestDispatcher("viewAgenda.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");

        HttpSession session = request.getSession();
        Employee acount = (Employee) request.getSession().getAttribute("employee");

        ApplicationDAO applicationDAO = new ApplicationDAO();
        HashMap<Integer, List<Date>> absentDates = applicationDAO.absentDates();

        EmployeeDAO edao = new EmployeeDAO();

        HashMap<String, List<Boolean>> statusWorks = new HashMap<>();
        List<Date> dates = new ArrayList<>();

        try {
            Date from = Date.valueOf(from_raw);
            Date to = Date.valueOf(to_raw);

            Calendar cal = Calendar.getInstance();
            cal.setTime(from);  // Bắt đầu từ 'from'

            while (!cal.getTime().after(to)) {  // Duyệt tới khi quá 'to'
                java.util.Date utilDate = cal.getTime();
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                dates.add(sqlDate);
                cal.add(Calendar.DATE, 1);  // Tăng 1 ngày
            }

            List<Employee> employees;
            if (acount.getRoleId() == 1) {
                employees = edao.getAll();
            } else {
                employees = edao.getEmloyeesForDivisionLeader(acount);
            }

            for (Employee employee : employees) {
                Date startWorkDate = employee.getStartWorkDate();
                List<Boolean> statusWork = new ArrayList<>();
                for (int i = 0; i < dates.size(); i++) {
                    Date date = dates.get(i);
                    List<Date> absentDate = absentDates.get(employee.getEmployeeId());
                    if (absentDate != null) {
                        if (absentDate.contains(date) || date.before(startWorkDate)) {
                            statusWork.add(false);
                        } else {
                            statusWork.add(true);

                        }
                    } else {
                        if (date.before(startWorkDate)) {
                            statusWork.add(false);
                        } else {
                            statusWork.add(true);
                        }
                    }
                }
                statusWorks.put(employee.getName(), statusWork);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("dates", dates);
        request.setAttribute("statusWorks", statusWorks);
        request.setAttribute("absentDates", absentDates);
        request.getRequestDispatcher("viewAgenda.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

//try {
//            Date from = Date.valueOf(from_raw);
//            Date to = Date.valueOf(to_raw);
//


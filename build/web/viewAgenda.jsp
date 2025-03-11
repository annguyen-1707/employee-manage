<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>View Agenda - Employee Management System</title>
                <link rel="stylesheet" href="styles.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
                <style>
                    .agenda-container {
                        background-color: white;
                        border-radius: 10px;
                        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                        padding: 2rem;
                        margin-top: 2rem;
                    }

                    .agenda-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 2rem;
                    }

                    .week-selector {
                        display: flex;
                        align-items: center;
                        gap: 1rem;
                    }

                    .week-selector button {
                        background: none;
                        border: none;
                        font-size: 1.5rem;
                        color: #3498db;
                        cursor: pointer;
                        padding: 0.5rem;
                    }

                    .week-selector button:hover {
                        color: #2980b9;
                    }

                    .current-week {
                        font-size: 1.2rem;
                        font-weight: 500;
                        color: #2f3640;
                    }

                    .agenda-table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 1rem;
                    }

                    .agenda-table th,
                    .agenda-table td {
                        padding: 0.75rem;
                        text-align: center;
                        border: 1px solid #dcdde1;
                        min-width: 100px;
                    }

                    .agenda-table th:first-child,
                    .agenda-table td:first-child {
                        text-align: left;
                        min-width: 150px;
                    }

                    .status-working {
                        background-color: #55efc4 !important;
                    }

                    .status-leave {
                        background-color: #fab1a0 !important;
                    }

                    .employee-name {
                        font-weight: 500;
                        color: #2f3640;
                        padding: 0.5rem;
                        border-radius: 4px;
                    }

                    .department-filter {
                        padding: 0.5rem;
                        border: 1px solid #dcdde1;
                        border-radius: 5px;
                        margin-right: 1rem;
                    }

                    .legend {
                        display: flex;
                        gap: 2rem;
                        margin-top: 1rem;
                        padding: 1rem;
                        background-color: #f8f9fa;
                        border-radius: 5px;
                    }

                    .legend-item {
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .legend-color {
                        width: 20px;
                        height: 20px;
                        border-radius: 4px;
                    }

                    .legend-working {
                        background-color: #55efc4;
                    }

                    .legend-leave {
                        background-color: #fab1a0;
                    }

                    .date {
                        display: block;
                        font-size: 0.8rem;
                        color: #7f8c8d;
                        font-weight: normal;
                        margin-top: 0.25rem;
                    }

                    .weekend {
                        background-color: #f8f9fa;
                    }

                    .date-range {
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        margin: 0 1rem;
                    }

                    .date-input {
                        padding: 0.5rem;
                        border: 1px solid #dcdde1;
                        border-radius: 4px;
                        font-size: 0.9rem;
                    }

                    .btn-primary {
                        background-color: #3498db;
                        color: white;
                        border: none;
                        padding: 0.5rem 1rem;
                        border-radius: 4px;
                        cursor: pointer;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .btn-primary:hover {
                        background-color: #2980b9;
                    }

                    @media (max-width: 768px) {
                        .agenda-header {
                            flex-direction: column;
                            gap: 1rem;
                        }

                        .agenda-table {
                            font-size: 0.9rem;
                        }

                        .agenda-table th,
                        .agenda-table td {
                            padding: 0.5rem;
                        }

                        .legend {
                            flex-direction: column;
                            gap: 0.5rem;
                        }
                    }

                    .mt-4 {
                        margin-top: 2rem;
                    }

                    .badge {
                        background-color: #fab1a0;
                        color: #2d3436;
                        padding: 0.25rem 0.5rem;
                        border-radius: 4px;
                        margin: 0.25rem;
                        display: inline-block;
                        font-size: 0.85rem;
                    }
                </style>
            </head>

            <body>
                <!-- Include Navigation Bar -->
                <jsp:include page="header.jsp" />

                <div class="main-content">
                    <div class="container">
                        <div class="agenda-container">
                            <div class="agenda-header">
                                <h2>Department Agenda</h2>
                                <form action="viewAgenda" method="POST" class="week-selector">
                                    <!-- <select id="departmentFilter" name="department" class="department-filter">
                                <option value="all">All Departments</option>
                                <option value="IT">IT</option>
                                <option value="HR">HR</option>
                                <option value="Finance">Finance</option>
                                <option value="Marketing">Marketing</option>
                            </select> -->
                                    <div class="date-range">
                                        <input type="date" id="startDate" name="from" class="date-input">
                                        <span>to</span>
                                        <input type="date" id="endDate" name="to" class="date-input">
                                    </div>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-search"></i> View
                                    </button>
                                </form>
                            </div>

                            <div class="table-responsive">
                                <table class="agenda-table">
                                    <thead>
                                        <tr>
                                            <th>Employee</th>
                                            <c:forEach var="date" items="${dates}">
                                                <th>
                                                    <fmt:formatDate value="${date}" pattern="EEE" />
                                                    <span class="date">
                                                        <fmt:formatDate value="${date}" pattern="dd/MM/yyyy" />
                                                    </span>
                                                </th>
                                            </c:forEach>
                                        </tr>
                                    </thead>
                                    <tbody id="agendaTableBody">
                                        <c:forEach var="statusWorks" items="${statusWorks}">
                                            <tr>
                                                <td>
                                                    <span class="employee-name">${statusWorks.key}</span>
                                                </td>
                                                <c:forEach var="value" items="${statusWorks.value}">
                                                    <td class="${value ? 'status-working' : 'status-leave'}"></td>
                                                </c:forEach>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <div class="legend">
                                <div class="legend-item">
                                    <div class="legend-color legend-working"></div>
                                    <span>Working</span>
                                </div>
                                <div class="legend-item">
                                    <div class="legend-color legend-leave"></div>
                                    <span>On Leave</span>
                                </div>
                            </div>
                        </div>

                        <!-- Absent Dates Table -->
                        <div class="agenda-container mt-4">
                            <h3>Absent Dates</h3>
                            <div class="table-responsive">
                                <table class="agenda-table">
                                    <thead>
                                        <tr>
                                            <th>Employee</th>
                                            <th>Absent Dates</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="entry" items="${absentDates}">
                                            <tr>
                                                <td>${entry.key}</td>
                                                <td>
                                                    <c:forEach var="date" items="${entry.value}">
                                                        <span class="badge">
                                                            <fmt:formatDate value="${date}" pattern="dd/MM/yyyy" />
                                                        </span>
                                                    </c:forEach>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </body>

            </html>
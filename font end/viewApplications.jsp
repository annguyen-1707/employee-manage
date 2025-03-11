<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Applications - EMS</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            .applications-container {
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                padding: 2rem;
            }

            .applications-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
            }

            .filter-section {
                display: flex;
                gap: 1rem;
                margin-bottom: 2rem;
            }

            .applications-table {
                width: 100%;
                border-collapse: collapse;
            }

            .applications-table th,
            .applications-table td {
                padding: 1rem;
                text-align: left;
                border-bottom: 1px solid #e0e0e0;
            }

            .applications-table th {
                font-weight: 600;
                color: #2c3e50;
                background-color: #f8f9fa;
            }

            .applications-table tr:hover {
                background-color: #f8f9fa;
            }

            .status-badge {
                display: inline-block;
                padding: 0.25rem 0.75rem;
                border-radius: 20px;
                font-size: 0.875rem;
                font-weight: 500;
            }

            .status-pending {
                background-color: #fff3e0;
                color: #e65100;
            }

            .status-approved {
                background-color: #e8f5e9;
                color: #2e7d32;
            }

            .status-rejected {
                background-color: #ffebee;
                color: #c62828;
            }

            .empty-state {
                text-align: center;
                padding: 3rem;
                color: #7f8c8d;
            }

            .empty-state i {
                font-size: 3rem;
                margin-bottom: 1rem;
            }

            .action-buttons {
                display: flex;
                gap: 0.5rem;
            }

            .btn-approve {
                background-color: #4caf50;
            }

            .btn-reject {
                background-color: #f44336;
            }
        </style>
    </head>

    <body>
        <!-- Include Navigation Bar -->
        <jsp:include page="header.jsp" />

        <div class="main-content">
            <div class="container">
                <div class="applications-container">
                    <div class="applications-header">
                        <h1>Leave Applications</h1>
                    </div>

                    <div class="filter-section">
                        <select class="form-control" id="statusFilter">
                            <option value="">All Status</option>
                            <option value="Pending">Pending</option>
                            <option value="Approved">Approved</option>
                            <option value="Rejected">Rejected</option>
                        </select>
                    </div>

                    <c:if test="${empty applications}">
                        <div class="empty-state">
                            <i class="fas fa-folder-open"></i>
                            <p>No applications found</p>
                        </div>
                    </c:if>

                    <c:if test="${not empty applications}">
                        <table class="applications-table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>From</th>
                                    <th>To</th>
                                    <th>Created By</th>
                                    <th>Status</th>
                                    <th>Processed By</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="app" items="${applications}">
                                    <tr>
                                        <td>
                                            <a href="applicationDetail?applicationId=${app.applicationId}">${app.title}</a>
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${app.startDate}" pattern="dd/MM/yyyy" />
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${app.endDate}" pattern="dd/MM/yyyy" />
                                        </td>
                                        <td>${app.createdByName}</td>
                                        <td>
                                            <span class="status-badge status-${app.status.toLowerCase()}">${app.status}</span>
                                        </td>
                                        <td>
                                            ${app.processedByName}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>

        <script>
            function approveApplication(id) {
                if (confirm('Are you sure you want to approve this application?')) {
                    window.location.href = `process-application?id=${id}&action=approve`;
                }
            }

            function rejectApplication(id) {
                if (confirm('Are you sure you want to reject this application?')) {
                    window.location.href = `process-application?id=${id}&action=reject`;
                }
            }

            document.getElementById('statusFilter').addEventListener('change', function () {
                const status = this.value;
                window.location.href = `view-applications?status=${status}`;
            });
        </script>
    </body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Applications - Employee Management System</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .applications-container {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                padding: 2rem;
                margin-top: 2rem;
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
            }

            .filter-select {
                padding: 0.5rem;
                border: 1px solid #dcdde1;
                border-radius: 5px;
                min-width: 150px;
            }

            .applications-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 1rem;
            }

            .applications-table th,
            .applications-table td {
                padding: 1rem;
                text-align: left;
                border-bottom: 1px solid #dcdde1;
            }

            .applications-table th {
                font-weight: 600;
                color: #2f3640;
                background-color: #f8f9fa;
            }

            .application-link {
                font-weight: 600;
                font-size: 1.1rem;
                color: #2f3640;
                text-decoration: none;
                display: block;
                padding: 0.5rem 0;
            }

            .application-link:hover {
                color: #2980b9;
                text-decoration: underline;
            }

            .status-badge {
                padding: 0.5rem 1rem;
                border-radius: 20px;
                font-size: 0.9rem;
                font-weight: 500;
                text-align: center;
                display: inline-block;
            }

            .status-pending {
                background-color: #ffeaa7;
                color: #d35400;
            }

            .status-approved {
                background-color: #55efc4;
                color: #00b894;
            }

            .status-rejected {
                background-color: #fab1a0;
                color: #d63031;
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

            @media (max-width: 768px) {
                .applications-header {
                    flex-direction: column;
                    gap: 1rem;
                }

                .filter-section {
                    flex-direction: column;
                    width: 100%;
                }

                .filter-select {
                    width: 100%;
                }

                .applications-table {
                    font-size: 0.9rem;
                }

                .applications-table th,
                .applications-table td {
                    padding: 0.75rem;
                }

                .status-badge {
                    padding: 0.25rem 0.75rem;
                }
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
                        <h2>Leave Applications</h2>
                        <div class="filter-section">
                            <select class="filter-select" id="statusFilter">
                                <option value="all">All Status</option>
                                <option value="pending">Pending</option>
                                <option value="approved">Approved</option>
                                <option value="rejected">Rejected</option>
                            </select>
                            <select class="filter-select" id="typeFilter">
                                <option value="all">All Types</option>
                                <option value="annual">Annual Leave</option>
                                <option value="sick">Sick Leave</option>
                                <option value="personal">Personal Leave</option>
                            </select>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="applications-table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Employee</th>
                                    <th>Status</th>
                                    <th>Date Applied</th>
                                </tr>
                            </thead>
                            <tbody id="applicationsTableBody">
                                <tr>
                                    <td>
                                        <a href="application-detail.jsp?id=1" class="application-link">Nghỉ phép lấy
                                            vợ</a>
                                    </td>
                                    <td>Mr A</td>
                                    <td><span class="status-badge status-pending">Pending</span></td>
                                    <td>March 1, 2024</td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="application-detail.jsp?id=2" class="application-link">Nghỉ ốm</a>
                                    </td>
                                    <td>Mr B</td>
                                    <td><span class="status-badge status-approved">Approved</span></td>
                                    <td>February 28, 2024</td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="application-detail.jsp?id=3" class="application-link">Nghỉ phép năm</a>
                                    </td>
                                    <td>Mr C</td>
                                    <td><span class="status-badge status-rejected">Rejected</span></td>
                                    <td>February 27, 2024</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Empty state (hidden by default) -->
                    <div class="empty-state" style="display: none;">
                        <i class="fas fa-inbox"></i>
                        <h3>No Applications Found</h3>
                        <p>There are no leave applications matching your filters.</p>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Filter functionality
            const statusFilter = document.getElementById('statusFilter');
            const typeFilter = document.getElementById('typeFilter');
            const tableBody = document.getElementById('applicationsTableBody');
            const emptyState = document.querySelector('.empty-state');

            function filterApplications() {
                const status = statusFilter.value;
                const type = typeFilter.value;

                // Here you would typically make an API call to get filtered data
                fetch('getApplications', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        status: status,
                        type: type
                    })
                })
                    .then(response => response.json())
                    .then(data => {
                        updateApplicationsTable(data);
                    })
                    .catch(error => console.error('Error:', error));
            }

            function updateApplicationsTable(data) {
                // Implementation will be added when backend is ready
                console.log('Updating applications with data:', data);
            }

            statusFilter.addEventListener('change', filterApplications);
            typeFilter.addEventListener('change', filterApplications);
        </script>
    </body>

    </html>
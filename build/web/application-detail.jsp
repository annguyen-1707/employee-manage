<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Application Detail - Employee Management System</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .detail-container {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                padding: 2rem;
                margin-top: 2rem;
            }

            .detail-header {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                margin-bottom: 2rem;
                padding-bottom: 1rem;
                border-bottom: 1px solid #dcdde1;
            }

            .back-button {
                color: #2f3640;
                text-decoration: none;
                display: flex;
                align-items: center;
                gap: 0.5rem;
                margin-bottom: 1rem;
            }

            .back-button:hover {
                color: #2980b9;
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

            .detail-section {
                margin-bottom: 2rem;
            }

            .detail-section h3 {
                color: #2f3640;
                margin-bottom: 1rem;
            }

            .detail-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 1.5rem;
            }

            .detail-item {
                margin-bottom: 1rem;
            }

            .detail-label {
                font-size: 0.9rem;
                color: #7f8c8d;
                margin-bottom: 0.5rem;
            }

            .detail-value {
                font-size: 1rem;
                color: #2f3640;
                font-weight: 500;
            }

            .action-buttons {
                display: flex;
                gap: 1rem;
                margin-top: 2rem;
            }

            .approve-btn,
            .reject-btn {
                padding: 0.75rem 1.5rem;
                border: none;
                border-radius: 5px;
                font-weight: 500;
                cursor: pointer;
                display: flex;
                align-items: center;
                gap: 0.5rem;
                transition: background-color 0.3s;
            }

            .approve-btn {
                background-color: #55efc4;
                color: #00b894;
            }

            .reject-btn {
                background-color: #fab1a0;
                color: #d63031;
            }

            .approve-btn:hover {
                background-color: #00b894;
                color: white;
            }

            .reject-btn:hover {
                background-color: #d63031;
                color: white;
            }

            @media (max-width: 768px) {
                .detail-header {
                    flex-direction: column;
                    gap: 1rem;
                }

                .action-buttons {
                    flex-direction: column;
                }

                .approve-btn,
                .reject-btn {
                    width: 100%;
                    justify-content: center;
                }
            }
        </style>
    </head>

    <body>
        <!-- Include Navigation Bar -->
        <jsp:include page="header.jsp" />

        <div class="main-content">
            <div class="container">
                <div class="detail-container">
                    <a href="view-applications.jsp" class="back-button">
                        <i class="fas fa-arrow-left"></i> Back to Applications
                    </a>

                    <div class="detail-header">
                        <div>
                            <h2>Nghỉ phép lấy vợ</h2>
                            <p>Application ID: #APP001</p>
                        </div>
                        <span class="status-badge status-pending">Pending</span>
                    </div>

                    <div class="detail-section">
                        <h3>Employee Information</h3>
                        <div class="detail-grid">
                            <div class="detail-item">
                                <div class="detail-label">Name</div>
                                <div class="detail-value">Mr A</div>
                            </div>
                            <div class="detail-item">
                                <div class="detail-label">Department</div>
                                <div class="detail-value">IT</div>
                            </div>
                            <div class="detail-item">
                                <div class="detail-label">Position</div>
                                <div class="detail-value">Software Engineer</div>
                            </div>
                        </div>
                    </div>

                    <div class="detail-section">
                        <h3>Leave Details</h3>
                        <div class="detail-grid">
                            <div class="detail-item">
                                <div class="detail-label">Leave Type</div>
                                <div class="detail-value">Personal Leave</div>
                            </div>
                            <div class="detail-item">
                                <div class="detail-label">Start Date</div>
                                <div class="detail-value">March 15, 2024</div>
                            </div>
                            <div class="detail-item">
                                <div class="detail-label">End Date</div>
                                <div class="detail-value">March 20, 2024</div>
                            </div>
                            <div class="detail-item">
                                <div class="detail-label">Total Days</div>
                                <div class="detail-value">6 days</div>
                            </div>
                        </div>
                    </div>

                    <div class="detail-section">
                        <h3>Reason</h3>
                        <p>Getting married and need time for wedding ceremony and honeymoon.</p>
                    </div>

                    <% if (session.getAttribute("userRole") !=null &&
                        session.getAttribute("userRole").equals("manager")) { %>
                        <div class="action-buttons">
                            <button class="approve-btn" onclick="handleAction('approve')">
                                <i class="fas fa-check"></i> Approve
                            </button>
                            <button class="reject-btn" onclick="handleAction('reject')">
                                <i class="fas fa-times"></i> Reject
                            </button>
                        </div>
                        <% } %>
                </div>
            </div>
        </div>

        <script>
            function handleAction(action) {
                if (!confirm(`Are you sure you want to ${action} this application?`)) {
                    return;
                }

                fetch('updateApplication', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        applicationId: 'APP001',
                        action: action
                    })
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            alert(`Application ${action}ed successfully`);
                            window.location.href = 'view-applications.jsp';
                        } else {
                            alert('Error updating application');
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('Error updating application');
                    });
            }
        </script>
    </body>

    </html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Home page specific styles */
        .home-page .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            padding: 1rem;
            margin-top: 2rem;
        }

        .home-page .feature-card {
            background-color: white;
            border-radius: 10px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .home-page .feature-card:hover {
            transform: translateY(-10px);
        }

        .home-page .feature-card i {
            font-size: 3rem;
            color: #3498db;
            margin-bottom: 1rem;
        }

        .home-page .feature-card h3 {
            color: #2f3640;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        .home-page .feature-card p {
            color: #7f8c8d;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .home-page .feature-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .home-page .feature-btn:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

        .home-page .welcome-section {
            text-align: center;
            margin: 3rem 0;
        }

        .home-page .welcome-section h2 {
            font-size: 2.5rem;
            color: #2f3640;
            margin-bottom: 1rem;
        }

        .home-page .welcome-section p {
            color: #7f8c8d;
            font-size: 1.1rem;
            max-width: 800px;
            margin: 0 auto;
            line-height: 1.6;
        }

        @media (max-width: 768px) {
            .home-page .features-grid {
                grid-template-columns: 1fr;
                padding: 1rem 0;
            }

            .home-page .welcome-section h2 {
                font-size: 2rem;
            }

            .home-page .welcome-section p {
                font-size: 1rem;
                padding: 0 1rem;
            }
        }
    </style>
</head>

<body>
    <!-- Include Navigation Bar -->
    <div id="header"></div>

    <div class="main-content home-page">
        <div class="container">
            <div class="welcome-section">
                <h2>Welcome to Employee Management System</h2>
                <p>A comprehensive solution for managing your workforce efficiently and effectively.</p>
            </div>

            <div class="features-grid">
                <div class="feature-card">
                    <i class="fas fa-users"></i>
                    <h3>Manage Employees</h3>
                    <p>Add, update, and manage employee information with ease. Keep track of all employee details in one
                        place.</p>
                    <a href="manage-employees.jsp" class="feature-btn">Access</a>
                </div>
                <div class="feature-card">
                    <i class="fas fa-file-alt"></i>
                    <h3>View Applications</h3>
                    <p>Review and process employee applications efficiently. Streamline your hiring process.</p>
                    <a href="view-applications.jsp" class="feature-btn">Access</a>
                </div>
                <div class="feature-card">
                    <i class="fas fa-calendar-alt"></i>
                    <h3>View Agenda</h3>
                    <p>Manage schedules, meetings, and important events. Stay organized and never miss a deadline.</p>
                    <a href="view-agenda.jsp" class="feature-btn">Access</a>
                </div>
                <div class="feature-card">
                    <i class="fas fa-file-signature"></i>
                    <h3>Resignation Request</h3>
                    <p>Submit and manage resignation requests. Easy process for both employees and HR department.</p>
                    <a href="resignation.jsp" class="feature-btn">Create Request</a>
                </div>
                <div class="feature-card">
                    <i class="fas fa-calendar-plus"></i>
                    <h3>Leave Request</h3>
                    <p>Submit and track your leave requests. Easy way to manage your time off and vacations.</p>
                    <a href="leave-request.jsp" class="feature-btn">Request Leave</a>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Load header
        fetch('header.jsp')
            .then(response => response.text())
            .then(data => {
                document.getElementById('header').innerHTML = data;
            });
    </script>
</body>

</html>
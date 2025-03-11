<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Application Request - EMS</title>
                <link rel="stylesheet" href="styles.css">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                <style>
                    .application-detail {
                        background: white;
                        border-radius: 8px;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                        padding: 2rem;
                        max-width: 800px;
                        margin: 0 auto;
                    }

                    .detail-header {
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        margin-bottom: 2rem;
                    }

                    .back-button {
                        color: #3498db;
                        text-decoration: none;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .application-title {
                        font-size: 1.5rem;
                        font-weight: 600;
                        color: #2c3e50;
                        margin: 0;
                        margin-bottom: 1rem;
                        text-align: center;
                    }

                    .info-grid {
                        display: grid;
                        gap: 1.5rem;
                        margin-bottom: 2rem;
                        max-width: 600px;
                        margin-left: auto;
                        margin-right: auto;
                    }

                    .info-item {
                        display: flex;
                        align-items: center;
                    }

                    .info-label {
                        min-width: 150px;
                        font-weight: 500;
                        color: #7f8c8d;
                        text-align: right;
                        padding-right: 20px;
                    }

                    .info-value {
                        flex: 1;
                        color: #2c3e50;
                        padding-left: 20px;
                        border-left: 2px solid #eee;
                    }

                    .info-input {
                        flex: 1;
                        padding: 8px 12px;
                        border: 1px solid #ddd;
                        border-radius: 4px;
                        margin-left: 20px;
                        font-size: 14px;
                    }

                    .reason-box {
                        background: #f8f9fa;
                        padding: 1.5rem;
                        border-radius: 6px;
                        margin-bottom: 2rem;
                        max-width: 600px;
                        margin-left: auto;
                        margin-right: auto;
                    }

                    .reason-title {
                        font-size: 1.1rem;
                        font-weight: 600;
                        color: #2c3e50;
                        margin-bottom: 1rem;
                        text-align: center;
                    }

                    .reason-textarea {
                        width: 100%;
                        min-height: 100px;
                        padding: 12px;
                        border: 1px solid #ddd;
                        border-radius: 4px;
                        resize: vertical;
                        font-size: 14px;
                    }

                    .action-buttons {
                        display: flex;
                        gap: 1rem;
                        margin-top: 2rem;
                        justify-content: center;
                    }

                    .btn-submit {
                        background-color: #3498db;
                        color: white;
                        padding: 10px 20px;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                        font-size: 14px;
                    }

                    .btn-submit:hover {
                        background-color: #2980b9;
                    }
                </style>
            </head>

            <body>
                <jsp:include page="header.jsp" />

                <div class="main-content">
                    <div class="container">
                        <div class="application-detail">
                            <div class="detail-header">
                                <a href="viewApplications" class="back-button">
                                    <i class="fas fa-arrow-left"></i>
                                    Back to Applications
                                </a>
                            </div>

                            <h1 class="application-title">Duyệt đơn xin nghỉ phép</h1>

                            <form action="applicationRequest" method="POST">
                                <div class="info-grid">
                                    <div class="info-item">
                                        <span class="info-label">Created By</span>
                                        <span class="info-value">${sessionScope.employee.name}</span>
                                    </div>
                                    <div class="info-item">
                                        <span class="info-label">Created By Role</span>
                                        <span class="info-value">${sessionScope.employee.role}</span>
                                    </div>
                                    <div class="info-item">
                                        <span class="info-label">Title</span>
                                        <input type="text" name="title" class="info-input" required>
                                    </div>
                                    <div class="info-item">
                                        <span class="info-label">From</span>
                                        <input type="date" name="startDate" class="info-input" required>
                                    </div>
                                    <div class="info-item">
                                        <span class="info-label">To</span>
                                        <input type="date" name="endDate" class="info-input" required>
                                    </div>
                                </div>

                                <div class="reason-box">
                                    <h2 class="reason-title">Reason</h2>
                                    <textarea name="reason" class="reason-textarea" required></textarea>
                                </div>

                                <div class="action-buttons">
                                    <button type="submit" class="btn btn-submit">
                                        <i class="fas fa-paper-plane"></i>
                                        Submit Application
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <script>
                    // Validate dates when form is submitted
                    document.querySelector('form').addEventListener('submit', function (e) {
                        const startDate = new Date(document.querySelector('input[name="startDate"]').value);
                        const endDate = new Date(document.querySelector('input[name="endDate"]').value);
                        const today = new Date();
                        today.setHours(0, 0, 0, 0);

                        if (startDate < today) {
                            e.preventDefault();
                            alert('Start date cannot be in the past');
                        } else if (endDate < startDate) {
                            e.preventDefault();
                            alert('End date must be after start date');
                        }
                    });
                </script>
            </body>

            </html>
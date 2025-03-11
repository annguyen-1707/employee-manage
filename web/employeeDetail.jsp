<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Employee Detail - EMS</title>
                <link rel="stylesheet" href="styles.css">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                <style>
                    .employee-detail {
                        background: white;
                        border-radius: 8px;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                        padding: 2rem;
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

                    .employee-name {
                        font-size: 1.5rem;
                        font-weight: 600;
                        color: #2c3e50;
                        margin: 0;
                    }

                    .detail-grid {
                        display: grid;
                        grid-template-columns: repeat(2, 1fr);
                        gap: 2rem;
                    }

                    .detail-section {
                        background: #f8f9fa;
                        padding: 1.5rem;
                        border-radius: 6px;
                    }

                    .section-title {
                        font-size: 1.1rem;
                        font-weight: 600;
                        color: #2c3e50;
                        margin-bottom: 1rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .info-list {
                        list-style: none;
                        padding: 0;
                        margin: 0;
                    }

                    .info-item {
                        display: flex;
                        margin-bottom: 1rem;
                    }

                    .info-label {
                        width: 140px;
                        font-weight: 500;
                        color: #7f8c8d;
                    }

                    .info-value {
                        flex: 1;
                        color: #2c3e50;
                    }

                    .status-badge {
                        display: inline-block;
                        padding: 0.25rem 0.75rem;
                        border-radius: 20px;
                        font-size: 0.875rem;
                        font-weight: 500;
                    }

                    .status-active {
                        background-color: #e8f5e9;
                        color: #2e7d32;
                    }

                    @media (max-width: 768px) {
                        .detail-grid {
                            grid-template-columns: 1fr;
                        }
                    }
                </style>
            </head>

            <body>
                <jsp:include page="header.jsp" />

                <div class="main-content">
                    <div class="container">
                        <div class="employee-detail">
                            <div class="detail-header">
                                <a href="index" class="back-button">
                                    <i class="fas fa-arrow-left"></i>
                                    Back to Home
                                </a>
                                <button class="btn btn-primary">
                                    <i class="fas fa-edit"></i>
                                    Edit Employee
                                </button>
                            </div>

                            <h1 class="employee-name">${employee.name}</h1>

                            <div class="detail-grid">
                                <div class="detail-section">
                                    <h2 class="section-title">
                                        <i class="fas fa-user"></i>
                                        Personal Information
                                    </h2>
                                    <ul class="info-list">
                                        <li class="info-item">
                                            <span class="info-label">Employee ID</span>
                                            <span class="info-value">${employee.employeeId}</span>
                                        </li>
                                        <li class="info-item">
                                            <span class="info-label">Full Name</span>
                                            <span class="info-value">${employee.name}</span>
                                        </li>
                                        <li class="info-item">
                                            <span class="info-label">Email</span>
                                            <span class="info-value">${employee.email}</span>
                                        </li>
                                        <li class="info-item">
                                            <span class="info-label">Phone</span>
                                            <span class="info-value">${employee.phoneNumber}</span>
                                        </li>
                                        <li class="info-item">
                                            <span class="info-label">Address</span>
                                            <span class="info-value">${employee.address}</span>
                                        </li>
                                        <li class="info-item">
                                            <span class="info-label">Gender</span>
                                            <span class="info-value">${employee.gender ? 'Male' : 'Female'}</span>
                                        </li>
                                    </ul>
                                </div>

                                <div class="detail-section">
                                    <h2 class="section-title">
                                        <i class="fas fa-briefcase"></i>
                                        Work Information
                                    </h2>
                                    <ul class="info-list">
                                        <li class="info-item">
                                            <span class="info-label">Department</span>
                                            <span class="info-value">${employee.departmentName}</span>
                                        </li>
                                        <li class="info-item">
                                            <span class="info-label">Role</span>
                                            <span class="info-value">${employee.role}</span>
                                        </li>

                                        <li class="info-item">
                                            <span class="info-label">Manager</span>
                                            <span class="info-value">${employee.manageName}</span>
                                        </li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>
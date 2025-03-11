<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Application Detail - EMS</title>
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

                    .reason-box {
                        background: #f8f9fa;
                        padding: 1.5rem;
                        border-radius: 6px;
                        margin-bottom: 2rem;
                        max-width: 600px;
                        margin-left: auto;
                        margin-right: auto;
                    }

                    .reason-textarea {
                        width: 100%;
                        min-height: 100px;
                        padding: 10px;
                        border: 1px solid #ddd;
                        border-radius: 4px;
                        resize: vertical;
                        font-family: inherit;
                        font-size: 14px;
                        line-height: 1.5;
                    }

                    .reason-title {
                        font-size: 1.1rem;
                        font-weight: 600;
                        color: #2c3e50;
                        margin-bottom: 1rem;
                        text-align: center;
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

                    .action-buttons {
                        display: flex;
                        gap: 1rem;
                        margin-top: 2rem;
                        justify-content: center;
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
                <jsp:include page="header.jsp" />

                <div class="main-content">
                    <div class="container">
                        <div class="application-detail">
                            <div class="detail-header">
                                <a href="viewApplications" class="back-button">
                                    <i class="fas fa-arrow-left"></i>
                                    Back to Applications
                                </a>
                                <span
                                    class="status-badge status-${application.status.toLowerCase()}">${application.status}</span>
                            </div>

                            <h1 class="application-title">${application.title}</h1>

                            <div class="info-grid">
                                <div class="info-item">
                                    <span class="info-label">Created By</span>
                                    <span class="info-value">${application.createdByName}</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Created By Role</span>
                                    <span class="info-value">${application.createByRole}</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">From</span>
                                    <span class="info-value">
                                        <fmt:formatDate value="${application.startDate}" pattern="dd/MM/yyyy" />
                                    </span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">To</span>
                                    <span class="info-value">
                                        <fmt:formatDate value="${application.endDate}" pattern="dd/MM/yyyy" />
                                    </span>
                                </div>
                                <c:if test="${not empty application.processedByName}">
                                    <div class="info-item">
                                        <span class="info-label">Processed By</span>
                                        <span class="info-value">${application.processedByName}</span>
                                    </div>
                                </c:if>
                            </div>

                            <div class="reason-box">
                                <h2 class="reason-title">Reason</h2>
                                <p>${application.reason}</p>
                            </div>

                            <c:if test="${not empty application.note}">
                                <div class="reason-box">
                                    <h2 class="reason-title">Note</h2>
                                    <p>${application.note}</p>
                                </div>
                            </c:if>

                            <c:if
                                test="${sessionScope.employee.employeeId != application.createdBy && application.status == 'In progress'}">
                                <form action="applicationDetail" method="POST">
                                    <div class="reason-box">
                                        <h2 class="reason-title">Note</h2>
                                        <textarea name="note" class="reason-textarea"
                                            placeholder="Enter your note here..."></textarea>
                                    </div>

                                    <div class="action-buttons">
                                        <input type="hidden" name="id" value="${application.applicationId}">
                                        <input type="hidden" name="action" id="actionInput" value="">
                                        <button type="button" class="btn btn-approve" onclick="submitForm('accept')">
                                            <i class="fas fa-check"></i>
                                            Approve
                                        </button>
                                        <button type="button" class="btn btn-reject" onclick="submitForm('reject')">
                                            <i class="fas fa-times"></i>
                                            Reject
                                        </button>
                                    </div>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>

                <script>
                    function submitForm(action) {
                        document.getElementById('actionInput').value = action;
                        document.querySelector('form').submit();
                    }
                </script>
            </body>

            </html>
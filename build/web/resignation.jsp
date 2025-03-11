<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Resignation - Employee Management System</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .resignation-container {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                padding: 2rem;
                margin-top: 2rem;
            }

            .resignation-header {
                margin-bottom: 2rem;
                padding-bottom: 1rem;
                border-bottom: 1px solid #dcdde1;
            }

            .resignation-form {
                max-width: 800px;
                margin: 0 auto;
            }

            .form-section {
                margin-bottom: 2rem;
            }

            .form-section h3 {
                color: #2f3640;
                margin-bottom: 1rem;
            }

            .form-group {
                margin-bottom: 1.5rem;
            }

            .form-label {
                display: block;
                font-size: 0.9rem;
                color: #2f3640;
                margin-bottom: 0.5rem;
            }

            .form-control {
                width: 100%;
                padding: 0.75rem;
                border: 1px solid #dcdde1;
                border-radius: 5px;
                font-size: 1rem;
            }

            .form-control:focus {
                border-color: #3498db;
                outline: none;
            }

            textarea.form-control {
                min-height: 150px;
                resize: vertical;
            }

            .submit-btn {
                background-color: #3498db;
                color: white;
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

            .submit-btn:hover {
                background-color: #2980b9;
            }

            .error-message {
                color: #d63031;
                font-size: 0.9rem;
                margin-top: 0.5rem;
            }

            .info-text {
                color: #7f8c8d;
                font-size: 0.9rem;
                margin-top: 0.5rem;
            }

            @media (max-width: 768px) {
                .resignation-container {
                    padding: 1rem;
                }

                .submit-btn {
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
                <div class="resignation-container">
                    <div class="resignation-header">
                        <h2>Submit Resignation</h2>
                    </div>

                    <form class="resignation-form" action="submitResignation" method="POST"
                        onsubmit="return validateForm()">
                        <div class="form-section">
                            <div class="form-group">
                                <label class="form-label" for="lastWorkingDate">Last Working Date</label>
                                <input type="date" class="form-control" id="lastWorkingDate" name="lastWorkingDate"
                                    required>
                                <div class="info-text">Please provide at least 30 days notice from today</div>
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="reason">Reason for Resignation</label>
                                <textarea class="form-control" id="reason" name="reason" required
                                    placeholder="Please explain your reasons for resigning"></textarea>
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="handover">Handover Notes</label>
                                <textarea class="form-control" id="handover" name="handover" required
                                    placeholder="Please provide details about your current projects and responsibilities that need to be handed over"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="submit-btn">
                                <i class="fas fa-paper-plane"></i> Submit Resignation
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function validateForm() {
                const lastWorkingDate = new Date(document.getElementById('lastWorkingDate').value);
                const today = new Date();
                const minDate = new Date();
                minDate.setDate(today.getDate() + 30);

                if (lastWorkingDate < minDate) {
                    alert('Last working date must be at least 30 days from today');
                    return false;
                }

                return confirm('Are you sure you want to submit your resignation?');
            }

            // Set min date for last working date input
            const lastWorkingDateInput = document.getElementById('lastWorkingDate');
            const minDate = new Date();
            minDate.setDate(minDate.getDate() + 30);
            lastWorkingDateInput.min = minDate.toISOString().split('T')[0];
        </script>
    </body>

    </html>
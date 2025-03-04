<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Leave Request - Employee Management System</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .request-container {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                padding: 2rem;
                margin-top: 2rem;
            }

            .request-header {
                margin-bottom: 2rem;
                padding-bottom: 1rem;
                border-bottom: 1px solid #dcdde1;
            }

            .request-form {
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

            .form-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 1.5rem;
            }

            .form-group {
                margin-bottom: 1rem;
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
                min-height: 100px;
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

            @media (max-width: 768px) {
                .request-container {
                    padding: 1rem;
                }

                .form-grid {
                    grid-template-columns: 1fr;
                }

                .submit-btn {
                    width: 100%;
                    justify-content: center;
                }
            }

            .auth-container {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: calc(100vh - 100px);
                padding: 2rem;
            }
        </style>
    </head>

    <body>
        <!-- Include Navigation Bar -->
        <jsp:include page="header.jsp" />

        <div class="main-content">
            <div class="container">
                <div class="request-container">
                    <div class="request-header">
                        <h2>Submit Leave Request</h2>
                    </div>

                    <form class="request-form" action="submitLeave" method="POST" onsubmit="return validateForm()">
                        <div class="form-section">
                            <h3>Leave Details</h3>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label class="form-label" for="leaveType">Leave Type</label>
                                    <select class="form-control" id="leaveType" name="leaveType" required>
                                        <option value="">Select Leave Type</option>
                                        <option value="annual">Annual Leave</option>
                                        <option value="sick">Sick Leave</option>
                                        <option value="personal">Personal Leave</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="startDate">Start Date</label>
                                    <input type="date" class="form-control" id="startDate" name="startDate" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="endDate">End Date</label>
                                    <input type="date" class="form-control" id="endDate" name="endDate" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="totalDays">Total Days</label>
                                    <input type="number" class="form-control" id="totalDays" name="totalDays" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="form-section">
                            <h3>Additional Information</h3>
                            <div class="form-group">
                                <label class="form-label" for="title">Title</label>
                                <input type="text" class="form-control" id="title" name="title" required
                                    placeholder="Enter a title for your leave request">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="reason">Reason</label>
                                <textarea class="form-control" id="reason" name="reason" required
                                    placeholder="Explain the reason for your leave request"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="submit-btn">
                                <i class="fas fa-paper-plane"></i> Submit Request
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function calculateTotalDays() {
                const startDate = new Date(document.getElementById('startDate').value);
                const endDate = new Date(document.getElementById('endDate').value);

                if (startDate && endDate) {
                    const diffTime = Math.abs(endDate - startDate);
                    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;
                    document.getElementById('totalDays').value = diffDays;
                }
            }

            function validateForm() {
                const startDate = new Date(document.getElementById('startDate').value);
                const endDate = new Date(document.getElementById('endDate').value);
                const today = new Date();

                if (startDate < today) {
                    alert('Start date cannot be in the past');
                    return false;
                }

                if (endDate < startDate) {
                    alert('End date cannot be before start date');
                    return false;
                }

                return true;
            }

            document.getElementById('startDate').addEventListener('change', calculateTotalDays);
            document.getElementById('endDate').addEventListener('change', calculateTotalDays);
        </script>
    </body>

    </html>
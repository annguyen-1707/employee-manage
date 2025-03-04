<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Employees - Employee Management System</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .employees-container {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                padding: 2rem;
                margin-top: 2rem;
            }

            .employees-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
            }

            .add-employee-btn {
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
                text-decoration: none;
            }

            .add-employee-btn:hover {
                background-color: #2980b9;
            }

            .filter-section {
                display: flex;
                gap: 1rem;
                margin-bottom: 1.5rem;
            }

            .filter-select {
                padding: 0.5rem;
                border: 1px solid #dcdde1;
                border-radius: 5px;
                min-width: 150px;
            }

            .search-input {
                padding: 0.5rem;
                border: 1px solid #dcdde1;
                border-radius: 5px;
                flex-grow: 1;
            }

            .employees-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 1rem;
            }

            .employees-table th,
            .employees-table td {
                padding: 1rem;
                text-align: left;
                border-bottom: 1px solid #dcdde1;
            }

            .employees-table th {
                font-weight: 600;
                color: #2f3640;
                background-color: #f8f9fa;
            }

            .employee-name {
                font-weight: 500;
                color: #2f3640;
            }

            .status-badge {
                padding: 0.5rem 1rem;
                border-radius: 20px;
                font-size: 0.9rem;
                font-weight: 500;
                text-align: center;
                display: inline-block;
            }

            .status-active {
                background-color: #55efc4;
                color: #00b894;
            }

            .status-inactive {
                background-color: #fab1a0;
                color: #d63031;
            }

            .action-btn {
                padding: 0.5rem;
                border: none;
                background: none;
                color: #3498db;
                cursor: pointer;
            }

            .action-btn:hover {
                color: #2980b9;
            }

            .modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 1000;
            }

            .modal-content {
                background-color: white;
                border-radius: 10px;
                padding: 2rem;
                width: 90%;
                max-width: 600px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1.5rem;
            }

            .close-modal {
                background: none;
                border: none;
                font-size: 1.5rem;
                cursor: pointer;
                color: #7f8c8d;
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

            @media (max-width: 768px) {
                .employees-header {
                    flex-direction: column;
                    gap: 1rem;
                }

                .filter-section {
                    flex-direction: column;
                }

                .filter-select,
                .search-input {
                    width: 100%;
                }

                .employees-table {
                    font-size: 0.9rem;
                }

                .employees-table th,
                .employees-table td {
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
                <div class="employees-container">
                    <div class="employees-header">
                        <h2>Manage Employees</h2>
                        <button class="add-employee-btn" onclick="openAddEmployeeModal()">
                            <i class="fas fa-plus"></i> Add Employee
                        </button>
                    </div>

                    <div class="filter-section">
                        <select class="filter-select" id="departmentFilter">
                            <option value="all">All Departments</option>
                            <option value="IT">IT</option>
                            <option value="HR">HR</option>
                            <option value="Finance">Finance</option>
                            <option value="Marketing">Marketing</option>
                        </select>
                        <select class="filter-select" id="statusFilter">
                            <option value="all">All Status</option>
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                        <input type="text" class="search-input" placeholder="Search employees...">
                    </div>

                    <div class="table-responsive">
                        <table class="employees-table">
                            <thead>
                                <tr>
                                    <th>Employee</th>
                                    <th>Department</th>
                                    <th>Position</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="employeesTableBody">
                                <tr>
                                    <td>
                                        <span class="employee-name">Mr A</span>
                                    </td>
                                    <td>IT</td>
                                    <td>Software Engineer</td>
                                    <td><span class="status-badge status-active">Active</span></td>
                                    <td>
                                        <button class="action-btn" onclick="editEmployee(1)">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="action-btn" onclick="deleteEmployee(1)">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="employee-name">Mr B</span>
                                    </td>
                                    <td>HR</td>
                                    <td>HR Manager</td>
                                    <td><span class="status-badge status-active">Active</span></td>
                                    <td>
                                        <button class="action-btn" onclick="editEmployee(2)">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="action-btn" onclick="deleteEmployee(2)">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add/Edit Employee Modal -->
        <div id="employeeModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 id="modalTitle">Add Employee</h3>
                    <button class="close-modal" onclick="closeModal()">&times;</button>
                </div>
                <form id="employeeForm" onsubmit="return handleSubmit(event)">
                    <div class="form-group">
                        <label class="form-label" for="fullName">Full Name</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="department">Department</label>
                        <select class="form-control" id="department" name="department" required>
                            <option value="">Select Department</option>
                            <option value="IT">IT</option>
                            <option value="HR">HR</option>
                            <option value="Finance">Finance</option>
                            <option value="Marketing">Marketing</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="position">Position</label>
                        <input type="text" class="form-control" id="position" name="position" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="add-employee-btn" style="width: 100%;">
                            <i class="fas fa-save"></i> Save Employee
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // Modal functions
            function openAddEmployeeModal() {
                document.getElementById('modalTitle').textContent = 'Add Employee';
                document.getElementById('employeeForm').reset();
                document.getElementById('employeeModal').style.display = 'block';
            }

            function closeModal() {
                document.getElementById('employeeModal').style.display = 'none';
            }

            function editEmployee(id) {
                document.getElementById('modalTitle').textContent = 'Edit Employee';
                // Here you would typically fetch employee data and populate the form
                document.getElementById('employeeModal').style.display = 'block';
            }

            function deleteEmployee(id) {
                if (confirm('Are you sure you want to delete this employee?')) {
                    // Here you would typically make an API call to delete the employee
                    console.log('Deleting employee:', id);
                }
            }

            function handleSubmit(event) {
                event.preventDefault();
                // Here you would typically make an API call to save the employee data
                const formData = new FormData(event.target);
                const data = Object.fromEntries(formData.entries());
                console.log('Saving employee data:', data);
                closeModal();
                return false;
            }

            // Filter functionality
            const departmentFilter = document.getElementById('departmentFilter');
            const statusFilter = document.getElementById('statusFilter');
            const searchInput = document.querySelector('.search-input');

            function filterEmployees() {
                const department = departmentFilter.value;
                const status = statusFilter.value;
                const search = searchInput.value.toLowerCase();

                // Here you would typically make an API call to get filtered data
                console.log('Filtering employees:', { department, status, search });
            }

            departmentFilter.addEventListener('change', filterEmployees);
            statusFilter.addEventListener('change', filterEmployees);
            searchInput.addEventListener('input', filterEmployees);

            // Close modal when clicking outside
            window.onclick = function (event) {
                const modal = document.getElementById('employeeModal');
                if (event.target === modal) {
                    closeModal();
                }
            }
        </script>
    </body>

    </html>
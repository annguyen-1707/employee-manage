<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Agenda - Employee Management System</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .agenda-container {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                padding: 2rem;
                margin-top: 2rem;
            }

            .agenda-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
            }

            .week-selector {
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .week-selector button {
                background: none;
                border: none;
                font-size: 1.5rem;
                color: #3498db;
                cursor: pointer;
                padding: 0.5rem;
            }

            .week-selector button:hover {
                color: #2980b9;
            }

            .current-week {
                font-size: 1.2rem;
                font-weight: 500;
                color: #2f3640;
            }

            .agenda-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 1rem;
            }

            .agenda-table th,
            .agenda-table td {
                padding: 0.75rem;
                text-align: center;
                border: 1px solid #dcdde1;
                min-width: 100px;
            }

            .agenda-table th:first-child,
            .agenda-table td:first-child {
                text-align: left;
                min-width: 150px;
            }

            .status-working {
                background-color: #55efc4 !important;
            }

            .status-leave {
                background-color: #fab1a0 !important;
            }

            .employee-name {
                font-weight: 500;
                color: #2f3640;
                padding: 0.5rem;
                border-radius: 4px;
            }

            .department-filter {
                padding: 0.5rem;
                border: 1px solid #dcdde1;
                border-radius: 5px;
                margin-right: 1rem;
            }

            .legend {
                display: flex;
                gap: 2rem;
                margin-top: 1rem;
                padding: 1rem;
                background-color: #f8f9fa;
                border-radius: 5px;
            }

            .legend-item {
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .legend-color {
                width: 20px;
                height: 20px;
                border-radius: 4px;
            }

            .legend-working {
                background-color: #55efc4;
            }

            .legend-leave {
                background-color: #fab1a0;
            }

            .date {
                display: block;
                font-size: 0.8rem;
                color: #7f8c8d;
                font-weight: normal;
                margin-top: 0.25rem;
            }

            .weekend {
                background-color: #f8f9fa;
            }

            @media (max-width: 768px) {
                .agenda-header {
                    flex-direction: column;
                    gap: 1rem;
                }

                .agenda-table {
                    font-size: 0.9rem;
                }

                .agenda-table th,
                .agenda-table td {
                    padding: 0.5rem;
                }

                .legend {
                    flex-direction: column;
                    gap: 0.5rem;
                }
            }
        </style>
    </head>

    <body>
        <!-- Include Navigation Bar -->
        <jsp:include page="header.jsp" />

        <div class="main-content">
            <div class="container">
                <div class="agenda-container">
                    <div class="agenda-header">
                        <h2>Department Agenda</h2>
                        <div class="week-selector">
                            <select id="departmentFilter" class="department-filter">
                                <option value="all">All Departments</option>
                                <option value="IT">IT</option>
                                <option value="HR">HR</option>
                                <option value="Finance">Finance</option>
                                <option value="Marketing">Marketing</option>
                            </select>
                            <button id="prevWeek"><i class="fas fa-chevron-left"></i></button>
                            <span class="current-week" id="currentWeek">March 1 - March 7, 2024</span>
                            <button id="nextWeek"><i class="fas fa-chevron-right"></i></button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="agenda-table">
                            <thead>
                                <tr>
                                    <th>Employee</th>
                                    <th>Mon <span class="date" id="date-mon"></span></th>
                                    <th>Tue <span class="date" id="date-tue"></span></th>
                                    <th>Wed <span class="date" id="date-wed"></span></th>
                                    <th>Thu <span class="date" id="date-thu"></span></th>
                                    <th>Fri <span class="date" id="date-fri"></span></th>
                                    <th>Sat <span class="date" id="date-sat"></span></th>
                                    <th>Sun <span class="date" id="date-sun"></span></th>
                                </tr>
                            </thead>
                            <tbody id="agendaTableBody">
                                <tr>
                                    <td>
                                        <span class="employee-name">Mr A (IT)</span>
                                    </td>
                                    <td class="status-working"></td>
                                    <td class="status-working"></td>
                                    <td class="status-working"></td>
                                    <td class="status-working"></td>
                                    <td class="status-working"></td>
                                    <td class="status-working weekend"></td>
                                    <td class="status-leave weekend"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="employee-name">Mr B (HR)</span>
                                    </td>
                                    <td class="status-working"></td>
                                    <td class="status-working"></td>
                                    <td class="status-leave"></td>
                                    <td class="status-leave"></td>
                                    <td class="status-leave"></td>
                                    <td class="status-leave weekend"></td>
                                    <td class="status-working weekend"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="employee-name">Mr C (Finance)</span>
                                    </td>
                                    <td class="status-working"></td>
                                    <td class="status-working"></td>
                                    <td class="status-working"></td>
                                    <td class="status-working"></td>
                                    <td class="status-working"></td>
                                    <td class="status-working weekend"></td>
                                    <td class="status-working weekend"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="employee-name">Mr D (Marketing)</span>
                                    </td>
                                    <td class="status-working"></td>
                                    <td class="status-leave"></td>
                                    <td class="status-leave"></td>
                                    <td class="status-working"></td>
                                    <td class="status-working"></td>
                                    <td class="status-leave weekend"></td>
                                    <td class="status-leave weekend"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="legend">
                        <div class="legend-item">
                            <div class="legend-color legend-working"></div>
                            <span>Working</span>
                        </div>
                        <div class="legend-item">
                            <div class="legend-color legend-leave"></div>
                            <span>On Leave</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Week navigation
            const prevWeekBtn = document.getElementById('prevWeek');
            const nextWeekBtn = document.getElementById('nextWeek');
            const currentWeekSpan = document.getElementById('currentWeek');
            let currentDate = new Date();

            function updateWeekDisplay() {
                const weekStart = new Date(currentDate);
                weekStart.setDate(currentDate.getDate() - currentDate.getDay() + 1);
                const weekEnd = new Date(weekStart);
                weekEnd.setDate(weekStart.getDate() + 6);

                const options = { month: 'long', day: 'numeric' };
                const startStr = weekStart.toLocaleDateString('en-US', options);
                const endStr = weekEnd.toLocaleDateString('en-US', options);
                const yearStr = weekEnd.getFullYear();

                currentWeekSpan.textContent = `${startStr} - ${endStr}, ${yearStr}`;

                // Update dates in table headers
                const days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
                days.forEach((day, index) => {
                    const date = new Date(weekStart);
                    date.setDate(weekStart.getDate() + index);
                    document.getElementById(`date-${day}`).textContent =
                        `(${date.getDate()}/${date.getMonth() + 1})`;
                });

                // Add weekend class to Saturday and Sunday columns
                const table = document.querySelector('.agenda-table');
                const cells = table.getElementsByTagName('td');
                for (let i = 0; i < cells.length; i++) {
                    const cellIndex = cells[i].cellIndex;
                    if (cellIndex === 6 || cellIndex === 7) { // Saturday or Sunday
                        cells[i].classList.add('weekend');
                    }
                }

                // Fetch agenda data for the selected week
                fetch('getAgenda', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        startDate: weekStart.toISOString(),
                        endDate: weekEnd.toISOString()
                    })
                })
                    .then(response => response.json())
                    .then(data => {
                        // Update the table with the fetched data
                        updateAgendaTable(data);
                    })
                    .catch(error => console.error('Error:', error));
            }

            function updateAgendaTable(data) {
                // Implementation will be added when backend is ready
                console.log('Updating agenda with data:', data);
            }

            prevWeekBtn.addEventListener('click', () => {
                currentDate.setDate(currentDate.getDate() - 7);
                updateWeekDisplay();
            });

            nextWeekBtn.addEventListener('click', () => {
                currentDate.setDate(currentDate.getDate() + 7);
                updateWeekDisplay();
            });

            // Department filter
            const departmentFilter = document.getElementById('departmentFilter');
            departmentFilter.addEventListener('change', filterByDepartment);

            function filterByDepartment() {
                const department = departmentFilter.value;
                const rows = document.getElementById('agendaTableBody').getElementsByTagName('tr');

                for (let row of rows) {
                    const employeeDept = row.querySelector('.employee-name').textContent.match(/\((.*?)\)/)[1];
                    if (department === 'all' || department === employeeDept) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                }
            }

            // Initialize
            updateWeekDisplay();
        </script>
    </body>

    </html>
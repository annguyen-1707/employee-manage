<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!-- Navigation Bar -->
            <link rel="stylesheet" href="header.css">
            <nav class="navbar">
                <div class="nav-container">
                    <div class="nav-left">
                        <a href="index" class="logo-link" style="text-decoration: none;">
                            <h1>EMS</h1>
                        </a>
                        <a href="manage-employees.html"><i class="fas fa-users"></i> Employees</a>
                    </div>
                    <div class="nav-right">
                        <c:if test="${sessionScope.employee!=null}">
                            <a href="employeeDetail">${sessionScope.employee.name}</a>
                            <a href="logout" class="logout-btn" id="logoutBtn"><i
                                    class="fas fa-sign-out-alt"></i>Logout</a>
                        </c:if>
                        <c:if test="${sessionScope.employee==null}">
                            <a href="login" class="login-btn" id="loginBtn"><i class="fas fa-sign-in-alt"></i> Login</a>
                        </c:if>
                    </div>
                </div>
            </nav>

            <!--<script>
    // Function to check login status and update navigation
    function updateNavigation() {
        const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
        const loginBtn = document.getElementById('loginBtn');
        const logoutBtn = document.getElementById('logoutBtn');

        if (isLoggedIn) {
            loginBtn.style.display = 'none';
            logoutBtn.style.display = 'flex';
        } else {
            loginBtn.style.display = 'flex';
            logoutBtn.style.display = 'none';
        }
    }

    // Handle logout
    document.getElementById('logoutBtn').addEventListener('click', function (e) {
        e.preventDefault();
        localStorage.removeItem('isLoggedIn');
        window.location.href = 'login.html';
    });

    // Update navigation when page loads
    document.addEventListener('DOMContentLoaded', updateNavigation);
</script>-->
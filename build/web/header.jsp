<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <nav class="navbar">
        <div class="nav-brand">
            <a href="index.jsp">EMS</a>
        </div>

        <button class="nav-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="nav-menu">
            <% if (session.getAttribute("user") !=null) { %>
                <!-- Menu for logged-in users -->
                <a href="view-agenda.jsp" class="nav-link">
                    <i class="fas fa-calendar"></i> View Agenda
                </a>
                <a href="view-applications.jsp" class="nav-link">
                    <i class="fas fa-list-alt"></i> View Applications
                </a>
                <a href="leave-request.jsp" class="nav-link">
                    <i class="fas fa-paper-plane"></i> Leave Request
                </a>
                <a href="resignation.jsp" class="nav-link">
                    <i class="fas fa-door-open"></i> Resignation
                </a>

                <% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").equals("manager")) {
                    %>
                    <!-- Additional menu items for managers -->
                    <a href="manage-employees.jsp" class="nav-link">
                        <i class="fas fa-users"></i> Manage Employees
                    </a>
                    <% } %>

                        <div class="nav-divider"></div>

                        <div class="user-menu">
                            <button class="user-menu-btn">
                                <i class="fas fa-user-circle"></i>
                                <%= session.getAttribute("userName") %>
                            </button>
                            <div class="user-dropdown">
                                <a href="profile.jsp">
                                    <i class="fas fa-id-card"></i> Profile
                                </a>
                                <a href="logout">
                                    <i class="fas fa-sign-out-alt"></i> Logout
                                </a>
                            </div>
                        </div>
                        <% } else { %>
                            <!-- Menu for non-logged-in users -->
                            <a href="login.jsp" class="nav-link">
                                <i class="fas fa-sign-in-alt"></i> Login
                            </a>
                            <a href="signup.jsp" class="nav-link">
                                <i class="fas fa-user-plus"></i> Sign Up
                            </a>
                            <% } %>
        </div>
    </nav>

    <style>
        .navbar {
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            height: 70px;
        }

        .nav-brand a {
            font-size: 1.3rem;
            font-weight: 700;
            color: #3498db;
            text-decoration: none;
        }

        .nav-toggle {
            display: none;
            background: none;
            border: none;
            font-size: 1.5rem;
            color: #2f3640;
            cursor: pointer;
        }

        .nav-menu {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .nav-link {
            color: #2f3640;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.4rem;
            font-weight: 500;
            padding: 0.4rem 0.8rem;
            border-radius: 4px;
            font-size: 0.95rem;
            transition: background-color 0.3s;
        }

        .nav-link:hover {
            background-color: #f8f9fa;
            color: #3498db;
        }

        .nav-divider {
            width: 1px;
            height: 24px;
            background-color: #dcdde1;
        }

        .user-menu {
            position: relative;
        }

        .user-menu-btn {
            background: none;
            border: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1rem;
            color: #2f3640;
            cursor: pointer;
            padding: 0.5rem;
            border-radius: 5px;
        }

        .user-menu-btn:hover {
            background-color: #f8f9fa;
        }

        .user-dropdown {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            padding: 0.5rem;
            min-width: 200px;
        }

        .user-dropdown a {
            color: #2f3640;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem;
            border-radius: 5px;
        }

        .user-dropdown a:hover {
            background-color: #f8f9fa;
            color: #3498db;
        }

        .user-menu:hover .user-dropdown {
            display: block;
        }

        @media (max-width: 768px) {
            .nav-toggle {
                display: block;
            }

            .nav-menu {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background-color: white;
                padding: 1rem;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                flex-direction: column;
                align-items: stretch;
            }

            .nav-menu.active {
                display: flex;
            }

            .nav-divider {
                width: 100%;
                height: 1px;
                margin: 0.5rem 0;
            }

            .user-menu {
                width: 100%;
            }

            .user-menu-btn {
                width: 100%;
                justify-content: center;
            }

            .user-dropdown {
                position: static;
                box-shadow: none;
                margin-top: 0.5rem;
            }

            .user-menu:hover .user-dropdown {
                display: none;
            }
        }
    </style>

    <script>
        document.querySelector('.nav-toggle').addEventListener('click', function () {
            document.querySelector('.nav-menu').classList.toggle('active');
        });

        document.querySelector('.user-menu-btn').addEventListener('click', function (e) {
            if (window.innerWidth <= 768) {
                e.preventDefault();
                document.querySelector('.user-dropdown').style.display =
                    document.querySelector('.user-dropdown').style.display === 'block' ? 'none' : 'block';
            }
        });
    </script>
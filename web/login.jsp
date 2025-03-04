<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Employee Management System</title>
        <link rel="stylesheet" href="auth-styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>

    <body>
        <!-- Include Navigation Bar -->
        <jsp:include page="header.jsp" />

        <div class="main-content">
            <div class="auth-container">
                <div class="auth-card">
                    <div class="auth-header">
                        <h1>EMS</h1>
                        <p>Welcome back!</p>
                    </div>
                    <% if (request.getAttribute("error") !=null) { %>
                    <div class="error-message">
                        <%= request.getAttribute("error") %>
                    </div>
                    <% } %>
                    <form class="auth-form" action="login" method="POST">
                        <div class="form-group">
                            <label for="email"><i class="fas fa-envelope"></i> Email</label>
                            <input type="email" id="email" name="email" required placeholder="Enter your email">
                        </div>
                        <div class="form-group">
                            <label for="password"><i class="fas fa-lock"></i> Password</label>
                            <div class="password-input">
                                <input type="password" id="password" name="pass" required
                                       placeholder="Enter your password">
                                <i class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
                            </div>
                        </div>
                        <div class="form-options">
                            <label class="remember-me">
                                <input type="checkbox" ${(cookie.crem != null ? 'checked' : '')} name="rem" value="ON">
                                Remember me
                            </label>
                            <a href="forgot-password.jsp" class="forgot-link">Forgot Password?</a>
                        </div>
                        <button type="submit" class="auth-button">Login</button>
                    </form>
                    <div class="auth-footer">
                        <p>Don't have an account? <a href="signup.jsp" class="signup-link">Let's sign up</a></p>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            function togglePassword() {
                const passwordInput = document.getElementById('password');
                const toggleIcon = document.querySelector('.toggle-password');

                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    toggleIcon.classList.remove('fa-eye');
                    toggleIcon.classList.add('fa-eye-slash');
                } else {
                    passwordInput.type = 'password';
                    toggleIcon.classList.remove('fa-eye-slash');
                    toggleIcon.classList.add('fa-eye');
                }
            }
        </script>
    </body>

</html>
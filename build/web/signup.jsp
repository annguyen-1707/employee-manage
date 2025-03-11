<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
   <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Employee Management System</title>
    <link rel="stylesheet" href="auth-styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>

<body>
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <h1>Create Account</h1>
                <p>Join our employee management system</p>
            </div>
            <form class="auth-form" id="signupForm" onsubmit="return validateSignupForm()">
                <div class="form-group">
                    <label for="fullname"><i class="fas fa-user"></i> Full Name</label>
                    <input type="text" id="fullname" name="fullname" required placeholder="Enter your full name">
                </div>
                <div class="form-group">
                    <label for="email"><i class="fas fa-envelope"></i> Email</label>
                    <input type="email" id="email" name="email" required placeholder="Enter your email">
                </div>
                <div class="form-group">
                    <label for="phone"><i class="fas fa-phone"></i> Phone Number</label>
                    <input type="tel" id="phone" name="phone" required placeholder="Enter your phone number">
                </div>
                <div class="form-group">
                    <label for="password"><i class="fas fa-lock"></i> Password</label>
                    <div class="password-input">
                        <input type="password" id="password" name="password" required placeholder="Create a password">
                        <i class="fas fa-eye toggle-password" onclick="togglePassword('password')"></i>
                    </div>
                </div>
                <div class="form-group">
                    <label for="confirm-password"><i class="fas fa-lock"></i> Confirm Password</label>
                    <div class="password-input">
                        <input type="password" id="confirm-password" name="confirm-password" required
                            placeholder="Confirm your password">
                        <i class="fas fa-eye toggle-password" onclick="togglePassword('confirm-password')"></i>
                    </div>
                </div>
                <div class="form-group">
                    <label class="terms-checkbox">
                        <input type="checkbox" name="terms" required>
                        <span>I agree to the Terms and Conditions</span>
                    </label>
                </div>
                <button type="submit" class="auth-button">Sign Up</button>
                <a href="login.jsp" class="back-to-login">
                    <i class="fas fa-arrow-left"></i> Already have an account? Login
                </a>
            </form>
        </div>
    </div>

    <script>
        function validateSignupForm() {
            const fullname = document.getElementById('fullname').value;
            const email = document.getElementById('email').value;
            const phone = document.getElementById('phone').value;
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirm-password').value;
            const terms = document.querySelector('input[name="terms"]').checked;

            if (!fullname || !email || !phone || !password || !confirmPassword) {
                alert('Please fill in all fields');
                return false;
            }

            if (password !== confirmPassword) {
                alert('Passwords do not match');
                return false;
            }

            if (!terms) {
                alert('Please accept the Terms and Conditions');
                return false;
            }

            // Password validation
            const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
            if (!passwordRegex.test(password)) {
                alert('Password must be at least 8 characters long and contain at least one letter and one number');
                return false;
            }

            return true;
        }

        function togglePassword(inputId) {
            const passwordInput = document.getElementById(inputId);
            const toggleIcon = passwordInput.nextElementSibling;

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
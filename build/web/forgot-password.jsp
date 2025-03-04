<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset Password - Employee Management System</title>
        <link rel="stylesheet" href="auth-styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>

    <body>
        <div class="auth-container">
            <div class="auth-card">
                <div class="auth-header">
                    <h1>Reset Password</h1>
                    <p>Enter your email and new password</p>
                </div>
                <form class="auth-form" id="resetForm" onsubmit="return validateResetForm()">
                    <div class="form-group">
                        <label for="email"><i class="fas fa-envelope"></i> Email</label>
                        <input type="email" id="email" name="email" required placeholder="Enter your email">
                    </div>
                    <div class="form-group">
                        <label for="new-password"><i class="fas fa-lock"></i> New Password</label>
                        <div class="password-input">
                            <input type="password" id="new-password" name="new-password" required
                                   placeholder="Enter new password">
                            <i class="fas fa-eye toggle-password" onclick="togglePassword('new-password')"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="confirm-password"><i class="fas fa-lock"></i> Confirm New Password</label>
                        <div class="password-input">
                            <input type="password" id="confirm-password" name="confirm-password" required
                                   placeholder="Confirm new password">
                            <i class="fas fa-eye toggle-password" onclick="togglePassword('confirm-password')"></i>
                        </div>
                    </div>
                    <button type="submit" class="auth-button">Reset Password</button>
                    <a href="login.jsp" class="back-to-login">
                        <i class="fas fa-arrow-left"></i> Back to Login
                    </a>
                </form>
            </div>
        </div>

        <script>
            function validateResetForm() {
                const email = document.getElementById('email').value;
                const newPassword = document.getElementById('new-password').value;
                const confirmPassword = document.getElementById('confirm-password').value;

                if (!email || !newPassword || !confirmPassword) {
                    alert('Please fill in all fields');
                    return false;
                }

                if (newPassword !== confirmPassword) {
                    alert('Passwords do not match');
                    return false;
                }

                // Password validation
                const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
                if (!passwordRegex.test(newPassword)) {
                    alert('Password must be at least 8 characters long and contain at least one letter and one number');
                    return false;
                }

                // Here you would typically make an API call to update the password
                alert('Password has been reset successfully!');
                window.location.href = 'login.jsp'; // Redirect to login page
                return false;
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
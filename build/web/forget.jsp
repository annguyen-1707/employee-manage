<%-- 
    Document   : forget
    Created on : Dec 7, 2024, 3:49:47 PM
    Author     : -Asus-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quên Mật Khẩu</title>
        <style>
            /* CSS toàn cục */
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f8ff;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            /* Container chính */
            .reset-container {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
                text-align: center;
            }

            .reset-container h1 {
                color: #FF5722;
                margin-bottom: 10px;
            }

            .reset-container h3 {
                color: #555;
                margin-bottom: 20px;
            }

            .reset-container h3 a {
                color: #007BFF;
                text-decoration: none;
            }

            .reset-container h3 a:hover {
                text-decoration: underline;
            }

            .error-message {
                color: red;
                margin-bottom: 15px;
            }

            /* Form đặt lại mật khẩu */
            .reset-container form {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            .reset-container input[type="text"] {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                width: 100%;
            }

            .reset-container input[type="submit"] {
                padding: 10px;
                background-color: #FF5722;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            .reset-container input[type="submit"]:hover {
                background-color: #e64a19;
            }
        </style>
    </head>
    <body>
        <div class="reset-container">
            <h1>Quên Mật Khẩu?</h1>
            <h3>Vui lòng nhập tên người dùng của bạn. Đã nhớ mật khẩu? <a href="login">Quay lại trang đăng nhập</a></h3>
            <h3 class="error-message">${requestScope.error}</h3>

            <form action="forget" method="post">
                <input type="text" name="user" placeholder="Tên tài khoản" required/>
                <input type="text" name="pass" placeholder="Mật khẩu mới" required/>
                <input type="submit" value="Đặt lại mật khẩu">
            </form>
        </div>
    </body>
</html>
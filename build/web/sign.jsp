<%-- 
    Document   : sign
    Created on : Dec 7, 2024, 3:01:14 PM
    Author     : -Asus-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            .register-container {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
                text-align: center;
            }

            .register-container h1 {
                color: #4CAF50;
                margin-bottom: 10px;
            }

            .register-container h3 {
                color: #555;
                margin-bottom: 20px;
            }

            .register-container h3 a {
                color: #007BFF;
                text-decoration: none;
            }

            .register-container h3 a:hover {
                text-decoration: underline;
            }

            .error-message {
                color: red;
                margin-bottom: 15px;
            }

            /* Form đăng ký */
            .register-container form {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            .register-container input[type="text"],
            .register-container input[type="password"] {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                width: 100%;
            }

            .register-container input[type="submit"] {
                padding: 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            .register-container input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="register-container">
            <h1>Đăng Ký</h1>
            <h3>Bạn đã có tài khoản? <a href="login">Đăng nhập</a></h3>
            <h3 class="error-message">${requestScope.error}</h3>

            <form action="sign" method="post">
                <input type="text" name="firstname" placeholder="Họ" required/>
                <input type="text" name="lastname" placeholder="Tên" required/>
                <input type="text" name="user" placeholder="Tên tài khoản" required/>
                <input type="password" name="pass" placeholder="Mật khẩu" required/>
                <input type="submit" value="Đăng ký">
            </form>
        </div>
    </body>
</html>


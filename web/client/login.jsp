<%-- 
    Document   : login
    Created on : Oct 24, 2019, 2:42:53 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="loginbox">
            <img src="images/avatar.png" class="avatar">
            <h1>Login Here</h1>
            <form action="login" method="POST"> 
                <p>Username</p>
                <input class="text" required type="text" name="username" placeholder="Enter Username">
                <p>Password</p>
                <input class="text" required type="password" name="password" placeholder="Enter Password">
                <input type="checkbox" name="remmember"/>remeber password
                <input class="text" type="submit" name="" value="Login" style="margin-top: 1rem">
                <a href="http://localhost:8080/HousewareShop/forgot-password">Lost your password?</a><br>
                <a href="http://localhost:8080/HousewareShop/sign-up">Don't have an account?</a>
            </form>

        </div>
        
    </body>
</html>

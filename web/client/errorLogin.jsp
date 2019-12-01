<%-- 
    Document   : errorLogin
    Created on : Oct 28, 2019, 1:13:59 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    </head>
    <body>
        <div class="loginbox" style="height: 450px">
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
                <a href="http://localhost:8080/HousewareShop/forgot-password">Don't have an account?</a><br>
                <span style="color: #fff707; font-size: 14px" class="mt-1"><i class="fas fa-exclamation-triangle"></i> ${warning}</span>
            </form>

        </div>
    </body>
</html>

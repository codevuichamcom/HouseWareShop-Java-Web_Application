<%-- 
    Document   : forgotPassword
    Created on : Oct 28, 2019, 11:47:00 AM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot password</title>
         <link href="css/login.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    </head>
    <body>
        <div class="loginbox" style="height: 480px !important">
            <img src="images/avatar.png" class="avatar">
            <h1><i class="fas fa-info-circle" style="color: orange"></i> Lost Password</h1>
            <form action="forgot-password" method="POST"> 
                <p>Username</p>
                <input class="text" required type="text" name="username" placeholder="Enter username">
                <p>Email</p>
                <input class="text" required type="email" name="email" placeholder="Enter Your email">
                <p>Phone Number</p><br>
                <input class="text" required type="text" name="phone" placeholder="Enter Phone Number">
                <input class="text" type="submit" name="" value="Send">
                <a href="http://localhost:8080/HousewareShop/sign-up">Don't have an account?</a><br>
                <a href="http://localhost:8080/HousewareShop/login">Click here to back to login</a>
            </form>

        </div>
    </body>
</html>

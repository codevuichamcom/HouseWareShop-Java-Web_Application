<%-- 
    Document   : errorSignup
    Created on : Oct 28, 2019, 5:17:03 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    </head>
    <body>
        <div class="loginbox" style="height: 660px !important; width: 30%; margin:1rem auto">
            <img src="images/avatar.png" class="avatar">
            <h1><i class="fas fa-info-circle" style="color: orange"></i> Signup Here</h1>
            <form action="sign-up" method="POST"> 
                <p>Username</p>
                <input class="text" required type="text" name="username" placeholder="Enter username" value="${username}">
                <p>Password</p>
                <input class="text" required type="password" name="password" placeholder="Enter password" value="${password}">
                <p>Retype password</p>
                <input class="text" required type="password" name="retypePassword" placeholder="Retype password" value="${retypePassword}">
                <p>Email</p>
                <input class="text" required type="email" name="email" placeholder="Enter Your email" value="${email}">
                <p>Phone Number</p><br>
                <input class="text" required type="number" name="phone" placeholder="Enter Phone Number" value="${phone}">
                <input class="text" type="submit" name="" value="Create">
                <a href="http://localhost:8080/HousewareShop/login">Click here to back to login</a><br>
                <a href="http://localhost:8080/HousewareShop/loginfb">Login with FaceBook</a><br>
                <span style="color: #fff707" class="mt-2"><i class="fas fa-exclamation-triangle"></i> ${warning}</span>
            </form>

        </div>
    </body>
</html>

<%-- 
    Document   : thank
    Created on : Oct 28, 2019, 9:01:59 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!DOCTYPE html>
    <html>
        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
            <title>Thank you</title>
        </head>
        <body>
            <%--<%@include file="../component/navbar.jsp" %>--%>

            <div class="container">
                <div class="row">
                    <div class="col-md-12 mt-5">
                        <div class="alert alert-success text-center" role="alert">
                            <h5>Your order has been received, thank you for your purchase</h5>
                            <a href="get-list-product" class="btn btn-success mt-2">continue shopping</a>
                        </div>
                    </div>
                </div>
            </div>
            <%--<%@include file="../component/footer.jsp" %>--%>
        </body>
    </html>
</body>
</html>

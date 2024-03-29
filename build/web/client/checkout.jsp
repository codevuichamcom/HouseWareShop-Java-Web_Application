<%-- 
    Document   : checkout
    Created on : Oct 23, 2019, 8:53:58 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="en_US"/>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <title>Check out</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container" style="margin-top: 5rem">
            <div class="row">
                <div class="col-md-8" style="border: 1px solid #ced4da;border-radius: 5px !important">
                    <c:choose>
                        <c:when test="${sessionScope.listCart.size()==0}">
                            <div class="alert alert-danger mt-5" role="alert">
                                You have not purchased anything
                            </div>
                            <a href="get-list-product" class="btn btn-outline-success" style="margin: 0 35%">Back to Buy Something</a>
                        </c:when>
                        <c:otherwise>


                            <h4 class="mt-3">List of Product</h4>
                            <table class="w-100 table table-striped mt-3">   
                                <tr>
                                    <th>STT</th>
                                    <th>Image</th>
                                    <th>Name of Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total Price</th>
                                </tr>
                                <c:forEach items="${sessionScope.listCart}" var="cart" varStatus="track">
                                    <tr>
                                        <td>${track.count}</td>
                                        <td>
                                            <img src="images/${cart.productImg}" style="width: 100px">
                                        </td>
                                        <td>${cart.productName}</td>
                                        <td>
                                            <fmt:formatNumber type="currency" value="${cart.productPrice}"/>
                                        </td>
                                        <td>
                                            ${cart.quantity}
                                        </td>
                                        <td>
                                            <fmt:formatNumber type="currency" value="${cart.productPrice * cart.quantity}"/>
                                        </td>
                                    </tr>
                                    <span style="display: none">${totalPrice=totalPrice+(cart.productPrice * cart.quantity)}</span>
                                </c:forEach>
                            </table>
                            <hr/>
                            <div class="text-right">
                                <h4>Total price:<fmt:formatNumber type="currency" value="${totalPrice}"/></h4>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="col-md-4 pl-5" style="border: 1px solid #ced4da;border-radius: 5px !important;">
                    <h3 class="mt-3" style="color: orange">Infomation of Customer</h3>
                    <div class="card mt-3">
                        <div class="card-body">
                            <form action="checkout" method="post">
                                <div class="form-group">
                                    <label for="name">Full Name</label>
                                    <input type="text" name="name" class="form-control" placeholder="Enter name" required>
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="sdt">Phone number</label>
                                    <input type="number" name="mobile" class="form-control" placeholder="enter phone number" required>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <textarea class="form-control" rows="3" name="address" required></textarea>
                                </div><div class="form-group">
                                    <label for="address">Note</label>
                                    <textarea class="form-control" rows="3" name="note"></textarea>
                                </div>
                                
                                <button type="submit" class="btn btn-success w-100">Accept</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>

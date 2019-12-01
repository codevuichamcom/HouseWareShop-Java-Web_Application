<%-- 
    Document   : prepareShipping
    Created on : Nov 7, 2019, 9:44:49 AM
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
        <title>Prepare shipping</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-12 mt-5">
                    <div class="card" >
                        <div class="card-body mt-5" style="border: 1px solid #ced4da;border-radius: 5px">
                            <h4 style="color: orange">List of Products</h4>
                            <table class="w-100 table mt-3">   
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
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="mt-5"><a onclick="document.getElementById('inf').submit()" class="btn btn-outline-success ml-auto w-100">Shipping to this address</a></div>
                            <div class="mt-3"><a  onclick="document.getElementById('address').style.display = 'block'" class="btn btn-outline-info ml-auto w-100">Shipping to another address</a></div>
                        </div>
                        
                        <div class="col-md-9 mt-3">
                            <form id="inf" action="prepare-shipping" method="post" style="border: 1px solid #ced4da !important; border-radius: 5px !important"> 
                            <div class="card" >
                                <div class="card-body">
                                    <h4 style="color: orange">Adress Shipping</h4>
                                <h6 style="overflow: visible !important">Products will be delivered at the address below</h6><br>
                                <div>Full Name:<span class="ml-4"> <b>${shipping.name}</b><span></div>
                                            <input type="hidden" name="name" value="${shipping.name}">
                                            <input type="hidden" name="mobile" value="${shipping.phone}">
                                            <input type="hidden" name="address" value="${shipping.address}">
                                            <input type="hidden" name="note" value="${note}">
                                <div>Phone number: <span class="ml-4">${shipping.phone}<span></div>
                                <div>Address: <span class="ml-4">${shipping.address}</span></div>
                                <div>Note <span class="ml-4">${note}</span></div>
                                </div>
                            </div>
                                </form>
                        </div>
                            

                    </div>
                    <div class="row">

                        <div class="col-md-3">

                        </div>
                        <div id="address" class="col-md-9 mt-5">
                            <div class="card">
                                <div class="card-body" style="border: 1px solid #ced4da;border-radius: 5px !important">
                                    <h4 class="mt-3" style="color: orange">Infomation of Customer</h4>
                                <div class="card mt-3">
                                    <div class="card-body">
                                        <form action="<c:if test="${sessionScope.account ne null}">prepare-shipping</c:if><c:if test="${sessionScope.account eq null}">login</c:if>" method="post">
                                            <div class="form-group">
                                                <label for="name">Full Name</label>
                                                <input type="text" name="name" class="form-control" placeholder="Enter name">
                                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                            </div>
                                            <div class="form-group">
                                                <label for="sdt">Phone number</label>
                                                <input type="number" name="mobile" class="form-control" placeholder="enter phone number">
                                            </div>
                                            <div class="form-group">
                                                <label for="address">Address</label>
                                                <textarea class="form-control" rows="3" name="address"></textarea>
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
                    </div>
                </div>
            </div>
        </div>
        <script>
            document.getElementById('address').style.display = 'none'
        </script>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>

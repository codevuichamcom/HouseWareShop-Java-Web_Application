<%-- 
    Document   : myprofile
    Created on : Nov 7, 2019, 5:43:07 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
            <link href="css/newcss.css" rel="stylesheet" type="text/css"/>


            <!-- Page level plugin CSS-->
            <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">


            <title>My profile</title>
            <style>
                .a{
                    text-decoration: none !important;
                    color: purple;
                    font-size: 25px !important;
                }
                table td{
                    padding-left: 2rem;
                }
                .next{
                    right: 0 !important;
                    border-radius: 3px 0 0 3px;
                }
                .btn-info{
                    width: 15% !important;
                }
                span input{
                    width: 75% !important;
                }

            </style>
        </head>
        <body>
            <%@include file="../component/navbar.jsp" %>

            <div class="container">
                <div class="row">
                    <div class="col-md-12 mt-5">
                        <!--My profile-->
                        <div class="row mt-5" style="border: 1px solid #ced4da !important; border-radius: 5px !important">
                            <div class="col-md-4 mt-3 text-center">
                                <h3 style="color: orange">Information of Accounts</h3>
                                <hr/>
                                <div class="mt-5"><a class="a" href="my-profile">My profile</a></div>
                                <div class="mt-3"><a class="a" onclick="openOrder()">Order</a></div>
                                <div class="mt-3"><a class="a" onclick="openHistory()">History</a></div>
                                <div class="mt-3"><a class="a" onclick="openSetting()">Setting</a></div>
                            </div>
                            <div class="col-md-8" style="border: 1px solid #ced4da;">
                                <h3 class="text-center pt-3" style="color: orange">Detail</h3>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-7">
                                        <table class="mt-5">
                                            <tr>
                                                <td>User Name:</td>
                                                <td>${account.userName}</td>
                                            </tr>
                                            <tr>
                                                <td>Display Name:</td>
                                                <td>${account.displayName}</td>
                                            </tr>
                                            <tr>
                                                <td>Address: </td>
                                                <td>${account.address}</td>
                                            </tr>
                                            <tr>
                                                <td>Email: </td>
                                                <td>${account.email}</td>
                                            </tr>
                                            <tr>
                                                <td>Phone:  </td>
                                                <td>${account.phone}</td>
                                            </tr>
                                            <tr>
                                                <td>Role:  </td>
                                                <td>${account.getRole(account.roleId).role}</td>
                                            </tr>
                                            <tr>
                                                <td>Status:  </td>
                                                <td>${account.getStatus(account.status).status}</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-md-5">
                                        <img style="margin-top: -30px" class="img-circle" src="images/AccountIcon2.png" alt=""/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Order Watting-->                    
                        <div id="order" class="row">
                            <div class="col-md-12 mt-3" style="border: 1px solid #ced4da !important; border-radius: 5px !important">
                                <h3 style="color: orange">Order watting......</h3>
                                <hr/>
                                <table class="table">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Customer</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Total Price</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">status</th>
                                        <th scope="col">Delete</th>
                                    <tr>
                                        <c:forEach items="${listOrderWatting}" var="order">
                                        <tr>
                                            <td>${order.id}</td>
                                            <td>${order.getShipping().name}</td>
                                            <td>${order.getShipping().phone}</td>
                                            <td>${order.getShipping().address}</td>
                                            <td>${order.totalPrice}</td>
                                            <td>${order.createDate}</td>
                                            <td>${order.getStatusOrder().status}</td>
                                            <td><a  href="delete-order?id=${order.id}" onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-outline-danger"><i class="fas fa-trash mr-2"></i>Delete</a></td>
                                        </tr>
                                    </c:forEach>

                                </table>
                            </div>
                        </div>

                        <!--History-->
                        <div id="history" class="row">
                            <div class="col-md-12 mt-3" style="border: 1px solid #ced4da !important; border-radius: 5px !important">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>OrderId</th>
                                                        <th>Name</th>
                                                        <th>Image</th>
                                                        <th>Quantity</th>
                                                        <th>Price</th>
                                                        <th>Date</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>OrderId</th>
                                                        <th>Name</th>
                                                        <th>Image</th>
                                                        <th>Quantity</th>
                                                        <th>Price</th>
                                                        <th>Date</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <c:forEach items="${listOrderHistory}" var="history" varStatus="track">
                                                        <tr>

                                                            <td>${track.count}</td>
                                                            <td>${history.orderId}</td>
                                                            <td>${history.productName}</td>
                                                            <td><a href="detail?id=${history.productId}"><img src="images/${history.productImage}" style="width: 50px"></a></td>
                                                            <td>${history.quantity}</td>
                                                            <td>${history.productPrice}</td>
                                                            <td>${history.getOrder().createDate}</td>
                                                            <td class="text-success">success</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                        </div>

                        <!--Setting-->
                        <div id="setting" class="row mt-3">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">

                                    </div>

                                    <div class="col-md-6" style="border: 1px solid #ced4da !important; border-radius: 5px !important">
                                        <form action="Change" method="Post">
                                            <a onclick="openDisplayName()" class="btn btn-outline-danger w-100 mt-2">Change Display Name</a>
                                            <span id="displayName"><input type="text" class="mt-2" style="height: 35px" placeholder="Enter display name..." name="displayName"><input type="submit" class="btn btn-info ml-5" value="Change"></span>
                                            <a onclick="openChangePassword()" class="btn btn-outline-danger w-100 mt-2">Change Password</a>
                                            <span id="password"><input type="password" class="mt-2" style="height: 35px" placeholder="Enter password..." name="password"></span>
                                            <span id="retypePassword"><input type="password" class="mt-2" style="height: 35px" placeholder="Re-type password..." name="retypePassword"><input type="submit" class="btn btn-info ml-5" value="Change"></span>
                                            <a onclick="openemail()" class="btn btn-outline-danger w-100 mt-2">Change email</a>
                                            <span id="email"><input type="email" class="mt-2" style="height: 35px" placeholder="Enter email..." name="email"><input type="submit" class="btn btn-info ml-5" value="Change"></span>
                                            <a onclick="openPhone()" class="btn btn-outline-danger w-100 mt-2">Change phone</a>
                                            <span id="phone"><input type="text" class="mt-2" style="height: 35px" placeholder="Enter phone number..." name="phone"><input type="submit" class="btn btn-info ml-5" value="Change"></span>
                                            <a onclick="openAddress()" class="btn btn-outline-danger w-100 mt-2 mb-2">Change address</a>
                                            <span id="address"><input type="text" class="mt-2" style="height: 35px" placeholder="Enter address..." name="address"><input type="submit" class="btn btn-info ml-5" value="Change"></span>
                                        </form>
                                    </div>

                                    <div class="col-md-3">

                                    </div>
                                </div>
                            </div>
                        </div>               

                    </div>
                </div>
            </div>


            <%@include file="../component/footer_2.jsp" %>
        </body>
    </html>
    <script>
        <c:choose>
            <c:when test="${order eq 1}">
        document.getElementById('order').style.display = 'block';
        document.getElementById('history').style.display = 'none';
        document.getElementById('setting').style.display = 'none';
            </c:when>
            <c:otherwise>
        document.getElementById('order').style.display = 'none';
        document.getElementById('history').style.display = 'none';
        document.getElementById('setting').style.display = 'none';
        document.getElementById('displayName').style.display = 'none';
        document.getElementById('password').style.display = 'none';
        document.getElementById('retypePassword').style.display = 'none';
        document.getElementById('email').style.display = 'none';
        document.getElementById('phone').style.display = 'none';
        document.getElementById('address').style.display = 'none';

        function openOrder() {
            document.getElementById('order').style.display = 'block';
            document.getElementById('history').style.display = 'none';
            document.getElementById('setting').style.display = 'none';
        }
        function openHistory() {
            document.getElementById('order').style.display = 'none';
            document.getElementById('history').style.display = 'block';
            document.getElementById('setting').style.display = 'none';
        }
        function openSetting() {
            document.getElementById('order').style.display = 'none';
            document.getElementById('history').style.display = 'none';
            document.getElementById('setting').style.display = 'block';
        }
        function openDisplayName() {
            document.getElementById('displayName').style.display = 'block';
        }
        function openChangePassword() {
            document.getElementById('password').style.display = 'block';
            document.getElementById('retypePassword').style.display = 'block';
        }
        function openemail() {
            document.getElementById('email').style.display = 'block';
        }
        function openPhone() {
            document.getElementById('phone').style.display = 'block';
        }
        function openAddress() {
            document.getElementById('address').style.display = 'block';
        }
            </c:otherwise>
        </c:choose>
    </script>
</body>
</html>

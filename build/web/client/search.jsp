<%-- 
   Document   : list-product
   Created on : Oct 2, 2019, 8:57:18 PM
   Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<fmt:setLocale value="en_US" scope="session"></fmt:setLocale>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <title>Hello, world!</title>
    </head>
    <body>

        <%@include file="../component/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <!-- Show list category -->
                <div class="col-md-2">
                    <h5 class="labelhead">
                        <div class="alert alert-success" role="alert">
                            Category
                        </div>
                    </h5>
                    <div class="category">
                        <a href="filter?id=0&page=${page}" class="pt-3" style="color: #d71e1e; font-size: 20px">All Product</a>
                        <c:forEach items="${requestScope.listCategory}" var="category">
                            <a class="pt-4" href="filter?id=${category.id}&page=${page}" style="color: #8400e7 !important; margin-left: 5px;font-size: 20px">${category.category}</a>
                            <c:forEach items="${category.listSubCategory}" var="subCategory">
                                <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${subCategory.subCategoryName}">
                                    <a class="pl-3 subCategory" href="filter?cid=${subCategory.id}&page=${page}"><li>${subCategory.subCategoryName}</li></a>
                                </span>
                            </c:forEach>
                        </c:forEach>
                    </div>
                </div>
                <!-- end -->
                <!-- Show list product -->

                <div class="col-md-10">
                    <h5 class="labelhead">
                        <div class="alert alert-secondary" role="alert">
                            <form onchange="submitForm()" id="combo" action="sort-product" method="post">List of products
                                <i class="fas fa-cubes mr-2 ml-4"></i></i><a href="sort-product?match=1" class="btn btn-outline-warning" style="color: #ff0707"> Best Match</a>
                                <i class="fas fa-filter mr-2 ml-4"></i></i><a href="sort-product?random=1" class="btn btn-outline-primary">Random</a>
                                <i class="fas fa-dollar-sign mr-2 ml-4"></i>
                                <select name="price" style="font-size: 1rem">
                                    <option value="-1">Price</option>
                                    <option value="0" <c:if test="${price ==0}">selected</c:if>>0$-5%</option>
                                    <option value="1" <c:if test="${price ==1}">selected</c:if>>5$-10$</option>
                                    <option value="2" <c:if test="${price ==2}">selected</c:if>>10$-15$</option>
                                    <option value="3" <c:if test="${price ==3}">selected</c:if>>15$-20$</option>
                                    <option value="4" <c:if test="${price ==4}">selected</c:if>>>20$</option>
                                    </select>
                                    <i class="fas fa-sort-down mr-2 ml-4"></i><a href="sort-product?news=1" class="btn btn-outline-info">new</a>
                                    <i class="fas fa-bolt mr-2 ml-4"></i><a href="sort-product?free=1" class="btn btn-outline-success">free ship</a>
                                    <a href="sort-product?check=4" style="color: orange"><i class="fas fa-sort ml-5"></i></a>
                                </form>
                            </div>
                                    <%@include file="../component/navPagingSearch.jsp" %>
                            <div class="row mb-5">
                                
                            <c:choose>
                                <c:when test="${requestScope.listProduct.size() == 0}">
                                    <div class="col-md-12 pt-5">
                                        <h5>No products found</h5>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    
                                    <c:forEach items="${requestScope.listProduct}" var="product">
                                        <!-- Show product -->
                                        
                                        <div class="col-md-3 mt-4 pt-2">
                                            <div class="card">
                                                <c:if test="${product.status==2}">
                                                    <div id="DIV_1">
                                                        <span id="SPAN_2">26</span>
                                                    </div>
                                                </c:if>
                                                <c:if test="${product.status==3}">
                                                    <div id="DIV_1">
                                                        <span id="SPAN_2"><i class="fas fa-bolt"></i></span>
                                                    </div>
                                                </c:if>
                                                <a href="detail?id=${product.id}"><img src="images/${product.image}" style="border: 1px solid #ededed;" class="card-img-top pt-4" alt="..."></a>
                                                <div class="card-body pt-3">
                                                    <a href="add-to-cart-now?id=${product.id}" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to carrt</a>
                                                    <a href="detail?id=${product.id}" class="card-title text-center mb-1 mt-2">${product.name}</a>
                                                    <p class="text-center my-0" style="color: #f60">$${product.price}</p>
                                                    <!--                                        <p class="text-center my-0">
                                                                                                <fmt:formatNumber value="${product.price}" type="currency"></fmt:formatNumber>
                                                                                            </p>-->
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- end -->
                                    </c:forEach>
                                        
                                </c:otherwise>
                            </c:choose>
                        </div>
                            <%@include file="../component/navPagingSearch.jsp" %>
                </div>
                <!--end -->
            </div>
        </div>

        <script>
            function submitForm()
            {
                document.getElementById("combo").submit();
            }
        </script>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>

<%-- 
    Document   : ModalProduct
    Created on : Nov 3, 2019, 7:57:23 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Information of Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container" style="margin-top: 5rem">
                    <div class="row mt-5">
                        <div class="col-md-5 mt-5">
                            <c:forEach items="${productDetail.listImage}" var="image" varStatus="track">
                                <div class="mySlides">
                                    <div class="numbertext">${track.count} / ${listImage.size()}</div>
                                    <img src="images/${image.imageName}" class="w-100">
                                </div>
                            </c:forEach>

                            <!-- Next and previous buttons -->
                            <a class="prevs" onclick="plusSlides(-1)">&#10094;</a>
                            <a class="nexts" onclick="plusSlides(1)">&#10095;</a>


                            <!-- Thumbnail images -->
                            <div class="row-image">
                                <c:forEach items="${productDetail.listImage}" var="image" varStatus="track">
                                    <div class="column" >
                                        <img class="demo cursor w-100" src="images/${image.imageName}" onclick="currentSlide(${track.count})">
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="col-md-6 pl-5">
                            <h3 class="mt-5">${requestScope.productDetail.name}<sup><span class="badge badge-success">Success</span></sup></h3>
                            <p class="my-0"><b style="font-size: 20px;color: #f60">$${requestScope.productDetail.price}</b></p>
                            <h6 class="mt-5"><b>Code of Product:  ${requestScope.productDetail.code}</b></h6>
                            <a href="add-to-cart?id=${requestScope.productDetail.id}" class="btn btn-outline-danger w-50 mt-4"><i class="fas fa-cart-plus mr-2"></i>Add to Cart</a>
                            <a href="checkout" class="btn btn-outline-success w-25 mt-4 ml-2">Buy Now<i class="fas fa-money-check-alt ml-2" style="color: green"></i></a>
                            <p class="mt-4"><b>Infomation of Product:</b></br></br>${requestScope.productDetail.description}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

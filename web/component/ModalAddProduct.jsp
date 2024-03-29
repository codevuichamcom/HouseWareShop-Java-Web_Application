<%-- 
    Document   : ModalAddProduct
    Created on : Nov 4, 2019, 9:50:55 AM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="modalAddProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Information of Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="modal-content animate" style="padding: 5px;border-top:none;border-bottom: none" action="add-product" method="post" enctype="multipart/form-data">


                    <div class="container">
                        <label for="code"><b>Code of product</b></label><br>
                        <input class="text" type="text" placeholder="Enter code of product" name="code" value="${product.code}" required><br>

                        <label for="name"><b>Name of Product</b></label><br>
                        <input class="text" type="text" placeholder="Enter name of product" name="name" value="${product.name}" required><br>


                        <label for="image" ><b>Images Product</b></label><br>
                        
                        <input type="file" name="fileName" class="form-control-file" multiple><br>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1"><b>Category</b></label>
                            <select class="form-control" name="subCategory"id="exampleFormControlSelect1">
                                <c:forEach items="${listSubCategory}" var="subCategory">
                                    <option value="${subCategory.id}">${subCategory.subCategoryName}</option>
                                </c:forEach>
                            </select>

                        </div>


                        <div class="form-group">
                            <label for="quantity"><b>Quantity of product</b></label>
                            <input class="text" class="form-control" type="number" placeholder="Enter quantity of product" name="quantity" required>
                        </div>
                        <div class="form-group">
                            <label for="price"><b>Price of Product</b></label>
                            <input class="text" class="form-control" type="number" placeholder="Enter price of product" name="price" required>
                        </div>

                        <div class="form-group">
                            <label for="status"><b>status of Product</b></label>
                            <select class="form-control" name="status"id="exampleFormControlSelect1">
                                <c:forEach items="${listStatusProduct}" var="statusProduct">
                                    <option value="${statusProduct.id}">${statusProduct.status}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlTextarea1"><b>Description of Product</b></label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="description"></textarea>
                        </div>

                        <button class="btn btn-outline-info" style="width: 55%" type="submit" ><i class="fas fa-sync-alt mr-2"></i>Update</button>
                        <a data-dismiss="modal" class="btn btn-outline-danger" style="width: 44%" ><i class="fas fa-window-close mr-2"></i></i>Cancel</a>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

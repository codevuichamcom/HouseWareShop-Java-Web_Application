<%-- 
    Document   : ModalAddSubCategory
    Created on : Nov 5, 2019, 12:31:04 AM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="modalAddSubCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Information of Category</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="modal-content animate" style="padding: 5px;border-top:none;border-bottom: none" action="add-sub-category" method="POST">


                    <div class="container">
                        <label for="category"><b>Name of SubCategory</b></label><br>
                        <input class="text" type="text" placeholder="Enter name of category" name="name" value="${SubCategory.subCategoryName}" required><br>

                        <div class="form-group">
                            <label for="exampleFormControlSelect1"><b>Category</b></label>
                            <select class="form-control" name="category"id="exampleFormControlSelect1">
                                <c:forEach items="${listCategory}" var="category">
                                    <option <c:if test="${subCategory.categoryId eq category.id }">selected</c:if> value="${category.id}">${category.category}</option>
                                </c:forEach>
                            </select>

                        </div>
                        <div class="form-group">
                            <label for="status"><b>status of Category</b></label>
                            <select class="form-control" name="status"id="exampleFormControlSelect1">
                                <c:forEach items="${listStatusSubCategory}" var="SubCategory">
                                    <option <c:if test="${SubCategory.id eq subCategory.status}">selected</c:if> value="${SubCategory.id}">${SubCategory.status}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <button class="btn btn-outline-info" style="width: 55%" type="submit" ><i class="fas fa-sync-alt mr-2"></i>Add Category</button>
                        <a data-dismiss="modal" class="btn btn-outline-danger" style="width: 44%" ><i class="fas fa-window-close mr-2"></i>Cancel</a>
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

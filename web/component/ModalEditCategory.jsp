<%-- 
    Document   : ModalEditCategory
    Created on : Nov 3, 2019, 10:51:42 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Information of Category</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="modal-content animate" style="padding: 5px;border-top:none;border-bottom: none" action="edit-category" method="POST">


                    <input type="hidden" name="id" value="${category.id}">

                    <div class="container">
                        <label for="code"><b>Name of category</b></label>
                        <input class="text" type="text" placeholder="Enter name of subcategory" name="category" value="${category.category}" required>

                        <div class="form-group">
                            <label for="status"><b>status of Category</b></label>
                            <select class="form-control" name="status"id="exampleFormControlSelect1">
                                <c:forEach items="${listStatusCategory}" var="statusCategory">
                                    <option <c:if test="${statusCategory.code eq category.status}">selected</c:if> value="${statusCategory.id}">${statusCategory.status}</option>
                                </c:forEach>
                            </select>
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

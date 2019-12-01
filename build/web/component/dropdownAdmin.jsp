<%-- 
    Document   : dropdownAdmin
    Created on : Nov 4, 2019, 9:46:28 AM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-fw fa-folder"></i>
        <span>Add New Something</span>
    </a>
    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
        <h6 class="dropdown-header">Add Screens:</h6>
        <a onclick="addProduct();" class="dropdown-item">Product</a>
        <a onclick="addCategory()();" class="dropdown-item">Category</a>
        <a onclick="addSubCategory();" class="dropdown-item">SubCategory</a>
        <a onclick="addAccount();" class="dropdown-item">Account</a>
        <div class="dropdown-divider"></div>
        <h6 class="dropdown-header">Other Pages:</h6>
        <a class="dropdown-item" href="404.html">404 Page</a>
        <a class="dropdown-item" href="blank.html">Blank Page</a>
    </div>
</li>
<%@include file="../component/ModalAddProduct.jsp" %>
<%@include file="../component/ModalAddCategory.jsp" %>
<%@include file="../component/ModalAddSubCategory.jsp" %>
<%@include file="../component/ModalAddAccount.jsp" %>
<script>
    function addProduct(){
        $(document).ready(function () {
            $('#modalAddProduct').modal('show');
        });
    }
    function addCategory(){
        $(document).ready(function () {
            $('#modalAddCategory').modal('show');
        });
    }
    function addSubCategory(){
        $(document).ready(function () {
            $('#modalAddSubCategory').modal('show');
        });
    }
    function addAccount(){
        $(document).ready(function () {
            $('#modalAddAccount').modal('show');
        });
    }
</script>

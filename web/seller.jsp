<%-- 
    Document   : sell
    Created on : Jan 31, 2021, 5:52:57 PM
    Author     : USER
--%>
<%@page import="java.util.Map"%>
<%@page import="kynqh.dtos.Product"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Seller Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js' type='text/javascript'></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {        
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }	
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }    
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {    
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }	
            .modal form label {
                font-weight: normal;
            }	
        </style>

    </head>
    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="home">HOMEPAGE</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <c:if test="${sessionScope.account != null}">
                        <li><a href="LogoutController"><span class="glyphicon glyphicon-log-in"></span> Đăng xuất</a></li>
                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
                        </c:if>
                </ul>
            </div>
        </nav>

        <c:if test="${sessionScope.messages != null  }">
            <div class="alert alert-success" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>Thêm sản phẩm thành công</strong>
            </div>
        </c:if>
        <script>
            window.setTimeout(function () {
                $(".alert").fadeTo(500, 0).slideUp(500, function () {
                    $(this).remove();
                });
            }, 2000);
        </script>
        <!--        Product Table-->
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Products</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>						
                            </div>
                        </div>
                    </div>
                    <%
                        List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
                        if (listProduct != null) {
                            if (listProduct.size() > 0) {

                    %>

                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Price(per Product)</th>
                                <th>Quantity</th>
                                <th>Type</th>
                                <th>Image</th>
                                <th>Description</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int count = 0;
                                for (int i = 0; i < listProduct.size(); i++) {
                                    Product prod = listProduct.get(i);
                                    count++;
                            %>
                            <tr>
                        <script>
                            $('a[href="#editEmployeeModal"]').on('click', function () {
                                //$(this).attr('data-id');
                                var id = $(this).attr('data-id');
                                var txtID;

                                txtID = $(".modal-body #txtID").val(id);
                            });

                        </script>
                        <input type="hidden" id="dbID" name="dbID" value="<%= prod.getProID()%>"/>
                        <td><%= count%></td>
                        <td><%= prod.getProName()%></td>
                        <td><%= prod.getPrice()%> VND</td>
                        <% if (prod.getQuantity() == 0) {%>
                        <td style="color: red">Hết hàng</td>
                        <%} else {%>
                        <td><%= prod.getQuantity()%></td>
                        <%}%>
                        <% if (prod.getCateID() == 1) { %>
                        <td>Food</td>
                        <%} else if (prod.getCateID() == 2) {%>
                        <td>Drink</td>
                        <%} else if (prod.getCateID() == 3) {%>
                        <td>Plant</td>
                        <%} else {%>
                        <td>N/A</td>
                        <%}%>
                        <td><img src="images/<%= prod.getImgName()%>" height="100px" width="100px"></td>
                        <td><%= prod.getDescription()%></td>
                        <td>
                            <a href="#editEmployeeModal" data-id="<%= prod.getProID()%>" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                        </td>

                        <%
                            }
                        %>
                        </tr>

                        </tbody>
                    </table>

                    <%
                    } else {
                    %>
                    <font color="red">
                    <td>Chưa có sản phẩm nào.</td>
                    </font>    
                    <%
                            }
                        }
                    %>
                </div>
            </div>        
        </div>
        <!--        Order table-->
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8">
                                <h2>Manage <b>Orders</b></h2>
                            </div>
                        </div>
                    </div>
                    <%
                        List<Map> listOrder = (List<Map>) request.getAttribute("listOrder");
                        if (listOrder != null) {
                            if (!listOrder.isEmpty()) {
                    %>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Order ID</th>
                                <th>Product Name</th>
                                <th>Customer Name</th>
                                <th>Price(per product)</th>
                                <th>Quantity</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int count = 0;
                                for (Map ord : listOrder) {
                            %>
                            <tr>
                                <td><%= count++%></td>
                                <td><%= ord.get("ordID")%></td>
                                <td><%= ord.get("proName")%></td>
                                <td><%= ord.get("fullName")%></td>
                                <td><%= ord.get("price")%></td>
                                <td><%= ord.get("quantity")%></td>
                                <td><%= ord.get("phoneNumber")%></td>
                                <td><%= ord.get("address")%></td>
                                <td><%= ord.get("date")%></td>
                                <% if (ord.get("status").equals(1)) {%>
                                <td style="color: green">Thành công</td>
                                <%} else {%>
                                <td style="color: grey">Đã hủy</td>
                                <%}%>
                                <%}%>
                            </tr>
                        </tbody>
                    </table>
                    <%} else {%>
                    <font color="red">
                    <td>Chưa có đơn hàng nào</td>
                    </font> 
                    <%
                            }
                        }
                    %>
                </div>
            </div>        
        </div>

        <!-- Insert Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="InsertProductController" enctype="multipart/form-data" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Product Name</label>
                                <input type="text" class="form-control" name="txtProName" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="number" class="form-control" name="productPrice" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="number" class="form-control" name="productQuantity" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="txtDescription"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Categories</label>
                                <select name="listType" >
                                    <option value="1">Food</option>
                                    <option value="2">Drink</option>
                                    <option value="3">Plant</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="file" class="form-control" accept="image/*" name="imgUp" required>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" name="action" value="AddProduct">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="MainController" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Update Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Price(per product)</label>
                                <input type="number" class="form-control" name="txtPrice" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="number" class="form-control" name="txtQuantity" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="txtDescription" required></textarea>
                            </div>

                            <input type="hidden" name="txtID" id="txtID" value=""/>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" name="action" value="UpdateProduct">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
    </body>

</html>

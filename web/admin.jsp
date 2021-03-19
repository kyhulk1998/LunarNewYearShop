<%-- 
    Document   : admin
    Created on : Jan 31, 2021, 11:47:58 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kynqh.dtos.Account"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Admin Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Roboto', sans-serif;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 10px;
                margin: 0 0 10px;
                min-width: 100%;
            }
            .table-title h2 {
                margin: 8px 0 0;
                font-size: 22px;
            }
            .search-box {
                position: relative;        
                float: right;
            }
            .search-box input {
                height: 34px;
                border-radius: 20px;
                padding-left: 35px;
                border-color: #ddd;
                box-shadow: none;
            }
            .search-box input:focus {
                border-color: #3FBAE4;
            }
            .search-box i {
                color: #a0a5b1;
                position: absolute;
                font-size: 19px;
                top: 8px;
                left: 10px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
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
            table.table td:last-child {
                width: 130px;
            }
            table.table td a {
                color: #a0a5b1;
                display: inline-block;
                margin: 0 5px;
            }
            table.table td a.view {
                color: #03A9F4;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #E34724;
            }
            table.table td i {
                font-size: 19px;
            }    
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 95%;
                width: 30px;
                height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 30px !important;
                text-align: center;
                padding: 0;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a {
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
                margin-top: 6px;
                font-size: 95%;
            }    
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
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
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8"><h2>Manage <b>Accounts</b></h2></div>
                            <div class="col-sm-4">
                                <div class="search-box">
                                    <form action="MainController" method="POST">     
                                        <i class="material-icons">&#xE8B6;</i>
                                        <input type="text" class="form-control" name="txtSearch" placeholder="Tìm kiếm.." required/>    
                                        <input type="submit" name="action" value="searchUser" hidden/>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        List<Account> listAcc = (List<Account>) request.getAttribute("listAcc");
                        if (listAcc != null) {
                            if (listAcc.size() > 0) {

                    %>
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Username</th>
                                <th>Type</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                int count = 0;
                                for (Account acc : listAcc) {
                                    count++;
                            %>
                            <tr>
                                <td><%= count%></td>
                                <td><%= acc.getUsername()%></td>

                                <!--Seller Role-->
                                <% if (acc.getIsSell() == 0) {%>
                                <% if (acc.getIsAdmin() == 1) {%>
                                <td>Super User</td>
                                <%} else {%>
                                <td> User </td>
                                <%}%>
                                <%} else {%>
                                <td> Seller </td>
                                <%}%>

                                <!--Admin Role-->
                                <% if (acc.getIsAdmin() == 0) {%>
                                <td>User</td>
                                <%} else {%>
                                <td>Admin</td>
                                <%
                                    }
                                %>

                                <!--Active Role-->
                                <% if (acc.getIsActive() == 0) {%>
                                <td>Disabled</td>
                                <td>
                                    <a href="MainController?action=Enable&username=<%= acc.getUsername()%>&txtSearch=<%= request.getParameter("txtSearch")%>" title="Enable"> <i class="fa fa-lock" style="color: red"></i></a>
                                </td>
                                <%} else {%>
                                <td style="color: green">Available</td>
                                <td>
                                    <a href="MainController?action=Disable&username=<%= acc.getUsername()%>&txtSearch=<%= request.getParameter("txtSearch")%>" title="Disable"> <i class="fa fa-unlock" style="color: grey"></i></a>
                                </td>
                                <%
                                    }
                                %>

                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                    <%
                    } else {
                    %>
                    <font style="color: red">
                    No record found.
                    </font>
                    <%
                            }
                        }
                    %>

                </div>
            </div>  
        </div>   
    </body>
</html>

<%-- 
    Document   : home
    Created on : Jan 26, 2021, 9:09:37 PM
    Author     : USER
--%>

<%@page import="kynqh.dtos.Product"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html" charset="utf-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Shop đồ Tết</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/product.css"/>


    </head>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> +84-333-721-887</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> kynguyen5698@gmail.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> Ho Chi Minh city</a></li>
                    </ul>
                    <ul class="header-links pull-right">

                        <c:if test="${sessionScope.account != null}">
                            <c:if test="${sessionScope.account.isSell == 1}">
                                <li><a href="#">Hello, ${sessionScope.account.username} </a></li>
                                <li><a href="ViewProductController"><i class="fa fa-address-card-o"></i>Manage</a></li>
                                <li><a href="LogoutController"><i class="fa fa-user-o"></i>Đăng xuất</a></li>
                                </c:if>
                                <c:if test="${sessionScope.account.isSell == 0}"> 
                                <li><a href="#">Welcome back, ${sessionScope.account.username} </a></li>
                                <li><a href="ViewOrderCustomerName"><i class="fa fa-address-card-o"></i>Tình trạng đơn hàng</a></li>
                                <li><a href="LogoutController"><i class="fa fa-user-o"></i>Đăng xuất</a></li>
                                </c:if>
                            </c:if>
                            <c:if test="${sessionScope.account == null}">
                            <li><a href="searchOrder.jsp"><i class="fa fa-search"></i>Tra cứu đơn hàng</a></li>
                            <li><a href="login.jsp"><i class="fa fa-user-o"></i>Đăng nhập/Đăng kí</a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="home" class="logo">
                                    <img src="./img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="MainController" method="POST">  
                                    <input type="text" class="input" placeholder="Search here" name="txtSearchProduct" required/>
                                    <input type="submit" class="search-btn" name="action" value="Search"/>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Cart -->
                                <div class="dropdown">
                                    <a  href="cart.jsp" class="dropdown-toggle" >
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Giỏ hàng</span>
                                    </a>

                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->

                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->
        <!-- SECTION -->
        <%
            List<Product> listCategory = (List<Product>) request.getAttribute("listC");
        %>

        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- ASIDE -->

                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Danh mục</h3>
                            <div class="checkbox-filter">
                                <%
                                    for (Product prod : listCategory) {
                                %>
                                <%
                                    if (prod.getCateID() == 1) {
                                %>
                                <div class="input-checkbox">
                                    <input type="checkbox" id="category-1">
                                    <label for="category-1">
                                        <span></span>
                                        <a href="MainController?action=GetProductByCateID&id=<%= prod.getCateID()%>">Đồ ăn</a>
                                    </label>
                                </div>
                                <%}
                                    if (prod.getCateID() == 2) {%>
                                <div class="input-checkbox">
                                    <input type="checkbox" id="category-2">
                                    <label for="category-2">
                                        <span></span>
                                        <a href="MainController?action=GetProductByCateID&id=<%= prod.getCateID()%>">Thức uống</a>
                                    </label>
                                </div>
                                <%}
                                    if (prod.getCateID() == 3) {%>
                                <div class="input-checkbox">
                                    <input type="checkbox" id="category-3">
                                    <label for="category-3">
                                        <span></span>
                                        <a href="MainController?action=GetProductByCateID&id=<%= prod.getCateID()%>">Cây kiểng</a>
                                    </label>
                                </div>
                                <%}%>
                                <%
                                    }
                                %>
                            </div>

                        </div>
                        <!-- /aside Widget -->
                        <%
                            List<Product> max = (List<Product>) request.getAttribute("Max");
                        %>
                        <%
                            for (Product prod : max) {
                        %>
                        <div class="aside">
                            <h3 class="aside-title">Sản phẩm bán chạy nhất</h3>
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./images/<%= prod.getImgName()%>" alt="" width="500px" height="99px">
                                </div>
                                <div class="product-body">
                                    <%if (prod.getCateID() == 1) {%>
                                    <p class="product-category">Đồ ăn</p>
                                    <%} else if (prod.getCateID() == 2) {%>
                                    <p class="product-category">Thức uống</p>
                                    <%} else if (prod.getCateID() == 3) {%>
                                    <p class="product-category">Cây kiểng</p>
                                    <%}%>
                                    <h3 class="product-name"><a href="#"><%=prod.getProName()%></a></h3>
                                    <h4 class="product-price"><%=prod.getPrice()%></h4>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <div class="store-filter clearfix">
                            <div class="store-sort">
                                <label>
                                    Sort By:
                                    <select class="input-select">
                                        <option value="0">All</option>

                                    </select>
                                </label>

                                <label>
                                    Show:
                                    <select class="input-select">
                                        <option value="0">All</option>

                                    </select>
                                </label>
                            </div>
                            <ul class="store-grid">
                                <li class="active"><i class="fa fa-th"></i></li>
                                <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                            </ul>
                        </div>
                        <!-- /store top filter -->
                        <!-- store products -->
                        <%
                            List<Product> listPro = (List<Product>) request.getAttribute("listP");
                        %>

                        <div class="row">
                            <%
                                for (Product prod : listPro) {
                            %>
                            <!-- product -->
                            <div class="col-md-4 col-xs-6">
                                <div class="product">
                                    <input type="hidden" value="<%= prod.getProID()%>"/>
                                    <input type="hidden" id="txtDescription" value="<%= prod.getDescription()%>"/>
                                    <div class="product-img">
                                        <img src="./images/<%= prod.getImgName()%>" width="200px" height="200px">
                                    </div>

                                    <div class="product-body">
                                        <%if (prod.getCateID() == 1) {%>
                                        <p class="product-category">Đồ ăn</p>
                                        <%} else if (prod.getCateID() == 2) {%>
                                        <p class="product-category">Thức uống</p>
                                        <%} else if (prod.getCateID() == 3) {%>
                                        <p class="product-category">Cây kiểng</p>
                                        <%}%>
                                        <h3 class="product-name"><a href="#"></a><%= prod.getProName()%></h3>
                                        <h4 class="product-price"><%= prod.getPrice()%> VND.
                                            <div class="product-rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>


                                    </div>
                                    <div class="add-to-cart">
                                        <form action="MainController" method="POST">
                                            <input type="hidden" name="intProID" value="<%= prod.getProID()%>"/>
                                            <input type="hidden" name="txtProName" value="<%= prod.getProName()%>"/>
                                            <input type="hidden" name="intPrice" value="<%= prod.getPrice()%>"/>
                                            <button class="add-to-cart-btn" type="submit" value="addCart" name="action"><i class="fa fa-shopping-cart"></i> add to cart</button>    
                                        </form>

                                    </div>

                                </div>
                            </div>
                            <!-- /product -->
                            <%}%>
                        </div>

                        <!-- /store products -->
                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">About Us</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Hot deals</a></li>
                                    <li><a href="#">Laptops</a></li>
                                    <li><a href="#">Smartphones</a></li>
                                    <li><a href="#">Cameras</a></li>
                                    <li><a href="#">Accessories</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Information</h3>
                                <ul class="footer-links">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Orders and Returns</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Service</h3>
                                <ul class="footer-links">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">Wishlist</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->


        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//nhanh.vn/js/events/newyear.js"></script>
        <iframe src="https://www.nhaccuatui.com/lh/background/6DqYD1PatM8q" width="1" height="1" frameborder="0" allowfullscreen allow="autoplay"></iframe>
    </body>
</html>


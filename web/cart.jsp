<%-- 
    Document   : view
    Created on : Oct 7, 2020, 2:29:49 PM
    Author     : ACER
--%>


<%@page import="kynqh.dtos.Product"%>
<%@page import="kynqh.dtos.CartObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="utf-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Giỏ hàng</title>

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
        <%
            CartObj shoppingCart = (CartObj) session.getAttribute("cart");

        %>
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



    <div class="section">

        <div class="container">
            <%                        
                if (shoppingCart != null) {
                  
            %>
            <h1> Chi tiết giỏ hàng </h1>
            <form action="MainController" method="POST">
                <table class="table">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 0;
                            for (Product dto : shoppingCart.getCart().values()) {
                                count++;
                        %>
                        <tr>

                            <td><%= count%></td>
                            <td><%= dto.getProName()%></td>
                            <td>
                                <input type="number" name="txtQuantity" value="<%= dto.getQuantity()%>"/>
                                <input type="hidden" name="txtId" value="<%= dto.getProID()%>"/>

                            </td>
                            <td><%= dto.getPrice()%> VNĐ</td>
                            <td>
                                <input type="checkbox" name="chkRemove" value="<%= dto.getProID()%>"/>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td></td>
                            <td>
                                <a href="home" class="btn btn-default">Tiếp tục mua hàng</i></a>
                            </td>
                            <td></td>
                            <td>
                                <strong>Tổng cộng:</strong> <%= shoppingCart.getTotal()%> VNĐ
                            </td>
                            <td>
                                <input type="submit" name="action"  class="btn btn-primary" value="UpdateCart"/>
                                <input type="submit" name="action" class="btn btn-danger" value="RemoveItem"/>
                            </td> 
                        </tr>
                    </tbody>
                </table>
            </form>

            <div class="d-flex justify-content-center"><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Tiến hành thanh toán</button></div>
            <%
            } else {
            %>

            <p style="color: red">Chưa có sản phẩm nào.<a href="home">Bấm</a> vào đây để mua hàng</p>

            <%
                }
            %>
        </div>
    </div>

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

    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thông báo</h4>
                </div>
                <div class="modal-body">
                    <p>Do tình hình dịch bệnh. Chúng tôi sẽ ngừng việc nhận hàng tại cửa hàng. Vui lòng điền thông tin giao hàng. Cám ơn quý khách!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <!--                        NOT DONE-->
                    <input href="thank.jsp" class="btn btn-primary" value="Nhận hàng tại cửa hàng" disabled/>
                    <a href="checkout.jsp" class="btn btn-success">Giao hàng</a>
                </div>
            </div>

        </div>
    </div>

    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript" src="//nhanh.vn/js/events/newyear.js"></script>
    <iframe src="https://www.nhaccuatui.com/lh/background/6DqYD1PatM8q" width="1" height="1" frameborder="0" allowfullscreen allow="autoplay"></iframe>
</body>
</html>

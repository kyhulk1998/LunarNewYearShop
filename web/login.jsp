<%-- 
    Document   : login
    Created on : Jan 27, 2021, 12:13:22 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/login.css"/>
        <title>Login</title>
    </head>
    <body>

        <div class="container right-panel-active">
            <!-- Sign Up -->
            <div class="container__form container--signin">
                <form action="MainController" class="form" method="POST">
                    <h2 class="form__title">Đăng ký</h2>
                    <span style="color: red" id="mess"> ${message1} </span>
                    <input type="text" placeholder="Tên đăng nhập" class="input" maxlength="50" name="txtUsername" required/>
                    <input type="password" placeholder="Mật khẩu" class="input" name="txtPassword" id="password" onkeyup="check()" required/>
                    <input type="password" placeholder="Nhập lại mật khẩu" class="input" name="txtConfirm" id="confirm_password" onkeyup="check()" required/>
                    <span id='message'></span>
                    <p>Bạn là: </p>
                    <div>
                        <div class="radio">
                            <input id="radio-1" name="isSeller" type="radio" value="0" checked>
                            <label for="radio-1" class="radio-label">Người mua</label>
                        </div>
                        <div class="radio">
                            <input id="radio-2" name="isSeller" type="radio" value="1">
                            <label  for="radio-2" class="radio-label">Người bán</label>
                        </div>
                    </div>
                    <button type="submit" class="btn" name="action" value="Register" id="registerBtn" onkeyup="check()">Đăng ký</button>
                </form>
            </div>

            <script>

                function check() {
                    var password = document.getElementById('password');
                    var confirm_password = document.getElementById('confirm_password');
                    var reg_submit_btn = document.getElementById('registerBtn');

                    if (password.value != confirm_password.value) {
                        reg_submit_btn.disabled = true;
                        document.getElementById('message').style.color = 'red';
                        document.getElementById('message').innerHTML = 'Không trùng khớp';
                    } else {
                        reg_submit_btn.disabled = false;
                        document.getElementById('message').style.color = 'green';
                        document.getElementById('message').innerHTML = 'Trùng khớp';
                    }
                }


            </script>


            <!-- Sign In -->
            <div class="container__form container--signup">
                <form action="MainController" method="POST" class="form">
                    <h2 class="form__title"> Đăng nhập </h2>
                    <span style="color: red">${message}</span>
                    <span style="color: green">${messageSuccess}</span>
                    <input type="text" name="txtUsername" class="input" placeholder="Tên đăng nhập" required/>
                    <input type="password" name="txtPassword" class="input" placeholder="Mật khẩu" required/>

                    <button type="submit" class="btn" name="action" value="Login">Đăng nhập</button>
                </form>
            </div>





            <!-- Overlay -->
            <div class="container__overlay">
                <div class="overlay">
                    <div class="overlay__panel overlay--left">
                        <button class="btn" id="signIn">Chưa có tài khoản</button>
                    </div>
                    <div class="overlay__panel overlay--right">
                        <button class="btn" id="signUp">Đã có tài khoản</button>
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
        <script src="js/login.js"></script>
        <script type="text/javascript" src="//nhanh.vn/js/events/newyear.js"></script>
        <iframe src="https://www.nhaccuatui.com/lh/background/6DqYD1PatM8q" width="1" height="1" frameborder="0" allowfullscreen allow="autoplay"></iframe>
    </body>
</html>

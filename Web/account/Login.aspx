<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="account_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="商品关键词" />
    <meta name="Description" content="商品信息描述-->SEO" />
    <title>登录</title>
    <link rel="shortcut icon" href="../resource/favicon1.ico" />
    <link rel="icon" href="../resource/favicon.ico" type="image/gif" />
    <script type="text/javascript" src="../resource/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../resource/common.js"></script>
    <script type="text/javascript" src="../resource/user.js"></script>
    <script type="text/javascript" src="../resource/transport.js"></script>
    <link href="../resource/main.css" rel="stylesheet" type="text/css">
    <link href="../resource/main(1).css" rel="stylesheet" type="text/css">
    <link href="../resource/reset.css" rel="stylesheet" type="text/css">
    <link href="../resource/index.css" rel="stylesheet" type="text/css">
</head>

<script type="text/javascript" src="../resource/jquery1.7.js"></script>
<script type="text/javascript" src="../resource/silder.js"></script>
<script type="text/javascript" src="../resource/pop.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".main_visual").hover(function () {
            $("#btn_prev,#btn_next").fadeIn()
        }, function () {
            $("#btn_prev,#btn_next").fadeIn()
        });
        $dragBln = false;
        $(".main_image").touchSlider({
            flexible: true,
            speed: 200,
            btn_prev: $("#btn_prev"),
            btn_next: $("#btn_next"),
            paging: $(".flicking_con a"),
            counter: function (e) {
                $(".flicking_con a").removeClass("on").eq(e.current - 1).addClass("on");
            }
        });
        $(".main_image").bind("mousedown", function () {
            $dragBln = false;
        });
        $(".main_image").bind("dragstart", function () {
            $dragBln = true;
        });
        $(".main_image a").click(function () {
            if ($dragBln) {
                return false;
            }
        });
        timer = setInterval(function () {
            $("#btn_next").click();
        }, 5000);
        $(".main_visual").hover(function () {
            clearInterval(timer);
        }, function () {
            timer = setInterval(function () {
                $("#btn_next").click();
            }, 5000);
        });
        $(".main_image").bind("touchstart", function () {
            clearInterval(timer);
        }).bind("touchend", function () {
            timer = setInterval(function () {
                $("#btn_next").click();
            }, 5000);
        });
    });
</script>
<body>
    <div class="head">
        <div class="logo">
            <a href="#">
                <img src="../resource/logo1.png"></a>
        </div>
        <div class="menu">
            <ul>
                <li class="select" id="pop" style="position: relative">
                    <a href="#" style="display: block;">产品
                            <img src="../resource/icon-1.png"></a>
                    <div class="pop_menu" style="display: none;">
                        <ul>
                            <li><a href="../product/Omate.aspx">Omate X</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="../appstore/Index.aspx">应用市场</a></li>
                <li><a href="../self/Index.aspx">联系我们</a></li>
            </ul>
        </div>
        <div class="head_r">
            <div style="float: right;">
                <a href="Cart.aspx" style="display: block; margin-top: 18px;">
                    <img src="../resource/icon-2.png"></a>
            </div>
            <ul style="display: block; float: right;">
                <li><a href="../account/Login.aspx">登录</a></li>
                <li><a href="../account/Register.aspx">注册</a></li>
                <li><a href="../product/StoreOnLine.aspx">在线商城</a></li>
            </ul>

        </div>
        <div style="clear: both"></div>
    </div>
    <div class="logreBG">
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="loginBox">
            <div class="logTitle">登陆</div>
            <form name="formLogin" runat="server" method="post" onsubmit="return userLogin()">
                <div class="logInfo">
                    <ul>
                        <li>昵　称：<input class="inpuTxt" runat="server" name="username" id="username">
                        </li>
                        <a id="usernameTip"  runat="server" style="margin-left: 70px;"></a>
                        <li>密　码：<input name="password" runat="server" type="password" class="inpuTxt" id="password">
                            <a href="Password.aspx">忘记密码？</a></li>
                        <a id="passwordTip" runat="server" style="margin-left: 70px;"></a>
                        <%--<li>
                            <div class="clickBox">
                                <input type="checkbox" value="" checked="checked">记住密码
                            </div>
                            <div class="clickBoxs">
                                <input type="checkbox" value="">下次直接登陆
                            </div>
                            <div class="clear"></div>
                        </li>--%>
                        <div class="logBbox">
                            <input type="submit" runat="server" id="btn_Login" onserverclick="btn_Login_Click" style="background-color:yellowgreen;" class="logBtn" value="登录">
                            <a class="freeReg" href="../account/Register.aspx">免费注册</a>
                        </div>
                        <div class="clear"></div>
                    </ul>
                    <input type="hidden" name="act" value="act_login">
                    <input type="hidden" runat="server" id="back_act" value="">
                </div>
            </form>
            <img class="shadow" src="../resource/shadow.jpg">
        </div>
    </div>
    <div class="footer">
        <div class="footer_main">
            <div class="f_l">
                <img src="../resource/logo1.png">
            </div>
            <div class="f_c">
                <a href="https://www.facebook.com/omatetruesmart" target="_blank">
                    <img src="../resource/down-icon1.png"></a><a href="https://twitter.com/OmateTrueSmart" target="_blank"><img src="../resource/down-icon2.png"></a><a href="https://plus.google.com/u/0/b/104860063598575161591/104860063598575161591/posts" target="_blank"><img src="../resource/down-icon3.png"></a>
            </div>
            <div class="f_r">
                <img src="../resource/down-icon4.png">
                Contact Us<br>
                Customer Service:<a href="mailto:service@omate.com" style="color: #FFFFFF">　service@omate.com</a><br>
                Tel:+86 4008058998
            </div>
            <div style="clear: both"></div>
        </div>
    </div>
    <script>
        function userLogin() {
            if ($("#username").val() == '') {
                $("#usernameTip").html("<font style='color:red'> *请输入用户名或者注册邮箱 </font>");
                $("#username").focus();
                return false;
            }
            if ($("#username").val().length <= 1) {
                $("#usernameTip").html("<font style='color:red'> *用户名过短 </font>");
                $("#username").focus();
                return false;
            }
            $("#usernameTip").html("");


            if ($("#password").val() == '') {

                $("#passwordTip").html("<font style='color:red'> *请输入密码 </font>");
                $("#password").focus();
                return false;
            }
            if ($("#password").val().length < 6) {
                $("#passwordTip").html("<font style='color:red'> *密码需大于6个字节 </font>");
                $("#password").focus();
                return false;
            }
            $("#passwordTip").html("");

            return true;
        }
    </script>
</body>
</html>


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendVMsg.aspx.cs" Inherits="account_SendVMsg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="../resource/main.css" rel="stylesheet" type="text/css">
    <link href="../resource/style.css" rel="stylesheet" type="text/css">
    <link href="../resource/index.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .login {
            width: 990px;
            margin: 0 auto;
        }

            .login a {
                font-weight: bold;
                color: #0066CC;
                font-size: 12px;
                text-decoration: none;
            }

                .login a:hover {
                    color: #FF6600;
                }

        .login_form {
            padding-bottom: 10px;
            width: 981px;
            margin: 0 auto;
            border: 1px solid #cccccc;
            background: #FFFFFF;
        }

        .login_title {
            font-size: 14px;
            padding: 5px;
            height: 25px;
            background: url(themes/default/images/login_img/title.jpg);
            background-repeat: repeat-x;
        }

            .login_title span {
                display: block;
                float: right;
            }

        .login_item {
            width: 850px;
            height: 189px;
            background-image: url(themes/default/images/login_img/errorBg1.jpg);
            background-position: right bottom;
            background-repeat: no-repeat;
            margin: 0 auto;
            padding-top: 15px;
            padding-bottom: 15px;
            font-size: 12px;
        }

            .login_item span {
                display: block;
                width: 150px;
                float: left;
                text-align: right;
                font-size: 14px;
            }

        .text {
            font-family: "宋体";
            font-size: 16px;
            color: #990000;
            font-weight: bold;
            width: 600px;
            padding: 5px;
            margin: 0 auto;
            text-align: center;
            margin-top: 50px;
        }

        .text2 {
            font-family: "宋体";
            font-size: 16px;
            color: #990000;
            font-weight: bold;
            width: 100%;
            padding: 5px;
            margin: 20px auto;
            text-align: center;
            margin-top: 50px;
        }

            .text2 span a {
                color: #03a2a7;
                font-family: "microsoft yahei";
                font-size: 14px;
                font-weight: normal;
            }

        .msgbg {
            width: 907px;
            height: 30px;
            margin-bottom: 20px;
            padding: 110px 0;
            text-align: center;
            background: url(themes/default/images/sussbg2.png);
        }

            .msgbg p {
                color: #000;
            }

            .msgbg h1 {
                color: #000;
            }

        .button_sub {
            width: 167px;
            height: 31px;
            background-image: url(themes/default/images/login_img/bottom.jpg);
            border: 0px;
        }

        .text_sing {
            font-size: 12px;
            line-height: 15px;
        }

        .new_rigster {
            float: left;
        }

        .ser {
            font-size: 12px;
            padding-top: 10px;
            margin: 0 auto;
            width: 990px;
            text-align: center;
        }

        .login_left {
            width: 650px;
            margin: 0 auto;
        }

        .login_right {
            height: 200px;
            font-size: 12px;
            margin-top: 20px;
            margin-left: 20px;
            border-left: 1px solid #CCCCCC;
            width: 310px;
            float: left;
        }

        .new_reg {
            padding-top: 20px;
            padding-left: 20px;
        }

        .login_sub {
            padding-top: 10px;
            padding-bottom: 20px;
            margin-left: 145px;
        }

        .three_login {
            margin-top: 20px;
            font-size: 12px;
            padding-left: 20px;
        }

        .reg_line {
            font-size: 12px;
            margin-left: 130px;
            padding-bottom: 20px;
        }
    </style>


    <link href="../resource/reset.css" rel="stylesheet" type="text/css">
    <link href="../resource/slide.css" rel="stylesheet" type="text/css">
    <title>OMATE</title>

</head>

<body>
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
    <div style="width: 100%; background: #242424; padding-top: 50px; padding-bottom: 100px;">
        <div class="login" style="color: #ffffff;">
            <div class="login_form" style="border: none">
                <div class="login_title" style="background: #525252; height: 50px; line-height: 50px; padding: 0 0 0 15px; font-size: 18px;">
                    <div class="new_rigster"><strong style="font-weight: normal;">温馨提示</strong></div>
                </div>

                <div class="">
                    <div class="text2">
                        <div class="msgbg">
                            <p>重置密码的邮件已经发到您的邮箱：zhanxueguang@yeah.net</p>
                            <br>
                        </div>
                        <div style="width: 400px; margin: 0 auto;">
                            <span class="fo" style="line-height: 25px;"><a href="http://china.omate.com/">返回首页</a></span>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
    <div style="clear: both"></div>

    <div class="footer">
        <div class="footer_main">
            <div class="f_l">
                <img src="../resource/logo1.png"></div>
            <div class="f_c"><a href="https://www.facebook.com/omatetruesmart" target="_blank">
                <img src="../resource/down-icon1.png"></a><a href="https://twitter.com/OmateTrueSmart" target="_blank"><img src="../resource/down-icon2.png"></a><a href="https://plus.google.com/u/0/b/104860063598575161591/104860063598575161591/posts" target="_blank"><img src="../resource/down-icon3.png"></a></div>
            <div class="f_r">
                <img src="../resource/down-icon4.png">
                Contact Us<br>
                Customer Service:<a href="mailto:service@omate.com" style="color: #FFFFFF">　service@omate.com</a><br>
                Tel:+86 4008058998
            </div>
            <div style="clear: both"></div>
        </div>
    </div>
</body>
</html>

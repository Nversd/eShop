<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="self_Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="Keywords" content="认证说明">
    <meta name="Description" content="">
    <title>联系我们</title>
    <link rel="shortcut icon" href="http://china.omate.com/favicon.ico">
    <link rel="icon" href="http://china.omate.com/animated_favicon.gif" type="image/gif">
    <link href="../resource/style.css" rel="stylesheet" type="text/css">
    <link href="../resource/reset.css" rel="stylesheet" type="text/css">
    <link href="../resource/slide.css" rel="stylesheet" type="text/css">
    <link href="../resource/main.css" rel="stylesheet" type="text/css">
    <link href="../resource/index.css" rel="stylesheet" type="text/css">
    <link href="../resource/main(1).css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../resource/common.js"></script>
    <script>
        var process_request = "正在处理您的请求...";
    </script>
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
        <div class="logo"><a href="http://china.omate.com/index.php">
            <img src="../resource/logo1.png"></a></div>
        <div class="menu">
            <ul>
                <li class="select" id="pop" style="position: relative">
                    <a href="http://china.omate.com/article.php?id=43#" style="display: block;">产品
                        <img src="../resource/icon-1.png"></a>
                    <div class="pop_menu" style="display: none;">
                        <ul>
                            <li><a href="http://china.omate.com/index.html">Omate X</a></li>
                            <li style="border-bottom: none"><a href="http://china.omate.com/smart.php">TrueSmart</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="../appstore/Index.aspx">应用市场</a></li>
                <li><a href="#">联系我们</a></li>
            </ul>
        </div>
        <div class="head_r">
            <div style="float: right;"><a href="http://china.omate.com/flow.php" style="display: block; margin-top: 18px;">
                <img src="../resource/icon-2.png"></a></div>
            <ul style="display: block; float: right;">
                <li><a href="http://china.omate.com/user.php?act=login">登录</a></li>
                <li><a href="http://china.omate.com/user.php?act=register">注册</a></li>

                <li><a href="http://china.omate.com/goods.php?id=1">在线商城</a></li>
                <li id="lan" style="position: relative;"><a href="http://china.omate.com/article.php?id=43#" style="display: block; position: relative">中国
                    <img src="../resource/icon-1.png"></a>
                    <div class="langurge" style="position: absolute; display: none; left: -20px; z-index: 100000;">
                        <ul class="langcol">
                            <li><a href="http://www.omatewatch.fr/">
                                <img src="../resource/fr.gif">
                                France</a></li>
                            <li><a href="http://www.omate.com/">
                                <img src="../resource/en.gif">
                                English</a></li>
                            <li><a href="http://www.omate.com.tw/">
                                <img src="../resource/tw.gif">
                                台湾</a></li>
                            <li><a href="http://www.omate.org/">
                                <img src="../resource/ru.gif">
                                Россия</a></li>
                        </ul>
                    </div>
                </li>
            </ul>

        </div>
        <div style="clear: both"></div>
    </div>
    <div class="MsgContent">
        <div class="MsgInfo">
            <div class="local">当前位置: <a href="http://china.omate.com/">首页</a> <code>&gt;</code> 联系我们</div>
            <div class="msgDetail">
                <div class="msgMenu">
                    <ul>
                        <h1>配送方式 </h1>
                        <li><a href="http://china.omate.com/article.php?id=16">配送范围与运费</a></li>
                        <li><a href="http://china.omate.com/article.php?id=17">快递上门</a></li>
                        <li><a href="http://china.omate.com/article.php?id=18">验货与签收</a></li>
                    </ul>
                    <ul>
                        <h1>支付方式</h1>
                        <li><a href="http://china.omate.com/article.php?id=19">货到付款</a></li>
                        <li><a href="http://china.omate.com/article.php?id=20">在线支付</a></li>
                        <li><a href="http://china.omate.com/article.php?id=589">发票制度</a></li>
                    </ul>
                    <ul>
                        <h1>售后服务</h1>
                        <li><a href="http://china.omate.com/article.php?id=7">售后服务政策</a></li>
                        <li><a href="http://china.omate.com/article.php?id=22">退换货政策</a></li>
                        <li><a href="http://china.omate.com/article.php?id=44">保修政策</a></li>
                    </ul>
                    <ul>
                        <h1>关于Omate</h1>
                        <li><a href="http://china.omate.com/article.php?id=25">公司简介</a></li>
                        <li><a href="http://china.omate.com/article.php?id=26">管理团队</a></li>
                        <li><a href="../resource/联系我们.html" style="color: #399d9d">联系我们</a></li>
                    </ul>

                </div>
                <div class="MsgRight">
                    <div class="msgTitle">
                        <img src="../resource/triangle.jpg">
                        <div class="TitleBox">
                            <h1>联系我们</h1>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="MsgBox">
                        <p><span style="font-size: small">
                            <img alt="" width="754" height="270" src="../resource/baidumap.jpg"></span></p>
                        <p><span style="font-size: small">联系我们</span></p>
                        <p><span style="font-size: small">邮编：518057</span></p>
                        <p><span style="font-size: small">电话：4008-058-998</span></p>
                        <p><span style="font-size: small">地</span><span style="font-size: small"><span style="font-size: small">址：深圳市南山区科技园高新南一道中国科技开发院18楼</span></span></p>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StoreOnLine.aspx.cs" Inherits="product_StoreOnLine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>在线商城</title>
    <link rel="shortcut icon" href="../resource/favicon1.ico" />
    <link rel="icon" href="../resource/favicon.ico" type="image/gif" />
    <link href="../resource/style.css" rel="stylesheet" type="text/css">
    <link href="../resource/reset.css" rel="stylesheet" type="text/css">
    <link href="../resource/slide.css" rel="stylesheet" type="text/css">
    <link href="../resource/main.css" rel="stylesheet" type="text/css">
    <link href="../resource/index.css" rel="stylesheet" type="text/css">
    <link href="../resource/main(1).css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../resource/action.js"></script>
    <script type="text/javascript" src="../resource/jquery-1.4.4.min.js"></script>
    <style>
        .list {
            margin: 0 auto;
            width: 700px;
            padding-top: 40px;
        }

            .list ul li {
                display: block;
                width: 300px;
                height: 200px;
                border: 2px solid #CCCCCC;
                padding: 10px;
                float: left;
                margin-right: 20px;
                cursor: pointer;
            }

                .list ul li p {
                    text-align: left;
                    font-size: 16px;
                    line-height: 30px;
                }
    </style>
    <script type="text/javascript" src="../resource/json2.js"></script>
    <script type="text/javascript" src="../resource/transport.js"></script>
    <script type="text/javascript" src="../resource/common.js"></script>
    <script type="text/javascript" src="../resource/utils.js"></script>
    <script type="text/javascript" src="../resource/jquery.jqzoom1.0.2.js"></script>
</head>
<body style="">
    <script type="text/javascript">
        var process_request = "正在处理您的请求...";
    </script>
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
    <div style="clear: both"></div>
    <div style="width: 100%; background: #ebebeb; height: 10px;"></div>
    <form runat="server" id="form1">
        <div style="width: 100%; background: #ebebeb;">
        <div class="buyBox" style="margin-top: 0px;">
            <div class="buyTitle">OMATE套餐</div>
            <div class="buyInfo">
                <h1>标准版套餐商品包装清单:</h1>
                <img src="../resource/buy1.jpg">
                <img src="../resource/buy2.jpg">
                <img src="../resource/buy3.jpg">
                <img src="../resource/buy4.jpg">
                <div class="list">
                    <h3 style="text-align: left; font-size: 16px; margin-bottom: 20px;">请选择OMATE版本</h3>
                    <ul runat="server" id="glist">
                        <%--<li value="1" style="border: 2px solid rgb(1, 183, 185); background: url(../resource/tao1.png);"></li>
                        <li value="61" style="background: url(../resource/tao2.png)"></li>--%>
                    </ul>
                    <div style="clear: both"></div>
                    <asp:HiddenField runat="server" ID="goods" />
<%--                    <input type="hidden" value="61" id="goods" runat="server">--%>
                </div>
            </div>
        </div>
    </div>
    <div class="preSale" style="background: #ebebeb">
        <asp:Button runat="server" ID="btn_Submit" OnClick="btn_Submit_Click" />
        <%--<input type="submit" value="" onclick="javascript: selectgoods();">--%>
    </div>
    </form>
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
        function selectgoods() {
            var goods_id = $("#goods").val();
            if (goods_id == '') {
                alert('请选择OMATE版本')
                return false;
            } else {
                addToCart(goods_id);
            }
        }

        $(function () {
            $(".list ul li").eq(0).css("border", "2px solid #01B7B9")
            $(".list ul li").click(function () {
                var selectgoods_id = $(this).attr('value')
                $("#goods").val(selectgoods_id);
                $(this).css("border", "2px solid #01B7B9")
                $(this).siblings().css("border", "2px solid #ccc")
            })
        })

    </script>

</body>
</html>

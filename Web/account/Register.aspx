<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="account_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="商品关键词" />
    <meta name="Description" content="商品信息描述-->SEO" />
    <title>免费注册</title>
    <link rel="shortcut icon" href="../resource/favicon1.ico" />
    <link rel="icon" href="../resource/favicon.ico" type="image/gif" />
    <link href="../resource/main.css" rel="stylesheet" type="text/css">
    <link href="../resource/main(1).css" rel="stylesheet" type="text/css">
    <link href="../resource/reset.css" rel="stylesheet" type="text/css">
    <link href="../resource/index.css" rel="stylesheet" type="text/css">

    <style>
        .Validform_checktip {
            margin-left: 8px;
            line-height: 20px;
            height: 20px;
            overflow: hidden;
            color: #999;
            font-size: 12px;
        }

        .Validform_right {
            color: #71b83d;
            padding-left: 100px;
        }

        .Validform_wrong {
            color: red;
            padding-left: 100px;
        }

        .Validform_loading {
            padding-left: 100px;
        }

        .Validform_error {
            background-color: #ffe7e7;
        }

        #Validform_msg {
            color: #7d8289;
            font: 12px/1.5 tahoma, arial, 5b8b4f53, sans-serif;
            width: 280px;
            -webkit-box-shadow: 2px 2px 3px #aaa;
            -moz-box-shadow: 2px 2px 3px #aaa;
            background: #fff;
            position: absolute;
            top: 0px;
            right: 50px;
            z-index: 99999;
            display: none;
            filter: progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color='#999999');
        }

            #Validform_msg .iframe {
                position: absolute;
                left: 0px;
                top: -1px;
                z-index: -1;
            }

            #Validform_msg .Validform_title {
                line-height: 25px;
                height: 25px;
                text-align: left;
                font-weight: bold;
                padding: 0 8px;
                color: #fff;
                position: relative;
                background-color: #000;
            }

            #Validform_msg a.Validform_close:link, #Validform_msg a.Validform_close:visited {
                line-height: 22px;
                position: absolute;
                right: 8px;
                top: 0px;
                color: #fff;
                text-decoration: none;
            }

            #Validform_msg a.Validform_close:hover {
                color: #cc0;
            }

            #Validform_msg .Validform_info {
                padding: 8px;
                border: 1px solid #000;
                border-top: none;
                text-align: left;
            }

        .topleft {
            float: left;
        }

        .topright {
            float: right;
        }
    </style>
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
            <div class="logo"><a href="#">
                <img src="../resource/logo1.png"></a></div>
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
                <div style="float: right;"><a href="Cart.aspx" style="display: block; margin-top: 18px;">
                    <img src="../resource/icon-2.png"></a></div>
                <ul style="display: block; float: right;">
                    <li><a href="../account/Login.aspx">登录</a></li>
                    <li><a href="../account/Register.aspx">注册</a></li>
                    <li><a href="../product/StoreOnLine.aspx">在线商城</a></li>
                </ul>

            </div>
            <div style="clear: both"></div>
        </div>
    <script type="text/javascript" src="../resource/jquery.validform.js"></script>
    <script type="text/javascript" src="../resource/json2.js"></script>
    <script type="text/javascript" src="../resource/transport.js"></script>
    <script type="text/javascript">
        $(function () {
            //提示效果二;
            $(".formUser").Validform({
                tiptype: 2
            });

        })
    </script>
    <div class="logreBG">
        <div class="loginBox">
            <div class="logTitle">注册账号</div>
            <form runat="server" class="formUser">
                <div class="regInfo">
                    <ul>
                        <li>
                            <div class="regTxt">昵称：</div>
                            <div>
                                <input runat="server" class="inpuTxt" name="username" id="username" datatype="s6-18" nullmsg="请输入用户名！" errormsg="昵称至少6个字符,最多18个字符！">
                            </div>
                            <div>
                                <div runat="server" id="namechk" class="Validform_checktip"></div>
                            </div>
                        </li>
                        <li>
                            <div class="regTxt">设置密码：</div>
                            <div>
                                <input runat="server" id="password" class="inpuTxt" type="password" value="" name="password" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间,不能使用空格！">
                            </div>
                            <div>
                                <div class="Validform_checktip"></div>
                            </div>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <div class="regTxt">确认密码：</div>
                            <div>
                                <input runat="server" id="repassword" class="inpuTxt" type="password" value="" name="password1" datatype="*6-16" nullmsg="请再输入一次密码！">
                            </div>
                            <div>
                                <div runat="server" id="repwdchk" class="Validform_checktip"></di>
                            </div>
                        </li>
                        <li>
                            <div class="regTxt">邮箱：</div>
                            <div>
                                <input runat="server" class="inpuTxt" name="email" id="email" datatype="e" ignore="ignore" nullmsg="请输入您常用的邮箱！" errormsg="请输入您常用的邮箱！">
                            </div>
                            <div>
                                <div runat="server" id="emailchk" class="Validform_checktip"></div>
                            </div>
                        </li>
                        <%--<li>
                            <div class="regTxt">验证码：</div>
                            <input class="checkNum" name="captcha" id="captcha" datatype="captcha" nullmsg="请输入验证码！" errormsg="请输入四位数字或者数字！">
                            <img src="../resource/captcha.php" alt="captcha" style="vertical-align: middle; cursor: pointer;" onclick="this.src=&#39;captcha.php?is_login=1&amp;&#39;+Math.random()">
                            <div class="clear"></div>
                        </li>--%>
                        <div class="logBbox">
                            <%--<asp:Button runat="server" ID="btn_register" Text="注册" style=" background-color:orange;" OnClick="btn_register_Click" />--%>
                            <input runat="server" onserverclick="btn_register_Click" type="submit" style=" background-color:orange;" class="regBtn" value="注册"><div class="clear"></div>
                        </div>
                        <div class="reRemine">点击"立即注册"，即表示您同意并愿意遵守<a href="#">用户协议</a>和<a href="#">隐私政策</a>.</div>
                    </ul>
                </div>
                <input name="act" type="hidden" value="act_register">
                <input type="hidden" name="back_act" value="">
            </form>
            <img class="shadow" src="../resource/shadow.jpg">
        </div>
    </div>
    <div class="clear"></div>


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



</body>
</html>

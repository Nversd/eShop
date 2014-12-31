<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserCoupon.aspx.cs" Inherits="account_UserCoupon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>用户中心_我的优惠卷</title>
    <link rel="shortcut icon" href="../resource/favicon1.ico" />
    <link rel="icon" href="../resource/favicon.ico" type="image/gif" />
    <link href="../resource/style.css" rel="stylesheet" type="text/css">
    <link href="../resource/main.css" rel="stylesheet" type="text/css">
    <link href="../resource/reset.css" rel="stylesheet" type="text/css">
    <link href="../resource/slide.css" rel="stylesheet" type="text/css">
    <link href="../resource/index.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        var process_request = "正在处理您的请求...";
    </script>

    <script type="text/javascript" src="../resource/common.js"></script>
    <script type="text/javascript" src="../resource/user.js"></script>
    <script type="text/javascript" src="../resource/transport.js"></script>
    <script type="text/javascript" src="../resource/jquery.js"></script>

    <style>
        #simplemodal-overlay {
            background-color: #000;
            cursor: wait;
        }

        #simplemodal-container {
            height: 200px;
            width: 400px;
            color: #bbb;
            background-color: #fff;
            border: 4px solid #666;
        }

            #simplemodal-container .simplemodal-data {
                width: 160px;
                float: right;
                margin-top: 90px;
            }

                #simplemodal-container .simplemodal-data #youhui {
                    background: #15b695;
                    border: none;
                    color: #fff;
                    padding: 5px 5px;
                }

            #simplemodal-container code {
                background: #141414;
                border-left: 3px solid #65B43D;
                color: #bbb;
                display: block;
                font-size: 12px;
                margin-bottom: 12px;
                padding: 4px 6px 6px;
            }

            #simplemodal-container a {
                color: #ddd;
            }

                #simplemodal-container a.modalCloseImg {
                    background: url(themes/default/images/x.png) no-repeat;
                    width: 25px;
                    height: 29px;
                    display: inline;
                    z-index: 3200;
                    position: absolute;
                    top: -15px;
                    right: -16px;
                    cursor: pointer;
                }

            #simplemodal-container h3 {
                color: #84b8d9;
            }

        .simplemodal-wrap {
            background: url(themes/default/images/yhq.jpg);
        }

        .zfbbtn input {
            background: #03a2a7;
            border: none;
            padding: 0 10px;
            color: #FFF;
            height: 21px;
            line-height: 21px;
            margin: 5px 0;
            cursor: pointer;
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
                <li><a href="#">用户中心</a></li>
                <li><a href="../account/Register.aspx">注册</a></li>
                <li><a href="../product/StoreOnLine.aspx">在线商城</a></li>
            </ul>
        </div>
        <div style="clear: both"></div>
    </div>
    <div class="main_bg1">
        <div style="width: 1000px; margin: 0 auto">
            <div class="main_bg2">
                <div class="goods_name">当前位置: <a href="../product/Omate.aspx">首页</a> <code>&gt;</code> 用户中心</div>
            </div>
            <div class="ddTitle" style="width: 990px;">用户中心</div>
            <div class="content clearfix" style="width: 980px; padding: 15px 0 80px 20px; background: #FFFFFF;">
                <div class="Sub_menu">
                    <div class="sub_nav">
                        <ul>
                            <li><a href="UserCenter.aspx" class="curs">
                                <img src="../resource/u2.gif">
                                用户信息</a></li>
                            <li><a href="UserOrder.aspx">
                                <img src="../resource/u3.gif">
                                我的订单</a></li>
                            <li><a href="UserCoupon.aspx">
                                <img src="../resource/u4.gif">
                                我的优惠劵</a></li>
                            <li><a href="UserConsignee.aspx">
                                <img src="../resource/u4.gif">
                                收货地址</a></li>
                            <li><a href="UserGoods.aspx">
                                <img src="../resource/u4.gif">
                                我的产品</a></li>
                        </ul>
                    </div>
                </div>
                <form runat="server">
                    <div class="all_main_a">
                        <div class="user_content">
                            <script type="text/javascript">
                                var bonus_sn_empty = "请输入您要添加的优惠劵号码！";
                                var bonus_sn_error = "您输入的优惠劵号码格式不正确！";
                                var email_empty = "请输入您的电子邮件地址！";
                                var email_error = "您输入的电子邮件地址格式不正确！";
                                var old_password_empty = "请输入您的原密码！";
                                var new_password_empty = "请输入您的新密码！";
                                var confirm_password_empty = "请输入您的确认密码！";
                                var both_password_error = "您现两次输入的密码不一致！";
                                var msg_blank = "不能为空";
                                var no_select_question = "- 您没有完成密码提示问题的操作";
                            </script>
                            <h5><span style="color: #02a4a9;">我的优惠劵</span></h5>
                            <div class="blank"></div>
                            <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                                <thead>
                                    <tr>
                                        <th height="35" align="center" bgcolor="#FFFFFF">优惠劵序号</th>
                                        <th align="center" bgcolor="#FFFFFF">优惠劵名称</th>
                                        <th align="center" bgcolor="#FFFFFF">优惠劵金额</th>
                                        <th align="center" bgcolor="#FFFFFF">最小订单金额</th>
                                        <th align="center" bgcolor="#FFFFFF">截至使用日期</th>
                                        <th align="center" bgcolor="#FFFFFF">优惠劵状态</th>
                                    </tr>
                                </thead>
                                <tbody runat="server" id="tbody"></tbody>
                            </table>
                            <div class="blank5"></div>

                            <div id="pager">
                                总计
                                <asp:Label runat="server" ID="totalCount"></asp:Label>
                                个记录，
                                共
                                <asp:Label runat="server" ID="totalPage"></asp:Label>
                                页。 
                                <span>
                                    <asp:LinkButton runat="server" OnClick="PageChange_Click" CommandName="First" Text="第一页"></asp:LinkButton>
                                    <asp:LinkButton runat="server" OnClick="PageChange_Click" CommandName="Prev" Text="上一页"></asp:LinkButton>
                                    <asp:LinkButton runat="server" OnClick="PageChange_Click" CommandName="Next" Text="下一页"></asp:LinkButton>
                                    <asp:LinkButton runat="server" OnClick="PageChange_Click" CommandName="Last" Text="最末页"></asp:LinkButton>
                                </span>
                                <asp:HiddenField runat="server" ID="currentPage" />
                                <asp:DropDownList runat="server" ID="pageIndex" OnSelectedIndexChanged="pageIndex_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                            <div class="blank5"></div>
                            <h5><span>添加优惠劵</span></h5>
                            <div class="blank"></div>
                            <div style="padding: 15px;">
                                优惠劵序列号         
                                <input name="bonus_sn" type="text" size="30" class="inputBg">
                                <input type="hidden" name="act" value="act_add_bonus" class="inputBg">
                                <input type="submit" class="bnt_blue_1" style="border: none;" value="添加优惠劵">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="main_bg3"></div>
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
    <script type="text/javascript">
        var msg_title_empty = "留言标题为空";
        var msg_content_empty = "留言内容为空";
        var msg_title_limit = "留言标题不能超过200个字";
    </script>
</body>
</html>

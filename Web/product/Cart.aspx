<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="product_Cart" %>

<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="Keywords" content="">
    <meta name="Description" content="">

    <title>购物车</title>

    <link rel="shortcut icon" href="http://china.omate.com/favicon.ico">
    <link rel="icon" href="http://china.omate.com/animated_favicon.gif" type="image/gif">
    <link href="../resource/style.css" rel="stylesheet" type="text/css">

    <link href="../resource/reset.css" rel="stylesheet" type="text/css">
    <link href="../resource/slide.css" rel="stylesheet" type="text/css">
    <link href="../resource/main.css" rel="stylesheet" type="text/css">
    <link href="../resource/reset(1).css" rel="stylesheet" type="text/css">
    <link href="../resource/index.css" rel="stylesheet" type="text/css">
    <link href="../resource/main(1).css" rel="stylesheet" type="text/css">
    <link href="../resource/add.css" rel="stylesheet" type="text/css">
    <link href="../resource/pop.css" rel="stylesheet" type="text/css">
    <link href="../resource/tab.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        <!--
        .STYLE1 {
            color: #000000;
        }

        .STYLE4 {
            color: #000000;
        }

        body {
            font-size: 14px;
        }
        -->
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
            <a href="http://china.omate.com/index.php">
                <img src="../resource/logo1.png"></a>
        </div>
        <div class="menu">
            <ul>
                <li class="select" id="pop" style="position: relative">
                    <a href="http://china.omate.com/flow.php#" style="display: block;">产品
                        <img src="../resource/icon-1.png"></a>
                    <div class="pop_menu" style="display: none;">
                        <ul>
                            <li><a href="http://china.omate.com/index.html">Omate X</a></li>
                            <li style="border-bottom: none"><a href="http://china.omate.com/smart.php">TrueSmart</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="http://china.omate.com/apk.php">应用市场</a></li>
                <li><a href="http://china.omate.com/article.php?id=43">联系我们</a></li>
                <li><a href="http://china.omate.com/bbs">社区</a></li>
            </ul>
        </div>
        <div class="head_r">
            <div style="float: right;">
                <a href="../resource/购物车.html" style="display: block; margin-top: 18px;">
                    <img src="../resource/icon-2.png"></a>
            </div>
            <ul style="display: block; float: right;">
                <li><a href="http://china.omate.com/user.php?act=login">登录</a></li>
                <li><a href="http://china.omate.com/user.php?act=register">注册</a></li>

                <li><a href="http://china.omate.com/goods.php?id=1">在线商城</a></li>
                <li id="lan" style="position: relative;"><a href="http://china.omate.com/flow.php#" style="display: block; position: relative">中国
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
    <script type="text/javascript" src="../resource/jquery.form.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../resource/jquery.messager.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../resource/jquery.validate.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../resource/form.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../resource/my.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../resource/jquery.idTabs.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../resource/utils.js"></script>
    <script type="text/javascript" src="../resource/transport.js"></script>
    <script type="text/javascript" src="../resource/region.js"></script>
    <script type="text/javascript" src="../resource/json2.js"></script>
    <script type="text/javascript" src="../resource/common.js"></script>
    <script type="text/javascript" src="../resource/shopping_flow.js"></script>
    <script type="text/javascript" src="../resource/order.js"></script>
    <div style="width: 100%; background: #242424; padding-top: 150px; padding-bottom: 150px;">
        <div id="pbody" style="width: 981px; margin: 0 auto; background: #f1f1f1;">


            <script type="text/javascript">
                //弹出登录信息
                function login_pop() {
                    $('#login_pop').popShow({ closeId: 'close1,close2', titleId: 'title1' });
                }
                //清空table
                function ClearTable(tid) {
                    var table = document.getElementById(tid);//table的Id
                    for (var i = 0, len = table.rows.length; i < len; i++)
                    { table.deleteRow(0); }
                }

                /**
                * 点选可选属性或改变数量时修改商品价格的函数
                */
                function changePrice(number, rec_id) {
                    //var attr = getSelectedAttributes(document.forms['ECS_FORMBUY']);
                    // var qty = document.forms['ECS_FORMBUY'].elements['number'].value;
                    Ajax.call('flow.php', 'step=update_cart_ajax&rec_id=' + rec_id + '&number=' + number, changePriceResponse, 'GET', 'JSON');
                    //window.location.reload(true);
                }
                /**
                * 接收返回的信息
                */
                function changePriceResponse(res) {
                    document.getElementById('goods_number_' + res.rec_id).value = res.goods_number;

                    //更新赠品到购物车
                    Ajax.call('flow.php?step=get_favourable_goods', '', function (result) {
                        //alert(result.content[0].goods_name);
                        var html = '';
                        ClearTable('favourable_goods');//清空表格
                        if (result.error == 0) {
                            for (var i = 0; i < result.content.length; i++) {
                                //html += '<tr><td width="230" bgcolor="#ffffff" align="left" style="border-bottom:1px #ccc dotted;"><div style="width:230px;"><div style="float:left;width:60px;height:60px;border:1px #ccc solid;padding:2px;"> <a target="_blank" href="goods.php?id='+result.content[i].goods_id+'"><img width="60" height="60" border="0" title="+result.content[i]["goods_name"]+" src="'+result.content[i].goods_thumb+'"></a></div> <div style="float:right;width:155px;text-align:left;height:72px;"><a class="f6" target="_blank" href="goods.php?id='+result.content[i].goods_id+'">'+result.content[i].goods_name+'</a><span style="color:#fff;background:#f00;padding:2px;">赠品</span></div></div><br></td><td  width="200" bgcolor="#ffffff" style="border-bottom:1px #ccc dotted;">'+result.content[i].act_name+'</td> <td  width="130" bgcolor="#ffffff" align="center" style="border-bottom:1px #ccc dotted;">￥'+result.content[i].market_price+'</td><td  width="150"  bgcolor="#ffffff" align="center" style="border-bottom:1px #ccc dotted;">￥'+result.content[i].goods_price+'</td><td  width="150" bgcolor="#ffffff" align="center" style="border-bottom:1px #ccc dotted;"> 1 </td> <td  width="130" bgcolor="#ffffff" align="center" style="border-bottom:1px #ccc dotted;">￥'+result.content[i].goods_price+'</td> <td  width="80" bgcolor="#ffffff" align="center" style="border-bottom:1px #ccc dotted;"><a class="f6" href="javascript:if (confirm(\'您确实要把该商品移出购物车吗？\'))  location.href=\'flow.php?step=drop_goods&amp;id='+result.content[i].rec_id+'\'; ">删除</a></td></tr>';
                                var td0 = '<div style="width:230px;"><div style="float:left;width:60px;height:60px;border:1px #ccc solid;padding:2px;"> <a target="_blank" href="goods.php?id=' + result.content[i].goods_id + '"><img width="60" height="60" border="0" title="+result.content[i]["goods_name"]+" src="' + result.content[i].goods_thumb + '"></a></div> <div style="float:right;width:155px;text-align:left;height:72px;"><a class="f6" target="_blank" href="goods.php?id=' + result.content[i].goods_id + '">' + result.content[i].goods_name + '</a><span style="color:#fff;background:#f00;padding:2px;">赠品</span></div></div><br>';

                                var td1 = result.content[i].act_name;
                                var td2 = '￥' + result.content[i].market_price;
                                var td3 = '￥' + result.content[i].goods_price;
                                var td4 = '1';
                                var td5 = '￥' + result.content[i].goods_price;
                                var td6 = '<a class="f6" href="javascript:if (confirm(\'您确实要把该商品移出购物车吗？\'))  location.href=\'flow.php?step=drop_goods&amp;id=' + result.content[i].rec_id + '\'; "><img src="themes/default/images/button_cancel.png" /></a>';
                                var oTr = document.getElementById('favourable_goods').insertRow(i);
                                for (var j = 0; j < 7; j++) {
                                    var oTd = oTr.insertCell(j);
                                    if (j == 0) {
                                        oTd.setAttribute('width', '230');
                                    }
                                    else if (j == 1) {
                                        oTd.setAttribute('width', '160');
                                    } else if (j == 2) {
                                        oTd.setAttribute('width', '100');
                                    }
                                    else if (j == 3) {
                                        oTd.setAttribute('width', '100');
                                    }
                                    else if (j == 4) {
                                        oTd.setAttribute('width', '180');
                                    }
                                    oTd.setAttribute('style', 'border-bottom:1px #ccc dotted;align:center;');
                                    oTd.setAttribute('align', 'center');
                                    oTd.innerHTML = eval("td" + j);
                                }
                            }
                        }


                        //document.getElementById('favourable_goods').innerHTML = html;
                    }, 'POST', 'JSON');

                    if (res.error > 0) {
                        alert(res.content);
                    }
                    else {
                        document.getElementById('subtotal_' + res.rec_id).innerHTML = res.subtotal;//商品小计
                        document.getElementById('cart_amount_desc').innerHTML = res.cart_amount_desc;//购物车商品总价说明
                        document.getElementById('market_amount_desc').innerHTML = res.market_amount_desc;//购物车商品总市价说明

                        //更新购物车区块 (若你的购物流程页面没有包含 <a href="flow.html" title="查看购物车">您的购物车中有 0 件商品，总计金额 ￥0.00。</a> 的话，则不需要放这段)
                        //var cartInfo = document.getElementById('ECS_CARTINFO');
                        //if (cartInfo)
                        //{
                        //cartInfo.innerHTML = res.content;
                        //}

                    }
                }
            </script>

            <script type="text/javascript" src="../resource/showdiv.js"></script>
            <script type="text/javascript">
                var user_name_empty = "请输入您的用户名！";
                var email_address_empty = "请输入您的电子邮件地址！";
                var email_address_error = "您输入的电子邮件地址格式不正确！";
                var new_password_empty = "请输入您的新密码！";
                var confirm_password_empty = "请输入您的确认密码！";
                var both_password_error = "您两次输入的密码不一致！";
                var show_div_text = "请点击更新购物车按钮";
                var show_div_exit = "关闭";
            </script>


            <div class="flowbox">
                <form id="formCart" name="formCart" method="post" action="http://china.omate.com/flow.html">
                    <table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
                        <tbody>
                            <tr>
                                <th width="230" height="60" bgcolor="#525252"><span style="color: #FFFFFF;" class="STYLE1">商品名称</span></th>
                                <th bgcolor="#525252" width="160"><span style="color: #FFFFFF;" class="STYLE1">属性</span></th>
                                <th height="30" bgcolor="#525252" class="STYLE1" style="color: #FFFFFF;">市场价</th>
                                <th bgcolor="#525252" class="STYLE1" style="color: #FFFFFF;">本店价</th>

                                <th bgcolor="#525252" class="STYLE1" style="color: #FFFFFF;">购买数量</th>
                                <th bgcolor="#525252" class="STYLE1" style="color: #FFFFFF;">小计</th>
                                <th colspan="2" bgcolor="#525252" class="STYLE1" style="color: #FFFFFF;">操作</th>
                            </tr>


                        </tbody>
                    </table>
                    <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" id="favourable_goods">
                    </table>
                    <br>


                    <table width="100%" height="100" align="center" border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td width="6%" bgcolor="#f1f1f1" valign="top">
                                    <a style="margin-left: 5px;" href="http://china.omate.com/goods.php?id=1">
                                        <img src="../resource/shopping_star.png"></a>               </td>
                                <td valign="top" bgcolor="#f1f1f1"></td>
                                <td width="87%" bgcolor="#f1f1f1" valign="top">
                                    <div align="right" style="font-size: 12px; width: 98%; margin: 0 auto;">
                                        <div id="ECS_ORDERTOTAL">

                                            <span id="market_amount_desc" style="font-size: 14px">比市场价 ￥0.00 节省了 ￥0.00 (0)，</span>
                                            <span id="cart_amount_desc" style="font-family: 微软雅黑, 宋体, Songti宋体, SimSun, Verdana, Arial, Helvetica, sans-serif; color: #02a4a9; font-size: 16px; font-weight: bold;">购物金额小计 ￥0.00</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>

                <table width="100%" border="0" cellpadding="5" cellspacing="0" bgcolor="#dddddd">
                    <tbody>
                        <tr>
                            <td align="right" bgcolor="#f1f1f1" style="padding: 10px 10px 30px 0;">
                                <a id="checkout_href" href="javascript:;" onclick="_common_box(&#39;请您登录后继续刚才的操作&#39;),pop_login();">
                                    <img src="../resource/pay.png" alt="checkout"></a>            </td>
                        </tr>
                    </tbody>
                </table>

            </div>












        </div>
    </div>

    <div class="blank"></div>

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
        var process_request = "正在处理您的请求...";
        var username_empty = "- 用户名不能为空。";
        var username_shorter = "- 用户名长度不能少于 3 个字符。";
        var username_invalid = "- 用户名只能是由字母数字以及下划线组成。";
        var password_empty = "- 登录密码不能为空。";
        var password_shorter = "- 登录密码不能少于 6 个字符。";
        var confirm_password_invalid = "- 两次输入密码不一致";
        var email_empty = "- Email 为空";
        var email_invalid = "- Email 不是合法的地址";
        var agreement = "- 您没有接受协议";
        var msn_invalid = "- msn地址不是一个有效的邮件地址";
        var qq_invalid = "- QQ号码不是一个有效的号码";
        var home_phone_invalid = "- 家庭电话不是一个有效号码";
        var office_phone_invalid = "- 办公电话不是一个有效号码";
        var mobile_phone_invalid = "- 手机号码不是一个有效号码";
        var msg_un_blank = "* 用户名不能为空";
        var msg_un_length = "* 用户名最长不得超过7个汉字";
        var msg_un_format = "* 用户名含有非法字符";
        var msg_un_registered = "* 用户名已经存在,请重新输入";
        var msg_can_rg = "* 可以注册";
        var msg_email_blank = "* 邮件地址不能为空";
        var msg_email_registered = "* 邮箱已存在,请重新输入";
        var msg_email_format = "* 邮件地址不合法";
        var msg_blank = "不能为空";
        var no_select_question = "- 您没有完成密码提示问题的操作";
        var passwd_balnk = "- 密码中不能包含空格";
        var username_exist = "用户名 %s 已经存在";
        var compare_no_goods = "您没有选定任何需要比较的商品或者比较的商品数少于 2 个。";
        var btn_buy = "购买";
        var is_cancel = "取消";
        var select_spe = "请选择商品属性";

        //Add 2011-07-09 liusq
        function check_free(goods_id) {
            Ajax.call('flow.php', 'step=check_free&goods_id=' + goods_id, changeFreeResponse, 'GET', 'JSON');
        }

        function changeFreeResponse(res) {
            if (res.error > 0) {
                alert(res.message);
            } else {
                location.href = "flow-checkout.html";
            }

        }

    </script>


</body>
</html>
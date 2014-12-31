<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserConsignee.aspx.cs" Inherits="account_UserConsignee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>用户中心_收货地址</title>
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
        $(document).ready(function(){
            $(".main_visual").hover(function(){
                $("#btn_prev,#btn_next").fadeIn()
            },function(){
                $("#btn_prev,#btn_next").fadeIn()
            });
            $dragBln = false;
            $(".main_image").touchSlider({
                flexible : true,
                speed : 200,
                btn_prev : $("#btn_prev"),
                btn_next : $("#btn_next"),
                paging : $(".flicking_con a"),
                counter : function (e){
                    $(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
                }
            });
            $(".main_image").bind("mousedown", function() {
                $dragBln = false;
            });
            $(".main_image").bind("dragstart", function() {
                $dragBln = true;
            });
            $(".main_image a").click(function(){
                if($dragBln) {
                    return false;
                }
            });
            timer = setInterval(function(){
                $("#btn_next").click();
            }, 5000);
            $(".main_visual").hover(function(){
                clearInterval(timer);
            },function(){
                timer = setInterval(function(){
                    $("#btn_next").click();
                },5000);
            });
            $(".main_image").bind("touchstart",function(){
                clearInterval(timer);
            }).bind("touchend", function(){
                timer = setInterval(function(){
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
                <div class="all_main_a">
                    <div class="user_content">
                        <h5><span style="color: #02a4a9">收货人信息</span></h5>
                        <div class="blank"></div>

                        <script type="text/javascript" src="../resource/utils.js"></script>
                        <script type="text/javascript" src="../resource/region.js"></script>
                        <script type="text/javascript" src="../resource/shopping_flow.js"></script>
                        <script type="text/javascript">
                            region.isAdmin = false;
                            var consignee_not_null = "收货人姓名不能为空！";
                            var country_not_null = "请您选择收货人所在国家！";
                            var province_not_null = "请您选择收货人所在省份！";
                            var city_not_null = "请您选择收货人所在城市！";
                            var district_not_null = "请您选择收货人所在区域！";
                            var invalid_email = "您输入的邮件地址不是一个合法的邮件地址。";
                            var address_not_null = "收货人的详细地址不能为空！";
                            var tele_not_null = "电话不能为空！";
                            var shipping_not_null = "请您选择配送方式！";
                            var payment_not_null = "请您选择支付方式！";
                            var goodsattr_style = "1";
                            var tele_invaild = "电话号码不有效的号码";
                            var zip_not_num = "邮政编码只能填写数字";
                            var mobile_invaild = "手机号码不是合法号码";
                            
                            onload = function() {
                                if (!document.all)
                                {
                                    document.forms['theForm'].reset();
                                }
                            }
              
                        </script>
                        <form action="http://china.omate.com/user.php" method="post" name="theForm" onsubmit="return checkConsignee(this)">
                            <div class="blank5"></div>
                            <table width="100%" border="0" cellpadding="5" cellspacing="1">
                                <tbody>
                                    <tr>
                                        <td width="11%" align="left">配送区域：</td>
                                        <td colspan="3" align="left" style="padding: 8px 0 8px 5px;">
                                            <select name="country" id="selCountries_0" onchange="region.changed(this, 1, &#39;selProvinces_0&#39;)">
                                                <option value="0">请选择国家</option>
                                                <option value="1" selected="">中国</option>
                                                <option value="3409">香港</option>
                                                <option value="3410">台湾</option>
                                            </select>
                                            <select name="province" id="selProvinces_0" onchange="region.changed(this, 2, &#39;selCities_0&#39;)">
                                                <option value="0">请选择省</option>
                                                <option value="2">北京</option>
                                                <option value="3">安徽</option>
                                                <option value="4">福建</option>
                                                <option value="5">甘肃</option>
                                                <option value="6">广东</option>
                                                <option value="7">广西</option>
                                                <option value="8">贵州</option>
                                                <option value="9">海南</option>
                                                <option value="10">河北</option>
                                                <option value="11">河南</option>
                                                <option value="12">黑龙江</option>
                                                <option value="13" selected="">湖北</option>
                                                <option value="14">湖南</option>
                                                <option value="15">吉林</option>
                                                <option value="16">江苏</option>
                                                <option value="17">江西</option>
                                                <option value="18">辽宁</option>
                                                <option value="19">内蒙古</option>
                                                <option value="20">宁夏</option>
                                                <option value="21">青海</option>
                                                <option value="22">山东</option>
                                                <option value="23">山西</option>
                                                <option value="24">陕西</option>
                                                <option value="25">上海</option>
                                                <option value="26">四川</option>
                                                <option value="27">天津</option>
                                                <option value="28">西藏</option>
                                                <option value="29">新疆</option>
                                                <option value="30">云南</option>
                                                <option value="31">浙江</option>
                                                <option value="32">重庆</option>
                                                <option value="33">香港</option>
                                                <option value="34">澳门</option>
                                                <option value="35">台湾</option>
                                            </select>
                                            <select name="city" id="selCities_0" onchange="region.changed(this, 3, &#39;selDistricts_0&#39;)">
                                                <option value="0">请选择市</option>
                                                <option value="180">武汉</option>
                                                <option value="181">仙桃</option>
                                                <option value="182">鄂州</option>
                                                <option value="183" selected="">黄冈</option>
                                                <option value="184">黄石</option>
                                                <option value="185">荆门</option>
                                                <option value="186">荆州</option>
                                                <option value="187">潜江</option>
                                                <option value="188">神农架林区</option>
                                                <option value="189">十堰</option>
                                                <option value="190">随州</option>
                                                <option value="191">天门</option>
                                                <option value="192">咸宁</option>
                                                <option value="193">襄樊</option>
                                                <option value="194">孝感</option>
                                                <option value="195">宜昌</option>
                                                <option value="196">恩施</option>
                                            </select>
                                            <select name="district" id="selDistricts_0">
                                                <option value="0">请选择区</option>
                                                <option value="1562">黄州区</option>
                                                <option value="1563">麻城市</option>
                                                <option value="1564">武穴市</option>
                                                <option value="1565" selected="">团风县</option>
                                                <option value="1566">红安县</option>
                                                <option value="1567">罗田县</option>
                                                <option value="1568">英山县</option>
                                                <option value="1569">浠水县</option>
                                                <option value="1570">蕲春县</option>
                                                <option value="1571">黄梅县</option>
                                            </select>
                                            (必填) </td>
                                    </tr>
                                    <tr>
                                        <td align="left">收货人姓名：</td>
                                        <td align="left">
                                            <input name="consignee" type="text" class="add_input" id="consignee_0" value="詹学广">
                                            (必填) </td>
                                        <td width="12%" align="left">电子邮件地址：</td>
                                        <td>
                                            <input name="email" type="text" class="add_input" id="email_0" value="zhanxueguang@yeah.net">
                                            (必填)</td>
                                    </tr>
                                    <tr>
                                        <td align="left">详细地址：</td>
                                        <td>
                                            <input name="address" type="text" class="add_input" id="address_0" value="淋山河">
                                            (必填)</td>
                                        <td align="left">邮政编码：</td>
                                        <td>
                                            <input name="zipcode" type="text" class="add_input" id="zipcode_0" value="200000"></td>
                                    </tr>
                                    <tr>
                                        <td align="left">电话：</td>
                                        <td>
                                            <input name="tel" type="text" class="add_input" id="tel_0" value="111111111111">
                                            (必填)</td>
                                        <td align="left">手机：</td>
                                        <td>
                                            <input name="mobile" type="text" class="add_input" id="mobile_0" value=""></td>
                                    </tr>
                                    <tr>
                                        <td align="left">标志建筑：</td>
                                        <td>
                                            <input name="sign_building" type="text" class="add_input" id="sign_building_0" value=""></td>
                                        <td align="left">最佳送货时间：</td>
                                        <td>
                                            <input name="best_time" type="text" class="add_input" id="best_time_0" value=""></td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">&nbsp;</td>
                                        <td height="50" colspan="3" align="center" bgcolor="#ffffff">
                                            <input type="submit" name="submit" class="bnt_blue_1" value="确认修改">
                                            <input name="button" type="button" class="bnt_blue_1" onclick="if (confirm(&#39;你确认要删除该收货地址吗？&#39;))location.href=&#39;user.php?act=drop_consignee&amp;id=4569&#39;" value="删除">
                                            <input type="hidden" name="act" value="act_edit_address">
                                            <input name="address_id" type="hidden" value="4569">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="blank5"></div>
                        </form>
                        <form action="http://china.omate.com/user.php" method="post" name="theForm" onsubmit="return checkConsignee(this)">
                            <div class="blank5"></div>
                            <table width="100%" border="0" cellpadding="5" cellspacing="1">
                                <tbody>
                                    <tr>
                                        <td width="11%" align="left">配送区域：</td>
                                        <td colspan="3" align="left" style="padding: 8px 0 8px 5px;">
                                            <select name="country" id="selCountries_1" onchange="region.changed(this, 1, &#39;selProvinces_1&#39;)">
                                                <option value="0">请选择国家</option>
                                                <option value="1" selected="">中国</option>
                                                <option value="3409">香港</option>
                                                <option value="3410">台湾</option>
                                            </select>
                                            <select name="province" id="selProvinces_1" onchange="region.changed(this, 2, &#39;selCities_1&#39;)">
                                                <option value="0">请选择省</option>
                                                <option value="2">北京</option>
                                                <option value="3">安徽</option>
                                                <option value="4">福建</option>
                                                <option value="5">甘肃</option>
                                                <option value="6">广东</option>
                                                <option value="7">广西</option>
                                                <option value="8">贵州</option>
                                                <option value="9">海南</option>
                                                <option value="10">河北</option>
                                                <option value="11">河南</option>
                                                <option value="12">黑龙江</option>
                                                <option value="13">湖北</option>
                                                <option value="14">湖南</option>
                                                <option value="15">吉林</option>
                                                <option value="16">江苏</option>
                                                <option value="17">江西</option>
                                                <option value="18">辽宁</option>
                                                <option value="19">内蒙古</option>
                                                <option value="20">宁夏</option>
                                                <option value="21">青海</option>
                                                <option value="22">山东</option>
                                                <option value="23">山西</option>
                                                <option value="24">陕西</option>
                                                <option value="25">上海</option>
                                                <option value="26">四川</option>
                                                <option value="27">天津</option>
                                                <option value="28">西藏</option>
                                                <option value="29">新疆</option>
                                                <option value="30">云南</option>
                                                <option value="31">浙江</option>
                                                <option value="32">重庆</option>
                                                <option value="33">香港</option>
                                                <option value="34">澳门</option>
                                                <option value="35">台湾</option>
                                            </select>
                                            <select name="city" id="selCities_1" onchange="region.changed(this, 3, &#39;selDistricts_1&#39;)">
                                                <option value="0">请选择市</option>
                                            </select>
                                            <select name="district" id="selDistricts_1" style="display: none">
                                                <option value="0">请选择区</option>
                                            </select>
                                            (必填) </td>
                                    </tr>
                                    <tr>
                                        <td align="left">收货人姓名：</td>
                                        <td align="left">
                                            <input name="consignee" type="text" class="add_input" id="consignee_1" value="">
                                            (必填) </td>
                                        <td width="12%" align="left">电子邮件地址：</td>
                                        <td>
                                            <input name="email" type="text" class="add_input" id="email_1" value="zhanxueguang@yeah.net">
                                            (必填)</td>
                                    </tr>
                                    <tr>
                                        <td align="left">详细地址：</td>
                                        <td>
                                            <input name="address" type="text" class="add_input" id="address_1" value="">
                                            (必填)</td>
                                        <td align="left">邮政编码：</td>
                                        <td>
                                            <input name="zipcode" type="text" class="add_input" id="zipcode_1" value=""></td>
                                    </tr>
                                    <tr>
                                        <td align="left">电话：</td>
                                        <td>
                                            <input name="tel" type="text" class="add_input" id="tel_1" value="">
                                            (必填)</td>
                                        <td align="left">手机：</td>
                                        <td>
                                            <input name="mobile" type="text" class="add_input" id="mobile_1" value=""></td>
                                    </tr>
                                    <tr>
                                        <td align="left">标志建筑：</td>
                                        <td>
                                            <input name="sign_building" type="text" class="add_input" id="sign_building_1" value=""></td>
                                        <td align="left">最佳送货时间：</td>
                                        <td>
                                            <input name="best_time" type="text" class="add_input" id="best_time_1" value=""></td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#ffffff">&nbsp;</td>
                                        <td height="50" colspan="3" align="center" bgcolor="#ffffff">
                                            <input type="submit" name="submit" class="bnt_blue_1" style="width: 130px;" value="新增收货地址">
                                            <input type="hidden" name="act" value="act_edit_address">
                                            <input name="address_id" type="hidden" value="">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="blank5"></div>
                        </form>



                    </div>
                </div>

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

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="appstore_Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="Keywords" content="Omate X Omate Turesmart 智能手表 可穿戴产品">
    <meta name="Description" content="Omate是全球领先的创新智能穿戴公司。Omate X不仅是功能强大智能穿戴手表，更是一款可以长时间陪伴您的时尚装饰品。Omate X成就这一切，并将超出您的预期。">
    <title>Omate（香港）中国区官网</title>
    <link rel="shortcut icon" href="../resource/favicon1.ico" />
    <link rel="icon" href="../resource/favicon.ico" type="image/gif" />
    <link href="../resource/reset.css" rel="stylesheet" type="text/css">
    <link href="../resource/main.css" rel="stylesheet" type="text/css">
    <link href="../resource/index.css" rel="stylesheet" type="text/css">
    <link href="../resource/main(1).css" rel="stylesheet" s="" type="text/css">
    <script type="text/javascript" src="../resource/common.js"></script>
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
    <div class="oBox">
        <div class="oBannerbox">
            <div class="obanner">
                <ul>
                    <li><a class="oforapp" href="http://china.omate.com/kiwi.php"></a></li>
                    <li><a class="oforand" href="http://china.omate.com/themes/default/download/Wiki_Mobile_Assistant.apk"></a></li>
                </ul>
            </div>
        </div>
        <div class="appBox">
            <ul>
                <h1>Ostore最新上架</h1>
                <li>
                    <img src="../resource/kiwi.png">
                    <h2>奇异果手机助手</h2>
                    <p>-奇异果手机助手</p>
                    <a href="http://china.omate.com/themes/default/download/Wiki_Watch_Client.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/oicon1.gif">
                    <h2>QQ</h2>
                    <p>-视频、语音、图片、个性主题丰富表情、乐在沟通。</p>
                    <a href="http://china.omate.com/themes/default/download/qq_3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/oicon4.gif">
                    <h2>谷歌地图 Google Maps</h2>
                    <p>-谷歌地图</p>
                    <a href="http://china.omate.com/themes/default/download/ggmaps_3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/oweixin.jpg">
                    <h2>微信</h2>
                    <p>-语音、图片、文字随时沟通器</p>
                    <a href="http://china.omate.com/themes/default/download/weixin3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li style="margin-right: 0;">
                    <img src="../resource/oweibo.jpg">
                    <h2>新浪微博</h2>
                    <p>-随时随地分享新鲜事</p>
                    <a href="http://china.omate.com/themes/default/download/weibo_3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <div class="clear"></div>
            </ul>
            <ul>
                <h1>娱乐类</h1>
                <li>
                    <img src="../resource/okugou.jpg">
                    <h2>酷狗音乐</h2>
                    <p>-完美视觉享受！</p>
                    <a href="http://china.omate.com/themes/default/download/kugou.android_3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/wangyi163.jpg">
                    <h2>网易163</h2>
                    <p>-网易163</p>
                    <a href="http://china.omate.com/themes/default/download/wangyinews_183342.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/camera360.jpg">
                    <h2>camera360</h2>
                    <p>-给你不曾发现的美</p>
                    <a href="http://china.omate.com/themes/default/download/Camera360_144007.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/yy.jpg">
                    <h2>YY语音</h2>
                    <p>-YY语音软件</p>
                    <a href="http://china.omate.com/themes/default/download/113723-YY.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li style="margin-right: 0;">
                    <img src="../resource/baidumusic.png">
                    <h2>百度音乐</h2>
                    <p>-百度音乐，听到极致！</p>
                    <a href="http://china.omate.com/themes/default/download/134827-baidumusic.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <div class="clear"></div>
            </ul>
            <ul>
                <h1>社交类</h1>
                <li>
                    <img src="../resource/oicon1.gif">
                    <h2>QQ</h2>
                    <p>-视频、语音、图片、个性主题丰富表情、乐在沟通。</p>
                    <a href="http://china.omate.com/themes/default/download/qq_3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/oweixin.jpg">
                    <h2>微信</h2>
                    <p>-语音、图片、文字随时沟通</p>
                    <a href="http://china.omate.com/themes/default/download/weixin3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/oweibo.jpg">
                    <h2>新浪微博</h2>
                    <p>-随时随地分享新鲜事</p>
                    <a href="http://china.omate.com/themes/default/download/weibo_3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/qqzone.png">
                    <h2>qq空间</h2>
                    <p>-分享生活，留住感动</p>
                    <a href="http://china.omate.com/themes/default/download/com.qzone_174541.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li style="margin-right: 0;">
                    <img src="../resource/renren.png">
                    <h2>人人</h2>
                    <p>-人人是真实的社交网络</p>
                    <a href="http://china.omate.com/themes/default/download/com.renren.mobile.android_163532.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <div class="clear"></div>
            </ul>
            <ul>
                <h1>生活类</h1>
                <li>
                    <img src="../resource/taobao.png">
                    <h2>淘宝</h2>
                    <p>-随时随地手机淘宝</p>
                    <a href="http://china.omate.com/themes/default/download/taobao_3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/wuba.png">
                    <h2>58同城</h2>
                    <p>-租房招聘兼职二手车</p>
                    <a href="http://china.omate.com/themes/default/download/com.wuba_103454.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/ganji.png">
                    <h2>赶集生活</h2>
                    <p>-手机上赶集，啥都有！</p>
                    <a href="http://china.omate.com/themes/default/download/com.ganji.android_133846.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/moji.png">
                    <h2>墨迹天气</h2>
                    <p>-2亿用户的选择！</p>
                    <a href="http://china.omate.com/themes/default/download/moji3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li style="margin-right: 0;">
                    <img src="../resource/wochacha.png">
                    <h2>我查查</h2>
                    <p>-给力比价我查查</p>
                    <a href="http://china.omate.com/themes/default/download/com.wochacha_172707.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <div class="clear"></div>
            </ul>
            <ul>
                <h1>运动与健康类</h1>
                <li>
                    <img src="../resource/nike.png">
                    <h2>Nike+ Running</h2>
                    <p>-健身从跑步开始</p>
                    <a href="http://china.omate.com/themes/default/download/144505-Nike%20Running.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/gudong.png">
                    <h2>咕咚健身</h2>
                    <p>-咕咚健身</p>
                    <a href="http://china.omate.com/themes/default/download/com.CodoonSport_145159.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/jiankangnz.png">
                    <h2>健康闹钟</h2>
                    <p>-健康闹钟</p>
                    <a href="http://china.omate.com/themes/default/download/com.baiyicare.healthalarm-1.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/mrdl.png">
                    <h2>每日锻炼免费版</h2>
                    <p>-每日锻炼免费版</p>
                    <a href="http://china.omate.com/themes/default/download/com.tinymission.dailycardioworkoutfree_225040.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li style="margin-right: 0;">
                    <img src="../resource/wbj.png">
                    <h2>金优咕噜万步计计步器</h2>
                    <p>-金优咕噜万步计计步器</p>
                    <a href="http://china.omate.com/themes/default/download/com.goldyogurt.pedometer-1.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <div class="clear"></div>
            </ul>
            <ul>
                <h1>实用类</h1>
                <li>
                    <img src="../resource/qqtxl.png">
                    <h2>QQ通讯录</h2>
                    <p>-QQ通讯录</p>
                    <a href="http://china.omate.com/themes/default/download/QQtongxunlu.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/uc.png">
                    <h2>UC浏览器</h2>
                    <p>-4亿用户的选择！</p>
                    <a href="http://china.omate.com/themes/default/download/UCliulanqi.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/zhwnl.jpg">
                    <h2>中华万年历</h2>
                    <p>-中华万年历</p>
                    <a href="http://china.omate.com/themes/default/download/zhonghuacalender.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/oicon4.gif">
                    <h2>谷歌地图 Google Maps</h2>
                    <p>-谷歌地图</p>
                    <a href="http://china.omate.com/themes/default/download/ggmaps_3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li style="margin-right: 0;">
                    <img src="../resource/jsdcys.png">
                    <h2>金山电池医生</h2>
                    <p>-金山电池医生</p>
                    <a href="http://china.omate.com/themes/default/download/jinshandianchiyisheng.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <div class="clear"></div>
            </ul>
            <ul>
                <h1>出行类</h1>
                <li>
                    <img src="../resource/yilong.png">
                    <h2>艺龙旅行</h2>
                    <p>-订机票酒店返现更多！</p>
                    <a href="http://china.omate.com/themes/default/download/101503-yilong.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/qunaer.png">
                    <h2>去哪儿旅行</h2>
                    <p>-聪明你的旅行！</p>
                    <a href="http://china.omate.com/themes/default/download/135139-qunaer.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/moji.png">
                    <h2>墨迹天气</h2>
                    <p>-2亿用户的选择！</p>
                    <a href="http://china.omate.com/themes/default/download/moji3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <img src="../resource/tuba.png">
                    <h2>图吧导航</h2>
                    <p>-图吧导航引擎再次升级</p>
                    <a href="http://china.omate.com/themes/default/download/152418-tuba.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <li style="margin-right: 0;">
                    <img src="../resource/oicon4.gif">
                    <h2>谷歌地图 Google Maps</h2>
                    <p>-谷歌地图</p>
                    <a href="http://china.omate.com/themes/default/download/ggmaps_3.44.1.4513.apk">下载</a>
                    <div class="clear"></div>
                </li>
                <div class="clear"></div>
            </ul>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Omate.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="Keywords" content="商品关键词" />
    <meta name="Description" content="商品信息描述-->SEO" />
    <title>商品展示首页</title>
    <link rel="shortcut icon" href="../resource/favicon1.ico" />
    <link rel="icon" href="../resource/favicon.ico" type="image/gif" />
    <link href="resourcemain.css" rel="stylesheet" type="text/css" />
    <link href="../resource/reset.css" rel="stylesheet" type="text/css" />
    <link href="../resource/main(1).css" rel="stylesheet" type="text/css" />
    <link href="../resource/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../resource/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../resource/omate.js"></script>
    <script type="text/javascript" src="../resource/common.js"></script>
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
</head>
<body>
    <form id="form1" runat="server">
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
                                <li><a href="#">Omate X</a></li>
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
                    <li><%--<a href="../account/Login.aspx">登录</a>--%>
                        <asp:HyperLink runat="server" ID="login" NavigateUrl="~/account/Login.aspx">登录</asp:HyperLink>
                        <asp:HyperLink runat="server" ID="usercenter" NavigateUrl="~/account/UserCenter.aspx">用户中心</asp:HyperLink>
                    </li>
                    <li><a href="../account/Register.aspx">注册</a></li>
                    <li><a href="StoreOnLine.aspx">在线商城</a></li>
                </ul>

            </div>
            <div style="clear: both"></div>
        </div>
        <div class="mini_header">
            <div class="logo2">
                <div class="logoimg">
                    <img src="../resource/logo2.jpg"></div>
            </div>
        </div>
        <div class="paraMenu">
            <ul>
                <li><a class="pmOnclick" id="xx">Truesmart</a></li>
                <li><a id="function">功能特点</a></li>
                <li><a id="size">尺寸重量</a></li>
                <li><a id="para">参数规格</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="funBox" id="funBox">
            <img src="../resource/function.jpg">
        </div>
        <div class="paraBanner" id="sizeBox">
            <img src="../resource/parabanner.jpg">
        </div>
        <div class="formatbg" id="xxBox">
            <img src="../resource/truesmart_01.gif">
            <img src="../resource/truesmart_02.gif">
            <img src="../resource/truesmart_03.gif">
            <img src="../resource/truesmart_04.gif">
            <img src="../resource/truesmart_05.gif">
            <img src="../resource/truesmart_06.gif">
            <img src="../resource/truesmart_07.gif">
            <img src="../resource/truesmart_08.gif">
            <img src="../resource/proimg6.jpg">
        </div>
        <div class="paraBox" id="paraBox">
            <div id="showBtn"><a id="showAll">展开全部选项</a><a id="hideAll" style="display: none">收起全部选项</a></div>
            <div class="paratype">
                <div class="paraBtn">无线网络功能<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">WCDMA频段</div>
                        <div class="paratbr">2100/MHz</div>
                    </li>
                    <li>
                        <div class="paratbl">GSM频段</div>
                        <div class="paratbr">900/1800MHz</div>
                    </li>
                    <li>
                        <div class="paratbl">GPRS</div>
                        <div class="paratbr">GPRS class 12</div>
                    </li>
                    <li>
                        <div class="paratbl">EDGE</div>
                        <div class="paratbr">Multi-Slot Class 12</div>
                    </li>
                    <li>
                        <div class="paratbl">HSPA</div>
                        <div class="paratbr">DPA 7.2Mbps/UPA 5.76Mbps</div>
                    </li>
                    <li>
                        <div class="paratbl">WiFi</div>
                        <div class="paratbr">IEEE 802.11b/g;</div>
                    </li>
                    <li>
                        <div class="paratbl">蓝牙功能</div>
                        <div class="paratbr">可接听电话和立体声音乐</div>
                    </li>
                    <li>
                        <div class="paratbl">全内置天线</div>
                        <div class="paratbr">全内置天线</div>
                    </li>
                </ul>
                <div class="paraBtn">硬件<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">平台</div>
                        <div class="paratbr">MT6572</div>
                    </li>
                    <li>
                        <div class="paratbl">AP频率</div>
                        <div class="paratbr">Cortex A7  Dual-core 1.2 GHz</div>
                    </li>
                    <li>
                        <div class="paratbl">ROM</div>
                        <div class="paratbr">4/8GB</div>
                    </li>
                    <li>
                        <div class="paratbl">RAM</div>
                        <div class="paratbr">512MB</div>
                    </li>
                </ul>
                <div class="paraBtn">LCM&amp;TP<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">尺寸</div>
                        <div class="paratbr">1.54英寸</div>
                    </li>
                    <li>
                        <div class="paratbl">分辨率</div>
                        <div class="paratbr">240*240</div>
                    </li>
                    <li>
                        <div class="paratbl">对比度</div>
                        <div class="paratbr">16.7M</div>
                    </li>
                    <li>
                        <div class="paratbl">触摸屏</div>
                        <div class="paratbr">电容式TP</div>
                    </li>
                </ul>
                <div class="paraBtn">多媒体播放器<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">支持音频</div>
                        <div class="paratbr" style="font-size: 12px; width: 580px; line-height: 30px;">
                            AAC LC / LTP, HE-AACv1 (AAC+), HE-AACv2 (enhanced AAC+),
AMR-NB, AMR-WB, MP3, MIDI, Ogg Vorbis, PCM / WAVE
                        </div>
                    </li>
                    <li>
                        <div class="paratbl">支持图片格式</div>
                        <div class="paratbr">JPEG, GIF, BMP, PNG (只支持静态图)</div>
                    </li>
                    <li>
                        <div class="paratbl">视频支持</div>
                        <div class="paratbr">mpeg4-sp,mpeg1/2,divx,vc1/WMV9,RMVB,H.264</div>
                    </li>
                    <li>
                        <div class="paratbl">扬声器</div>
                        <div class="paratbr">1个</div>
                    </li>
                </ul>
                <div class="paraBtn">照相机<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">照相机</div>
                        <div class="paratbr">5.0M AF CMOS ( Flash-LED)</div>
                    </li>
                    <li>
                        <div class="paratbl">录像机</div>
                        <div class="paratbr">480p@30fps</div>
                    </li>
                </ul>
                <div class="paraBtn">功率<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">电池容量</div>
                        <div class="paratbr">TBD</div>
                    </li>
                    <li>
                        <div class="paratbl">待机电流</div>
                        <div class="paratbr">约8mA</div>
                    </li>
                    <li>
                        <div class="paratbl">额定功率</div>
                        <div class="paratbr">根据不同功能</div>
                    </li>
                </ul>
                <div class="paraBtn">手机功能<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">SIM</div>
                        <div class="paratbr">小SIM卡</div>
                    </li>
                    <li>
                        <div class="paratbl">PS传感器</div>
                        <div class="paratbr">支持</div>
                    </li>
                </ul>
                <div class="paraBtn">键盘和输入法<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">键盘</div>
                        <div class="paratbr">安卓键/ 电源键</div>
                    </li>
                    <li>
                        <div class="paratbl">输入法</div>
                        <div class="paratbr">安卓键盘</div>
                    </li>
                </ul>
                <div class="paraBtn">GPS功能<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">全内置天线</div>
                        <div class="paratbr">是</div>
                    </li>
                    <li>
                        <div class="paratbl">定位精度</div>
                        <div class="paratbr">10m 内</div>
                    </li>
                </ul>
                <div class="paraBtn">连接<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">SIM卡槽 </div>
                        <div class="paratbr">单SIM卡槽</div>
                    </li>
                    <li>
                        <div class="paratbl">扩展SD卡卡槽</div>
                        <div class="paratbr">N/A</div>
                    </li>
                    <li>
                        <div class="paratbl">通过USB接口充电</div>
                        <div class="paratbr">N/A</div>
                    </li>
                </ul>
                <div class="paraBtn">其它<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">FM收音机功能</div>
                        <div class="paratbr">支持</div>
                    </li>
                    <li>
                        <div class="paratbl">G-SENSOR</div>
                        <div class="paratbr">支持</div>
                    </li>
                    <li>
                        <div class="paratbl">Gyro</div>
                        <div class="paratbr">可选</div>
                    </li>
                </ul>
                <div class="paraBtn">软件<p id="remind">+</p>
                    <div class="clear"></div>
                </div>
                <ul class="parameter">
                    <li>
                        <div class="paratbl">系统</div>
                        <div class="paratbr">安卓4.2</div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
        <div class="footer">
            <div class="footer_main">
                <div class="f_l">
                    <img src="../resource/logo1.png"></div>
                <div class="f_c"><a href="https://www.facebook.com/omatetruesmart" title="FaceBook" target="_blank">
                    <img src="../resource/down-icon1.png"></a><a href="https://twitter.com/OmateTrueSmart" title="Twitter" target="_blank"><img src="../resource/down-icon2.png"></a><a href="https://plus.google.com/u/0/b/104860063598575161591/104860063598575161591/posts" target="_blank"><img src="../resource/down-icon3.png"></a></div>
                <div class="f_r">
                    <img src="../resource/down-icon4.png">
                    Contact Us<br>
                    Customer Service:<a href="mailto:service@omate.com" title="Google+" style="color: #FFFFFF">　service@omate.com</a><br>
                    Tel:+86 4008058998
                </div>
                <div style="clear: both"></div>
            </div>
        </div>
    </form>
</body>
</html>

/**
 +----------------------------------------------------------
 * 头部检测会员是否登录
 +----------------------------------------------------------
*/
function _loginJsonp()
{
    $.getJSON('user.php?act=checkLogin&callback=?',function (_data)
    {
        if(_data.status=='1')
        {
             var _top = '';
             _top+='<a href='+'user.php'+'>'+_data.userid+'</a>|';
			 _top+='<a onclick="logout()" style="cursor:pointer;">退出</a>|';
             jQuery('#_topLogin').html(_top);
        }
        else
        {
            var _top = '';
            _top = '<a href='+'login.shtml?returnurl='+ '#' + '>登录</a>|';
            _top+= '<a href='+'login.shtml?returnurl='+ '#'+'>注册</a>|';
            jQuery('#_topLogin').html(_top);
        }
    });
}


/**
+----------------------------------------------------------
* 退出登录
+----------------------------------------------------------
*/
/**function logout()
{
	$.getJSON(consts('act')+'/User/logout?callback=?',function (_data)
	{
		if(_data.status=='1')
		{
		location.reload();
		}
	});
}
*/

function pop_login(){
	var _html = "";
	_html +='<div id="tablist_1">';
	_html +='<div id="pop_login">';
	_html +='<ul class="tab_menu">';
	_html +='<li class="current"><a href="javascript:;">登 录</a></li>';
	_html +='<li><a href="javascript:;">注 册</a></li>';
	_html +='</ul>';

	//表单HTML
	_html +='<div id="pop_login_form" class="tab_con">';
	_html +='<form id="login_form" action="/User/login" method="post">';
	_html +='<table border="0" cellpadding="0" cellspacing="0"><tr>';
	_html +='<tr>';
	_html +='<th>用户名：<div id="p3p"></div></th>';
	_html +='<td>';
	_html +='<input type="text" class=" login_text" name="luser_id" maxlength="16"/>';
	_html +='<div class="verify_text"><span class="tips" style="display:none">请输入用户名。</span><span class="errorinfo Lcfl">&nbsp;</span></div>';
	_html +='</td>';
	_html +='</tr>';
	_html +='<tr>';
	_html +='<th>密码：</th>';
	_html +='<td>';
	_html +='<input type="password" class="login_text" name="lpassword" maxlength="16"/>';
	_html +='<div class="verify_text"><span class="tips" style="display:none">请输入密码。</span><span class="errorinfo Lcfl">&nbsp;</span></div>';
	_html +='</td>';
	_html +='</tr>';
	_html +='<tr>';
	_html +='<th></th>';
	_html +='<td>';
	_html +='<input type="checkbox" id="rememberUsername" name="rememberUsername" value="1" checked=checked /> <label for="chckbox_u1">记住用户名</label>';
	_html +='<div class="verify_text"></div>';
	_html +='</td>';
	_html +='</tr>';
	_html +='<tr>';
	_html +='<th></th>';
	_html +='<td height="40"><a class="btn btn_important" id="login" ><span>登 录</span></a> &nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="user.php?act=get_password">找回密码？</a></td>';
	_html +='</tr>';
	_html +='</table>';
	_html +='</form>';
	_html +='</div>';

	//用户注册表单
	_html +='<div class="tab_con" id="pop_register_form" style="display:none;">';
	_html +='<form id="register_form" action="/User/register/" method="post">';
	_html +='<table border="0" cellpadding="0" cellspacing="0">';
	_html +='<tr>';
	_html +='<th>用户名：</th>';
	_html +='<td><input type="hidden" name="type" value="register">';
	_html +='<input type="text" class="text login_text" maxlength="16" name="user_id" id="user_id"/>';
	_html +='<div class="verify_text"><span class="tips" style="display:none">5-20个字符，推荐使用中文会员名，注册后不能修改。</span><span class="errorinfo Lcfl">&nbsp;</span></div>';
	_html +='</td>';
	_html +='</tr>';
	_html +='<tr>';
	_html +='<th>登录密码：</th>';
	_html +='<td>';
	_html +='<input type="password" class="text login_text" maxlength="16" name="password" id="password_register_form"/>';
	_html +='<div class="verify_text"><span class="tips" style="display:none">6-16个字符，请使用字母加数字的组合密码。</span><span class="errorinfo Lcfl">&nbsp;</span></div>';
	_html +='</td>';
	_html +='</tr>';
	_html +='<tr>';
	_html +='<th>确认密码：</th>';
	_html +='<td>';
	_html +='<input type="password" class="text login_text" name="repassword" maxlength="16"/>';
	_html +='<div class="verify_text"><span class="tips" style="display:none">请再次输入登录密码。</span><span class="errorinfo Lcfl">&nbsp;</span></div>';
	_html +='</td>';
	_html +='</tr>';
	_html +='<tr>';
	_html +='<th>邮箱：</th>';
	_html +='<td>';
	_html +='<input type="text" class="text login_text" name="email"/>';
	_html +='<div class="verify_text"><span class="tips" style="display:none">请输入您的邮箱。</span><span class="errorinfo Lcfl">&nbsp;</span></div>';
	_html +='</td>';
	_html +='</tr>';
	_html +='<tr>';
	_html +='<th>验证码：</th>';
	_html +='<td>';
	_html +='<input type="text" name="checknumber" class="text login_text_small"/> <span><img width="60" height="22px" alt="点击更换验证码" class="yanzhengma"  id="register_box_vcode"style="cursor: pointer; vertical-align:top;" onclick="validPic(this)" name="vcode" src="" /> 看不清，点击图片换一张</span>';
	_html +='<div class="verify_text"><span class="tips" style="display:none">请输入验证码。</span><span class="errorinfo Lcfl">&nbsp;</span></div>';
	_html +='</td>';
	_html +='</tr>';
	_html +='<tr>';
	_html +='<th></th>';
	_html +='<td>';
	_html +='<input type="checkbox" id="deal_check" name="deal_check" value="1" checked="checked" /> <label for="checkbox_u2">我已阅读并同意《<a href="article.php?cat_id=-1" target="_blank">用户服务协议</a>》</label>';
	_html +='<div class="verify_text"></div>';
	_html +='</td>';
	_html +='</tr>';
	_html +='<tr>';
	_html +='<th></th>';
	_html +='<td><a  class="btn btn_important"  id="register"><span>注 册</span></a></td>';
	_html +='</tr>';
	_html +='</table>';
	_html +='</form>';
	_html +='</div>';
	_html +='</div>';
	_html +='</div>';

	$("#pop_content .pop_content_inner").html(_html);

	//注册表单相关JS事件
	fromvalidate($("#login_form"),"user.php?act=slogin",Request,boxResponse,".errorinfo");//表单A验证提交
	fromvalidate($("#register_form"),"user.php?act=sregister",Request,boxResponse,".errorinfo");//表单B验证提交
	validPic ($(".yanzhengma"));//初始化验证码
	fromsubbind("#login_form","#login");//登录表单提交
	fromsubbind("#register_form","#register");//注册表单提交
	shinfo($("#register_form"),".errorinfo",".tips");//注册表单报错信息
	shinfo($("#login_form"),".errorinfo",".tips");//登录表单报错信息

	$('#tablist_1>div').each(function(){
		$(this).find('>div').hide().eq(0).show();
		$(this).find('li').eq(0).addClass("current");
		
		$(this).find('li').eq(1).click(function(){
			location.href='user.php?act=register&back_act=http://www.zhengou.com/flow.html';return;
		});
	//	$(this).find('li').each(function(i){
		//	$(this).click(function(){
			//	$(this).siblings().removeClass("current");
				//$(this).addClass("current");
				//$(this).parent().parent().find('>div').hide().eq(i).show();
			//});
		//});
	});

}

//公共的弹出层背景
function _common_box(title)
{
    $("body","html").css({height: "100%", width: "100%"});
    var _html = "";
        _html +='<div id="pop_window"><table border="0" cellpadding="0" cellspacing="0">';
        _html +='<tr><td class="pop_tl"></td><td class="pop_tc"></td><td class="pop_tr"></td></tr>';
        _html +='<tr>';
        _html +='<td class="pop_cl"></td>';
        _html +='<td class="pop_cc">';
        _html +='<div id="pop_header"><span>'+title+'</span><em class="btn btn_close">关闭</em></div>';
        _html +='<div id="pop_content"><div class="pop_content_inner"></div></div>';
        _html +='</td>';
        _html +='<td class="pop_cr"></td>';
        _html +='</tr>';
        _html +='<tr><td class="pop_bl"></td><td class="pop_bc"></td><td class="pop_br"></td></tr>';
        _html +='</table></div>';
        _html +='<div id="pop_overlay" class="pop_overlay"></div>';
        _html +='<div id="pop_load"></div>';
        $("body").append(_html);
        $("#pop_header .btn_close, #pop_overlay").click(close_pop_window);
}


//删除弹窗
function close_pop_window(t)
{
	$("#pop_window").remove();
	$("#pop_overlay").remove();
	$("#pop_load").remove();
   /** if(_mark_tring)
    {
        $('#fav'+_mark_tring+' .table_mask').hide();
        $('#fav'+_mark_tring+' .table_loading').hide();
        $('#global_mask').hide();
    }
    else
    {
        if(consts('moduleNmae')=='Cart')
        {
            _refresh_cart();
        }
    }*/
}


/**
 * +---------------------------------------------------------- 切换验证码图片
 * +----------------------------------------------------------
 */
function validPic(obj) {
	$(obj).attr('src', "captcha.php?is_login=1&" + Math.random());
}

//判断空字符模板
function trim(str){
　　     return str.replace(/(^\s*)|(\s*$)/g, "");
}
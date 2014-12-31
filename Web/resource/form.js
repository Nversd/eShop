//表单提交方法
function fromsubbind(formid,btnid){
	$(formid).keydown(function(e){
		if(e.keyCode==13){
			if( e && (e.scrElement || e.target)) (e.scrElement || e.target).blur();
			$(".tips").hide();//提示框内容清空
			$(formid).submit(); //处理事件
		}
	});
	//注册表单提交事件
	$(btnid).click(function(){
		$(".tips").hide();//提示框内容清空
		$(formid).submit();
	});
}

//报错信息和提示信息
function shinfo(form,error,info){
	$(form).find(":input").each(function(){
		$(this).blur(function(){
			if($(this).parent().find(error).html()==''){
				$(this).parent().find(error).html('&nbsp;');
			}
			$(this).parent().find(info).hide()
		}).focus(function(){
			if($(this).parent().find(error).html()=='&nbsp;'){
				$(this).parent().find(error).html('');
				$(this).parent().find(info).show()
			}
		});
	})

}


/**
 * 表单验证等相关
 */
function fromvalidate(obj, action, Request, Response, errorsite) {

	$.validator.setDefaults({
		submitHandler : function(form) {
			form.submit();
		}
	});

	// 用户名验证/^[A-Za-z\u4e00-\u9fa5]+\d+[\w\u4e00-\u9fa5]*$|[\w\u4e00-\u9fa5]+$/
	jQuery.validator.addMethod("useridCheck", function(value, element) {
		  var len = value.replace(/[^\x00-]xff]/g,"xx").length;
		  if(len>20 && len<5)return false;//条件3 没办法判断实际长度只能用这个方法
		  if(/^[A-Za-z\u4e00-\u9fa5]+[\w\u4e00-\u9fa5]*$/.test(value))return true;//条件1~2
		  return false;
	}, "以中、英文开头，与数字、下划线组合为5-20字节");

	// 字符验证
	jQuery.validator.addMethod("stringCheck", function(value, element) {
		return this.otional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
	}, "只能包括中文字、英文字母、数字和下划线");

	// 中文字两个字节
	jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {
		var length = value.length;
		for ( var i = 0; i < value.length; i++) {
			if (value.charCodeAt(i) > 127) {
				length++;
			}
		}
		return this.optional(element)
				|| (length >= param[0] && length <= param[1]);
	}, "请确保输入的值在3-15个字节之间(一个中文字算2个字节)");


	// 密码安全
	jQuery.validator.addMethod("isPassword", function(value, element) {
		  if(/^[A-Za-z0-9]+$/.test(value))return true;
		  return false;
	}, "只能为数字、字母");


	// 身份证号码验证
	jQuery.validator.addMethod("isIdCardNo", function(value, element) {
		return this.optional(element) || isIdCardNo(value);
	}, "请正确输入您的身份证号码");

	// 手机号码验证
	jQuery.validator.addMethod("isMobile", function(value, element) {
		var length = value.length;
		var mobile = /^13[0-9]{9}$|15[0-9]{9}$|18[0-9]{9}$|14[0-9]{9}$/;
		return this.optional(element) || (length == 11 && mobile.test(value));
	}, "请正确填写您的手机号码");

	// 电话号码验证
	jQuery.validator.addMethod("isTel", function(value, element) {
		var area = /^\d{3,4}$/;
		var tel = /(^\d{7,8})$/; // 电话号码格式010-12345678
		return this.optional(element) || (tel.test(value)||(area.test(value)));
	}, "请正确填写您的电话号码");

	// 联系电话(手机/电话皆可)验证
	jQuery.validator.addMethod("isPhone", function(value, element) {
		var length = value.length;
		var mobile = /^13[0-9]{9}$|15[0-9]{9}$|18[0-9]{9}$|14[0-9]{9}$/;
		var tel = /^\d{3,4}-?\d{7,9}$/;
		return this.optional(element) || (tel.test(value) || mobile.test(value));
	}, "请正确填写您的联系电话");
	/**jQuery.validator.addMethod("telphoneValid", function(value, element) {
		var tel = /^(130|131|132|133|134|135|136|137|138|139|150|153|157|158|159|180|187|188|189)\d{8}$/;
		return tel.test(value) || this.optional(element);
	}, "请输入正确的手机号码");*/
	// 邮政编码验证
	 jQuery.validator.addMethod("isZipCode", function(value, element) {
		 var tel = /^[0-9]{6}$/;
		 return this.optional(element) || (tel.test(value));
	 }, "请正确填写您的邮政编码");
	 //邮箱验证
	  jQuery.validator.addMethod("isEmail", function(value, element) {
		 var email = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		 return this.optional(element) || (email.test(value));
	 }, "请正确填写您的邮箱");

	/**
	 * 表单验证
	 */
	$(obj).validate({
						//onblur : true, // 鼠标移出触发事件						
						rules : {// 规则
							user_id : {
								useridCheck : true,
								required : true,
								byteRangeLength : [ 5, 20 ],
								remote : {
									type : "GET",
									dataType : "json",
									url : "user.php?act=ajaxCheckUser&type=user_id&time="+Math.random()+"&callback=?"
								}
							},
							opassword : {
								required : true,
								isPassword : true,
								remote : {
									type : "GET",
									dataType : "json",
									url : "user.php?act=ajaxCheckUser&type=user_id&time="+Math.random()+"&callback=?",
									data : {
										user_id : function() {
											return $(obj).find("#userid").val();
										},
										password : function(){
											return $(obj).find("#opassword").val();
										}
									}
								}
							},
							password : {
								required : true,
								isPassword : true,
								byteRangeLength : [ 6, 16 ]
							},
							repassword : {
								equalTo : "#password_" + $(obj).attr('id'),
								required : true,
								byteRangeLength : [ 6, 16 ]
							},
							luser_id : {
								required : function(){
									$("#error_show").empty();
								}
							},
							lpassword : {
								required : function(){
									$("#error_show").empty();
								}
							},
							mobile : {
								isMobile : true,
								required : true,
								remote : {
									type : "GET",
									dataType : "json",
									url : "user.php?act=ajaxCheckUser&type=mobile&time="+Math.random()+"&callback=?",
									data : {
										user_id : function() {
											return $("#user_id").text();
										}
									}
								}
							},
							add_mobile : {
								isMobile : true,
								required : true
							},
							mobile_code : {
								required : true
							},
							email : {
								required : true,
								isEmail : true,
								remote : {
									type : "GET",
									dataType : "json",
									url : "user.php?act=ajaxCheckUser&type=email&time="+Math.random()+"&callback=?",
									data : {
										user_id : function() {
											return $("#user_id").text();
										}
									}
								}
							},
							checknumber : {
								required : true,
								remote : {
									type : "GET",
									dataType : "json",
									url : "user.php?act=ajaxCheckUser&type=checknumber&time="+Math.random()+"&callback=?"
								}
							},
							email_phone : {
								required : true
							},
							actvie_code : {
								required : true
							},
							order_sn : {
								required : true
							},
							semail : {
								required : true,
								isEmail : true
							},
							consignee : {
								required : true
							},
							province : {
								required : true
							},
							city : {
								required : true
							},
							district : {
								required : true
							},
							address : {
								required : true
							},
							nickname : {
								required : true
							},
							deal_check : {
								required : true
							},
							zipcode :{
								isZipCode :true
							},
							tel :{
								isTel :true
							},
							area :{
								isTel :true
							},
							job_number :{
								required : true
							},
							full_name :{
								required : true
							},
							identity_card :{
								required : true
							},
							re_card_no :{
								required : true
							},
							mvp_no :{
								required : true
							}
						},
						messages : {
							user_id : {
								useridCheck : "以中、英文开头，与数字、下划线组成，长度5-20字节",
								required : "用户名不能为空！",
								byteRangeLength : "用户名长度只能为5-20个字节！",
								remote : "用户名已存在！"
							},
							opassword : {
								required : "旧密码不能为空！",
								remote : "旧密码错误！"
							},
							password : {
								required : "密码不能为空！",
								isPassword : "密码不合法！",
								byteRangeLength : "密码长度只能为6-16个字节！"
							},
							repassword : {
								required : "确认密码不能为空！",
								byteRangeLength : "确认密码长度只能为6-16个字节！",
								equalTo : "两次输入密码不一致！"
							},
							luser_id : {
								required : "账号/email号不能为空！"
							},
							lpassword : {
								required : "密码不能为空！"
							},
							mobile : {
								isMobile : "手机号不合法！",
								required : "手机号不能为空！",
								remote : "手机号已注册过！"
							},
							add_mobile : {
								isMobile : "手机号不合法！",
								required : "手机号不能为空！"
							},
							mobile_code : {
								required : "手机验证码不能为空！"
							},
							email : {
								required : "email不能为空！",
								isEmail : "email格式不合法！",
								remote : "邮箱已注册过！"
							},
							checknumber : {
								required : "请输入验证码！",
								remote : "验证码错误！"
							},
							email_phone : {
								required : "注册的邮箱或手机不能为空！"
							},
							actvie_code : {
								required : "请输入幸运号码！"
							},
							order_sn : {
								required : "请输入订单号码！"
							},
							semail : {
								required : "邮箱地址不能为空！",
								isEmail : "请正确填写邮箱地址"
							},
							consignee : {
								required : "姓名不能为空！"
							},
							province : {
								required : "省不能为空！"
							},
							city : {
								required : "城市不能为空！"
							},
							district : {
								required : "区不能为空！"
							},
							address : {
								required : "地址不能为空！"
							},
							nickname : {
								required : "姓名不能为空！"
							},
							deal_check : {
								required : "请先确认服务协议！"
							},
							zipcode :{
								isZipCode :"请正确填写您的邮政编码！"
							},
							tel :{
								isTel :"请正确填写你的电话号！"
							},
							area :{
								isTel :"请正确填写区号！"
							},
							job_number :{
								required : '员工号不能为空！'
							},
							full_name :{
								required : '姓名不能为空！'
							},
							identity_card :{
								required : '身份证号不能为空！'
							},
							re_card_no :{
								required : '确认卡号不能为空！'
							},
							mvp_no :{
								required : 'vip卡号不能为空'
							}
						},
						errorPlacement : function(error, element) {
							// 显示错误提示信息
							element.parent().find(errorsite).html("&nbsp;");
							error.prependTo(element.parent().find(errorsite));
						},
						submitHandler : function() {
							// 验证后提交动作（AJAX表单提交）
							ajaxsubmitfun(obj, action);
						},
						errorClass : "invalid",
						focusInvalid : false,
						onkeyup : false
					});

	/**
	 * +---------------------------------------------------------- AJAX表单提交
	 * +----------------------------------------------------------
	 *
	 * @access public
	 *         +----------------------------------------------------------
	 */
	function ajaxsubmitfun(obj, action) {
		var options = {
			beforeSubmit : Request,
			success : Response,
			url : action + "&time="+Math.random()+"&callback=?",
			type : 'get',
			dataType : 'json'
		};
		$(obj).ajaxSubmit(options);
	}

}

/**
 * +---------------------------------------------------------- AJAX表单提交(执行前触发函数)
 * +----------------------------------------------------------
 *
 * @access public +----------------------------------------------------------
 * @param array
 *            formData
 * @param string
 *            jqForm
 * @param string
 *            options
 *            +----------------------------------------------------------
 */
function Request(formData, jqForm, options) {
	var queryString = $.param(formData);
	return true;
}


/**
 * +----------------------------------------------------------
 * AJAX表单提交(回调函数)
 * +----------------------------------------------------------
 * @access public
 * +----------------------------------------------------------
 * @param string	responseText //响应返回值
 * @param string	statusText //返回状态
 * +----------------------------------------------------------
 */
//登陆页
function loginResponse(responseText, statusText) {

	var current_div = '';
	// 判断是否字符串 JSON缺头
	if (responseText.substr)
		responseText = eval('(' + responseText + ')');
	switch (responseText.status) {
	case 1:// 成功
		if(responseText.returnurl.indexOf("http://")==-1)//判断http://是否存在
			responseText.returnurl="http://"+responseText.returnurl;
			location.href=responseText.returnurl;
			
		break;
	default:
		$("#error_show").text(responseText.message);
		break;
	}
}

//注册页
function registerResponse(responseText, statusText) {
	var current_div = '';
	// 判断是否字符串 JSON缺头
	if (responseText.substr) {
		responseText = eval('(' + responseText + ')');
	}
	switch (responseText.status) {
	case 1:
		//解除绑定click事件防止注册后切换其他注册方式
		$("#changetab a").unbind('click');
		$("#changetab a").click(function(){
			window.location.reload();
		});
		//current_div = $("#reg_success_div");
		//$("#show_user_id").text(responseText.user_id);
		//$(current_div).siblings('.RG_sbox1').hide();
		//$(current_div).fadeIn(300);
		_loginJsonp();
		break;
	case 2://注册失败
		alert(responseText.message)
		break;
	}
}

//弹出层
function boxResponse(responseText, statusText) {
	var current_div = '';
	// 判断是否字符串 JSON缺头
	if (responseText.substr)
		responseText = eval('(' + responseText + ')');
	switch (responseText.status) {
		case 0:
			location.reload();
			break;
		case 1:
			location.reload();
			break;
		case 3:
			alert(responseText.message)
			location.href=responseText.returnurl;
			break;
		default:
			alert(responseText.message)
			break;
	}
}

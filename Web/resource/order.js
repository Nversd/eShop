//新增配送地址
function _add_address()
{
    jQuery('.address_list > li').removeClass('select_cur');
    jQuery('#_address_list_other_address').addClass('select_cur');
    _add_address_html();
	getPayShipping();
    $('#_add_address_input').show();
    region.loadProvinces(1,"provinces");
}

//新增配送地址
function _add_address_html(_type)
{
    if(_type=="del")
    {
        jQuery('#_address_list_other_address').hide();
    }
    var _value        = _type=='get' ? '保存收货人信息' : '保存收货人信息';
    var _changge_type = _type=='get' ? 'update'   : 'add';
    var _html = '';
		_html+='<table style="font-size:12px" id="new_addr_div"  width="100%" border="0" cellspacing="0" cellpadding="0"  class="txdz_lb">';
		_html+='<tr><td class="col-1"><em>*</em>收货人姓名：</td>';
		_html+='<td class="col-2"><input type="text" name="consignee" id="consignee" value="" class="input_text" maxlength="6" onclick="_t (\'consignee\')"/>';
		_html+='<div class="verify" id="_consignee"></div></td></tr>';
		_html+='<tr><td class="col-1"><em>*</em>省份：</td>';
		_html+='<td class="col-2">';
		_html+='<select name="provinces" id="provinces" onChange="region.changed(this, 2, \'citys\')" style="margin-bottom:0px;">';
		_html+='<option value="0">--请选择省或直辖市--</option></select>';
		_html+='<select name="citys" id="citys"onchange="region.changed(this, 3, \'districts\')" style="margin-bottom:0px;">';
		_html+='<option value="0">--请选择城市--</option>';
		_html+='<option value=""></option></select>';
		_html+='<select name="districts" id="districts" style="margin-bottom:0px;">';
		_html+='<option value="0">--请选择区县--</option>';
		_html+='<option value=""></option></select>';
		_html+='<div class="verify" id="_provinces_citys_districts"></div>';
		_html+='</td></tr>';
		_html+='<tr><td class="col-1"><em>*</em>地址：</td>';
		_html+='<td class="col-2"><input type="text" name="address"  size="50" id="address" class="input_text" onclick="_t (\'address\')"> <span class="form_tip">详细街道地址</span>';
		_html+='<div class="verify" id="_address"></div>';
		_html+='</td></tr>';
		_html+='<tr><td class="col-1"><em>*</em>手机号码：</td>';
		_html+='<td class="col-2">';
		_html+='<input type="text" name="mobile"  id="mobile" size="20" class="input_text" maxlength="11"  onclick="_t (\'mobile\')"/> <span class="form_tip">或者 固定电话：</span>';
		_html+='<input type="text" name="tel1" id="tel1" value="" style="width:30px" class="input_text" maxlength="4" onclick="_t (\'mobile\')">&nbsp;';
		_html+='<input type="text" name="tel2" id="tel2" value="" class="input_text" size="14" maxlength="8" onclick="_t (\'mobile\')">&nbsp;';
		_html+='<input type="text" name="tel3" id="tel3" value=""  style="width:30px" class="input_text" maxlength="4" onclick="_t (\'mobile\')">';
		_html+='<input type="hidden" name="tel" id="tel" value="" />';
		_html+='<span class="form_tip"> 用于接收发货通知短信及送货前确认</span>';
		_html+='<div class="verify" id="_mobile"></div>';
		//_html+='<div class="verify" id="_tel_list"></div></td></tr>';
		_html+='<tr><td class="col-1">邮政编码：</td>';
		_html+='<td class="col-2"><input type="text" name="zipcode" size="10" id="zipcode" value="" class="input_text" onclick="_t (\'zipcode\')"/> <span class="form_tip">请填写准确的邮编（<a href="http://cpdc.com.cn/postcdQueryAction.do?reqCode=gotoQueryPostAddr" target="_blank">查询</a>），有助您快速收货。</span>';
		_html+='<div class="verify" id="_zipcode"></div>';
		_html+='</td></tr>';
		_html+='<tr><td class="col-1">&nbsp;</td>';
		_html+='<td class="col-2"><input type="hidden" id="_save_address_id" name="_save_address_id" value="">';
		_html+='<span  class="change_btn"><a  onclick="_save_address(\''+_changge_type+'\')" id="_save_address_button" href="javascript:;"> '+_value+' </a></span></td>';
		_html+='</tr></table>';

		$('#_add_address_input').html(_html).show();
}
function _t(_divM)
{
    $('#_'+_divM).html('');
}
//修改\删除配送地址
function _ajax_change_address(_id,_type)
{
    if(_type!='del')
    {
        _add_address_html(_type);
    }
    if(_type=='del')
    {
        if(!confirm('您确定要删除么?'))
        {
            return ;
        }
    }
    var params    = {'id':_id, 'type':_type};
	var check_url ="flow.php?step=_check_address&rand="+Math.random();
    $.post(check_url,params,function(_data)
    {
        if(_data.status=='1')
        {
            //del
            if(_type=='del')
            {
                $('#_address_list_'+_id).remove();
                var addressJson = _data.data;
                if(!addressJson)
                {
					region.loadProvinces(1,"provinces");
                    _add_address_html(_type);
                }
                else
                {
                    _show_address_list(addressJson);
                }
            }
            //get
            else
            {
                $('#_add_address_input').show();
                $('#consignee').val(_data.data.consignee);$('#address').val(_data.data.address);$('#zipcode').val(_data.data.zipcode);
                $('#mobile').val(_data.data.mobile);
                if(_data.data.tel)
                {
                    var t = _data.data.tel.split('-') ;
                    $('#tel1').val(t[0]);$('#tel2').val(t[1]);$('#tel3').val(t[2]);
                }
                var province = '<option value="0">--请选择省或直辖市--</option>';
                var province_data = _data.data._province;
                for(var i=0 in province_data)
                {

                    var _selected = province_data[i]['region_id']==_data.data.province ? '  selected' : '';
                    province+='<option value='+province_data[i]['region_id']+''+_selected+'>'+province_data[i]['region_name']+'</opetion>';
                }
                // 省
                $('#provinces').html(province);
               // 市
               var city_data = _data.data._city;
               var city      = '<option value="0">--请选择城市--</option>';
               for(var i=0 in city_data)
               {
                    var _selected = city_data[i]['region_id']==_data.data.city ? '  selected' : '';
                    city+='<option value='+city_data[i]['region_id']+''+_selected+'>'+city_data[i]['region_name']+'</opetion>';
               }
               $('#citys').html(city);
               // 县
               var district_data = _data.data._district;
               var city          = '<option value="0">--请选择区县--</option>';
               for(var i=0 in district_data)
               {
                    var _selected = district_data[i]['region_id']==_data.data.district ? '  selected' : '';
                    city+='<option value='+district_data[i]['region_id']+''+_selected+'>'+district_data[i]['region_name']+'</opetion>';
               }
               $('#districts').html(city);
               //alert(_data.data.address_id);
               $('#_save_address_id').val(_data.data.address_id);
            }
        }
        else
        {
            alert ('系统错误');
            return ;
        }
    },'json');
}
$('#mobile').blur(function ()
{
    $('#mobile').html('');
});

// 提交配送地址
function _save_address(changge_type)
{
	 
    $('#_save_address_button').attr('disabled',true).attr('value','正在修改,请稍等....');
    var message = '';
    var zip = /^[0-9]{6}$/;
    var _message = '[';
    var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1}))+\d{8})$/;
    if($.trim($("#consignee").val())=='')
    {
       message+='收货人信息不能为空\r\n';
       _message+="{'field':'consignee','message':'收货人信息不能为空'},";
    }
    var dis_status = $('#districts').css('display');
    if($('#provinces').val()=='0' || $('#citys').val()=='0' || ($('#districts').val()=='0' && dis_status!='none') )
    {
        message+='省份地址信息不能为空\r\n';
        _message+="{'field':'provinces_citys_districts','message':'省份地址信息不能为空'},";
    }
    if($.trim($('#address').val())=="" )
    {
        message+='配送地址信息不能为空\r\n';
        _message+="{'field':'address','message':'配送地址信息不能为空'},";
    }
    else if($.trim($('#address').val()).length>40)
    {
         message+='配送地址过长\r\n';
        _message+="{'field':'address','message':'配送地址过长'},";
    }
    else if($.trim($('#address').val()).length<10)
    {
        message+='配送地址不够详细\r\n';
        _message+="{'field':'address','message':'配送地址不够详细'},";
    }
    if($.trim($('#zipcode').val())!='' && !zip.test($.trim($('#zipcode').val())))
    {
        message+='邮编不正确\r\n';
        _message+="{'field':'zipcode','message':'邮编不正确'},";
    }
    if(($.trim($('#tel2').val())=='') && ($.trim($('#tel1').val())=='') && ($.trim($('#mobile').val())==''))
    {
        message+='固定电话或手机号码任写一个\r\n';
        _message+="{'field':'tel_list','message':'或固定电话号码任写一个'},";
        _message+="{'field':'mobile','message':'或手机号码任写一个'},";
    }
    if($.trim($('#mobile').val())!='')
    {
        if($.trim($('#mobile').val()).length<11)
        {
             message+='手机号码不正确\r\n';
            _message+="{'field':'mobile','message':'手机号码不正确'},";
        }
    }
    if(($.trim($('#tel2').val())!='') || ($.trim($('#tel1').val())!=''))
    {
        if((isNaN($.trim($('#tel1').val())+$.trim($('#tel2').val())+$.trim($('#tel3').val()))) || (($.trim($('#tel2').val()).length<7)))
        {
            message+='固定号码不正确\r\n';
            _message+="{'field':'mobile','message':'固定号码不正确'},";
        }
    }
    if(message.length>0)
    {
        var m = _message.substr(0,(_message.length-1))+']';
        m = eval('(' + m + ')');
        for(var i in m)
        {
            $('#_'+m[i]['field']).html(m[i]['message']);
        }
        $('#_save_address_button').attr('disabled',false).attr('value','修改配送地址');
        return ;
    }
  
     var params = {
                   'consignee':$.trim($('#consignee').val()), 'provinces':$.trim($('#provinces').val()),'citys':$.trim($('#citys').val()),
                   'districts':$.trim($('#districts').val()), 'address':$.trim($('#address').val()),'zipcode':$.trim($('#zipcode').val()),
                   'mobile'   :$.trim($('#mobile').val()),     'type'  :changge_type,'id':$.trim($('#_save_address_id').val()),
                    'tel'     :$.trim($('#tel1').val())+'-'+$.trim($('#tel2').val())+'-'+$.trim($('#tel3').val())
                  };
    
    var check_url ="flow.php?step=_check_address&rand="+Math.random();
    $.post(check_url,params,function(_data)
    {
        if(_data.status=='1')
        {
            alert (_data.info);
            $('#_add_address_input').fadeIn('500',function ()
            {
              $('#_add_address_input').html('').hide();
            });

            _show_address_list(_data.data);
            return false;
        }
        else
        {
            alert (_data.info);
            return ;
        }
    },'json');
}

function submit_new_address(myform)
{
    var err='';
    var checkPost=/^\d{6}$/;
    if(myform.consignee.value.length==0)
    {
        err+="请输入收货人姓名 ";
    }
    if(myform.address.value.length==0)
    {
        err+="请输入收货地址 ";
    }
    if(myform.provinces.value<=0)
    {
        err+="请选择配送城市  ";
    }
    if(!checkPost.test(myform.zipcode.value))
    {
        err+="邮编不是数字或者邮编长度超过6位";
    }
    if(myform.tel2.value.length==0 && myform.mobile.value.length==0)
    {
        err+="填写联系电话和手机  ";
    }
    if(err!='')
    {
        jQuery('#errmsg').html(err);
        jQuery('#errmsg').show();
        return false;
    }
    else
    {
        myform.submit();
    }
}
function getTelNumber()
{
    var tel=jQuery("input[name='tel1']").val()+"-"+jQuery("input[name='tel2']").val()+"-"+jQuery("input[name='tel3']").val();
    jQuery("input[name='tel']").val(tel);
}


//现在配送地址
function _show_address_list(addressJson)
{
    var _addressHtml = '<ul class="address_list" >';
    var _class       = '';
    for(var i=0 in addressJson)
    {
        if(addressJson[i]['is_default']=='1')
        {
            var _options = addressJson[i]['address_id'];
            jQuery('#choose_address_id').val(_options);
        }
        _class   =  addressJson[i]['is_default']=='1' ? 'select_cur'     : '';
        _checked =  addressJson[i]['is_default']=='1' ? 'checked' : '';
        _addressHtml+='<li class="'+_class+'"  id="_address_list_'+addressJson[i]['address_id']+'"><span class="col-1">';
        _addressHtml+='<input type="radio" name="address_id" id="address'+i+'" value="'+addressJson[i]['address_id']+'" onclick="selectaddress('+addressJson[i]['address_id']+')"'+_checked+'/>';
        _addressHtml+='<label for="address'+i+'">'+addressJson[i]['consignee']+'</label></span><span class="col-2">';
        _addressHtml+=addressJson[i]['provinceName']+'-'+addressJson[i]['cityName']+'-'+addressJson[i]['districtName'];
        _addressHtml+='-'+addressJson[i]['address']+'&nbsp;&nbsp;&nbsp;';
        _addressHtml+=addressJson[i]['mobile']? addressJson[i]['mobile'] : addressJson[i]['tel'];
        _addressHtml+='</span>';
        _addressHtml+='<span class="col-3"><a href="javascript:;" onclick="_ajax_change_address(\''+addressJson[i]['address_id']+'\',\'get\')">修改</a> | <a href="javascript:;" onclick="_ajax_change_address(\''+addressJson[i]['address_id']+'\',\'del\')">删除</a></span></li>';
    }
    _addressHtml+= '<li id="_address_list_other_address"><span class="col-1"><input type="radio" name="address_id"  value="0" onclick="_add_address();" id="address_other" />';
    _addressHtml+='<label for="address_other">使用其他地址</label></span><span class="col-2"></span><span class="col-3"></span>';
    _addressHtml+='</li></ul><div class="new_address cur" style="display:none" id="_add_address_input"></div>';
    $('#address_list').html(_addressHtml);
    getPayShipping(_options);
}

//选择地址
function selectaddress(address_id)
{
    jQuery('#_add_address_input').hide().html('');
    jQuery('#choose_address_id').val(address_id);
    jQuery('.address_list > li').removeClass('select_cur');
    jQuery('#_address_list_'+address_id).addClass('select_cur');

    getPayShipping(address_id);

    var baseprice=parseFloat(jQuery('#baseprice').html());
    jQuery('#shipping_price').html('0.00');
    jQuery('#total_money').html(baseprice);
    jQuery('#must_pay').html(baseprice);
    jQuery("#cac_div").html("");
}

//获取地址对应的支付方式与配送方式
function getPayShipping(address_id)
{
    jQuery('#shippinglist').html('');
    jQuery("#cac_div").html("");
    var url  = "flow.php?step=shipAndPay";
    var data = {"address_id":address_id};
    jQuery.post(url,data,function(s)
    {
        var shippinglist=s.shipping;
        var default_shipping = jQuery("#default_shipping").val();
       
       var shippinghtml='';
       var shi_index=0;
       var tatal_shipping=0
       for(var dubs in shippinglist)
       {
            if(shippinglist[dubs]!=0)
            {
                if(shippinglist[dubs].support_cod==1)
                {
                  var codstr= '' ;
                }
                else
                {
                    var  codstr='';
                }
                if(shippinglist[dubs].shipping_id==99 && shippinglist[dubs].support_cod==0)
                {
                     var cur_price=shippinglist[dubs].region_price;
                }
                else
                {
                   var cur_price=shippinglist[dubs].shipping_price;
                }
                if(jQuery('#free_shipping').val()==1)
                {
                      var cur_price=0;
                }
                tatal_shipping=cur_price;
                var  curtml='<li>'
                     curtml+='<input ';
                    if(default_shipping!=undefined && default_shipping!='')
                    {
                        if(default_shipping==shippinglist[dubs].shipping_id) curtml+='checked=\'true\' ';
                    }
                    curtml+=' code="'+shippinglist[dubs].shipping_code+'" name="shipping" id="sid'+shippinglist[dubs].shipping_id+'" type="radio" value="'+shippinglist[dubs].shipping_id+'"  supportCod="'+shippinglist[dubs].support_cod+'" insure="'+shippinglist[dubs].insure+'"  onclick="selectShipping(this)"  >';
                    curtml+='<label for="sid'+shippinglist[dubs].shipping_id+'">'+shippinglist[dubs].shipping_name+'</label>';
					curtml+='&nbsp;&nbsp;'+shippinglist[dubs].shipping_desc;
                    curtml+=' (配送费用:<strong class="price" id="show_price_'+shippinglist[dubs].shipping_id+'"> '+cur_price+'</strong> 元) '+codstr;
                    curtml+='<input id="cod_'+shippinglist[dubs].shipping_id+'" id="" type="hidden" value="'+shippinglist[dubs].support_cod+'" />';
                    curtml+='<input id="use_price_'+shippinglist[dubs].shipping_id+'" type="hidden" value="'+cur_price+'" />';
                    curtml+='<input id="region_price_'+shippinglist[dubs].shipping_id+'" type="hidden" value="'+shippinglist[dubs].region_price+'" />';
                    curtml+='<input id="shipping_price_'+shippinglist[dubs].shipping_id+'" type="hidden" value="'+shippinglist[dubs].shipping_price+'" />';
                    curtml+='<input id="shipping_code_'+shippinglist[dubs].shipping_id+'" type="hidden" value="'+shippinglist[dubs].shipping_code+'" />';
                    curtml+='</li>';
               shippinghtml+=curtml;
               shi_index++;
            }
       }
       var peisong=0;
       if(s.shipping[0]!=undefined){
    	   peisong = s.shipping[0].region_price;    //配送费用
       }
       var jifen = $("#ECS_ORDERTOTAL #jifen").val(); //积分 同  所需价格
       var t_price=0;
       var t_price = parseInt(jifen)+parseInt(peisong); //总价
       $("#ECS_ORDERTOTAL #amount").html("￥"+t_price);  //改变总价
       $("#ECS_ORDERTOTAL #peisong").html(tatal_shipping);  //改变配送价格
    
       //  alert(tatal_shipping);
       if(shippinglist==undefined||shippinglist==null||shippinglist=='')
       {
           shippinghtml="没有所支持的配送设置。";
       }
        jQuery('#shippinglist').html(shippinghtml);
        if(default_shipping!=undefined && default_shipping!='' && default_shipping!='0')selectShipping();
        },"json");
}
//其它信息展开和关闭
jQuery(function(){
		jQuery("#open_close").toggle(
		  function () {
			jQuery(".other_info").show();
			jQuery("#open_close_img").attr("src","themes/default/images/icon_add.jpg"); 
		  },
		  function () {
			 jQuery(".other_info").hide();
			 jQuery("#open_close_img").attr("src","themes/default/images/add.gif"); 
		  }
		); 	
		//送货时间展开和关闭
		jQuery("#pub_time").toggle(
		  function () {
			jQuery(".pub_time").show();
			jQuery("#pub_time_img").attr("src","themes/default/images/icon_add.jpg"); 
		  },
		  function () {
			 jQuery(".pub_time").hide();
			 jQuery("#pub_time_img").attr("src","themes/default/images/add.gif");  
		  }
		); 	
});


//获取地址对应的支付方式与配送方式
/*
function getPayShipping(address_id)
{
    jQuery('#paymentlist').html('');
    jQuery('#shippinglist').html('');
    jQuery("#cac_div").html("");
    var url  = "flow.php?step=shipAndPay";
    var data = {"address_id":address_id};
    jQuery.post(url,data,function(s)
    {
        var paymentlist =s.payment;
        var shippinglist=s.shipping;
        var paymenthtml='';
        var default_payment  = jQuery("#default_payment").val();
        var default_shipping = jQuery("#default_shipping").val();
        for(var subs in paymentlist)
        {
            paymenthtml+='<li><input ';
            if(default_payment!=undefined&&default_payment!='')
            {
                if(default_payment == paymentlist[subs].pay_id) paymenthtml+='checked=\'true\' ';
            }
            paymenthtml+='pay_code="'+paymentlist[subs].pay_code+'" has_pos="'+paymentlist[subs].has_pos+'" name="pay_id" id="pay_id'+paymentlist[subs].pay_id+'" type="radio" value="'+paymentlist[subs].pay_id+'" onclick="selectPayment()" ><label for="pay_id'+paymentlist[subs].pay_id+'">'+paymentlist[subs].pay_name+'</label>';
            if(paymentlist[subs].has_pos=='1')
            {
                paymenthtml+='<span style="display:none" id="choose_pos"><br/><input style="margin-left:25px" type="radio" value="1" name="charge_type">使用POS机支付<br/><input style="margin-left:25px" type="radio" value="2" name="charge_type" checked="true">使用现金支付</span>';
            }
            paymenthtml+='</li>';
        }
       var shippinghtml='';
       var shi_index=0;

       for(var dubs in shippinglist)
       {
            if(shippinglist[dubs]!=0)
            {
                if(shippinglist[dubs].support_cod==1)
                {
                  var codstr= '' ;
                }
                else
                {
                    var  codstr='';
                }
                if(shippinglist[dubs].shipping_id==99 && shippinglist[dubs].support_cod==0)
                {
                     var cur_price=shippinglist[dubs].region_price;
                }
                else
                {
                   var cur_price=shippinglist[dubs].shipping_price;
                }
                if(jQuery('#free_shipping').val()==1)
                {
                      var cur_price=0;
                }
                var  curtml='<li>'
                     curtml+='<input ';
                    if(default_shipping!=undefined && default_shipping!='')
                    {
                        if(default_shipping==shippinglist[dubs].shipping_id) curtml+='checked=\'true\' ';
                    }
                    curtml+=' code="'+shippinglist[dubs].shipping_code+'" name="sid" id="sid'+shippinglist[dubs].shipping_id+'" type="radio" value="'+shippinglist[dubs].shipping_id+'" disabled="disabled"  onclick="selectShipping()"  >';
                    curtml+='<label for="sid'+shippinglist[dubs].shipping_id+'">'+shippinglist[dubs].shipping_name+'</label>';
                    curtml+=' (配送费用:<strong class="price" id="show_price_'+shippinglist[dubs].shipping_id+'"> '+cur_price+'</strong> 元) '+codstr;
                    curtml+='<input id="cod_'+shippinglist[dubs].shipping_id+'" id="" type="hidden" value="'+shippinglist[dubs].support_cod+'" />';
                    curtml+='<input id="use_price_'+shippinglist[dubs].shipping_id+'" type="hidden" value="'+cur_price+'" />';
                    curtml+='<input id="region_price_'+shippinglist[dubs].shipping_id+'" type="hidden" value="'+shippinglist[dubs].region_price+'" />';
                    curtml+='<input id="shipping_price_'+shippinglist[dubs].shipping_id+'" type="hidden" value="'+shippinglist[dubs].shipping_price+'" />';
                    curtml+='<input id="shipping_code_'+shippinglist[dubs].shipping_id+'" type="hidden" value="'+shippinglist[dubs].shipping_code+'" />';
                    curtml+='</li>';
               shippinghtml+=curtml;
               shi_index++;
            }
       }

       if(shippinglist==undefined||shippinglist==null||shippinglist=='')
       {
           shippinghtml="没有所支持的配送设置。";
       }
        jQuery('#paymentlist').html(paymenthtml);
        jQuery('#shippinglist').html(shippinghtml);

        if(default_payment!=undefined && default_payment!='' && default_payment!='0')selectPayment();
        if(default_shipping!=undefined && default_shipping!='' && default_shipping!='0')selectShipping();
        },"json");
}*/
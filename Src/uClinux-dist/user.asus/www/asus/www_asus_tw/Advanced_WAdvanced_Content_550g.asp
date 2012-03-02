<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="style.css" media="screen"></link>
<script language="JavaScript" type="text/javascript" src="overlib.js"></script>
<script language="JavaScript" type="text/javascript" src="general.js"></script>
<script type="text/javascript" src="slider/slider.js"></script>
<script type="text/javascript" src="slider/libcrossbrowser.js"></script>
<script type="text/javascript" src="slider/eventhandler.js"></script>
<script language="JavaScript" type="text/javascript">
<!--

function getObj(name)
{
  if (document.getElementById)
  {
  	this.obj = document.getElementById(name);
	this.style = document.getElementById(name).style;
  }
  else if (document.all)
  {
	this.obj = document.all[name];
	this.style = document.all[name].style;
  }
  else if (document.layers)
  {
   	this.obj = document.layers[name];
   	this.style = document.layers[name];
  }
}


function drawSliderBlock(){
	
	x = new getObj('sliderDiv');
	if ((document.all) || (document.getElementById)){
		x.obj.innerHTML = slider_table();
	}
	else{
		x.obj.document.write(slider_table());
		x.obj.document.close();
	}

	initSlider();
}

function loadSlider()
{	
	changePower(0);
	drawSliderBlock();
}


function slider_table()
{
	var result;
	var assignment_box;
	var disk_num=1;
	var num_disks_in_pane;
	var disk_array = ["A","B"];
	var space_array = ["100","100"];
	syncDisksInPool = true;
	maxSpaceAllowedInSync = 0.0;
	var isJbodPool = 1;
	
	result = "<table border=0 cellspacing=0 cellpadding=0><tr><td>";
	
	result += "<div id='sliderDiv" + disk_num + "'></div>\n";
		// the slider movement and gigabytes textbox value are kept in sync only if there is one disk per pane and it is a mirrored or striped pool

	//alert(stripe_count());
	//alert(mirror_count());
	result += "</td></tr></table>";
	return result;

}


 var max_slider_width = 18; // change it if needed

 function initSlider(){
 
 	var disk_num;
 	
 	sliderArray = new Array();
 	Bs_Objects = new Array(); // Have to initialize the internal array used by slider class as well
 	
 	var colorArray = new Array("red", "red","orange","green","magenta","yellow","turquoise");


	disk_num=1;
	
	if (document.forms[0].regulation_domain.value == "30DE")
 		sliderArray[disk_num.toString(10)] = drawSlider(disk_num.toString(10),"sliderDiv" + disk_num, "red",1, 9, document.forms[0].wl_radio_power_x.value, 1, false); 
 	else sliderArray[disk_num.toString(10)] = drawSlider(disk_num.toString(10),"sliderDiv" + disk_num, "red",1, 12, document.forms[0].wl_radio_power_x.value, 1, false); 
	return;
 
 }
 
 function drawSlider(sliderName,divName,color,minVal,maxVal,initVal,interval,isDisabled){
   
   if (arguments[0] != "")
   	mySlider = new Bs_Slider(sliderName);
   else
   	mySlider = new Bs_Slider();
   	
   mySlider.attachOnChange(bsSliderChange);
   mySlider.width         =  ( (maxVal / 2) * max_slider_width );
   //mySlider.width       = 121;
   mySlider.height        = 18;
   mySlider.minVal        = minVal;
   mySlider.maxVal        = maxVal;
   mySlider.valueInterval = interval;
   mySlider.arrowAmount   = interval;
   mySlider.valueDefault  = initVal;
   mySlider.imgDir   = 'slider/';
   //mySlider.setBackgroundImage('background.gif', 'no-repeat');
   mySlider.setBackgroundImage('background.gif', 'repeat');
   mySlider.setBackgroundImageLeft('background_left.gif', 7, 18);
   mySlider.setBackgroundImageRight('background_right.gif', 7, 18);
   mySlider.setSliderIcon('slider.gif', 13, 18);
   mySlider.setArrowIconLeft('arrowLeft.gif', 16, 16);
   mySlider.setArrowIconRight('arrowRight.gif', 16, 16);
   mySlider.useInputField = 0;
   //mySlider.styleValueFieldClass = 'sliderInput';
   mySlider.colorbar = new Object();
   mySlider.colorbar['color']           = color;
   mySlider.colorbar['height']          = 7;
   mySlider.colorbar['widthDifference'] = -14;
   mySlider.colorbar['offsetLeft']      = -3;
   mySlider.colorbar['offsetTop']       = 9;
   mySlider.setDisabled(isDisabled);
   mySlider.drawInto(divName);
   
   return mySlider;

 }
 
 function changePower(flag)
 {
 	var bpower, gpower, power_index;
 	
 	power_index=document.forms[0].wl_radio_power_x.value;
      	
      	if (power_index==12)
      	{	
      		bpower=24;
   		gpower=20;      	
      	}
      	else if(power_index==11)
      	{	
      		bpower=22;
   		gpower=20;
      	}
      	else
      	{
   		bpower=eval(power_index)+10;
   		gpower=eval(power_index)+10;
   	}	
   		 
   	document.forms[0].power_index_1.value = "B: " + bpower + " dbm / G: " + gpower + " dbm";
   	if (flag)
   	{	
   		window.top.pageChanged = 1;	
   	}	
 }
 
function bsSliderChange(sliderObj, val, newPos){       
   // if mirrored or striped and one disk per pane, make sure all disk sizes are made the same
   // update slider value and hidden field value here for the current field alone
   document.forms[0].wl_radio_power_x.value=sliderObj.getValue();
   changePower(1);   
}


//-->
</script>
</head>  
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>    
<body onLoad="load_body();loadSlider();" onunLoad="return unload_body();">
<form method="GET" name="form" action="apply.cgi">
<!-- Table for the conntent page -->	    
<table width="666" border="0" cellpadding="0" cellspacing="0">     	      
    	
<input type="hidden" name="current_page" value="Advanced_WAdvanced_Content.asp"><input type="hidden" name="next_page" value="SaveRestart.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="WLANAuthentication11a;WLANConfig11b;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">無線 - 進階</td>
</tr>
<input type="hidden" name="wl_gmode" value="<% nvram_get_x("WLANConfig11b","wl_gmode"); %>"><input type="hidden" name="wl_gmode_protection_x" value="<% nvram_get_x("WLANConfig11b","wl_gmode_protection_x"); %>">
<tr>
<td class="content_desc_td" colspan="2">本章讓您可設定在無線方面適用的其他參數。但建議最好採用預設值。
         </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('WLANConfig11b_x_RadioPowerEx_itemdesc', LEFT);" onMouseOut="return nd();">功率輸出（Radio Power）：
</td>


<td class="content_input_td">        
    <div id="sliderDiv" >

			<!--	<script>document.write(slider_table());</script> -->
    </div>
    <div id="sliderVal" align="right"><input type="text"  size="20" style="font-size:12px;" name="power_index_1" readonly/></div>
    <input type="hidden" maxlength="5" size="5" name="wl_radio_power_x" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "wl_radio_power_x"); %>"></td>
    <input type="hidden" maxlength="5" size="5" name="regulation_domain" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "regulation_domain"); %>"></td>
</td>    	  
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('啟用AfterBurner功能時，使用具備AfterBurner功能的無線網路卡與路由器相連將可大幅增進無線傳輸效能。AfterBurner模式操作需要：將「驗證方式」設定為「Open System or Shared Key」，而AP模式則設定為「AP Only」並將「允許匿名」設定為「No」。', LEFT);" onMouseOut="return nd();">啟用AfterBurner功能？
           </td><td class="content_input_td"><select name="wl_afterburner" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_afterburner')"><option class="content_input_fd" value="off" <% nvram_match_x("WLANConfig11b","wl_afterburner", "off","selected"); %>>Disabled</option><option class="content_input_fd" value="auto" <% nvram_match_x("WLANConfig11b","wl_afterburner", "auto","selected"); %>>Enabled</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('選擇「Yes」，會將一些藉由廣播封包以查詢AP的客戶端所傳來的AP隱藏起來。因此，僅有對此AP的SSID有所注意的客戶端，才能和其連線。', LEFT);" onMouseOut="return nd();">隱藏SSID：
           </td><td class="content_input_td"><input type="radio" value="1" name="wl_closed" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_closed', '1')" <% nvram_match_x("WLANConfig11b","wl_closed", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wl_closed" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_closed', '0')" <% nvram_match_x("WLANConfig11b","wl_closed", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('選擇「Yes」，禁止無線用戶彼此相互通訊。', LEFT);" onMouseOut="return nd();">禁止無線用戶互通？
           </td><td class="content_input_td"><input type="radio" value="1" name="wl_ap_isolate" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_ap_isolate', '1')" <% nvram_match_x("WLANConfig11b","wl_ap_isolate", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wl_ap_isolate" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_ap_isolate', '0')" <% nvram_match_x("WLANConfig11b","wl_ap_isolate", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('選擇傳輸資校率。建議您選擇「Auto」以獲得最大的效能。', LEFT);" onMouseOut="return nd();">資料傳輸速率（Mbps）：
           </td><td class="content_input_td"><select name="wl_rate" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_rate')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","wl_rate", "0","selected"); %>>Auto</option><option class="content_input_fd" value="1000000" <% nvram_match_x("WLANConfig11b","wl_rate", "1000000","selected"); %>>1</option><option class="content_input_fd" value="2000000" <% nvram_match_x("WLANConfig11b","wl_rate", "2000000","selected"); %>>2</option><option class="content_input_fd" value="5500000" <% nvram_match_x("WLANConfig11b","wl_rate", "5500000","selected"); %>>5.5</option><option class="content_input_fd" value="6000000" <% nvram_match_x("WLANConfig11b","wl_rate", "6000000","selected"); %>>6</option><option class="content_input_fd" value="9000000" <% nvram_match_x("WLANConfig11b","wl_rate", "9000000","selected"); %>>9</option><option class="content_input_fd" value="11000000" <% nvram_match_x("WLANConfig11b","wl_rate", "11000000","selected"); %>>11</option><option class="content_input_fd" value="12000000" <% nvram_match_x("WLANConfig11b","wl_rate", "12000000","selected"); %>>12</option><option class="content_input_fd" value="18000000" <% nvram_match_x("WLANConfig11b","wl_rate", "18000000","selected"); %>>18</option><option class="content_input_fd" value="24000000" <% nvram_match_x("WLANConfig11b","wl_rate", "24000000","selected"); %>>24</option><option class="content_input_fd" value="36000000" <% nvram_match_x("WLANConfig11b","wl_rate", "36000000","selected"); %>>36</option><option class="content_input_fd" value="48000000" <% nvram_match_x("WLANConfig11b","wl_rate", "48000000","selected"); %>>48</option><option class="content_input_fd" value="54000000" <% nvram_match_x("WLANConfig11b","wl_rate", "54000000","selected"); %>>54</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('本欄為指出無線客戶端必須支援的基本速率。', LEFT);" onMouseOut="return nd();">基本速率設定：
           </td><td class="content_input_td"><select name="wl_rateset" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_rateset')"><option class="content_input_fd" value="default" <% nvram_match_x("WLANConfig11b","wl_rateset", "default","selected"); %>>Default</option><option class="content_input_fd" value="all" <% nvram_match_x("WLANConfig11b","wl_rateset", "all","selected"); %>>All</option><option class="content_input_fd" value="12" <% nvram_match_x("WLANConfig11b","wl_rateset", "12","selected"); %>>1, 2 Mbps</option></select></td>
</tr>
<tr>
<td class="content_header_td">分割臨界值設定：
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wl_frag" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "wl_frag"); %>" onBlur="validate_range(this, 256, 2346)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td">RTS門檻設定：
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wl_rts" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "wl_rts"); %>" onBlur="validate_range(this, 0, 2347)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td">DTIM間隔：
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wl_dtim" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "wl_dtim"); %>" onBlur="validate_range(this, 1, 255)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td">訊號間隔：
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wl_bcn" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "wl_bcn"); %>" onBlur="validate_range(this, 1, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('選擇「Yes」，可啟用FrameBurst功能以增進效能。', LEFT);" onMouseOut="return nd();">啟用FrameBurst功能？
           </td><td class="content_input_td"><select name="wl_frameburst" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_frameburst')"><option class="content_input_fd" value="off" <% nvram_match_x("WLANConfig11b","wl_frameburst", "off","selected"); %>>Disabled</option><option class="content_input_fd" value="on" <% nvram_match_x("WLANConfig11b","wl_frameburst", "on","selected"); %>>Enabled</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('選擇「Yes」，可以啟用無線上網（Enable Radio）功能。', LEFT);" onMouseOut="return nd();">啟用無線上網？
           </td><td class="content_input_td"><input type="radio" value="1" name="wl_radio_x" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_radio_x', '1')" <% nvram_match_x("WLANConfig11b","wl_radio_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wl_radio_x" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_radio_x', '0')" <% nvram_match_x("WLANConfig11b","wl_radio_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('此選項讓你能夠啟動或關閉WMM。', LEFT);" onMouseOut="return nd();">啟動 WMM?
           </td><td class="content_input_td"><select name="wl_wme" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_wme')"><option class="content_input_fd" value="off" <% nvram_match_x("WLANConfig11b","wl_wme", "off","selected"); %>>Disabled</option><option class="content_input_fd" value="on" <% nvram_match_x("WLANConfig11b","wl_wme", "on","selected"); %>>Enabled</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('此選項讓你能夠啟動或關閉WMM No-Acknowledgment.', LEFT);" onMouseOut="return nd();">啟動 WMM No-Acknowledgement？
           </td><td class="content_input_td"><select name="wl_wme_no_ack" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_wme_no_ack')"><option class="content_input_fd" value="off" <% nvram_match_x("WLANConfig11b","wl_wme_no_ack", "off","selected"); %>>Disabled</option><option class="content_input_fd" value="on" <% nvram_match_x("WLANConfig11b","wl_wme_no_ack", "on","selected"); %>>Enabled</option></select></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0"></table>
</td>
</tr>
<tr>
<td>		
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="B0B0B0">
<tr bgcolor="#CCCCCC"><td colspan="3"><font face="arial" size="2"><b>&nbsp</b></font></td></tr>
<tr bgcolor="#FFFFFF">  
   <td id ="Confirm" height="25" width="34%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Restore ')" type="submit" value=" 還原 " name="action"></font></div> 
   </td>  
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Finish ')" type="submit" value=" 儲存 " name="action"></font></div> 
   </td>
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Apply ')" type="submit" value=" 套用 " name="action"></font></div> 
   </td>    
</tr>
</table>
</td>
</tr>

<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="B0B0B0">
<tr>
    <td colspan="2" width="616" height="25" bgcolor="#FFBB00"></td> 
</tr>                   
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">還原: </td>
    <td class="content_input_td_padding" align="left">清除上述設定值並還原有效設定值。</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">儲存: </td>
    <td class="content_input_td_padding" align="left">現在確認所有設定值並重新啟動ZVMODELVZ。</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">套用: </td>
    <td class="content_input_td_padding" align="left">確認上述設定值並繼續。</td>
</tr>
</table>
</td>
</tr>

</table>
</form>
</body>

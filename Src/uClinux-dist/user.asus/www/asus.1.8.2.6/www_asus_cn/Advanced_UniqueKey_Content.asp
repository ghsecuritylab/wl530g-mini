<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="style.css" media="screen"></link>
<script language="JavaScript" type="text/javascript" src="overlib.js"></script>
<script language="JavaScript" type="text/javascript" src="general.js"></script>
</head>  
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>    
<body onLoad="load_body()" onunLoad="return unload_body();">
<form method="GET" name="form" action="apply.cgi">
<!-- Table for the conntent page -->	    
<table width="666" border="0" cellpadding="0" cellspacing="0">     	      
    	
<input type="hidden" name="current_page" value="Advanced_UniqueKey_Content.asp"><input type="hidden" name="next_page" value="Advanced_ACL_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="DeviceSecurity11a;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">无线 - t2AES</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">「AES密钥控制」（AES Key Control）可让您以专为每个802.11a无线用户端保有一道特有的加密密钥。请记得先启用在「无线 – 界面」（Wireless - Interface）页中的AES加密功能。
         </td>
</tr>
<input type="hidden" name="" value="<% nvram_get_x("DeviceSecurity11a",""); %>">
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="AESList">AES存取控制列表（仅适用于11a）
         <input type="hidden" name="AESListCount_0" value="<% nvram_get_x("DeviceSecurity11a", "AESListCount"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'AESList', 64, ' Add ');" name="AESList" value="增加" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'AESList', 64, ' Del ');" name="AESList" value="删除" size="12">
</div>
</td><td width="5%"></td>
</tr>
<table class="content_list_table" width="640" border="0" cellspacing="0" cellpadding="0">
<tr>
<td colspan="3" height="10"></td>
</tr>
<tr>
<td colspan="3">
<div align="center">
<table class="content_list_value_table" border="1" cellspacing="0" cellpadding="0">
<tr>
<td></td><td class="content_list_field_header_td" colspan="">MAC地址	                
           	        </td><td class="content_list_field_header_td" colspan="">AES类型	                
           	        </td><td class="content_list_field_header_td" colspan="">AES密钥	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="12" class="content_input_list_fd" size="14" name="_0" onKeyPress="return is_hwaddr()"></td><td class="content_list_input_td" colspan=""><select name="_0" class="content_input_list_fd"><option value="64bits" <% nvram_match_list_x("DeviceSecurity11a","", "64bits","selected", 0); %>>64bits</option><option value="128bits" <% nvram_match_list_x("DeviceSecurity11a","", "128bits","selected", 0); %>>128bits</option><option value="152bits" <% nvram_match_list_x("DeviceSecurity11a","", "152bits","selected", 0); %>>152bits</option></select></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="32" class="content_input_list_fd" size="32" name="_0" onKeyPress="return is_wlkey(this, 'DeviceSecurity11a')" onKeyUp="return change_wlkey(this, 'DeviceSecurity11a')"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="AESList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("DeviceSecurity11a","AESList"); %>
</select></td>
</tr>
</table>
</div>
</td>
</tr>
<tr>
<td colspan="3" height="10"></td>
</tr>
</table>
</table>
</td>
</tr>
<tr>
<td>		
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="B0B0B0">
<tr bgcolor="#CCCCCC"><td colspan="3"><font face="arial" size="2"><b>&nbsp</b></font></td></tr>
<tr bgcolor="#FFFFFF">  
   <td id ="Confirm" height="25" width="34%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Restore ')" type="submit" value=" 还原 " name="action"></font></div> 
   </td>  
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Finish ')" type="submit" value=" 保存 " name="action"></font></div> 
   </td>
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Apply ')" type="submit" value=" 应用 " name="action"></font></div> 
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
    <td class="content_header_td_15" align="left">还原: </td>
    <td class="content_input_td_padding" align="left">清除上述设置并还原有效设置。</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">保存: </td>
    <td class="content_input_td_padding" align="left">现在确认所有设置并重新启动ZVMODELVZ。</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">应用: </td>
    <td class="content_input_td_padding" align="left">确认上述设置并继续。</td>
</tr>
</table>
</td>
</tr>

</table>
</form>
</body>

<head>
<title>WL530g Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
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
    	
<input type="hidden" name="current_page" value="Advanced_APLAN_Content.asp"><input type="hidden" name="next_page" value="SaveRestart.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="LANHostConfig;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">IP組態 - 區域網路</td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">LAN IP設定
            </td>
</tr>
<tr>
<td class="content_header_td">自動取得IP？
           </td><td class="content_input_td"><input type="radio" value="1" name="lan_proto_x" class="content_input_fd" onClick="return change_common_radio(this, 'LANHostConfig', 'lan_proto_x', '1')" <% nvram_match_x("LANHostConfig","lan_proto_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="lan_proto_x" class="content_input_fd" onClick="return change_common_radio(this, 'LANHostConfig', 'lan_proto_x', '0')" <% nvram_match_x("LANHostConfig","lan_proto_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('此一WL530g的IP位址與您在本地網路中所見相同。預設值是192.168.1.1。', LEFT);" onMouseOut="return nd();">IP位址：
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="lan_ipaddr" value="<% nvram_get_x("LANHostConfig","lan_ipaddr"); %>" onBlur="return validate_ipaddr(this, 'lan_ipaddr')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('此一WL530g的子網路遮罩與您在本地網路中所見相同。預設值是255.255.255.0。', LEFT);" onMouseOut="return nd();">子網路遮罩：
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="lan_netmask" value="<% nvram_get_x("LANHostConfig","lan_netmask"); %>" onBlur="return validate_ipaddr(this, 'lan_netmask')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('此為無線網路橋接器所使用的預設閘道器的IP位址', LEFT);" onMouseOut="return nd();">預設閘道器：
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="lan_gateway" value="<% nvram_get_x("LANHostConfig","lan_gateway"); %>" onBlur="return validate_ipaddr(this, 'lan_gateway')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0"></table>
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
    <td class="content_input_td_padding" align="left">現在確認所有設定值並重新啟動WL530g。</td>
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

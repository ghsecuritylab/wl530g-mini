<head>
<title>WL520g Web Manager</title>
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
    	
<input type="hidden" name="current_page" value="Advanced_URLFilter_Content.asp"><input type="hidden" name="next_page" value="SaveRestart.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="FirewallConfig;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">互联网防火墙 -  URL过滤器</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">URL过滤器可让您以封锁从您的本地网络进行存取的指定URL。
         </td>
</tr>
<tr>
<td class="content_header_td">启用URL过滤器？
           </td><td class="content_input_td"><input type="radio" value="1" name="url_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'FirewallConfig', 'url_enable_x', '1')" <% nvram_match_x("FirewallConfig","url_enable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="url_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'FirewallConfig', 'url_enable_x', '0')" <% nvram_match_x("FirewallConfig","url_enable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('本栏目可定义URL过滤器将会启用的日期。', LEFT);" onMouseOut="return nd();">URL过滤器启用日期：
           </td><td class="content_input_td"><input type="hidden" maxlength="7" class="content_input_fd" size="7" name="url_date_x" value="<% nvram_get_x("FirewallConfig","url_date_x"); %>">
<p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">
<input type="checkbox" class="content_input_fd" name="url_date_x_Sun">Sun</input><input type="checkbox" class="content_input_fd" name="url_date_x_Mon">Mon</input><input type="checkbox" class="content_input_fd" name="url_date_x_Tue">Tue</input><input type="checkbox" class="content_input_fd" name="url_date_x_Wed">Wed</input>
</p>
<input type="checkbox" class="content_input_fd" name="url_date_x_Thu">Thu</input><input type="checkbox" class="content_input_fd" name="url_date_x_Fri">Fri</input><input type="checkbox" class="content_input_fd" name="url_date_x_Sat">Sat</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('本栏目可定义URL过滤器将会启用的时间间隔。', LEFT);" onMouseOut="return nd();">URL过滤器启用的时间：
           </td><td class="content_input_td"><input type="hidden" maxlength="11" class="content_input_fd" size="11" name="url_time_x" value="<% nvram_get_x("FirewallConfig","url_time_x"); %>"><input type="text" maxlength="2" class="content_input_fd" size="2" name="url_time_x_starthour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 0)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="url_time_x_startmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 1)">-
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="url_time_x_endhour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 2)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="url_time_x_endmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 3)"></td>
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="UrlList">URL关键字列表
         <input type="hidden" name="url_num_x_0" value="<% nvram_get_x("FirewallConfig", "url_num_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'UrlList', 128, ' Add ');" name="UrlList" value="增加" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'UrlList', 128, ' Del ');" name="UrlList" value="删除" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">URL关键字	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="32" size="36" name="url_keyword_x_0" class="content_input_list_fd" onKeyPress="return is_string(this)"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="UrlList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("FirewallConfig","UrlList"); %>
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
    <td class="content_input_td_padding" align="left">现在确认所有设置并重新启动WL520g。</td>
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

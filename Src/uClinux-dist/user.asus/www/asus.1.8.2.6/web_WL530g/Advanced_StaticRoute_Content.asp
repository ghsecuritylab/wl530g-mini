<head>
<title>WL530g Web Manager</title>
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
    	
<input type="hidden" name="current_page" value="Advanced_StaticRoute_Content.asp"><input type="hidden" name="next_page" value="Advanced_DynamicRoute_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="RouterConfig;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">·���� - ��̬·��</td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('������̬·������Static Route List������ָ����̬·����Ŀ���е�·����Ϣ�����·��䵽RIP���ڡ�', LEFT);" onMouseOut="return nd();">����̬·�����·��䵽RIP��·����ϢЭ�飩�ڣ�
           </td><td class="content_input_td"><input type="radio" value="1" name="dr_static_rip_x" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', 'dr_static_rip_x', '1')" <% nvram_match_x("RouterConfig","dr_static_rip_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="dr_static_rip_x" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', 'dr_static_rip_x', '0')" <% nvram_match_x("RouterConfig","dr_static_rip_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�����ڴ���֪ͨ��announcement��ʱ·�����õĺ��ʵ�˳�����RIP����Ч��˳���Ǵ�1��16��', LEFT);" onMouseOut="return nd();">���þ�̬·���Ķ�����׼��1-16����
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="dr_static_matric_x" class="content_input_fd" value="<% nvram_get_x("RouterConfig", "dr_static_matric_x"); %>" onBlur="validate_range(this, 1, 16)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����Ŀ����ԡ���̬·������������Static Route Filter table������ָ���ĺ���Ŀ�����磬ȷ���Ƿ���Ҫ���·��䡣', LEFT);" onMouseOut="return nd();">ֻ��·����������ָ����·���������á�
           </td><td class="content_input_td"><select name="dr_default_x" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', 'dr_default_x')"><option class="content_input_fd" value="0" <% nvram_match_x("RouterConfig","dr_default_x", "0","selected"); %>>be redistributed</option><option class="content_input_fd" value="1" <% nvram_match_x("RouterConfig","dr_default_x", "1","selected"); %>>not be redistributed</option></select></td>
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="StaticRoute">��̬·���б�
         <input type="hidden" name="dr_staticnum_x_0" value="<% nvram_get_x("RouterConfig", "dr_staticnum_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'StaticRoute', 16, ' Add ');" name="StaticRoute" value="����" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'StaticRoute', 16, ' Del ');" name="StaticRoute" value="ɾ��" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="button" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return openHelp(this, 'RouterHelp');" name="StaticRoute" value="˵��" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">����/����IP	                
           	        </td><td class="content_list_field_header_td" colspan="">�����������	                
           	        </td><td class="content_list_field_header_td" colspan="">����	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="18" name="dr_staticipaddr_x_0" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="5" style="font-family: fixedsys; font-size: 10pt;" size="8" name="dr_staticnetmask_x_0" onKeyPress="return is_number(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="16" name="dr_staticgateway_x_0" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="StaticRoute_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("RouterConfig","StaticRoute"); %>
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="RipSRoute">��̬·�ɹ�����
         <input type="hidden" name="RipSRouteCount_0" value="<% nvram_get_x("RouterConfig", "RipSRouteCount"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'RipSRoute', 16, ' Add ');" name="RipSRoute" value="����" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'RipSRoute', 16, ' Del ');" name="RipSRoute" value="ɾ��" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="button" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return openHelp(this, 'RouterHelp');" name="RipSRoute" value="˵��" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">����/����IP	                
           	        </td><td class="content_list_field_header_td" colspan="">�����������	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="15" name="_0" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="5" style="font-family: fixedsys; font-size: 10pt;" size="8" name="_0" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="RipSRoute_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("RouterConfig","RipSRoute"); %>
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
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="B0B0B0">
<tr bgcolor="#CCCCCC"><td colspan="3"><font face="arial" size="2"><b>&nbsp</b></font></td></tr>
<tr bgcolor="#FFFFFF">  
   <td id ="Confirm" height="25" width="34%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Restore ')" type="submit" value=" ��ԭ " name="action"></font></div> 
   </td>  
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Finish ')" type="submit" value=" ���� " name="action"></font></div> 
   </td>
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Apply ')" type="submit" value=" Ӧ�� " name="action"></font></div> 
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
    <td class="content_header_td_15" align="left">��ԭ: </td>
    <td class="content_input_td_padding" align="left">����������ò���ԭ��Ч���á�</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">����: </td>
    <td class="content_input_td_padding" align="left">����ȷ���������ò���������WL530g��</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">Ӧ��: </td>
    <td class="content_input_td_padding" align="left">ȷ���������ò�������</td>
</tr>
</table>
</td>
</tr>

</table>
</form>
</body>

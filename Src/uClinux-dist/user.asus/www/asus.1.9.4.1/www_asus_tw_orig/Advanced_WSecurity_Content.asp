<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
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
    	
<input type="hidden" name="current_page" value="Advanced_WSecurity_Content.asp"><input type="hidden" name="next_page" value="Advanced_WAdvanced_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="WLANAuthentication11a;WLANConfig11b;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">���� - RADIUS ����</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">���⿡�� RADIUS ������ ���Ͽ� ���� Ŭ���̾�Ʈ�� �����ϴ� �߰����� �Ķ���͸� ������ �� �ֽ��ϴ�. �̰��� "����-�������̽�"�� "�������"��"WPA" �Ǵ� "802.1x �ݰ�"���� �����ϴ� ���ȿ� �䱸�˴ϴ�.
         </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� RADIUS ������ �ּҸ� ���Ͽ� 802.1X ���������� ���� �� Ű ������ ���� ����� �� �ֵ��� �մϴ�.', LEFT);" onMouseOut="return nd();">���� IP �ּ�:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wl_radius_ipaddr" value="<% nvram_get_x("WLANAuthentication11a","wl_radius_ipaddr"); %>" onBlur="return validate_ipaddr(this, 'wl_radius_ipaddr')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸񿡼� RADIUS ������ ����ϴ� UDP ��Ʈ��ȣ�� ���մϴ�.', LEFT);" onMouseOut="return nd();">���� ��Ʈ:
           </td><td class="content_input_td"><input type="text" maxlength="5" class="content_input_fd" size="5" name="wl_radius_port" value="<% nvram_get_x("WLANAuthentication11a","wl_radius_port"); %>" onBlur="validate_range(this, 0, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� RADIUS �������� ������ �����ϱ� ���� ���Ǵ� ��й�ȣ�� ���մϴ�.', LEFT);" onMouseOut="return nd();">��п���:
           </td><td class="content_input_td"><input type="password" maxlength="64" class="content_input_fd" size="32" name="wl_radius_key" value="<% nvram_get_x("WLANAuthentication11a","wl_radius_key"); %>" onBlur="validate_string(this)"></td>
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
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="B0B0B0">
<tr bgcolor="#CCCCCC"><td colspan="3"><font face="arial" size="2"><b>&nbsp</b></font></td></tr>
<tr bgcolor="#FFFFFF">  
   <td id ="Confirm" height="25" width="34%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Restore ')" type="submit" value=" ���� " name="action"></font></div> 
   </td>  
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Finish ')" type="submit" value=" ��ħ " name="action"></font></div> 
   </td>
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Apply ')" type="submit" value=" ���� " name="action"></font></div> 
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
    <td class="content_header_td_15" align="left">����: </td>
    <td class="content_input_td_padding" align="left">��� ������ ����ϰ� ���������� ��ȿȭ�մϴ�.</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">��ħ: </td>
    <td class="content_input_td_padding" align="left">��� ������ Ȯ���ϰ� ZVMODELVZ�� ���� �ٽ� �����մϴ�.</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">����: </td>
    <td class="content_input_td_padding" align="left">��⼳���� Ȯ���ϰ� ����մϴ�.</td>
</tr>
</table>
</td>
</tr>

</table>
</form>
</body>

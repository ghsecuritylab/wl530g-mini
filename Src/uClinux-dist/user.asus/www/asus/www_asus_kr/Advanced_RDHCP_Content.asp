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
    	
<input type="hidden" name="current_page" value="Advanced_RDHCP_Content.asp"><input type="hidden" name="next_page" value="Advanced_RMISC_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="LANHostConfig;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">IP ���ǱԷ��̼� - DHCP ����</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">ZVMODELVZ�� �ִ� 253���� ���� ��Ʈ��ũ IP �ּҸ� �����մϴ�. ���� �ӽ��� IP�ּҴ� ��Ʈ��ũ �����ڷ� ���� ���� �Ҵ�ްų� DHCP ������ Ȱ��ȭ �� ��� ZVMODELVZ�� ���� �ڵ� �ο����� �� �ֽ��ϴ�.
         </td>
</tr>
<tr>
<td class="content_header_td">DHCP ������ Ȱ��ȭ�ϰڽ��ϱ�?
           </td><td class="content_input_td"><input type="radio" value="1" name="dhcp_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'LANHostConfig', 'dhcp_enable_x', '1')" <% nvram_match_x("LANHostConfig","dhcp_enable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="dhcp_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'LANHostConfig', 'dhcp_enable_x', '0')" <% nvram_match_x("LANHostConfig","dhcp_enable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� DHCP������ IP �ּҸ� ��û�ϴ� Ŭ���̾�Ʈ�鿡�� �����ϴ� ������ �̸��� ��Ÿ���ϴ�.', LEFT);" onMouseOut="return nd();">������ �̸�:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="lan_domain" value="<% nvram_get_x("LANHostConfig","lan_domain"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� ���� ��Ʈ��ũ�� DHCP������ ���Ͽ� �Ҵ�Ǵ� IP Ǯ�� ù ��° �ּҸ� ��Ÿ���ϴ�.', LEFT);" onMouseOut="return nd();">IP Ǯ ���� �ּ�:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="dhcp_start" value="<% nvram_get_x("LANHostConfig","dhcp_start"); %>" onBlur="return validate_ipaddr(this, 'dhcp_start')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� ���� ��Ʈ��ũ�� DHCP������ ���Ͽ� �Ҵ�Ǵ� IP Ǯ�� ������ �ּҸ� ��Ÿ���ϴ�.', LEFT);" onMouseOut="return nd();">IP Ǯ ���� �ּ�:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="dhcp_end" value="<% nvram_get_x("LANHostConfig","dhcp_end"); %>" onBlur="return validate_ipaddr(this, 'dhcp_end')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� ������ ���� IP�ּҷ� ��Ʈ��ũ ����ڿ��� ����� ����ð��� ��Ÿ���ϴ�.', LEFT);" onMouseOut="return nd();">���� �ð�:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="dhcp_lease" class="content_input_fd" value="<% nvram_get_x("LANHostConfig", "dhcp_lease"); %>" onBlur="validate_range(this, 1, 86400)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� LAN ����Ʈ������ IP�ּҸ� ǥ���մϴ�. �������� �θ�ZVMODELVZ�� IP�ּҰ� �Ҵ� �˴ϴ�.', LEFT);" onMouseOut="return nd();">�⺻���� ����Ʈ����:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="dhcp_gateway_x" value="<% nvram_get_x("LANHostConfig","dhcp_gateway_x"); %>" onBlur="return validate_ipaddr(this, 'dhcp_gateway_x')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">DNS ��WINS ��������
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� DHCP������ IP �ּҸ� ��û�ϴ� Ŭ���̾�Ʈ�鿡�� �����ϴ� DNS�� IP�ּҸ� ��Ÿ���ϴ�. �������� �θ�DNS ��û�� ZVMODELVZ�� ó���ϰ� �˴ϴ�.', LEFT);" onMouseOut="return nd();">DNS ���� 1:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="dhcp_dns1_x" value="<% nvram_get_x("LANHostConfig","dhcp_dns1_x"); %>" onBlur="return validate_ipaddr(this, 'dhcp_dns1_x')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td">DNS ���� 2:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd_ro" size="15" name="" value="<% nvram_get_f("LANHostConfig","lan_ipaddr"); %>" readonly="1"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('WINS�� ��� PC�� ���ͳ� ���ͷ����� �����մϴ�. WINS������ ����ϰ� ������ �� ���� ���� IP�ּҸ� �Է��Ͻʽÿ�.', LEFT);" onMouseOut="return nd();">WINS ����:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="dhcp_wins_x" value="<% nvram_get_x("LANHostConfig","dhcp_wins_x"); %>" onBlur="return validate_ipaddr(this, 'dhcp_wins_x')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">IP �ּ� �����Ҵ�
            </td>
</tr>
<tr>
<td class="content_header_td">�����Ҵ��� Ȱ��ȭ�ϰڽ��ϱ�?
           </td><td class="content_input_td"><input type="radio" value="1" name="dhcp_static_x" class="content_input_fd" onClick="return change_common_radio(this, 'LANHostConfig', 'dhcp_static_x', '1')" <% nvram_match_x("LANHostConfig","dhcp_static_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="dhcp_static_x" class="content_input_fd" onClick="return change_common_radio(this, 'LANHostConfig', 'dhcp_static_x', '0')" <% nvram_match_x("LANHostConfig","dhcp_static_x", "0", "checked"); %>>No</input></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="ManualDHCPList">�����Ҵ� IP ���
         <input type="hidden" name="dhcp_staticnum_x_0" value="<% nvram_get_x("LANHostConfig", "dhcp_staticnum_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'ManualDHCPList', 8, ' Add ');" name="ManualDHCPList" value="�߰�" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'ManualDHCPList', 8, ' Del ');" name="ManualDHCPList" value="����" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">MAC �ּ�	                
           	        </td><td class="content_list_field_header_td" colspan="">IP �ּ�	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="12" class="content_input_list_fd" size="12" name="dhcp_staticmac_x_0" onKeyPress="return is_hwaddr()"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="14" name="dhcp_staticip_x_0" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="4" name="ManualDHCPList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("LANHostConfig","ManualDHCPList"); %>
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

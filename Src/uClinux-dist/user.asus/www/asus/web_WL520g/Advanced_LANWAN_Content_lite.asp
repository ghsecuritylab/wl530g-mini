<head>
<title>WL520g Web Manager</title>
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
    	
<input type="hidden" name="current_page" value="Advanced_LANWAN_Content.asp"><input type="hidden" name="next_page" value="Advanced_DHCP_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="Layer3Forwarding;LANHostConfig;IPConnection;PPPConnection;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">IP ���ǱԷ��̼� - WAN & LAN</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">WL520g�� ���� ����� WAN ���������� �����մϴ�. �̷��� ������ WAN �������� ���� �ִ� ��Ӵٿ� �޴����� ������ �� �ֽ��ϴ�. ���� �ʵ��׸��� ������ ���������� ���� �ٸ��ϴ�.
         </td>
</tr>
<tr>
<td class="content_header_td">WAN ��������:
           </td><td class="content_input_td"><select name="wan_proto" class="content_input_fd" onChange="return change_common(this, 'Layer3Forwarding', 'wan_proto')"><option class="content_input_fd" value="dhcp" <% nvram_match_x("Layer3Forwarding","wan_proto", "dhcp","selected"); %>>Automatic IP</option><option class="content_input_fd" value="static" <% nvram_match_x("Layer3Forwarding","wan_proto", "static","selected"); %>>Static IP</option><option class="content_input_fd" value="pppoe" <% nvram_match_x("Layer3Forwarding","wan_proto", "pppoe","selected"); %>>PPPoE</option><option class="content_input_fd" value="pptp" <% nvram_match_x("Layer3Forwarding","wan_proto", "pptp","selected"); %>>PPTP</option><option class="content_input_fd" value="bigpond" <% nvram_match_x("Layer3Forwarding","wan_proto", "bigpond","selected"); %>>BigPond</option></select></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">WAN IP ����
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�̰��� ���� ��Ʈ��ũ���� ��Ÿ���� �ٿ� ���� WL520g�� IP�ּ��Դϴ�. �������� �θ� WL520g�� DHCP ������ ���� IP�ּҸ� �ڵ����� �����ɴϴ�.', LEFT);" onMouseOut="return nd();">IP �ּ�:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_ipaddr" value="<% nvram_get_x("IPConnection","wan_ipaddr"); %>" onBlur="return validate_ipaddr(this, 'wan_ipaddr')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���� ��Ʈ��ũ���� ��Ÿ���� �Ͱ� ���� WL520g�� ����� ����ũ�Դϴ�', LEFT);" onMouseOut="return nd();">����� ����ũ:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_netmask" value="<% nvram_get_x("IPConnection","wan_netmask"); %>" onBlur="return validate_ipaddr(this, 'wan_netmask')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('WL520g�� ���� ��Ʈ��ũ �Ǵ� ȣ��Ʈ�� ������ �� �ֵ��� �ϴ� �⺻���� ����Ʈ������ IP�ּ��Դϴ�.', LEFT);" onMouseOut="return nd();">�⺻���� ����Ʈ����:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_gateway" value="<% nvram_get_x("IPConnection","wan_gateway"); %>" onBlur="return validate_ipaddr(this, 'wan_gateway')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">WAN DNS ����
            </td>
</tr>
<tr>
<td class="content_header_td"> DNS ������ �ڵ� �ο��մϱ�?
           </td><td class="content_input_td"><input type="radio" value="1" name="wan_dnsenable_x" class="content_input_fd" onClick="return change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', '1')" <% nvram_match_x("IPConnection","wan_dnsenable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wan_dnsenable_x" class="content_input_fd" onClick="return change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', '0')" <% nvram_match_x("IPConnection","wan_dnsenable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� WL520g�� ����Ǵ� DNS�� IP�ּҸ� ��Ÿ���ϴ�.', LEFT);" onMouseOut="return nd();">DNS ����1:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_dns1_x" value="<% nvram_get_x("IPConnection","wan_dns1_x"); %>" onBlur="return validate_ipaddr(this, 'wan_dns1_x')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� WL520g�� ����Ǵ� DNS�� IP�ּҸ� ��Ÿ���ϴ�.', LEFT);" onMouseOut="return nd();">DNS ����2:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_dns2_x" value="<% nvram_get_x("IPConnection","wan_dns2_x"); %>" onBlur="return validate_ipaddr(this, 'wan_dns2_x')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0"></table>
</td>
</tr>
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">PPPoE �� PPTP ����
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� WAN ���������� PPPoE�� ���� ��쿡�� �̿� �����մϴ�.', LEFT);" onMouseOut="return nd();">����� �̸�:
           </td><td class="content_input_td"><input type="text" maxlength="64" class="content_input_fd" size="32" name="wan_pppoe_username" value="<% nvram_get_x("PPPConnection","wan_pppoe_username"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� WAN ���������� PPPoE�� ���� ��쿡�� �̿� �����մϴ�.', LEFT);" onMouseOut="return nd();">��й�ȣ:
           </td><td class="content_input_td"><input type="password" maxlength="64" class="content_input_fd" size="32" name="wan_pppoe_passwd" value="<% nvram_get_x("PPPConnection","wan_pppoe_passwd"); %>" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� ������ �ð��� ����� �� ISP ������ ������ �� �ֵ��� ���ǱԷ��̼� �� �� �ְ� �մϴ�. Tx���� üũ�Ǿ� ������ ���ͳ����κ����� �����Ͱ� ���ð��� ����ϵ��� �ǳʶٱ� �մϴ�.', LEFT);" onMouseOut="return nd();">�ʴ��� ��� ���������ð�(�ɼ�):
           </td><td class="content_input_td"><input type="text" maxlength="10" class="content_input_fd" size="10" name="wan_pppoe_idletime" value="<% nvram_get_x("PPPConnection","wan_pppoe_idletime"); %>" onBlur="validate_range(this, 0, 4294967295)" onKeyPress="return is_number(this)"><input type="checkbox" style="margin-left:30" name="wan_pppoe_idletime_check" value="" onClick="return change_common_radio(this, 'PPPConnection', 'wan_pppoe_idletime', '1')">Tx Only</input></td>
</tr>
<input type="hidden" name="wan_pppoe_txonly_x" value="<% nvram_get_x("PPPConnection","wan_pppoe_txonly_x"); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('PPPoE ��Ŷ�� �ִ����۴���(MTU;Maximum Transmission Unit)�Դϴ�.', LEFT);" onMouseOut="return nd();">MTU:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wan_pppoe_mtu" class="content_input_fd" value="<% nvram_get_x("PPPConnection", "wan_pppoe_mtu"); %>" onBlur="validate_range(this, 576, 1492)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('packet.PPPoE ��Ŷ�� �ִ���Ŵ���(MRU;Maximum Receive Unit)�Դϴ�.', LEFT);" onMouseOut="return nd();">MRU:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wan_pppoe_mru" class="content_input_fd" value="<% nvram_get_x("PPPConnection", "wan_pppoe_mru"); %>" onBlur="validate_range(this, 576, 1492)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �׸��� ISP�� ���� �� �ֽ��ϴ�. �ʿ�� ISP�� �����Ͽ� �ۼ��մϴ�.', LEFT);" onMouseOut="return nd();">���� �̸�(�ɼ�):
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wan_pppoe_service" value="<% nvram_get_x("PPPConnection","wan_pppoe_service"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �׸��� ISP�� ���� �� �ֽ��ϴ�. �ʿ�� ISP�� �����Ͽ� �ۼ��մϴ�.', LEFT);" onMouseOut="return nd();">�׼��� ������ġ �̸�(�ɼ�):
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wan_pppoe_ac" value="<% nvram_get_x("PPPConnection","wan_pppoe_ac"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">ISP Ư���䱸����
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸񿡼��� WL520g�� ȣ��Ʈ �̸��� �ο��� �� �ֽ��ϴ�. ISP�� ���� �䱸�մϴ�.', LEFT);" onMouseOut="return nd();">ȣ��Ʈ �̸�:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wan_hostname" value="<% nvram_get_x("PPPConnection","wan_hostname"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸񿡼��� ���ͳ� ������ ���� WL520g�� MAC �ּҸ� �ο��� �� �ֽ��ϴ�. ISP�� ���� �䱸�մϴ�.', LEFT);" onMouseOut="return nd();">MAC �ּ�:
           </td><td class="content_input_td"><input type="text" maxlength="12" class="content_input_fd" size="12" name="wan_hwaddr_x" value="<% nvram_get_x("PPPConnection","wan_hwaddr_x"); %>" onBlur="return validate_hwaddr(this)" onKeyPress="return is_hwaddr()"></td>
</tr>
<tr>
<td class="content_header_td">Heart-Beat Server:
           </td><td class="content_input_td"><input type="text" maxlength="256" class="content_input_fd" size="32" name="wan_heartbeat_x" value="<% nvram_get_x("PPPConnection","wan_heartbeat_x"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
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
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">LAN IP ����
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���� ��Ʈ��ũ���� �������� �Ͱ� ���� WL520g�� IP�ּ��Դϴ�. �ʱ⼳������ 192.168.1.1�Դϴ�.', LEFT);" onMouseOut="return nd();">IP �ּ�:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="lan_ipaddr" value="<% nvram_get_x("LANHostConfig","lan_ipaddr"); %>" onBlur="return validate_ipaddr(this, 'lan_ipaddr')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���� ��Ʈ��ũ���� �������� �Ͱ� ���� WL520g�� ����� ����ũ�Դϴ�. �ʱ⼳������ 255.255.255.0�Դϴ�.', LEFT);" onMouseOut="return nd();">����� ����ũ:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="lan_netmask" value="<% nvram_get_x("LANHostConfig","lan_netmask"); %>" onBlur="return validate_ipaddr(this, 'lan_netmask')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<input type="hidden" name="dhcp_start" value="<% nvram_get_x("LANHostConfig","dhcp_start"); %>"><input type="hidden" name="dhcp_end" value="<% nvram_get_x("LANHostConfig","dhcp_end"); %>">
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
    <td class="content_input_td_padding" align="left">��� ������ Ȯ���ϰ� WL520g�� ���� �ٽ� �����մϴ�.</td>
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

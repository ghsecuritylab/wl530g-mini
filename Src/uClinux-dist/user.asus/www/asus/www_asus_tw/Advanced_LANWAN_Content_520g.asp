<head>
<title>ZVMODELVZ Web Manager</title>
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
    	
<input type="hidden" name="current_page" value="Advanced_LANWAN_Content.asp"><input type="hidden" name="next_page" value="Advanced_DHCP_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="Layer3Forwarding;LANHostConfig;IPConnection;PPPConnection;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">IP�պA - �򥻳]�w</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">ZVMODELVZ�i�䴩�ƺسs��WAN���s�u�����C�o�������i�qWAN�s�u�����Ǫ��U�Ԧ���椤����C�]�w���|���z�O������سs�u�����өw�C
         </td>
</tr>
<tr>
<td class="content_header_td">WAN�s�u�����G
           </td><td class="content_input_td"><select name="wan_proto" class="content_input_fd" onChange="return change_common(this, 'Layer3Forwarding', 'wan_proto')"><option class="content_input_fd" value="dhcp" <% nvram_match_x("Layer3Forwarding","wan_proto", "dhcp","selected"); %>>Automatic IP</option><option class="content_input_fd" value="static" <% nvram_match_x("Layer3Forwarding","wan_proto", "static","selected"); %>>Static IP</option><option class="content_input_fd" value="pppoe" <% nvram_match_x("Layer3Forwarding","wan_proto", "pppoe","selected"); %>>PPPoE</option><option class="content_input_fd" value="pptp" <% nvram_match_x("Layer3Forwarding","wan_proto", "pptp","selected"); %>>PPTP</option><option class="content_input_fd" value="bigpond" <% nvram_match_x("Layer3Forwarding","wan_proto", "bigpond","selected"); %>>BigPond</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('��ܡu���Ρv�A�|�NWAN�q�T�𰱥ΨñNZVMODELVZ�]���O�@�xAP�C��ܡu�ҥΡv�A�|�NZVMODELVZ�]���O�@�x�t��NAT�\�઺���Ѿ��C�b�}�������N�A�Ӻ����l�u���WWAN�q�T��ɡA��ܡu�۰ʡv�i�NZVMODELVZ�]���O�@�x���Ѿ��C', LEFT);" onMouseOut="return nd();">WAN�Ҧ��G
           </td><td class="content_input_td"><select name="wan_mode_x" class="content_input_fd" onChange="return change_common(this, 'Layer3Forwarding', 'wan_mode_x')"><option class="content_input_fd" value="0" <% nvram_match_x("Layer3Forwarding","wan_mode_x", "0","selected"); %>>Disabled</option><option class="content_input_fd" value="1" <% nvram_match_x("Layer3Forwarding","wan_mode_x", "1","selected"); %>>Enabled</option><option class="content_input_fd" value="2" <% nvram_match_x("Layer3Forwarding","wan_mode_x", "2","selected"); %>>Auto</option></select></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">���ں��� IP�]�w
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���@ZVMODELVZ��IP��}�P�z�b���ݺ����W�Ҩ��ۦP�C�p�G�z�ŵۤ���AZVMODELVZ�|�۰ʦVDHCP���A�����oIP��}�C', LEFT);" onMouseOut="return nd();">IP��}�G
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_ipaddr" value="<% nvram_get_x("IPConnection","wan_ipaddr"); %>" onBlur="return validate_ipaddr(this, 'wan_ipaddr')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���@ZVMODELVZ��IP��}�P�z�b���ݺ����W�Ҩ��ۦP�C', LEFT);" onMouseOut="return nd();">�l�����B�n�G
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_netmask" value="<% nvram_get_x("IPConnection","wan_netmask"); %>" onBlur="return validate_ipaddr(this, 'wan_netmask')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�����w�]�h�D����IP��}�A�i��ZVMODELVZ�P���ݺ����ΥD�������ۤ��sô�C', LEFT);" onMouseOut="return nd();">�w�]�h�D���G
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_gateway" value="<% nvram_get_x("IPConnection","wan_gateway"); %>" onBlur="return validate_ipaddr(this, 'wan_gateway')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">���ں��� DNS�]�w
            </td>
</tr>
<tr>
<td class="content_header_td">�۰ʱ��WDNS���A���H
           </td><td class="content_input_td"><input type="radio" value="1" name="wan_dnsenable_x" class="content_input_fd" onClick="return change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', '1')" <% nvram_match_x("IPConnection","wan_dnsenable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wan_dnsenable_x" class="content_input_fd" onClick="return change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', '0')" <% nvram_match_x("IPConnection","wan_dnsenable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���@���i���ZVMODELVZ�ҳsô��DNS��IP��}�C', LEFT);" onMouseOut="return nd();">DNS���A��1�G
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_dns1_x" value="<% nvram_get_x("IPConnection","wan_dns1_x"); %>" onBlur="return validate_ipaddr(this, 'wan_dns1_x')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���@���i���ZVMODELVZ�ҳsô��DNS��IP��}�C', LEFT);" onMouseOut="return nd();">DNS���A��2�G
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
<td class="content_section_header_td" colspan="2">PPPoE��PPTP�b��
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����Ȧb�z�N���ں����s�u�����]�wPPPoE�ɾA��', LEFT);" onMouseOut="return nd();">�Τ�W�١G
           </td><td class="content_input_td"><input type="text" maxlength="64" class="content_input_fd" size="32" name="wan_pppoe_username" value="<% nvram_get_x("PPPConnection","wan_pppoe_username"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����Ȧb�z�N���ں����s�u�����]�wPPPoE�ɾA��', LEFT);" onMouseOut="return nd();">�K�X�G
           </td><td class="content_input_td"><input type="password" maxlength="64" class="content_input_fd" size="32" name="wan_pppoe_passwd" value="<% nvram_get_x("PPPConnection","wan_pppoe_passwd"); %>" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�������z�i�]�w�b�@�S�w�ɶ����j����פ�zISP�s�u���պA�C�@�ƭ�0�i���\�L���������m�ɶ��C�p�G�ȤĿ�Tx�A����Ӧۺ��ں�������ƱN�|���L�H�K�~��p�ⶡ�m���ɶ��C', LEFT);" onMouseOut="return nd();">�H��p�⤧���m�_�u�ɶ��]�ﶵ�^�G
           </td><td class="content_input_td"><input type="text" maxlength="10" class="content_input_fd" size="10" name="wan_pppoe_idletime" value="<% nvram_get_x("PPPConnection","wan_pppoe_idletime"); %>" onBlur="validate_range(this, 0, 4294967295)" onKeyPress="return is_number(this)"><input type="checkbox" style="margin-left:30" name="wan_pppoe_idletime_check" value="" onClick="return change_common_radio(this, 'PPPConnection', 'wan_pppoe_idletime', '1')">Tx Only</input></td>
</tr>
<input type="hidden" name="wan_pppoe_txonly_x" value="<% nvram_get_x("PPPConnection","wan_pppoe_txonly_x"); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('�ҫ���PPPoE���̤j�ǿ���]MTU�^�C', LEFT);" onMouseOut="return nd();">�̤j�ǿ���]MTU�^�G
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wan_pppoe_mtu" class="content_input_fd" value="<% nvram_get_x("PPPConnection", "wan_pppoe_mtu"); %>" onBlur="validate_range(this, 576, 1492)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�ҫ���PPPoE���̤j�������]MRU�^�C', LEFT);" onMouseOut="return nd();">�̤j�������]MRU�^�G
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wan_pppoe_mru" class="content_input_fd" value="<% nvram_get_x("PPPConnection", "wan_pppoe_mru"); %>" onBlur="validate_range(this, 576, 1492)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�����γ\�Y��ISP�~�̯�����w�C�ЦV�z��ISP�~�̽T�{�é�ݭn�ɱN���̶�J�C', LEFT);" onMouseOut="return nd();">�����A�ȦW�١]�ﶵ�^�G
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wan_pppoe_service" value="<% nvram_get_x("PPPConnection","wan_pppoe_service"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�����γ\�Y��ISP�~�̯�����w�C�ЦV�z��ISP�~�̽T�{�é�ݭn�ɱN���̶�J�C', LEFT);" onMouseOut="return nd();">�s�����T���]Access Concentrator�^�W�١]�ﶵ�^�G
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wan_pppoe_ac" value="<% nvram_get_x("PPPConnection","wan_pppoe_ac"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�ҥ�PPPoE Relay�i���ϰ�����]LAN�^������a�x�]�w�i�q�L������}�ഫ�]NAT�^���A�����ӧOPPPoE�s�u�C', LEFT);" onMouseOut="return nd();">�ҥ�PPPoE Relay�]PPPoE��e�^�H
           </td><td class="content_input_td"><input type="radio" value="1" name="wan_pppoe_relay_x" class="content_input_fd" onClick="return change_common_radio(this, 'PPPConnection', 'wan_pppoe_relay_x', '1')" <% nvram_match_x("PPPConnection","wan_pppoe_relay_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wan_pppoe_relay_x" class="content_input_fd" onClick="return change_common_radio(this, 'PPPConnection', 'wan_pppoe_relay_x', '0')" <% nvram_match_x("PPPConnection","wan_pppoe_relay_x", "0", "checked"); %>>No</input></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">�Ӧ�ISP�~�̪��S�O�ݨD
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����i���z����ZVMODELVZ�ҨϥΪ��D���W�١C�q�`�O�zISP�~�̭n�D���W�١C', LEFT);" onMouseOut="return nd();">�D���W�١G
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wan_hostname" value="<% nvram_get_x("PPPConnection","wan_hostname"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����i���z����ZVMODELVZ�s�����ں����ҨϥΪ��S�������d�����}�]MAC Address�^�C�q�`�O�zISP�~�̭n�D����}�C', LEFT);" onMouseOut="return nd();">�����d�����}�]MAC Address�^�G
           </td><td class="content_input_td"><input type="text" maxlength="12" class="content_input_fd" size="12" name="wan_hwaddr_x" value="<% nvram_get_x("PPPConnection","wan_hwaddr_x"); %>" onBlur="return validate_hwaddr(this)" onKeyPress="return is_hwaddr()"></td>
</tr>
<tr>
<td class="content_header_td">�{�Ҧ��A��:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wan_heartbeat_x" value="<% nvram_get_x("PPPConnection","wan_heartbeat_x"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
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
<td class="content_section_header_td" colspan="2">LAN IP�]�w
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���@ZVMODELVZ��IP��}�P�z�b���a�������Ҩ��ۦP�C�w�]�ȬO192.168.1.1�C', LEFT);" onMouseOut="return nd();">IP��}�G
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="lan_ipaddr" value="<% nvram_get_x("LANHostConfig","lan_ipaddr"); %>" onBlur="return validate_ipaddr(this, 'lan_ipaddr')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���@ZVMODELVZ���l�����B�n�P�z�b���a�������Ҩ��ۦP�C�w�]�ȬO255.255.255.0�C', LEFT);" onMouseOut="return nd();">�l�����B�n�G
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
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Restore ')" type="submit" value=" �٭� " name="action"></font></div> 
   </td>  
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Finish ')" type="submit" value=" �x�s " name="action"></font></div> 
   </td>
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Apply ')" type="submit" value=" �M�� " name="action"></font></div> 
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
    <td class="content_header_td_15" align="left">�٭�: </td>
    <td class="content_input_td_padding" align="left">�M���W�z�]�w�Ȩ��٭즳�ĳ]�w�ȡC</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">�x�s: </td>
    <td class="content_input_td_padding" align="left">�{�b�T�{�Ҧ��]�w�Ȩí��s�Ұ�ZVMODELVZ�C</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">�M��: </td>
    <td class="content_input_td_padding" align="left">�T�{�W�z�]�w�Ȩ��~��C</td>
</tr>
</table>
</td>
</tr>

</table>
</form>
</body>

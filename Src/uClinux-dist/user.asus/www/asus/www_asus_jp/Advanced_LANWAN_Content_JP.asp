<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
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
    	
<input type="hidden" name="current_page" value="Advanced_LANWAN_Content.asp"><input type="hidden" name="next_page" value="Advanced_MultiPPPoE_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="Layer3Forwarding;LANHostConfig;IPConnection;PPPConnection;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">IP�r�� - WAN��LAN</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">ZVMODELVZ��WAN�ɑ΂��镡���̐ڑ��̃^�C�v���T�|�[�g���܂��B�����̃^�C�v�́AWAN�ڑ��^�C�v�̖T�̃h���b�v�_�E�����j���[����I������܂��B�ݒ�t�B�[���h�́A�I������ڑ��̃^�C�v�̎�ނɂ���ĈقȂ�܂��B
         </td>
</tr>
<tr>
<td class="content_header_td">WAN�̐ڑ��^�C�v:
           </td><td class="content_input_td"><select name="wan_proto" class="content_input_fd" onChange="return change_common(this, 'Layer3Forwarding', 'wan_proto')"><option class="content_input_fd" value="dhcp" <% nvram_match_x("Layer3Forwarding","wan_proto", "dhcp","selected"); %>>Automatic IP</option><option class="content_input_fd" value="static" <% nvram_match_x("Layer3Forwarding","wan_proto", "static","selected"); %>>Static IP</option><option class="content_input_fd" value="pppoe" <% nvram_match_x("Layer3Forwarding","wan_proto", "pppoe","selected"); %>>PPPoE</option><option class="content_input_fd" value="pptp" <% nvram_match_x("Layer3Forwarding","wan_proto", "pptp","selected"); %>>PPTP</option><option class="content_input_fd" value="bigpond" <% nvram_match_x("Layer3Forwarding","wan_proto", "bigpond","selected"); %>>BigPond</option></select></td>
</tr>
<tr>
<td class="content_header_td">WAN�ڑ��X�s�[�h:
           </td><td class="content_input_td"><select name="wan_etherspeed_x" class="content_input_fd" onChange="return change_common(this, 'Layer3Forwarding', 'wan_etherspeed_x')"><option class="content_input_fd" value="auto" <% nvram_match_x("Layer3Forwarding","wan_etherspeed_x", "auto","selected"); %>>Auto negotiation</option><option class="content_input_fd" value="10half" <% nvram_match_x("Layer3Forwarding","wan_etherspeed_x", "10half","selected"); %>>10Mbps half-duplex</option><option class="content_input_fd" value="10full" <% nvram_match_x("Layer3Forwarding","wan_etherspeed_x", "10full","selected"); %>>10Mbps full-duplex</option><option class="content_input_fd" value="100half" <% nvram_match_x("Layer3Forwarding","wan_etherspeed_x", "100half","selected"); %>>100Mpbs half-duplex</option><option class="content_input_fd" value="100full" <% nvram_match_x("Layer3Forwarding","wan_etherspeed_x", "100full","selected"); %>>100Mpbs full-duplex</option></select></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">WAN IP�ݒ�
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����́A�����[�g�l�b�g���[�N�ɕ\�������ZVMODELVZ��IP�A�h���X�ł��B������u�����N�ɂ��Ă����ƁAZVMODELVZ��DHCP�T�[�o�[����IP�A�h���X�������I�Ɏ擾���܂��B', LEFT);" onMouseOut="return nd();">IP�A�h���X:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_ipaddr" value="<% nvram_get_x("IPConnection","wan_ipaddr"); %>" onBlur="return validate_ipaddr(this, 'wan_ipaddr')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����́A�����[�g�l�b�g���[�N�ɕ\�������ZVMODELVZ�̃T�u�l�b�g�}�X�N�ł��B', LEFT);" onMouseOut="return nd();">�T�u�l�b�g�}�X�N:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_netmask" value="<% nvram_get_x("IPConnection","wan_netmask"); %>" onBlur="return validate_ipaddr(this, 'wan_netmask')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����̓f�t�H���g�̃Q�[�g�E�F�C��IP�A�h���X�ŁAZVMODELVZ�ƃ����[�g�̃l�b�g���[�N�܂��̓z�X�g�Ԃł̐ڑ����\�ɂ��܂��B', LEFT);" onMouseOut="return nd();">�f�t�H���g�̃Q�[�g�E�F�C:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_gateway" value="<% nvram_get_x("IPConnection","wan_gateway"); %>" onBlur="return validate_ipaddr(this, 'wan_gateway')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">WAN DNS�ݒ�
            </td>
</tr>
<tr>
<td class="content_header_td">DNS�T�[�o�[�������I�Ɏ擾���܂���?
           </td><td class="content_input_td"><input type="radio" value="1" name="wan_dnsenable_x" class="content_input_fd" onClick="return change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', '1')" <% nvram_match_x("IPConnection","wan_dnsenable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wan_dnsenable_x" class="content_input_fd" onClick="return change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', '0')" <% nvram_match_x("IPConnection","wan_dnsenable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́AZVMODELVZ���ڑ�����DNS��IP�A�h���X�������܂��B', LEFT);" onMouseOut="return nd();">DNS�T�[�o�[1:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="wan_dns1_x" value="<% nvram_get_x("IPConnection","wan_dns1_x"); %>" onBlur="return validate_ipaddr(this, 'wan_dns1_x')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́AZVMODELVZ���ڑ�����DNS��IP�A�h���X�������܂��B', LEFT);" onMouseOut="return nd();">DNS�T�[�o�[2:
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
<td class="content_section_header_td" colspan="2">PPPoE�܂���PPTP�A�J�E���g
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́APPPoE�Ƃ���WAN�ڑ��^�C�v��ݒ肵�Ă���Ƃ��ɂ̂݁A�g�p�ł��܂��B', LEFT);" onMouseOut="return nd();">���[�U�[��:
           </td><td class="content_input_td"><input type="text" maxlength="64" class="content_input_fd" size="32" name="wan_pppoe_username" value="<% nvram_get_x("PPPConnection","wan_pppoe_username"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́APPPoE�Ƃ���WAN�ڑ��^�C�v��ݒ肵�Ă���Ƃ��ɂ̂݁A�g�p�ł��܂��B', LEFT);" onMouseOut="return nd();">�p�X���[�h:
           </td><td class="content_input_td"><input type="password" maxlength="64" class="content_input_fd" size="32" name="wan_pppoe_passwd" value="<% nvram_get_x("PPPConnection","wan_pppoe_passwd"); %>" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�ɂ��A�w�肳�ꂽ���Ԃ̌��ISP�ڑ����I������悤�ɐݒ�ł��܂��B�[���̒l�́A�����̊�����~���Ԃ��\�ɂ��܂��B', LEFT);" onMouseOut="return nd();">�b�ł̊�����~�̐ؒf����(�I�v�V����):
           </td><td class="content_input_td"><input type="text" maxlength="10" class="content_input_fd" size="10" name="wan_pppoe_idletime" value="<% nvram_get_x("PPPConnection","wan_pppoe_idletime"); %>" onBlur="validate_range(this, 0, 4294967295)" onKeyPress="return is_number(this)"><input type="checkbox" style="margin-left:30" name="wan_pppoe_idletime_check" value="" onClick="return change_common_radio(this, 'PPPConnection', 'wan_pppoe_idletime', '1')">Tx Only</input></td>
</tr>
<input type="hidden" name="wan_pppoe_txonly_x" value="<% nvram_get_x("PPPConnection","wan_pppoe_txonly_x"); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('�����PPPoE�p�P�b�g�̍ő�`���P��(MTU)�ł��B', LEFT);" onMouseOut="return nd();">PPPoE MTU:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wan_pppoe_mtu" class="content_input_fd" value="<% nvram_get_x("PPPConnection", "wan_pppoe_mtu"); %>" onBlur="validate_range(this, 576, 1492)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�����PPPoE�p�P�b�g�̍ő��M�P��(MRU)�ł��B', LEFT);" onMouseOut="return nd();">PPPoE MRU:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wan_pppoe_mru" class="content_input_fd" value="<% nvram_get_x("PPPConnection", "wan_pppoe_mru"); %>" onBlur="validate_range(this, 576, 1492)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃A�C�e���́A��������ISP�ɂ���Ďw��ł��܂��BISP���`�F�b�N���A�K�v�ɉ����Ă���ISP���L�����Ă��������B', LEFT);" onMouseOut="return nd();">�T�[�r�X��(�I�v�V����):
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wan_pppoe_service" value="<% nvram_get_x("PPPConnection","wan_pppoe_service"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃A�C�e���́A��������ISP�ɂ���Ďw��ł��܂��BISP���`�F�b�N���A�K�v�ɉ����Ă���ISP���L�����Ă��������B', LEFT);" onMouseOut="return nd();">�A�N�Z�X�R���Z���g���[�^��(�I�v�V����):
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wan_pppoe_ac" value="<% nvram_get_x("PPPConnection","wan_pppoe_ac"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('PPPoE�����[��L���ɂ���ƁALAN�̒[�����p�X�X���[NAT�ł����PPPoE�ڑ���ݒ�ł��܂��B', LEFT);" onMouseOut="return nd();">PPPoE�����[��L���ɂ��܂���?
           </td><td class="content_input_td"><input type="radio" value="1" name="wan_pppoe_relay_x" class="content_input_fd" onClick="return change_common_radio(this, 'PPPConnection', 'wan_pppoe_relay_x', '1')" <% nvram_match_x("PPPConnection","wan_pppoe_relay_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wan_pppoe_relay_x" class="content_input_fd" onClick="return change_common_radio(this, 'PPPConnection', 'wan_pppoe_relay_x', '0')" <% nvram_match_x("PPPConnection","wan_pppoe_relay_x", "0", "checked"); %>>No</input></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">ISP����̓���v��
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́AZVMODELVZ�ɑ΂���z�X�g����񋟂��܂��B�ʏ�AISP�ɂ��v������܂��B', LEFT);" onMouseOut="return nd();">�z�X�g��:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wan_hostname" value="<% nvram_get_x("PPPConnection","wan_hostname"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h��ZVMODELVZ�ɑ΂���ŗLMAC�A�h���X��񋟂��āA�C���^�[�l�b�g�ɐڑ����܂��B�ʏ�AISP�ɂ��v������܂��B', LEFT);" onMouseOut="return nd();">MAC�A�h���X:
           </td><td class="content_input_td"><input type="text" maxlength="12" class="content_input_fd" size="12" name="wan_hwaddr_x" value="<% nvram_get_x("PPPConnection","wan_hwaddr_x"); %>" onBlur="return validate_hwaddr(this)" onKeyPress="return is_hwaddr()"></td>
</tr>
<tr>
<td class="content_header_td">Heart-Beat�T�[�o�[:
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
<td class="content_section_header_td" colspan="2">LAN IP�ݒ�
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����́A���[�J���l�b�g���[�N�ɕ\�������ZVMODELVZ��IP�A�h���X�ł��B�f�t�H���g�l��192.168.1.1�ł��B', LEFT);" onMouseOut="return nd();">IP�A�h���X:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="lan_ipaddr" value="<% nvram_get_x("LANHostConfig","lan_ipaddr"); %>" onBlur="return validate_ipaddr(this, 'lan_ipaddr')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����́A���[�J���l�b�g���[�N�ɕ\�������ZVMODELVZ�̃T�u�l�b�g�}�X�N�ł��B�f�t�H���g�l��255.255.255.0�ł��B', LEFT);" onMouseOut="return nd();">�T�u�l�b�g�}�X�N:
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
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Finish ')" type="submit" value=" �I�� " name="action"></font></div> 
   </td>
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Apply ')" type="submit" value=" �K�p " name="action"></font></div> 
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
    <td class="content_input_td_padding" align="left">��̐ݒ���������A�L���ɂȂ��Ă���ݒ�𕜌����܂��B</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">�I��: </td>
    <td class="content_input_td_padding" align="left">���ׂĂ̐ݒ���m�F���āA��ZVMODELVZ���ċN�����܂��B</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">�K�p: </td>
    <td class="content_input_td_padding" align="left">��̐ݒ���m�F���āA���s���܂��B</td>
</tr>
</table>
</td>
</tr>

</table>
</form>
</body>

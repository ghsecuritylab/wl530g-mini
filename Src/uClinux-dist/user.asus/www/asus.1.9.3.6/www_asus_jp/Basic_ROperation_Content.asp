<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="style.css" media="screen"></link>
<script language="JavaScript" type="text/javascript" src="overlib.js"></script>
<script language="JavaScript" type="text/javascript" src="general.js"></script>
<script language="JavaScript" type="text/javascript" src="quick.js"></script>
</head>
<body bgcolor="#FFFFFF" onLoad="loadQuick()">
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
<form method="GET" name="form" action="apply.cgi">
<!-- Table for the conntent page -->
<table width="666" border="0" cellpadding="0" cellspacing="0">
<input type="hidden" name="x_Mode" value="0">
<input type="hidden" name="current_page" value="Basic_GOperation_Content.asp">
<input type="hidden" name="next_page" value="Basic_HomeGateway_SaveRestart.asp">
<input type="hidden" name="next_host" value="">
<input type="hidden" name="sid_list" value="Layer3Forwarding;IPConnection;PPPConnection;WLANConfig11a;WLANConfig11b;LANHostConfig;FirewallConfig;">
<input type="hidden" name="action_mode" value="">
<input type="hidden" name="modified" value="0">
<input type="hidden" name="group_id" value="">
<input type="hidden" name="wan_proto" value="<% nvram_get_x("Layer3Forwarding","wan_proto"); %>">
<input type="hidden" name="wan_route_x" value="<% nvram_get_x("IPConnection","wan_route_x"); %>">
<input type="hidden" name="wan_nat_x" value="<% nvram_get_x("IPConnection","wan_nat_x"); %>">
<input type="hidden" name="wl_auth_mode" value="<% nvram_get_x("WLANConfig11b","wl_auth_mode"); %>">
<input type="hidden" name="wl_crypto" value="<% nvram_get_x("WLANConfig11b","wl_crypto"); %>">
<input type="hidden" name="wl_wep_x" value="<% nvram_get_x("WLANConfig11b","wl_wep_x"); %>">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr id="Country" class="content_header_tr">
<td class="content_header_td_title" colspan="2">�N�C�b�N�Z�b�g�A�b�v</td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">�^�C���]�[���̑I��</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2" height="50">
���Z�܂��̒n��̃^�C���]�[����I�����Ă�������</td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́A���Z�܂��̒n��̃^�C���]�[���������Ă��܂��B', LEFT);" onMouseOut="return nd();">�^�C���]�[��:</td><td class="content_input_td"><select name="time_zone" class="content_input_fd" onChange="return change_common(this, 'LANHostConfig', 'time_zone')"><option class="content_input_fd" value="UCT11" <% nvram_match_x("LANHostConfig","time_zone", "UCT11","selected"); %>>(GMT-11:00) Midway Island, Samoa</option><option class="content_input_fd" value="UCT10" <% nvram_match_x("LANHostConfig","time_zone", "UCT10","selected"); %>>(GMT-10:00) Hawaii</option><option class="content_input_fd" value="NAST9NADT" <% nvram_match_x("LANHostConfig","time_zone", "NAST9NADT","selected"); %>>(GMT-09:00) Alaska</option><option class="content_input_fd" value="PST8PDT" <% nvram_match_x("LANHostConfig","time_zone", "PST8PDT","selected"); %>>(GMT-08:00) Pacific Time</option><option class="content_input_fd" value="MST7MDT" <% nvram_match_x("LANHostConfig","time_zone", "MST7MDT","selected"); %>>(GMT-07:00) Mountain Time</option><option class="content_input_fd" value="MST7" <% nvram_match_x("LANHostConfig","time_zone", "MST7","selected"); %>>(GMT-07:00) Arizona</option><option class="content_input_fd" value="CST6CDT" <% nvram_match_x("LANHostConfig","time_zone", "CST6CDT","selected"); %>>(GMT-06:00) Central Time</option><option class="content_input_fd" value="UCT6" <% nvram_match_x("LANHostConfig","time_zone", "UCT6","selected"); %>>(GMT-06:00) Middle America</option><option class="content_input_fd" value="UCT5" <% nvram_match_x("LANHostConfig","time_zone", "UCT5","selected"); %>>(GMT-05:00) Indiana East, Colombia</option><option class="content_input_fd" value="EST5EDT" <% nvram_match_x("LANHostConfig","time_zone", "EST5EDT","selected"); %>>(GMT-05:00) Eastern Time</option><option class="content_input_fd" value="AST4ADT" <% nvram_match_x("LANHostConfig","time_zone", "AST4ADT","selected"); %>>(GMT-04:00) Atlantic Time, Brazil West</option><option class="content_input_fd" value="UCT4" <% nvram_match_x("LANHostConfig","time_zone", "UCT4","selected"); %>>(GMT-04:00) Bolivia, Venezuela</option><option class="content_input_fd" value="UCT3" <% nvram_match_x("LANHostConfig","time_zone", "UCT3","selected"); %>>(GMT-03:00) Guyana</option><option class="content_input_fd" value="EBST3EBDT" <% nvram_match_x("LANHostConfig","time_zone", "EBST3EBDT","selected"); %>>(GMT-03:00) Brazil East, Greenland</option><option class="content_input_fd" value="NORO2" <% nvram_match_x("LANHostConfig","time_zone", "NORO2","selected"); %>>(GMT-02:00) Mid-Atlantic</option><option class="content_input_fd" value="UCT0" <% nvram_match_x("LANHostConfig","time_zone", "UCT0","selected"); %>>(GMT) Gambia, Liberia, Morocco</option><option class="content_input_fd" value="GMT0BST" <% nvram_match_x("LANHostConfig","time_zone", "GMT0BST","selected"); %>>(GMT) England</option><option class="content_input_fd" value="MET-1METDST" <% nvram_match_x("LANHostConfig","time_zone", "MET-1METDST","selected"); %>>(GMT+01:00) Netherland, France, Italy</option><option class="content_input_fd" value="MEZ-1MESZ" <% nvram_match_x("LANHostConfig","time_zone", "MEZ-1MESZ","selected"); %>>(GMT+01:00) Germany</option><option class="content_input_fd" value="UCT-1" <% nvram_match_x("LANHostConfig","time_zone", "UCT-1","selected"); %>>(GMT+01:00) Tunisia</option><option class="content_input_fd" value="EET-2EETDST" <% nvram_match_x("LANHostConfig","time_zone", "EET-2EETDST","selected"); %>>(GMT+02:00) Greece, Ukraine, Turkey</option><option class="content_input_fd" value="SAST-2" <% nvram_match_x("LANHostConfig","time_zone", "SAST-2","selected"); %>>(GMT+02:00) South Africa</option><option class="content_input_fd" value="IST-3IDT" <% nvram_match_x("LANHostConfig","time_zone", "IST-3IDT","selected"); %>>(GMT+03:00) Iraq, Jordan, Kuwait</option><option class="content_input_fd" value="MSK-3MSD" <% nvram_match_x("LANHostConfig","time_zone", "MSK-3MSD","selected"); %>>(GMT+03:00) Moscow Winter Time</option><option class="content_input_fd" value="UCT-4" <% nvram_match_x("LANHostConfig","time_zone", "UCT-4","selected"); %>>(GMT+04:00) Armenia</option><option class="content_input_fd" value="UCT-5" <% nvram_match_x("LANHostConfig","time_zone", "UCT-5","selected"); %>>(GMT+05:00) Pakistan, Russia</option><option class="content_input_fd" value="UCT-6" <% nvram_match_x("LANHostConfig","time_zone", "UCT-6","selected"); %>>(GMT+06:00) Bangladesh, Russia</option><option class="content_input_fd" value="UCT-7" <% nvram_match_x("LANHostConfig","time_zone", "UCT-7","selected"); %>>(GMT+07:00) Thailand, Russia</option><option class="content_input_fd" value="CST-8" <% nvram_match_x("LANHostConfig","time_zone", "CST-8","selected"); %>>(GMT+08:00) China Coast, Hong Kong</option><option class="content_input_fd" value="CCT-8" <% nvram_match_x("LANHostConfig","time_zone", "CCT-8","selected"); %>>(GMT+08:00) Taipei</option><option class="content_input_fd" value="SST-8" <% nvram_match_x("LANHostConfig","time_zone", "SST-8","selected"); %>>(GMT+08:00) Singapore</option><option class="content_input_fd" value="WAS-8WAD" <% nvram_match_x("LANHostConfig","time_zone", "WAS-8WAD","selected"); %>>(GMT+08:00) Australia West</option><option class="content_input_fd" value="JST-9" <% nvram_match_x("LANHostConfig","time_zone", "JST-9","selected"); %>>(GMT+09:00) Japan, Korea</option><option class="content_input_fd" value="KST-9KDT" <% nvram_match_x("LANHostConfig","time_zone", "KST-9KDT","selected"); %>>(GMT+09:00) Korean</option><option class="content_input_fd" value="UCT-10" <% nvram_match_x("LANHostConfig","time_zone", "UCT-10","selected"); %>>(GMT+10:00) Guam, Russia</option><option class="content_input_fd" value="EST-10EDT" <% nvram_match_x("LANHostConfig","time_zone", "EST-10EDT","selected"); %>>(GMT+10:00) Australia</option><option class="content_input_fd" value="UCT-11" <% nvram_match_x("LANHostConfig","time_zone", "UCT-11","selected"); %>>(GMT+11:00) Solomon Islands</option><option class="content_input_fd" value="UCT-12" <% nvram_match_x("LANHostConfig","time_zone", "UCT-12","selected"); %>>(GMT+12:00) Fiji</option><option class="content_input_fd" value="NZST-12NZDT" <% nvram_match_x("LANHostConfig","time_zone", "NZST-12NZDT","selected"); %>>(GMT+12:00) New Zealand</option></select></td>
</tr>
<tr>
<td class="content_input_td" colspan="2">
<table>
<tr>
<td width="500" height="100"></td><td>
<div align="center">
<font face="Arial"><input class=inputSubmit onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="toPrevTag('Country')" type="hidden" value="�O��" name="action1"></font>&nbsp;&nbsp;
<font face="Arial"> <input class=inputSubmit onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="toTag('Country')" type="button" value="����" name="action"></font>
</div>
</td>
</tr>
<tr><td colspan="2" height="360"></td></tr>
</table>
</td>
</tr>
<tr id="Broadband" class="content_header_tr">
<td class="content_header_td_title" colspan="2">�N�C�b�N�Z�b�g�A�b�v</td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">�C���^�[�l�b�g�ڑ��^�C�v�̑I��</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2" height="50">
ZVMODELVZ�͂���WAN�|�[�g��ʂ��ăC���^�[�l�b�g�ւ�2��ނ̐ڑ����T�|�[�g���܂��B�K�v�Ƃ���ڑ��^�C�v��I�����Ă��������B����ɁA�C���^�[�l�b�g�ɐڑ�����O�ɁAZVMODELVZ��WAN�|�[�g�����g����DSL�܂��̓P�[�u�����f���ڑ����Ă��邱�Ƃ��m�F���Ă��������B</td>
</tr>
<tr> 
          <td class="content_header_td_less" onMouseOut="return nd();" colspan="2">          
          <p></p>
          <p><input type="radio" checked name="x_WANType" value="1" class="content_input_fd" onClick="changeWANType()">Cable Modem or other connection type that gets IP automatically.</p>          
          <p><input type="radio" checked name="x_WANType" value="2" class="content_input_fd" onClick="changeWANType()">ADSL connection that requires username and password. It is known as PPPoE.</p>          
          <p><input type="radio" checked name="x_WANType" value="3" class="content_input_fd" onClick="changeWANType()">ADSL connection that requires username, password and IP address. It is known as PPTP.</p>          
          <p><input type="radio" checked name="x_WANType" value="4" class="content_input_fd" onClick="changeWANType()">ADSL or other connection type that uses static IP address.</p>
          <p></p>
          <p></p>
          </td>
</tr>
<tr>
<td class="content_input_td" colspan="2">
<table>
<tr>
<td width="444" height="100"></td><td>
<div align="center">
<font face="Arial"><input class=inputSubmit onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="toPrevTag('Broadband')" type="button" value="�O��" name="action"></font>&nbsp;&nbsp;
<font face="Arial"> <input class=inputSubmit onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="toTag('Broadband')" type="button" value="����" name="action"></font>
</div>
</td>
</tr>
<tr><td colspan="2" height="360"></td></tr>
</table>
</td>
</tr>
<tr id="PPPoE" class="content_header_tr">
<td class="content_header_td_title" colspan="2">�N�C�b�N�Z�b�g�A�b�v</td>
</tr>
<tr class="content_section_header_tr">
<td  class="content_section_header_td" colspan="2">�A�J�E���g��ISP�ɐݒ�</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2" height="50">ADSL�A�J�E���g���_�C�i�~�b�NIP�ɓK�p����ꍇ�AADSL�A�J�E���g���_�C�i�~�b�NIP�ɓK�p����ꍇ�AISP����A�J�E���g�ƃp�X���[�h���擾����K�v������܂��B���̃f�[�^�����̃t�B�[���h�ɒ��ӂ��ċL�����Ă��������B�܂��́AADSL�A�J�E���g���X�^�e�B�b�NIP�ɓK�p����ꍇ�A���[�U�[���ƃp�X���[�h���𖳎����Ă��������B</td>
</tr>
<tr>
<td class="content_header_td_less">���[�U�[��:</td><td class="content_input_td"><input type="text" maxlength="64" size="32" name="wan_pppoe_username" class="content_input_fd" value="<% nvram_get_x("PPPConnection","wan_pppoe_username"); %>"></td>
</tr>
<tr>
<td class="content_header_td_less">�p�X���[�h:</td><td class="content_input_td"><input type="password" maxlength="64" size="32" name="wan_pppoe_passwd" class="content_input_fd" value="<% nvram_get_x("PPPConnection","wan_pppoe_passwd"); %>"></td>
</tr>
<tr>
<td class="content_input_td" colspan="2">
<table>
<tr>
<td width="444" height="100"></td>
<td>
<div align="center">
<font face="Arial"><input class=inputSubmit onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="toPrevTag('PPPoE')" type="button" value="�O��" name="action"></font>&nbsp;&nbsp;
<font face="Arial"><input class=inputSubmit onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="toTag('PPPoE')" type="button" value="����" name="action"></font>
</div>
</td>
</tr>
<tr><td colspan="2" height="360"></td></tr>
</table>
</td>
</tr>
<tr id="MacHost" class="content_header_tr">
<td class="content_header_td_title" colspan="2">�N�C�b�N�Z�b�g�A�b�v</td>
</tr>
<tr class="content_section_header_tr">
<td  class="content_section_header_td" colspan="2">ISP���v����������L��</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2" height="50">ISP�̓��[�U�[�A�J�E���g���m�F���邽�߂Ɏ��̏���v�����܂��B�v������Ȃ���΁A[����]�������Ă���𖳎����Ă��������B</td>
</tr>
<tr>
<td class="content_header_td_less" onMouseOver="return overlib('���̃t�B�[���h�́AZVMODELVZ�ɑ΂��ăz�X�g����񋟂��܂��B�z�X�g���͒ʏ�ISP�ɂ��v������܂��B', LEFT);" onMouseOut="return nd();">�z�X�g��:</td><td class="content_input_td"><input type="text" maxlength="32" size="32" name="wan_hostname" class="content_input_fd" value="<% nvram_get_x("PPPConnection","wan_isp_hostname_x"); %>"></td>
</tr>
<tr>
<td class="content_header_td_less" onMouseOver="return overlib('���̃t�B�[���h�́AZVMODELVZ�ɑ΂��ČŗLMAC�A�h���X��񋟂��ăC���^�[�l�b�g�ɐڑ����܂��BMAC�A�h���X�͒ʏ�ISP�ɂ��v������܂��B', LEFT);" onMouseOut="return nd();">MAC�A�h���X:</td><td class="content_input_td"><input type="text" maxlength="12" size="12" name="wan_hwaddr_x" class="content_input_fd" value="<% nvram_get_x("PPPConnection","wan_isp_mac_x"); %>" onBlur="return validate_hwaddr(this)" onKeyPress="return is_hwaddr()"></td>
</tr>
<tr>
<td class="content_input_td_less" colspan="2">
<table>
<tr>
<td width="444" height="100"></td>
<td>
<div align="center">
<font face="Arial"><input class=inputSubmit onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="toPrevTag('MacHost')" type="button" value="�O��" name="action"></font>&nbsp;&nbsp;
<font face="Arial"><input class=inputSubmit onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="toTag('MacHost')" type="button" value="����" name="action"></font>
</div>
</td>
</tr>
<tr><td colspan="2" height="360"></td></tr>
</table>
</td>
</tr>
<tr id="WANSetting" class="content_header_tr">
<td class="content_header_td_title" colspan="2">�N�C�b�N�Z�b�g�A�b�v</td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">WAN IP�ݒ�</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2" height="50">ZVMODELVZ�ɑ΂���TCP/IP�ݒ����͂��AWAN�|�[�g��ʂ��ăC���^�[�l�b�g�ɐڑ����܂��B</td>
</tr>
<tr>
<td class="content_header_td_less">IP�������I�Ɏ擾���܂���?</td><td class="content_input_td"><input type="radio" value="1" name="x_DHCPClient" class="content_input_fd" onClick="changeDHCPClient()">Yes</input><input type="radio" value="0" name="x_DHCPClient" class="content_input_fd" onClick="changeDHCPClient()">No</input></td>
</tr>
<tr>
<td class="content_header_td_less" onMouseOver="return overlib('WAN�C���^�[�t�F�C�X��IP�A�h���X�B������u�����N�ɂ��Ă����ƁAZVMODELVZ��DHCP�T�[�o�[����IP�A�h���X�������I�Ɏ擾���܂��B', LEFT);" onMouseOut="return nd();">IP Address:</td><td class="content_input_td"><input type="text" maxlength="15" size="15" name="wan_ipaddr" class="content_input_fd" value="<% nvram_get_x("IPConnection","wan_ipaddr"); %>" onBlur="return validate_ipaddr(this, 'ExternalIPAddress')" onKeyPress="return is_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td_less">�T�u�l�b�g�}�X�N:</td><td class="content_input_td"><input type="text" maxlength="15" size="15" name="wan_netmask" class="content_input_fd" value="<% nvram_get_x("IPConnection","wan_netmask"); %>" onBlur="return validate_ipaddr(this)" onKeyPress="return is_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td_less">�f�t�H���g�̃Q�[�g�E�F�C:</td><td class="content_input_td"><input type="text" maxlength="15" size="15" name="wan_gateway" class="content_input_fd" value="<% nvram_get_x("IPConnection","wan_gateway"); %>" onBlur="return validate_ipaddr(this)" onKeyPress="return is_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td_less">DNS�T�[�o�[�������I�Ɏ擾���܂���?</td><td class="content_input_td"><input type="radio" value="1" name="wan_dnsenable_x" class="content_input_fd" onClick="changeDNSServer()" <% nvram_match_x("IPConnection","wan_dnsenable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wan_dnsenable_x" class="content_input_fd" onClick="changeDNSServer()" <% nvram_match_x("IPConnection","wan_dnsenable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td_less">DNS�T�[�o�[1:</td><td class="content_input_td"><input type="text" maxlength="15" size="15" name="wan_dns1_x" class="content_input_fd" value="<% nvram_get_x("IPConnection","wan_dns1_x"); %>" onBlur="return validate_ipaddr(this)" onKeyPress="return is_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_header_td_less">DNS�T�[�o�[2:</td><td class="content_input_td"><input type="text" maxlength="15" size="15" name="wan_dns2_x" class="content_input_fd" value="<% nvram_get_x("IPConnection","wan_dns2_x"); %>" onBlur="return validate_ipaddr(this)" onKeyPress="return is_ipaddr(this)"></td>
</tr>
<tr>
<td class="content_input_td" colspan="2">
<table>
<tr>
<td width="444" height="100"></td><td>
<div align="center">
<font face="Arial"><input class=inputSubmit onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="toPrevTag('WANSetting')" type="button" value="�O��" name="action"></font>&nbsp;&nbsp;
<font face="Arial"><input class=inputSubmit onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="toTag('WANSetting')" type="button" value="����" name="action"></font>
</div>
</td>
</tr>
<tr><td colspan="2" height="360"></td></tr>
</table>
</td>
</tr>

<tr  id="Wireless"  class="content_header_tr">
<td class="content_header_td_title" colspan="2">�N�C�b�N�Z�b�g�A�b�v</td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">���C�����X�C���^�[�t�F�C�X��ݒ�</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2" height="50">���C�����X�C���^�[�t�F�C�X��ݒ肷��ŏ��̃X�e�b�v�́ASSID�ƌĂ΂�閼�O��^���邱�Ƃł��B����ɁA�`���f�[�^��ی삷��ɂ́A�Z�L�����e�B���x����I�����A�K�v�ɉ����āA�F�؂ƃf�[�^�`���p�̃p�X���[�h�����蓖�ĂĂ��������B</td>
</tr>
<tr>
<td class="content_header_td_less" onMouseOver="return overlib('LAN�ɑ΂��āA32�����ȓ��̔F�ؕ���������蓖�Ă܂��B', LEFT);" onMouseOut="return nd();">SSID:</td><td class="content_input_td"><input type="text" maxlength="32" size="32" name="wl_ssid" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b","wl_ssid"); %>"  onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td_less" onMouseOver="return overlib('�u��v��I������ƁA���ׂẴ��[�U�[�����̃A�N�Z�X�|�C���g�ɐڑ����ĈÍ����̂Ȃ��f�[�^��`�����邱�Ƃ��ł��܂��B�u���v��I������ƁA����WEP�L�[���g�p���郆�[�U�[���������̃A�N�Z�X�|�C���g�ɐڑ�����WEP�Í��������f�[�^��`�����܂��B�u���v��I������ƁA����WPA�v�����L�L�[���g�p���郆�[�U�[���������̃A�N�Z�X�|�C���g�ɐڑ����āATKIP�Í��������f�[�^��`�����܂��B', LEFT);" onMouseOut="return nd();">�Z�L�����e�B���x��:</td>
<td class="content_input_td">
 <select name="SecurityLevel" class="content_input_fd" onChange="return change_security(this, 'WLANConfig11b', 0)">
     <option value="0">Low(None)</option>
     <option value="1">Medium(WEP-128bits)</option>
     <option value="2">High(WPA-PSK)</option>
 </select>    
</td>
</tr>
<tr>
<td class="content_header_td_less" onMouseOver="return overlib('�����Z�L�����e�B���x����I������ƁA���̃t�B�[���h�̓p�X���[�h�Ƃ��Ďg�p����ATKIP�Í����v���Z�X���J�n���܂��B8��������63�����̃p�X���[�h���v������܂��B���̃Z�L�����e�B���x����I������ƁA���̃t�B�[���h��4��WEP�L�[�������I�ɐ������邽�߂Ɏg�p����܂��B', LEFT);" onMouseOut="return nd();">�p�X�t���[�Y:</td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="phrase.js"></script><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" size="32" name="wl_wpa_psk" class="content_input_fd"  value="<% nvram_get_x("WLANConfig11b","wl_wpa_psk"); %>" onKeyUp="return is_wlphrase_q('WLANConfig11b', this)" onBlur="return validate_wlphrase_q('WLANConfig11b', this)"></td>
</tr>
<tr>
<td class="content_header_td_less">WEP�L�[1 (10�܂���26��16�i��):</td><td class="content_input_td"><input type="pssword" maxlength="32" size="32" name="wl_key1" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b","wl_key1"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>				   
<tr>
<td class="content_header_td_less">WEP�L�[1 (10�܂���26��16�i��):</td><td class="content_input_td"><input type="pssword" maxlength="32" size="32" name="wl_key2" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b","wl_key2"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td_less">WEP�L�[1 (10�܂���26��16�i��):</td><td class="content_input_td"><input type="pssword" maxlength="32" size="32" name="wl_key3" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b","wl_key3"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td_less">WEP�L�[1 (10�܂���26��16�i��):</td><td class="content_input_td"><input type="pssword" maxlength="32" size="32" name="wl_key4" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b","wl_key4"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td_less">�f�t�H���g�L�[:</td><td class="content_input_td"><select name="wl_key" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_key')"><option value="1" <% nvram_match_x("WLANConfig11b","wl_key", "1","selected"); %>>1</option><option value="2" <% nvram_match_x("WLANConfig11b","wl_key", "2","selected"); %>>2</option><option value="3" <% nvram_match_x("WLANConfig11b","wl_key", "3","selected"); %>>3</option><option value="4" <% nvram_match_x("WLANConfig11b","wl_key", "4","selected"); %>>4</option></select></td>
</tr>
</table>
</td>
</tr>

<tr>
<td>		
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="B0B0B0">
<tr bgcolor="#CCCCCC"><td colspan="3"><font face="arial" size="2"><b>&nbsp</b></font></td></tr>
<tr bgcolor="#FFFFFF">  
   <td height="25" width="34%">  
   </td>
   <td height="25" width="33%">  
   </td>
   <td height="25" width="33%">  
   <div align="center">
   <font face="Arial"><input class=inputSubmit onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="toPrevTag('Wireless')" type="button" value="�O��" name="action"></font>&nbsp;&nbsp;&nbsp;&nbsp;
   <font face="Arial"><input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" type="submit" value="�I��" name="action"  onClick="saveQuick(this)"></font></div>
   </td>
</tr>
</table>
</td>
</tr>

<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="B0B0B0">
<tr>
    <td colspan="2" width="666" height="25" bgcolor="#FFBB00"></td> 
</tr>                   
</table>
</td>
</tr>
<tr><td colspan="2" height="240"></td></tr>
</table>
</form>


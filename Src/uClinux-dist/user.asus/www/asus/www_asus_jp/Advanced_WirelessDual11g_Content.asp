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
    	
<input type="hidden" name="current_page" value="Advanced_Wireless_Content.asp"><input type="hidden" name="next_page" value="Advanced_UniqueKey_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="WLANConfig11a;WLANConfig11b;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">���C�����X - �C���^�[�t�F�C�X</td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́AZVMODELVZ�����[�U�[�̍��̃��C�����X�d�l�ɏ]����悤�ɂ��܂��B', LEFT);" onMouseOut="return nd();">���R�[�h:
           </td><td class="content_input_td"><select name="" class="content_input_fd">   
<% select_country("WLANConfig11a"); %>
                </select></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">802.11a�C���^�[�t�F�C�X
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('WLAN�ɑ΂��āA32�����ȓ��̏ؖ�������������蓖�Ă܂��B', LEFT);" onMouseOut="return nd();">SSID:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���얳���`�����l����I�����Ă��������B���O�`�����l�����`�F�b�N����Ă���ƁA�ꕔ�̓���`�����l����I���ł��܂��B', LEFT);" onMouseOut="return nd();">�`�����l��:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')">   
<% select_channel("WLANConfig11a"); %>
                </select><input type="hidden" maxlength="15" size="15" name="x_RegulatoryDomain" value="<% nvram_get_x("Regulatory","x_RegulatoryDomain"); %>" readonly="1"><input type="checkbox" style="margin-left:30" name="_check" value="" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')">Outdoor Channel</input></td>
</tr>
<input type="hidden" name="" value="<% nvram_get_x("WLANConfig11a",""); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('�`�������f�[�^���x��I�����Ă��������B�p�t�H�[�}���X���ő�ɂ��邽�߂ɁABest��I�����邱�Ƃ������߂��܂��B�^�[�{���[�h�Ƀ`�F�b�N���Ă���ꍇ�A�ő�108 Mpbs�̃f�[�^���x�������܂��B', LEFT);" onMouseOut="return nd();">�f�[�^�]�����x(Mbps):
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11a","", "0","selected"); %>>Best</option><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11a","", "1","selected"); %>>6</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11a","", "2","selected"); %>>9</option><option class="content_input_fd" value="3" <% nvram_match_x("WLANConfig11a","", "3","selected"); %>>12</option><option class="content_input_fd" value="4" <% nvram_match_x("WLANConfig11a","", "4","selected"); %>>18</option><option class="content_input_fd" value="5" <% nvram_match_x("WLANConfig11a","", "5","selected"); %>>24</option><option class="content_input_fd" value="6" <% nvram_match_x("WLANConfig11a","", "6","selected"); %>>36</option><option class="content_input_fd" value="7" <% nvram_match_x("WLANConfig11a","", "7","selected"); %>>48</option><option class="content_input_fd" value="8" <% nvram_match_x("WLANConfig11a","", "8","selected"); %>>54</option></select><input type="checkbox" style="margin-left:30" name="_check" value="" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')">Turbo Mode</input></td>
</tr>
<input type="hidden" name="" value="<% nvram_get_x("WLANConfig11a",""); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�ɂ��A�Í������F�ؒi�K�ŗv������Ă��邩�ǂ�����ݒ�ł��܂��B', LEFT);" onMouseOut="return nd();">�F�ؕ���:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')"><option class="content_input_fd" value="Open System" <% nvram_match_x("WLANConfig11a","", "Open System","selected"); %>>Open System</option><option class="content_input_fd" value="Shared Key" <% nvram_match_x("WLANConfig11a","", "Shared Key","selected"); %>>Shared Key</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('WEP��L���ɂ���ƁA�f�[�^�������҂ɓǂݎ���Ȃ��悤�ɈÍ����ł��܂��B', LEFT);" onMouseOut="return nd();">�Í���(WEP):
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_wlweptype(this, 'WLANConfig11a')"><option class="content_input_fd" value="None" <% nvram_match_x("WLANConfig11a","", "None","selected"); %>>None</option><option class="content_input_fd" value="64bits" <% nvram_match_x("WLANConfig11a","", "64bits","selected"); %>>64bits</option><option class="content_input_fd" value="128bits" <% nvram_match_x("WLANConfig11a","", "128bits","selected"); %>>128bits</option><option class="content_input_fd" value="152bits" <% nvram_match_x("WLANConfig11a","", "152bits","selected"); %>>152bits</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�}�W�b�N���[�h��^�����WEP�L�[�������I�ɐ�������A���̃t�B�[���h���u�����N�ɂ���ƃL�[���蓮�œ��͂ł��܂��B', LEFT);" onMouseOut="return nd();">�t���[�Y:
           </td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onKeyUp="return is_wlphrase('WLANConfig11a', '', this)" onBlur="return validate_wlphrase('WLANConfig11a', '', this)"></td>
</tr>
<tr>
<td class="content_header_td">WEP�L�[1 (10�܂���26�܂���32����16�i����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td">WEP�L�[2 (10�܂���26�܂���32����16�i����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td">WEP�L�[3 (10�܂���26�܂���32����16�i����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td">WEP�L�[4 (10�܂���26�܂���32����16�i����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́A�f�t�H���g�̓`��WEP�L�[�������܂��B', LEFT);" onMouseOut="return nd();">�f�t�H���g�L�[:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')"><option class="content_input_fd" value="Key1" <% nvram_match_x("WLANConfig11a","", "Key1","selected"); %>>Key1</option><option class="content_input_fd" value="Key2" <% nvram_match_x("WLANConfig11a","", "Key2","selected"); %>>Key2</option><option class="content_input_fd" value="Key3" <% nvram_match_x("WLANConfig11a","", "Key3","selected"); %>>Key3</option><option class="content_input_fd" value="Key4" <% nvram_match_x("WLANConfig11a","", "Key4","selected"); %>>Key4</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́AAES���j�[�N�L�[�`�����\�ɂ��܂��B�����L���ɂ���ƁA�e�[���̓��C�����XAES�L�[�R���g���[���y�[�W�Ńv���Z�b�g���ꂽ�A���j�[�N�L�[�ňÍ������ꂽ�f�[�^�𑗎�M���܂��B', LEFT);" onMouseOut="return nd();">�Í���(AES���j�[�N�L�[):
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')" <% nvram_match_x("WLANConfig11a","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '0')" <% nvram_match_x("WLANConfig11a","", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́A�u���[�h�L���X�gSSID�����v���[�u���b�Z�[�W���u���b�N����邩�ǂ����������܂��B', LEFT);" onMouseOut="return nd();">�u���b�N�u���[�h�L���X�gSSID:
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')" <% nvram_match_x("WLANConfig11a","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '0')" <% nvram_match_x("WLANConfig11a","", "0", "checked"); %>>No</input></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">802.11g�C���^�[�t�F�C�X
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('32�����ȓ��̕�������Ȃ�A���ʕ������K�p���܂��B', LEFT);" onMouseOut="return nd();">SSID:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wl_ssid" value="<% nvram_get_x("WLANConfig11b","wl_ssid"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���삵�Ă��閳�����W�I�`�����l����I������', LEFT);" onMouseOut="return nd();">�`�����l��:
           </td><td class="content_input_td"><select name="wl_channel" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_channel')">   
<% select_channel("WLANConfig11b"); %>
                </select><input type="hidden" maxlength="15" size="15" name="x_RegulatoryDomain" value="<% nvram_get_x("Regulatory","x_RegulatoryDomain"); %>" readonly="1"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h��802.11g�C���^�[�t�F�C�X�̃��[�h�������܂��BAuto�i�����j��I������ƁA802.11g��802.11b���f�o�C�X�ɑI���ł��܂��B54g�݂̂�I������ƃp�t�H�[�}���X���ő剻����܂����A802.11b�N���C�A���g�̓f�o�C�X�ւ̐ڑ���������܂���B54g LRS��I������ƁA���S��11g���[�g�Z�b�g���X�g�������ł��Ȃ��]����802.11b�N���C�A���g���T�|�[�g���܂��B54g�ی삪�`�F�b�N����Ă���ƁA11g�g���q�b�N��G���[�h�ی삪11b�g���q�b�N�̂���Ƃ���Ŏ����I�ɗL���ɂȂ�܂��B', LEFT);" onMouseOut="return nd();">54g���[�h:
           </td><td class="content_input_td"><select name="wl_gmode" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_gmode')"><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","wl_gmode", "1","selected"); %>>Auto</option><option class="content_input_fd" value="4" <% nvram_match_x("WLANConfig11b","wl_gmode", "4","selected"); %>>54G Only</option><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","wl_gmode", "0","selected"); %>>802.11B Only</option></select><input type="checkbox" style="margin-left:30" name="wl_gmode_check" value="" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_gmode', '1')">54g Protection</input></td>
</tr>
<input type="hidden" name="wl_gmode_protection_x" value="<% nvram_get_x("WLANConfig11b","wl_gmode_protection_x"); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́A���C�����X���[�U�[�̔F�؂Ɏg�p���������������܂��B�قȂ�F�ؕ�����I������ƁA�قȂ�Í����������L���ɂȂ�܂��B', LEFT);" onMouseOut="return nd();">�F�ؕ���:
           </td><td class="content_input_td"><select name="wl_auth_mode" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_auth_mode')"><option class="content_input_fd" value="open" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "open","selected"); %>>Open System or Shared Key</option><option class="content_input_fd" value="shared" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "shared","selected"); %>>Shared Key</option><option class="content_input_fd" value="psk" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "psk","selected"); %>>WPA-PSK</option><option class="content_input_fd" value="wpa" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "wpa","selected"); %>>WPA</option><option class="content_input_fd" value="radius" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "radius","selected"); %>>Radius with 802.1x</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́AWPA�Í������L���ɂȂ��Ă���ԃf�[�^���Í������邽�߂Ɏg�p�����Í��������������܂��B', LEFT);" onMouseOut="return nd();">WPA�Í���:
           </td><td class="content_input_td"><select name="wl_crypto" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_crypto')"><option class="content_input_fd" value="tkip" <% nvram_match_x("WLANConfig11b","wl_crypto", "tkip","selected"); %>>TKIP</option><option class="content_input_fd" value="aes" <% nvram_match_x("WLANConfig11b","wl_crypto", "aes","selected"); %>>AES</option><option class="content_input_fd" value="tkip+aes" <% nvram_match_x("WLANConfig11b","wl_crypto", "tkip+aes","selected"); %>>TKIP+AES</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�v�����L�L�[��7�����ȏ�64�����ȉ��Őݒ肵�Ă�������!!! ���̃t�B�[���h���u�����N�ɂ���ƁA�V�X�e���̓p�X�t���[�Y�Ƃ���00000000�����蓖�Ă܂��B', LEFT);" onMouseOut="return nd();">WPA �v�����L�L�[:
           </td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" class="content_input_fd" size="32" name="wl_wpa_psk" value="<% nvram_get_x("WLANConfig11b","wl_wpa_psk"); %>" onKeyUp="return is_wlphrase('WLANConfig11b', 'wl_wpa_psk', this)" onBlur="return validate_wlphrase('WLANConfig11b', 'wl_wpa_psk', this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́A�f�[�^���Í�����������h�����߂Ɏg�p�����Í��������������܂��B', LEFT);" onMouseOut="return nd();">�Í���:
           </td><td class="content_input_td"><select name="wl_wep_x" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_wep_x')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","wl_wep_x", "0","selected"); %>>None</option><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","wl_wep_x", "1","selected"); %>>WEP-64bits</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11b","wl_wep_x", "2","selected"); %>>WEP-128bits</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('TKIP�܂���AES�Í���������I�����Ă���Ƃ��A���̃t�B�[���h�͈Í����v���Z�X���J�n���邽�߂̃p�X���[�h�Ƃ��Ďg�p����܂��BWEP-64�r�b�g�܂���WEP-128�r�b�g��I�����Ă���Ƃ��A���̃t�B�[���h��4��WEP�L�[�������I�ɐ������邽�߂Ɏg�p����܂��B', LEFT);" onMouseOut="return nd();">�p�X�t���[�Y:
           </td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" class="content_input_fd" size="32" name="wl_phrase_x" value="<% nvram_get_x("WLANConfig11b","wl_phrase_x"); %>" onKeyUp="return is_wlphrase('WLANConfig11b', 'wl_phrase_x', this)" onBlur="return validate_wlphrase('WLANConfig11b', 'wl_phrase_x', this)"></td>
</tr>
<tr>
<td class="content_header_td">WEP�L�[1 (10�܂���26����16�i����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key1" value="<% nvram_get_x("WLANConfig11b","wl_key1"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP�L�[2 (10�܂���26����16�i����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key2" value="<% nvram_get_x("WLANConfig11b","wl_key2"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP�L�[3 (10�܂���26����16�i����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key3" value="<% nvram_get_x("WLANConfig11b","wl_key3"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP�L�[4 (10�܂���26����16�i����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key4" value="<% nvram_get_x("WLANConfig11b","wl_key4"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́A�f�t�H���g�̓`��WEP�L�[�������܂��B', LEFT);" onMouseOut="return nd();">�f�t�H���g�L�[:
           </td><td class="content_input_td"><select name="wl_key" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_key')"><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","wl_key", "1","selected"); %>>Key1</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11b","wl_key", "2","selected"); %>>Key2</option><option class="content_input_fd" value="3" <% nvram_match_x("WLANConfig11b","wl_key", "3","selected"); %>>Key3</option><option class="content_input_fd" value="4" <% nvram_match_x("WLANConfig11b","wl_key", "4","selected"); %>>Key4</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́AWPA�O���[�v�L�[���ύX����鎞�ԊԊu��b�Ŏ����܂��B0�́A�����I��k-�ύX���K�v�Ȃ����Ƃ��Ӗ����܂��B', LEFT);" onMouseOut="return nd();">WPA Re-key�^�C�}�[:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wl_wpa_gtk_rekey" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "wl_wpa_gtk_rekey"); %>" onBlur="validate_range(this, 0, 86400)" onKeyPress="return is_number(this)"></td>
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

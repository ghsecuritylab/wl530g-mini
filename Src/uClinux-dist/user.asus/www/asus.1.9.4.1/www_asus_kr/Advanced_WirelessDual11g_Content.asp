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
    	
<input type="hidden" name="current_page" value="Advanced_Wireless_Content.asp"><input type="hidden" name="next_page" value="Advanced_UniqueKey_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="WLANConfig11a;WLANConfig11b;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">���� - �������̽�</td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� ZVMODELVZ�� �ش� ������ ���� ����� ���� �� �ֵ��� �մϴ�.', LEFT);" onMouseOut="return nd();">�����ڵ�:
           </td><td class="content_input_td"><select name="" class="content_input_fd">   
<% select_country("WLANConfig11a"); %>
                </select></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">802.11a �������̽�
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('WLAN�� ���Ͽ� �ִ� 32 ���ڼ��� ���̵� ���ڿ��� ���մϴ�.', LEFT);" onMouseOut="return nd();">SSID:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�۵��� ���� ä���� �����մϴ�. �ǿ�ä���� üũ�Ǿ� ������ �Ϻ��� Ư��ä���� ������ �� �ֽ��ϴ�.', LEFT);" onMouseOut="return nd();">ä��:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')">   
<% select_channel("WLANConfig11a"); %>
                </select><input type="hidden" maxlength="15" size="15" name="x_RegulatoryDomain" value="<% nvram_get_x("Regulatory","x_RegulatoryDomain"); %>" readonly="1"><input type="checkbox" style="margin-left:30" name="_check" value="" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')">Outdoor Channel</input></td>
</tr>
<input type="hidden" name="" value="<% nvram_get_x("WLANConfig11a",""); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('���� ������ ����Ʈ�� �����մϴ�. ���� �ش�ȭ�� ���� �ְ� ������ ���� �����մϴ�. �ͺ���尡 üũ�Ǿ� ������ �ִ� 108 Mpbs ������ ����Ʈ�� �����մϴ�.', LEFT);" onMouseOut="return nd();">������ ����Ʈ(Mbps):
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11a","", "0","selected"); %>>Best</option><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11a","", "1","selected"); %>>6</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11a","", "2","selected"); %>>9</option><option class="content_input_fd" value="3" <% nvram_match_x("WLANConfig11a","", "3","selected"); %>>12</option><option class="content_input_fd" value="4" <% nvram_match_x("WLANConfig11a","", "4","selected"); %>>18</option><option class="content_input_fd" value="5" <% nvram_match_x("WLANConfig11a","", "5","selected"); %>>24</option><option class="content_input_fd" value="6" <% nvram_match_x("WLANConfig11a","", "6","selected"); %>>36</option><option class="content_input_fd" value="7" <% nvram_match_x("WLANConfig11a","", "7","selected"); %>>48</option><option class="content_input_fd" value="8" <% nvram_match_x("WLANConfig11a","", "8","selected"); %>>54</option></select><input type="checkbox" style="margin-left:30" name="_check" value="" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')">Turbo Mode</input></td>
</tr>
<input type="hidden" name="" value="<% nvram_get_x("WLANConfig11a",""); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� �����ܰ迡���� ��ȣȭ �������θ� �����ϰ� �մϴ�.', LEFT);" onMouseOut="return nd();">�������:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')"><option class="content_input_fd" value="Open System" <% nvram_match_x("WLANConfig11a","", "Open System","selected"); %>>Open System</option><option class="content_input_fd" value="Shared Key" <% nvram_match_x("WLANConfig11a","", "Shared Key","selected"); %>>Shared Key</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���󿡼� ��м��� ������� �ʵ��� �����͸� ��ȣȭ�� �� �ֵ��� �մϴ�.', LEFT);" onMouseOut="return nd();">��ȣȭ ����(WEP):
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_wlweptype(this, 'WLANConfig11a')"><option class="content_input_fd" value="None" <% nvram_match_x("WLANConfig11a","", "None","selected"); %>>None</option><option class="content_input_fd" value="64bits" <% nvram_match_x("WLANConfig11a","", "64bits","selected"); %>>64bits</option><option class="content_input_fd" value="128bits" <% nvram_match_x("WLANConfig11a","", "128bits","selected"); %>>128bits</option><option class="content_input_fd" value="152bits" <% nvram_match_x("WLANConfig11a","", "152bits","selected"); %>>152bits</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� Ű�� �ڵ� ������ ���� ���带 �ο��ϰų� �� ĭ���� �ξ� Ű�� ���� �Է��մϴ�.', LEFT);" onMouseOut="return nd();">����:
           </td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onKeyUp="return is_wlphrase('WLANConfig11a', '', this)" onBlur="return validate_wlphrase('WLANConfig11a', '', this)"></td>
</tr>
<tr>
<td class="content_header_td">WEPŰ 1 (10, 26, 32�� 16����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Ű 2 (10, 26, 32�� 16����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Ű 3 (10, 26, 32�� 32 16����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Ű 4 (10, 26, 32�� 16����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� �⺻���� �� Ű�� ǥ���մϴ�.', LEFT);" onMouseOut="return nd();">Ű �ε���:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')"><option class="content_input_fd" value="Key1" <% nvram_match_x("WLANConfig11a","", "Key1","selected"); %>>Key1</option><option class="content_input_fd" value="Key2" <% nvram_match_x("WLANConfig11a","", "Key2","selected"); %>>Key2</option><option class="content_input_fd" value="Key3" <% nvram_match_x("WLANConfig11a","", "Key3","selected"); %>>Key3</option><option class="content_input_fd" value="Key4" <% nvram_match_x("WLANConfig11a","", "Key4","selected"); %>>Key4</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� AES Ű ������ �����ϰ� �մϴ�. Ű ������ Ȱ��ȭ�Ǿ� ������ ��� �����̼��� ���� AES Ű ��Ʈ�� ���������� ������ ������ Ű�� ��ȣȭ�� �����͸� �����ϰ� �����ϰ� �˴ϴ�.', LEFT);" onMouseOut="return nd();">��ȣȭ ����(AES Ű):
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')" <% nvram_match_x("WLANConfig11a","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '0')" <% nvram_match_x("WLANConfig11a","", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���� �����ϸ� ��ε�ĳ��Ʈ ��Ŷ���� Ap�� ���� ���� Ŭ���̾�Ʈ��� ���� AP�� ����� �˴ϴ�. �׷��Ƿ� AP�� SSID�� �ν��ϴ� Ŭ���̾�Ʈ�鸸�� ����� �� �ֽ��ϴ�.', LEFT);" onMouseOut="return nd();">SSID �����:
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')" <% nvram_match_x("WLANConfig11a","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '0')" <% nvram_match_x("WLANConfig11a","", "0", "checked"); %>>No</input></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">802.11g �������̽�
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('WLAN�� ���Ͽ� �ִ� 32 ���ڼ��� �����Ǵ� ���̵� ���ڿ��� �����մϴ�.', LEFT);" onMouseOut="return nd();">SSID:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wl_ssid" value="<% nvram_get_x("WLANConfig11b","wl_ssid"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�۵� ���� ä�� ����', LEFT);" onMouseOut="return nd();">ä��:
           </td><td class="content_input_td"><select name="wl_channel" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_channel')">   
<% select_channel("WLANConfig11b"); %>
                </select><input type="hidden" maxlength="15" size="15" name="x_RegulatoryDomain" value="<% nvram_get_x("Regulatory","x_RegulatoryDomain"); %>" readonly="1"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� 802.11g �������̽� ��带 ǥ���մϴ�. �ڵ��� �����ϸ� 802.11g �� 802.11b�� ������� ����̽��� ����� �� �ֽ��ϴ�. 54g���� �����ϸ� ������ �ش�ȭ�ǳ� 802.11b Ŭ���̾�Ʈ�� ������� ����̽��� ����� �� �����ϴ�. 54g  ��ȣ�� üũ�Ǿ� ������ 11g Ʈ������G-��� ��ȣ�� 11b Ʈ���� �տ��� �ڵ����� Ȱ��ȭ�˴ϴ�.', LEFT);" onMouseOut="return nd();">�������:
           </td><td class="content_input_td"><select name="wl_gmode" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_gmode')"><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","wl_gmode", "1","selected"); %>>Auto</option><option class="content_input_fd" value="4" <% nvram_match_x("WLANConfig11b","wl_gmode", "4","selected"); %>>54G Only</option><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","wl_gmode", "0","selected"); %>>802.11B Only</option></select><input type="checkbox" style="margin-left:30" name="wl_gmode_check" value="" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_gmode', '1')">54g Protection</input></td>
</tr>
<input type="hidden" name="wl_gmode_protection_x" value="<% nvram_get_x("WLANConfig11b","wl_gmode_protection_x"); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� ���� ������� ��������� ǥ���մϴ�. ��������� �ٸ��� �����ϸ� �ش��ϴ� ��ȣȭ ����ü�谡 ����˴ϴ�.', LEFT);" onMouseOut="return nd();">�������:
           </td><td class="content_input_td"><select name="wl_auth_mode" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_auth_mode')"><option class="content_input_fd" value="open" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "open","selected"); %>>Open System or Shared Key</option><option class="content_input_fd" value="shared" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "shared","selected"); %>>Shared Key</option><option class="content_input_fd" value="psk" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "psk","selected"); %>>WPA-PSK</option><option class="content_input_fd" value="wpa" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "wpa","selected"); %>>WPA</option><option class="content_input_fd" value="radius" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "radius","selected"); %>>Radius with 802.1x</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� WPA ��ȣȭ ������ Ȱ��ȭ �Ǵ� ���� ������ ��ȣȭ ��������� ǥ���մϴ�.', LEFT);" onMouseOut="return nd();">WPA ��ȣȭ ����:
           </td><td class="content_input_td"><select name="wl_crypto" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_crypto')"><option class="content_input_fd" value="tkip" <% nvram_match_x("WLANConfig11b","wl_crypto", "tkip","selected"); %>>TKIP</option><option class="content_input_fd" value="aes" <% nvram_match_x("WLANConfig11b","wl_crypto", "aes","selected"); %>>AES</option><option class="content_input_fd" value="tkip+aes" <% nvram_match_x("WLANConfig11b","wl_crypto", "tkip+aes","selected"); %>>TKIP+AES</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���� ����Ű�� 7�� �̻� 64�� ������ �����̾�� �մϴ�!!! �������� �θ� �ý����� ��й����� 00000000�� ���ϰ� �˴ϴ�.', LEFT);" onMouseOut="return nd();">WPA ���� ����Ű:
           </td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" class="content_input_fd" size="32" name="wl_wpa_psk" value="<% nvram_get_x("WLANConfig11b","wl_wpa_psk"); %>" onKeyUp="return is_wlphrase('WLANConfig11b', 'wl_wpa_psk', this)" onBlur="return validate_wlphrase('WLANConfig11b', 'wl_wpa_psk', this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� �� ��ȣȭ ������ Ȱ��ȭ�ǰ� �ִ� ���� �����͸� ��ȣȭ�ϱ� ���� ��������� ǥ���մϴ�.', LEFT);" onMouseOut="return nd();">WEP ��ȣȭ ����:
           </td><td class="content_input_td"><select name="wl_wep_x" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_wep_x')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","wl_wep_x", "0","selected"); %>>None</option><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","wl_wep_x", "1","selected"); %>>WEP-64bits</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11b","wl_wep_x", "2","selected"); %>>WEP-128bits</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('TKIP �Ǵ�AES ��������� �����ϸ� �� ������ TKIP ��ȣȭ ���������� �����ϴ� ��й�ȣ�� ���� �� �ֽ��ϴ�.  8~63 ���ڼ��� ��й�ȣ�� �䱸�˴ϴ�. �� 64 ��Ʈ �Ǵ� �� 128 ��Ʈ ��ȣȭ ������ �����ϸ� �� ������ 4���� WEB Ű�� �ڵ����� �� �� �ֽ��ϴ�.', LEFT);" onMouseOut="return nd();">��й���:
           </td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" class="content_input_fd" size="32" name="wl_phrase_x" value="<% nvram_get_x("WLANConfig11b","wl_phrase_x"); %>" onKeyUp="return is_wlphrase('WLANConfig11b', 'wl_phrase_x', this)" onBlur="return validate_wlphrase('WLANConfig11b', 'wl_phrase_x', this)"></td>
</tr>
<tr>
<td class="content_header_td">WEP Ű 1 (10 �Ǵ� 26�� 16����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key1" value="<% nvram_get_x("WLANConfig11b","wl_key1"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Ű 2 (10 �Ǵ� 26�� 16����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key2" value="<% nvram_get_x("WLANConfig11b","wl_key2"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Ű 3 (10 �Ǵ� 26�� 16����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key3" value="<% nvram_get_x("WLANConfig11b","wl_key3"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Ű 4 (10 �Ǵ� 26�� 16����):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key4" value="<% nvram_get_x("WLANConfig11b","wl_key4"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� �ʱ⼳�� ���� �� Ű�� ǥ���մϴ�.', LEFT);" onMouseOut="return nd();">Ű �ε���:
           </td><td class="content_input_td"><select name="wl_key" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_key')"><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","wl_key", "1","selected"); %>>Key1</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11b","wl_key", "2","selected"); %>>Key2</option><option class="content_input_fd" value="3" <% nvram_match_x("WLANConfig11b","wl_key", "3","selected"); %>>Key3</option><option class="content_input_fd" value="4" <% nvram_match_x("WLANConfig11b","wl_key", "4","selected"); %>>Key4</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� WPA �׷� Ű�� ����Ǵ� �ð������� �ʴ����� ���մϴ�. 0�� �ֱ����� Ű ������ �䱸���� ������ �ǹ��մϴ�.', LEFT);" onMouseOut="return nd();">��Ʈ��ũ Ű ȸ�� ����:
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

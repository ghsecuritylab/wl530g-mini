<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<td class="content_header_td_title" colspan="2">Wireless - Interface</td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field allows ZVMODELVZ to follow the wireless specification of your country.', LEFT);" onMouseOut="return nd();">Country Code:
           </td><td class="content_input_td"><select name="" class="content_input_fd">   
<% select_country("WLANConfig11a"); %>
                </select></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">802.11a Interface
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Assign an identification string, consisting of up to 32 characters, for your WLAN.', LEFT);" onMouseOut="return nd();">SSID:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Select the operating radio channel. If outdoor channel is checked, you will be allowed to select some special channels.', LEFT);" onMouseOut="return nd();">Channel:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')">   
<% select_channel("WLANConfig11a"); %>
                </select><input type="hidden" maxlength="15" size="15" name="x_RegulatoryDomain" value="<% nvram_get_x("Regulatory","x_RegulatoryDomain"); %>" readonly="1"><input type="checkbox" style="margin-left:30" name="_check" value="" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')">Outdoor Channel</input></td>
</tr>
<input type="hidden" name="" value="<% nvram_get_x("WLANConfig11a",""); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('Select the transmited data rate. You are recommended to select Best to maximize performace. If turbo mode is checked, you will get up to 108 Mpbs data rate.', LEFT);" onMouseOut="return nd();">Data Rate(Mbps):
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11a","", "0","selected"); %>>Best</option><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11a","", "1","selected"); %>>6</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11a","", "2","selected"); %>>9</option><option class="content_input_fd" value="3" <% nvram_match_x("WLANConfig11a","", "3","selected"); %>>12</option><option class="content_input_fd" value="4" <% nvram_match_x("WLANConfig11a","", "4","selected"); %>>18</option><option class="content_input_fd" value="5" <% nvram_match_x("WLANConfig11a","", "5","selected"); %>>24</option><option class="content_input_fd" value="6" <% nvram_match_x("WLANConfig11a","", "6","selected"); %>>36</option><option class="content_input_fd" value="7" <% nvram_match_x("WLANConfig11a","", "7","selected"); %>>48</option><option class="content_input_fd" value="8" <% nvram_match_x("WLANConfig11a","", "8","selected"); %>>54</option></select><input type="checkbox" style="margin-left:30" name="_check" value="" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')">Turbo Mode</input></td>
</tr>
<input type="hidden" name="" value="<% nvram_get_x("WLANConfig11a",""); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field allows you to configure if encryption is required in authentication stage or not.', LEFT);" onMouseOut="return nd();">Authentication Method:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')"><option class="content_input_fd" value="Open System" <% nvram_match_x("WLANConfig11a","", "Open System","selected"); %>>Open System</option><option class="content_input_fd" value="Shared Key" <% nvram_match_x("WLANConfig11a","", "Shared Key","selected"); %>>Shared Key</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Enable WEP to encrypt data which can avoid disclosure to eavesdroppers', LEFT);" onMouseOut="return nd();">Encryption(WEP):
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_wlweptype(this, 'WLANConfig11a')"><option class="content_input_fd" value="None" <% nvram_match_x("WLANConfig11a","", "None","selected"); %>>None</option><option class="content_input_fd" value="64bits" <% nvram_match_x("WLANConfig11a","", "64bits","selected"); %>>64bits</option><option class="content_input_fd" value="128bits" <% nvram_match_x("WLANConfig11a","", "128bits","selected"); %>>128bits</option><option class="content_input_fd" value="152bits" <% nvram_match_x("WLANConfig11a","", "152bits","selected"); %>>152bits</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Give a magic word to generate the WEP keys automatically or leave this field blank and type in the keys manually.', LEFT);" onMouseOut="return nd();">Phrase:
           </td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onKeyUp="return is_wlphrase('WLANConfig11a', '', this)" onBlur="return validate_wlphrase('WLANConfig11a', '', this)"></td>
</tr>
<tr>
<td class="content_header_td">WEP Key 1 (10 or 26 or 32 hex digits):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Key 2 (10 or 26 or 32 hex digits):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Key 3 (10 or 26 or 32 hex digits):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Key 4 (10 or 26 or 32 hex digits):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11a",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11a')" onKeyPress="return is_wlkey(this, 'WLANConfig11a')" onKeyUp="return change_wlkey(this, 'WLANConfig11a')"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field indicates the default transmit WEP key.', LEFT);" onMouseOut="return nd();">Key Index:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11a', '')"><option class="content_input_fd" value="Key1" <% nvram_match_x("WLANConfig11a","", "Key1","selected"); %>>Key1</option><option class="content_input_fd" value="Key2" <% nvram_match_x("WLANConfig11a","", "Key2","selected"); %>>Key2</option><option class="content_input_fd" value="Key3" <% nvram_match_x("WLANConfig11a","", "Key3","selected"); %>>Key3</option><option class="content_input_fd" value="Key4" <% nvram_match_x("WLANConfig11a","", "Key4","selected"); %>>Key4</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field allows you to enable AES unique key transmission. If you enable it, each station will transmit and receive data encrypted with an unique key which is pre-set in Wiress-AES Key Control page.', LEFT);" onMouseOut="return nd();">Encryption(AES Unique Key):
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')" <% nvram_match_x("WLANConfig11a","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '0')" <% nvram_match_x("WLANConfig11a","", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Selecting YES will hide your AP from those clients that query AP by broadcast packets. So, only clients that are aware of the SSID of AP can connect to it.', LEFT);" onMouseOut="return nd();">Hide SSID:
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '1')" <% nvram_match_x("WLANConfig11a","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11a', '', '0')" <% nvram_match_x("WLANConfig11a","", "0", "checked"); %>>No</input></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">802.11g Interface
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Assign an identification string, consisting of up to 32 characters, for your WLAN.', LEFT);" onMouseOut="return nd();">SSID:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="wl_ssid" value="<% nvram_get_x("WLANConfig11b","wl_ssid"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Select the operating radio channel', LEFT);" onMouseOut="return nd();">Channel:
           </td><td class="content_input_td"><select name="wl_channel" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_channel')">   
<% select_channel("WLANConfig11b"); %>
                </select><input type="hidden" maxlength="15" size="15" name="x_RegulatoryDomain" value="<% nvram_get_x("Regulatory","x_RegulatoryDomain"); %>" readonly="1"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field indicates the mode of 802.11g interface. Selecting Auto allows 802.11g and 802.11b to connect to your device. Selecting 54g Only maximizes performace, but 802.11b client is not allowed to connect to your device. If 54g Protection is checked, G-Mode protection of 11g traffic is enabled automatically in the presence of 11b traffic.', LEFT);" onMouseOut="return nd();">Wireless Mode:
           </td><td class="content_input_td"><select name="wl_gmode" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_gmode')"><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","wl_gmode", "1","selected"); %>>Auto</option><option class="content_input_fd" value="4" <% nvram_match_x("WLANConfig11b","wl_gmode", "4","selected"); %>>54G Only</option><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","wl_gmode", "0","selected"); %>>802.11B Only</option></select><input type="checkbox" style="margin-left:30" name="wl_gmode_check" value="" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_gmode', '1')">54g Protection</input></td>
</tr>
<input type="hidden" name="wl_gmode_protection_x" value="<% nvram_get_x("WLANConfig11b","wl_gmode_protection_x"); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field indicates the method used to authenticate wireless users. Selecting different Authentication Method, different encryption scheme will be applied.', LEFT);" onMouseOut="return nd();">Authentication Method:
           </td><td class="content_input_td"><select name="wl_auth_mode" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_auth_mode')"><option class="content_input_fd" value="open" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "open","selected"); %>>Open System or Shared Key</option><option class="content_input_fd" value="shared" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "shared","selected"); %>>Shared Key</option><option class="content_input_fd" value="psk" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "psk","selected"); %>>WPA-PSK</option><option class="content_input_fd" value="wpa" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "wpa","selected"); %>>WPA</option><option class="content_input_fd" value="radius" <% nvram_match_x("WLANConfig11b","wl_auth_mode", "radius","selected"); %>>Radius with 802.1x</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field indicates the encryption method used to encrypt data while WPA encryption is enabled.', LEFT);" onMouseOut="return nd();">WPA Encryption:
           </td><td class="content_input_td"><select name="wl_crypto" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_crypto')"><option class="content_input_fd" value="tkip" <% nvram_match_x("WLANConfig11b","wl_crypto", "tkip","selected"); %>>TKIP</option><option class="content_input_fd" value="aes" <% nvram_match_x("WLANConfig11b","wl_crypto", "aes","selected"); %>>AES</option><option class="content_input_fd" value="tkip+aes" <% nvram_match_x("WLANConfig11b","wl_crypto", "tkip+aes","selected"); %>>TKIP+AES</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Pre-shared key should be more than 7 characters and less than 64 characters!!! If you leave this field blank, system will assign 00000000 as your passphrase.', LEFT);" onMouseOut="return nd();">WPA Pre-Shared Key:
           </td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" class="content_input_fd" size="32" name="wl_wpa_psk" value="<% nvram_get_x("WLANConfig11b","wl_wpa_psk"); %>" onKeyUp="return is_wlphrase('WLANConfig11b', 'wl_wpa_psk', this)" onBlur="return validate_wlphrase('WLANConfig11b', 'wl_wpa_psk', this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field indicates the encryption method used to encrypt data while WEP encryption is enabled.', LEFT);" onMouseOut="return nd();">WEP Encryption:
           </td><td class="content_input_td"><select name="wl_wep_x" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_wep_x')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","wl_wep_x", "0","selected"); %>>None</option><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","wl_wep_x", "1","selected"); %>>WEP-64bits</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11b","wl_wep_x", "2","selected"); %>>WEP-128bits</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Selecting WEP-64bits or WEP-128bits encryption method, this field will be used to generate four WEP keys automatically.', LEFT);" onMouseOut="return nd();">Passphrase:
           </td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" class="content_input_fd" size="32" name="wl_phrase_x" value="<% nvram_get_x("WLANConfig11b","wl_phrase_x"); %>" onKeyUp="return is_wlphrase('WLANConfig11b', 'wl_phrase_x', this)" onBlur="return validate_wlphrase('WLANConfig11b', 'wl_phrase_x', this)"></td>
</tr>
<tr>
<td class="content_header_td">WEP Key 1 (10 or 26 hex digits):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key1" value="<% nvram_get_x("WLANConfig11b","wl_key1"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Key 2 (10 or 26 hex digits):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key2" value="<% nvram_get_x("WLANConfig11b","wl_key2"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Key 3 (10 or 26 hex digits):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key3" value="<% nvram_get_x("WLANConfig11b","wl_key3"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP Key 4 (10 or 26 hex digits):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="wl_key4" value="<% nvram_get_x("WLANConfig11b","wl_key4"); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field indicates the default transmit WEP key.', LEFT);" onMouseOut="return nd();">Key Index:
           </td><td class="content_input_td"><select name="wl_key" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_key')"><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","wl_key", "1","selected"); %>>Key1</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11b","wl_key", "2","selected"); %>>Key2</option><option class="content_input_fd" value="3" <% nvram_match_x("WLANConfig11b","wl_key", "3","selected"); %>>Key3</option><option class="content_input_fd" value="4" <% nvram_match_x("WLANConfig11b","wl_key", "4","selected"); %>>Key4</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field specifies the time interval, in seconds, that WPA group key is changed. 0 means no periodic key-change is required.', LEFT);" onMouseOut="return nd();">Network Key Rotation Interval:
           </td><td class="content_input_td"><input type="text" maxlength="10" class="content_input_fd" size="10" name="wl_wpa_gtk_rekey" value="<% nvram_get_x("WLANConfig11b","wl_wpa_gtk_rekey"); %>" onBlur="validate_range(this, 0, 4294927695)" onKeyPress="return is_number(this)"></td>
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
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Restore ')" type="submit" value=" Restore " name="action"></font></div> 
   </td>  
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Finish ')" type="submit" value=" Finish " name="action"></font></div> 
   </td>
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Apply ')" type="submit" value=" Apply " name="action"></font></div> 
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
    <td class="content_header_td_15" align="left">Restore: </td>
    <td class="content_input_td_padding" align="left">Clear the above settings and restore the settings in effect.</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">Finish: </td>
    <td class="content_input_td_padding" align="left">Confirm all settings and restart ZVMODELVZ now.</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">Apply: </td>
    <td class="content_input_td_padding" align="left">Confirm above settings and continue.</td>
</tr>
</table>
</td>
</tr>

</table>
</form>
</body>

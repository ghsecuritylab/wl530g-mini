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
    	
<input type="hidden" name="current_page" value="Advanced_WAdvanced_Content.asp"><input type="hidden" name="next_page" value="SaveRestart.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="WLANAuthentication11a;WLANConfig11b;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">���C�����X - �ڍאݒ�</td>
</tr>
<input type="hidden" name="wl_gmode" value="<% nvram_get_x("WLANConfig11b","wl_gmode"); %>"><input type="hidden" name="wl_gmode_protection_x" value="<% nvram_get_x("WLANConfig11b","wl_gmode_protection_x"); %>">
<tr>
<td class="content_desc_td" colspan="2">WLANConfig11b_display5_sectiondesc
         </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('WLANConfig11b_x_AfterBurner_itemdesc', LEFT);" onMouseOut="return nd();">WLANConfig11b_x_AfterBurner_itemname
           </td><td class="content_input_td"><select name="wl_afterburner" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_afterburner')"><option class="content_input_fd" value="off" <% nvram_match_x("WLANConfig11b","wl_afterburner", "off","selected"); %>>Disabled</option><option class="content_input_fd" value="auto" <% nvram_match_x("WLANConfig11b","wl_afterburner", "auto","selected"); %>>Enabled</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́A�u���[�h�L���X�gSSID�����v���[�u���b�Z�[�W���u���b�N����邩�������܂��B', LEFT);" onMouseOut="return nd();">�u���[�h�L���X�gSSID�̃u���b�N:
           </td><td class="content_input_td"><input type="radio" value="1" name="wl_closed" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_closed', '1')" <% nvram_match_x("WLANConfig11b","wl_closed", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wl_closed" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_closed', '0')" <% nvram_match_x("WLANConfig11b","wl_closed", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('WLANConfig11b_x_IsolateAP_itemdesc', LEFT);" onMouseOut="return nd();">WLANConfig11b_x_IsolateAP_itemname
           </td><td class="content_input_td"><input type="radio" value="1" name="wl_ap_isolate" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_ap_isolate', '1')" <% nvram_match_x("WLANConfig11b","wl_ap_isolate", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wl_ap_isolate" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_ap_isolate', '0')" <% nvram_match_x("WLANConfig11b","wl_ap_isolate", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�`�����x��I�����܂��B�p�t�H�[�}���X���ő剻���邽�߂ɂ�Auto�i�����j��I������悤�ɂ����߂��܂��B', LEFT);" onMouseOut="return nd();">�f�[�^�]�����x(Mbps):
           </td><td class="content_input_td"><select name="wl_rate" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_rate')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","wl_rate", "0","selected"); %>>Auto</option><option class="content_input_fd" value="1000000" <% nvram_match_x("WLANConfig11b","wl_rate", "1000000","selected"); %>>1</option><option class="content_input_fd" value="2000000" <% nvram_match_x("WLANConfig11b","wl_rate", "2000000","selected"); %>>2</option><option class="content_input_fd" value="5500000" <% nvram_match_x("WLANConfig11b","wl_rate", "5500000","selected"); %>>5.5</option><option class="content_input_fd" value="6000000" <% nvram_match_x("WLANConfig11b","wl_rate", "6000000","selected"); %>>6</option><option class="content_input_fd" value="9000000" <% nvram_match_x("WLANConfig11b","wl_rate", "9000000","selected"); %>>9</option><option class="content_input_fd" value="11000000" <% nvram_match_x("WLANConfig11b","wl_rate", "11000000","selected"); %>>11</option><option class="content_input_fd" value="12000000" <% nvram_match_x("WLANConfig11b","wl_rate", "12000000","selected"); %>>12</option><option class="content_input_fd" value="18000000" <% nvram_match_x("WLANConfig11b","wl_rate", "18000000","selected"); %>>18</option><option class="content_input_fd" value="24000000" <% nvram_match_x("WLANConfig11b","wl_rate", "24000000","selected"); %>>24</option><option class="content_input_fd" value="36000000" <% nvram_match_x("WLANConfig11b","wl_rate", "36000000","selected"); %>>36</option><option class="content_input_fd" value="48000000" <% nvram_match_x("WLANConfig11b","wl_rate", "48000000","selected"); %>>48</option><option class="content_input_fd" value="54000000" <% nvram_match_x("WLANConfig11b","wl_rate", "54000000","selected"); %>>54</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́A���C�����X�N���C�A���g���T�|�[�g���Ȃ���΂Ȃ�Ȃ���{���[�g�������܂��B', LEFT);" onMouseOut="return nd();">��{���[�g�Z�b�g:
           </td><td class="content_input_td"><select name="wl_rateset" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_rateset')"><option class="content_input_fd" value="default" <% nvram_match_x("WLANConfig11b","wl_rateset", "default","selected"); %>>Default</option><option class="content_input_fd" value="all" <% nvram_match_x("WLANConfig11b","wl_rateset", "all","selected"); %>>All</option><option class="content_input_fd" value="12" <% nvram_match_x("WLANConfig11b","wl_rateset", "12","selected"); %>>1, 2 Mbps</option></select></td>
</tr>
<tr>
<td class="content_header_td">�f�Љ��������l:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wl_frag" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "wl_frag"); %>" onBlur="validate_range(this, 256, 2346)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td">RTS�������l:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wl_rts" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "wl_rts"); %>" onBlur="validate_range(this, 0, 2347)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td">DTIM�Ԋu:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wl_dtim" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "wl_dtim"); %>" onBlur="validate_range(this, 1, 255)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td">�r�[�R���Ԋu:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wl_bcn" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "wl_bcn"); %>" onBlur="validate_range(this, 1, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�͂���I������ƁA�t���[���o�[�X�g��L���ɂ��ăp�t�H�[�}���X�����コ���܂��B', LEFT);" onMouseOut="return nd();">�t���[���o�[�X�g��L���ɂ��܂���?
           </td><td class="content_input_td"><select name="wl_frameburst" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_frameburst')"><option class="content_input_fd" value="off" <% nvram_match_x("WLANConfig11b","wl_frameburst", "off","selected"); %>>Disabled</option><option class="content_input_fd" value="on" <% nvram_match_x("WLANConfig11b","wl_frameburst", "on","selected"); %>>Enabled</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�͂���I������ƁA���t�Ǝ��Ԃɂ�胏�C�����X�@�\���L���ɂȂ�܂��B', LEFT);" onMouseOut="return nd();">������L���ɂ��܂���?
           </td><td class="content_input_td"><input type="radio" value="1" name="wl_radio_x" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_radio_x', '1')" <% nvram_match_x("WLANConfig11b","wl_radio_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wl_radio_x" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_radio_x', '0')" <% nvram_match_x("WLANConfig11b","wl_radio_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́A���C�����X�@�\���L���ɂȂ�����`���܂��B', LEFT);" onMouseOut="return nd();">������L���ɂ����:
           </td><td class="content_input_td"><input type="hidden" maxlength="7" class="content_input_fd" size="7" name="wl_radio_date_x" value="<% nvram_get_x("WLANConfig11b","wl_radio_date_x"); %>">
<p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">
<input type="checkbox" class="content_input_fd" name="wl_radio_date_x_Sun">Sun</input><input type="checkbox" class="content_input_fd" name="wl_radio_date_x_Mon">Mon</input><input type="checkbox" class="content_input_fd" name="wl_radio_date_x_Tue">Tue</input><input type="checkbox" class="content_input_fd" name="wl_radio_date_x_Wed">Wed</input>
</p>
<input type="checkbox" class="content_input_fd" name="wl_radio_date_x_Thu">Thu</input><input type="checkbox" class="content_input_fd" name="wl_radio_date_x_Fri">Fri</input><input type="checkbox" class="content_input_fd" name="wl_radio_date_x_Sat">Sat</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�́A���C�����X�@�\���L���ɂȂ鎞�ԊԊu���`���܂��B', LEFT);" onMouseOut="return nd();">������L���ɂ������:
           </td><td class="content_input_td"><input type="hidden" maxlength="11" class="content_input_fd" size="11" name="wl_radio_time_x" value="<% nvram_get_x("WLANConfig11b","wl_radio_time_x"); %>"><input type="text" maxlength="2" class="content_input_fd" size="2" name="wl_radio_time_x_starthour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 0)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="wl_radio_time_x_startmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 1)">-
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="wl_radio_time_x_endhour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 2)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="wl_radio_time_x_endmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 3)"></td>
</tr>
<tr>
<td class="content_header_td">Radio Power:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="wl_radio_power_x" class="content_input_fd" value="<% nvram_get_x("WLANConfig11b", "wl_radio_power_x"); %>" onBlur="validate_range(this, 1, 84)" onKeyPress="return is_number(this)"></td>
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
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0"></table>
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

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
    	
<input type="hidden" name="current_page" value="Advanced_Wireless_Content.asp"><input type="hidden" name="next_page" value="Advanced_WMode_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="WLANConfig11a;WLANConfig11b;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">�L�u - ����</td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���z���L�u�ϰ�����]WLAN�^���w�@�եi��32�Ӧr�����ѧO�r��C', LEFT);" onMouseOut="return nd();">SSID�G
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('��ܧ@�~�ɪ��L�u�W�D', LEFT);" onMouseOut="return nd();">�W�D�G
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', '')">   
<% select_channel("WLANConfig11b"); %>
                </select><input type="hidden" maxlength="15" size="15" name="x_RegulatoryDomain" value="<% nvram_get_x("Regulatory","x_RegulatoryDomain"); %>" readonly="1"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���欰���X�ΥH��L�u�Τ�i�����Ҫ��覡�C��ܤ��P�����Ҥ覡�A�K�ݮM�Τ��P���[�K���c�C', LEFT);" onMouseOut="return nd();">���v�覡�G
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', '')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","", "0","selected"); %>>Open System or Shared Key</option><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","", "1","selected"); %>>Shared Key</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11b","", "2","selected"); %>>WPA-PSK</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���欰���X��ҥ�WEP�[�K�\��A�ΥH�N��ƥ[�K���[�K�覡�C', LEFT);" onMouseOut="return nd();">WEP�[�K�G
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_wlweptype(this, 'WLANConfig11b')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","", "0","selected"); %>>None</option><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","", "1","selected"); %>>WEP-64bits</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11b","", "2","selected"); %>>WEP-128bits</option><option class="content_input_fd" value="3" <% nvram_match_x("WLANConfig11b","", "3","selected"); %>>WEP-152bits</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���WEP-64bits��WEP-128bits�[�K�覡�A����i�ΥH�۰ʲ��ͥ|�ժ�WEP���_�C', LEFT);" onMouseOut="return nd();">�q��X�G
           </td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onKeyUp="return is_wlphrase('WLANConfig11b', '', this)" onBlur="return validate_wlphrase('WLANConfig11b', '', this)"></td>
</tr>
<tr>
<td class="content_header_td">WEP���_1�]10��26�Q���i��ơ^�G
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP���_2�]10��26�Q���i��ơ^�G
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP���_3�]10��26�Q���i��ơ^�G
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEP���_4�]10��26�Q���i��ơ^�G
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���欰���X�w�w�ǰe��WEP���_�C', LEFT);" onMouseOut="return nd();">���_���ޡG
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', '')"><option class="content_input_fd" value="Key1" <% nvram_match_x("WLANConfig11b","", "Key1","selected"); %>>Key1</option><option class="content_input_fd" value="Key2" <% nvram_match_x("WLANConfig11b","", "Key2","selected"); %>>Key2</option><option class="content_input_fd" value="Key3" <% nvram_match_x("WLANConfig11b","", "Key3","selected"); %>>Key3</option><option class="content_input_fd" value="Key4" <% nvram_match_x("WLANConfig11b","", "Key4","selected"); %>>Key4</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('��ܡuYes�v�A�|�N�@���ǥѼs���ʥ]�H�d��AP���Ȥ�ݩҶǨӪ�AP���ð_�ӡC�]���A�Ȧ��惡AP��SSID���Ҫ`�N���Ȥ�ݡA�~��M��s�u�C', LEFT);" onMouseOut="return nd();">����SSID�G
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', '', '1')" <% nvram_match_x("WLANConfig11b","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', '', '0')" <% nvram_match_x("WLANConfig11b","", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���欰���wWPA�s�ժ��_�ܧ�A�H��p�⪺�ɶ����j�C0��ܵL���g���ʪ��_�ܧ�C', LEFT);" onMouseOut="return nd();">�������_��ʶ��j�G
           </td><td class="content_input_td"><input type="text" maxlength="10" class="content_input_fd" size="10" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onBlur="validate_range(this, 0, 4294967295)" onKeyPress="return is_number(this)"></td>
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

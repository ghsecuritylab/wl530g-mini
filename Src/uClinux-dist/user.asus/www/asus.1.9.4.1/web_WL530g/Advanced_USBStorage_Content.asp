<head>
<title>WL530g Web Manager</title>
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
    	
<input type="hidden" name="current_page" value="Advanced_USBStorage_Content.asp"><input type="hidden" name="next_page" value="Advanced_WebCam_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="PrinterStatus;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">USB���ε{�� - FTP���A��</td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�b�����z��USB��ʺФ��e�A�Ы��U����N�֨���Ƽg�^���ʺФW�õ��ԥ������A����ܡC', LEFT);" onMouseOut="return nd();">�j��h�XUSB��ʺСG
           </td><td class="content_input_td"><input type="hidden" maxlength="15" class="content_input_fd_ro" size="12" name="" value="<% nvram_get_f("ddns.log","DDNSStatus"); %>"><input type="submit" maxlength="15" class="content_input_fd_ro" onClick="return onSubmitApply('eject-usb.sh')" size="12" name="PrinterStatus_x_FEject_button" value="�h�X"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('��ܡuYes�v�A�i�Q�αz��USB��ʺЫإߤ@�BFTP���A���C', LEFT);" onMouseOut="return nd();">�ҥ�FTP���A���H
           </td><td class="content_input_td"><input type="radio" value="1" name="usb_ftpenable_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpenable_x', '1')" <% nvram_match_x("PrinterStatus","usb_ftpenable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="usb_ftpenable_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpenable_x', '0')" <% nvram_match_x("PrinterStatus","usb_ftpenable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('��ܡuYes�v�A�i���Τ�L���K�X�Y�i�s�W�z��FTP���A���C�ΦW�]Anonymous�^�b�����D�ؿ��]home directory�^�OUSB��ʺЪ��ڥؿ��C', LEFT);" onMouseOut="return nd();">���\�ΦW�Τ�n�J�H
           </td><td class="content_input_td"><input type="radio" value="1" name="usb_ftpanonymous_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpanonymous_x', '1')" <% nvram_match_x("PrinterStatus","usb_ftpanonymous_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="usb_ftpanonymous_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpanonymous_x', '0')" <% nvram_match_x("PrinterStatus","usb_ftpanonymous_x", "0", "checked"); %>>No</input><a href="javascript:openLink('x_FIsAnonymous')" class="content_input_link" name="x_FIsAnonymous_link">�n�J
             </a></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('��ܡuYes�v�A�i���Τ�H�ۦP�n�J���޳n��]Web Manager�^���b���ӳs�W�z��FTP���A���C�W�ťΤ�]Superuser�^�b�����D�ؿ��OUSB��ʺЪ��ڥؿ��C', LEFT);" onMouseOut="return nd();">���\�W�ťΤ�n�J�H
           </td><td class="content_input_td"><input type="radio" value="1" name="usb_ftpsuper_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpsuper_x', '1')" <% nvram_match_x("PrinterStatus","usb_ftpsuper_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="usb_ftpsuper_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpsuper_x', '0')" <% nvram_match_x("PrinterStatus","usb_ftpsuper_x", "0", "checked"); %>>No</input><a href="javascript:openLink('x_FIsSuperuser')" class="content_input_link" name="x_FIsSuperuser_link">�n�J
             </a></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����쬰���XFTP�q�T��w�ҨϥΪ��q�T��s���C', LEFT);" onMouseOut="return nd();">FTP�q�T��G
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="usb_ftpport_x" class="content_input_fd" value="<% nvram_get_x("PrinterStatus", "usb_ftpport_x"); %>" onBlur="validate_range(this, 1, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����쬰���X���\����P�ɶ��n�JFTP���A�����̤j�Τ�ơC', LEFT);" onMouseOut="return nd();">���\�n�J���̤j�Τ�ơG
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="usb_ftpmax_x" class="content_input_fd" value="<% nvram_get_x("PrinterStatus", "usb_ftpmax_x"); %>" onBlur="validate_range(this, 1, 12)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('��������z�i�b�Τ��J�n�J�W�٤@�q�S�w���ɶ���פ�Τ�s�u�C', LEFT);" onMouseOut="return nd();">�H���p�⪺�n�J�O�ɮɶ��G
           </td><td class="content_input_td"><input type="text" maxlength="5" class="content_input_fd" size="5" name="usb_ftptimeout_x" value="<% nvram_get_x("PrinterStatus","usb_ftptimeout_x"); %>" onBlur="validate_range(this, 0, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('��������z�i�b�Τ�n�J�o�������m�@�q�S�w���ɶ���פ�Τ�s�u�C', LEFT);" onMouseOut="return nd();">�H���p�⪺�����O�ɮɶ��G
           </td><td class="content_input_td"><input type="text" maxlength="5" class="content_input_fd" size="5" name="usb_ftpstaytimeout_x" value="<% nvram_get_x("PrinterStatus","usb_ftpstaytimeout_x"); %>" onBlur="validate_range(this, 0, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���A���WUSB�w�Ы�AWL530g �|�b���w�Ъ��ڥؿ��M��A���w���ɮרåB����C�ҥH�����ťձN�|�۰������o�@�ӥ\��C', LEFT);" onMouseOut="return nd();">�۰ʰ���{��:
           </td><td class="content_input_td"><input type="text" maxlength="256" class="content_input_fd" size="32" name="usb_ftpscript_x" value="<% nvram_get_x("PrinterStatus","usb_ftpscript_x"); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="x_FUserList">�Τ�b���M��
         <input type="hidden" name="usb_ftpnum_x_0" value="<% nvram_get_x("PrinterStatus", "usb_ftpnum_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_FUserList', 32, ' Add ');" name="x_FUserList" value="�s�W" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_FUserList', 32, ' Del ');" name="x_FUserList" value="�R��" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">�Τ�W��	                
           	        </td><td class="content_list_field_header_td" colspan="">�K�X	                
           	        </td><td class="content_list_field_header_td" colspan="">�̤j�n�J��	                
           	        </td><td class="content_list_field_header_td" colspan="">�Τ��v�q	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="16" size="16" name="usb_ftpusername_x_0" class="content_input_list_fd" onKeyPress="return is_string(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="16" size="16" name="usb_ftppasswd_x_0" class="content_input_list_fd" onKeyPress="return is_string(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="5" style="font-family: fixedsys; font-size: 10pt;" size="5" name="usb_ftpmaxuser_x_0" onKeyPress="return is_number(this)"></td><td class="content_list_input_td" colspan=""><select name="usb_ftprights_x_0" class="content_input_list_fd"><option value="Read/Write/Erase" <% nvram_match_list_x("PrinterStatus","usb_ftprights_x", "Read/Write/Erase","selected", 0); %>>Read/Write/Erase</option><option value="Read/Write" <% nvram_match_list_x("PrinterStatus","usb_ftprights_x", "Read/Write","selected", 0); %>>Read/Write</option><option value="Read Only" <% nvram_match_list_x("PrinterStatus","usb_ftprights_x", "Read Only","selected", 0); %>>Read Only</option><option value="View Only" <% nvram_match_list_x("PrinterStatus","usb_ftprights_x", "View Only","selected", 0); %>>View Only</option><option value="Private" <% nvram_match_list_x("PrinterStatus","usb_ftprights_x", "Private","selected", 0); %>>Private</option><option value="Private(WO)" <% nvram_match_list_x("PrinterStatus","usb_ftprights_x", "Private(WO)","selected", 0); %>>Private(WO)</option></select></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="x_FUserList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("PrinterStatus","x_FUserList"); %>
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="x_FBanIPList">�T��IP�M��
         <input type="hidden" name="usb_bannum_x_0" value="<% nvram_get_x("PrinterStatus", "usb_bannum_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_FBanIPList', 16, ' Add ');" name="x_FBanIPList" value="�s�W" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_FBanIPList', 16, ' Del ');" name="x_FBanIPList" value="�R��" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">IP��}	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="24" name="usb_ftpbanip_x_0" onKeyPress="return is_iprange(this)" onKeyUp="change_iprange(this)"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="x_FBanIPList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("PrinterStatus","x_FBanIPList"); %>
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
    <td class="content_input_td_padding" align="left">�{�b�T�{�Ҧ��]�w�Ȩí��s�Ұ�WL530g�C</td>
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
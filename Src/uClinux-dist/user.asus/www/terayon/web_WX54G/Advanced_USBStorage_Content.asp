<head>
<title>WX54G Web Manager</title>
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
    	
<input type="hidden" name="current_page" value="Advanced_USBStorage_Content.asp"><input type="hidden" name="next_page" value="Advanced_WebCam_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="PrinterStatus;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">USB Application - FTP Server</td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Before removing your USB disk, please press this button to write cached data back to disk and wait for this page shown up again.', LEFT);" onMouseOut="return nd();">Force to Eject USB Disk:
           </td><td class="content_input_td"><input type="hidden" maxlength="15" class="content_input_fd_ro" size="12" name="" value="<% nvram_get_f("ddns.log","DDNSStatus"); %>"><input type="submit" maxlength="15" class="content_input_fd_ro" onClick="return onSubmitApply('eject-usb.sh')" size="12" name="PrinterStatus_x_FEject_button" value="Eject"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Selecting Yes builds up a FTP server with your USB disk.', LEFT);" onMouseOut="return nd();">Enable FTP Server?
           </td><td class="content_input_td"><input type="radio" value="1" name="usb_ftpenable_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpenable_x', '1')" <% nvram_match_x("PrinterStatus","usb_ftpenable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="usb_ftpenable_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpenable_x', '0')" <% nvram_match_x("PrinterStatus","usb_ftpenable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Selecting Yes allows user to connect to your FTP server without any password. The home directory of Anonymous account is the root directory of USB disk.', LEFT);" onMouseOut="return nd();">Allow Anonymous User to Login?
           </td><td class="content_input_td"><input type="radio" value="1" name="usb_ftpanonymous_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpanonymous_x', '1')" <% nvram_match_x("PrinterStatus","usb_ftpanonymous_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="usb_ftpanonymous_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpanonymous_x', '0')" <% nvram_match_x("PrinterStatus","usb_ftpanonymous_x", "0", "checked"); %>>No</input><a href="javascript:openLink('x_FIsAnonymous')" class="content_input_link" name="x_FIsAnonymous_link">Login
             </a></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('Selecting Yes allows user to connect to your FTP server with the same account used to log in Web Manager. The home directory of Superuser account is the root directory of USB disk.', LEFT);" onMouseOut="return nd();">Allow Super User to Login?
           </td><td class="content_input_td"><input type="radio" value="1" name="usb_ftpsuper_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpsuper_x', '1')" <% nvram_match_x("PrinterStatus","usb_ftpsuper_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="usb_ftpsuper_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'usb_ftpsuper_x', '0')" <% nvram_match_x("PrinterStatus","usb_ftpsuper_x", "0", "checked"); %>>No</input><a href="javascript:openLink('x_FIsSuperuser')" class="content_input_link" name="x_FIsSuperuser_link">Login
             </a></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field indicates the port number used by FTP protocol.', LEFT);" onMouseOut="return nd();">FTP Port:
           </td><td class="content_input_td"><input type="text" maxlength="5" class="content_input_fd" size="5" name="usb_ftpport_x" value="<% nvram_get_x("PrinterStatus","usb_ftpport_x"); %>" onBlur="validate_range(this, 0, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field indicates the maximum number of users allowed to log in FTP server at the same time.', LEFT);" onMouseOut="return nd();">Maximum Users Allowed to Log in:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="usb_ftpmax_x" class="content_input_fd" value="<% nvram_get_x("PrinterStatus", "usb_ftpmax_x"); %>" onBlur="validate_range(this, 1, 12)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field allows you to terminate user connection after users enter login name for a specified period of time.', LEFT);" onMouseOut="return nd();">Login Timeout in Seconds:
           </td><td class="content_input_td"><input type="text" maxlength="5" class="content_input_fd" size="5" name="usb_ftptimeout_x" value="<% nvram_get_x("PrinterStatus","usb_ftptimeout_x"); %>" onBlur="validate_range(this, 0, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('This field allows you to terminate user connection after users login but stay idle for a specified period of time.', LEFT);" onMouseOut="return nd();">Stay Timeout in Seconds:
           </td><td class="content_input_td"><input type="text" maxlength="5" class="content_input_fd" size="5" name="usb_ftpstaytimeout_x" value="<% nvram_get_x("PrinterStatus","usb_ftpstaytimeout_x"); %>" onBlur="validate_range(this, 0, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="x_FUserList">User Account List
         <input type="hidden" name="usb_ftpnum_x_0" value="<% nvram_get_x("PrinterStatus", "usb_ftpnum_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_FUserList', 32, ' Add ');" name="x_FUserList" value="Add" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_FUserList', 32, ' Del ');" name="x_FUserList" value="Delete" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">User Name	                
           	        </td><td class="content_list_field_header_td" colspan="">Password	                
           	        </td><td class="content_list_field_header_td" colspan="">Max. Login	                
           	        </td><td class="content_list_field_header_td" colspan="">Rights	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="16" size="16" name="usb_ftpusername_x_0" class="content_input_list_fd" onKeyPress="return is_string(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="16" size="16" name="usb_ftppasswd_x_0" class="content_input_list_fd" onKeyPress="return is_string(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="5" style="font-family: fixedsys; font-size: 10pt;" size="5" name="usb_ftpmaxuser_x_0" onKeyPress="return is_number(this)"></td><td class="content_list_input_td" colspan=""><select name="usb_ftprights_x_0" class="content_input_list_fd"><option value="Read/Write/Erase" <% nvram_match_list_x("PrinterStatus","usb_ftprights_x", "Read/Write/Erase","selected", 0); %>>Read/Write/Erase</option><option value="Read/Write" <% nvram_match_list_x("PrinterStatus","usb_ftprights_x", "Read/Write","selected", 0); %>>Read/Write</option><option value="Read Only" <% nvram_match_list_x("PrinterStatus","usb_ftprights_x", "Read Only","selected", 0); %>>Read Only</option><option value="View Only" <% nvram_match_list_x("PrinterStatus","usb_ftprights_x", "View Only","selected", 0); %>>View Only</option><option value="Private" <% nvram_match_list_x("PrinterStatus","usb_ftprights_x", "Private","selected", 0); %>>Private</option></select></td>
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
<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="x_FBanIPList">Banned IP List
         <input type="hidden" name="usb_bannum_x_0" value="<% nvram_get_x("PrinterStatus", "usb_bannum_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_FBanIPList', 16, ' Add ');" name="x_FBanIPList" value="Add" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_FBanIPList', 16, ' Del ');" name="x_FBanIPList" value="Delete" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">IP Address	                
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
<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="FFFFFF">
<tr bgcolor="#FFFFFF"><td colspan="3"><font face="arial" size="2"><b>&nbsp</b></font></td></tr>
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
<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="FFFFFF">
<tr>
    <td colspan="2" width="600" height="25" bgcolor="#FFFFFF"></td> 
</tr>                   
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">Restore: </td>
    <td class="content_input_td_padding" align="left">Clear the above settings and restore the settings in effect.</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">Finish: </td>
    <td class="content_input_td_padding" align="left">Confirm all settings and restart WX54G now.</td>
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

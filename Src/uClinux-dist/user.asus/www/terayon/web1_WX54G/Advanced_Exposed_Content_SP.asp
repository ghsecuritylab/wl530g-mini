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
    	
<input type="hidden" name="current_page" value="Advanced_Exposed_Content.asp"><input type="hidden" name="next_page" value="SaveRestart.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="IPConnection;PPPConnection;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">NAT Setting - Virtual DMZ</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">Virtual DMZ allows you to expose one computer to Internet, so that all the inbounds packets will be redirected to the computer you set. It is useful while you run some applications that use uncertained incoming ports. Please use it carefully.
         </td>
</tr>
<tr>
<td class="content_header_td">IP Address of Exposed Station:
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="dmz_ip" value="<% nvram_get_x("IPConnection","dmz_ip"); %>" onBlur="return validate_ipaddr(this, 'dmz_ip')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">Special Applications
            </td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">Some applications require special handler against NAT. Please fill parameters to enable it. These special handlers are disabled in default.
         </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('WX54G allows multiple players in the LAN to play Starcraft at the same time. Please enter the ip address and range, such as 192.168.1.100:4, to allows 4 players with ip address starting from 192.168.1.100 to play. Leave this field blank will disable the function.', LEFT);" onMouseOut="return nd();">Starcraft(Battle.Net)
           </td><td class="content_input_td"><input type="text" maxlength="21" class="content_input_fd" size="15" name="sp_battle_ips" value="<% nvram_get_x("IPConnection","sp_battle_ips"); %>" onBlur="return validate_ipaddrport(this, 'sp_battle_ips')" onKeyPress="return is_ipaddrport(this)" onKeyUp="change_ipaddrport(this)"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="E0E0E0"></table>
</td>
</tr>
<tr>
<td>
<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="E0E0E0"></table>
</td>
</tr>
<tr>
<td>
<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="E0E0E0"></table>
</td>
</tr>
<tr>
<td>
<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="E0E0E0"></table>
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

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
    	
<input type="hidden" name="current_page" value="Advanced_Exposed_Content.asp"><input type="hidden" name="next_page" value="SaveRestart.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="IPConnection;PPPConnection;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">NAT�]�w - �����D�x�ư�</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">�����D�x�ưϡ]Virtual DMZ�^���z�o�H�N�@���q�����}���S�b���ں����W�A�ϩҦ��W�Ǫ��ʥ]������V�z���w���q���C�o��z�b����@�ǨϥΫD�S�w���ǳq�T��]incoming port�^�����ε{���ɷ|�۷����ΡC���ԷV�ϥΡC
         </td>
</tr>
<tr>
<td class="content_header_td">���}���S��a�x��IP��}�G
           </td><td class="content_input_td"><input type="text" maxlength="15" class="content_input_fd" size="15" name="dmz_ip" value="<% nvram_get_x("IPConnection","dmz_ip"); %>" onBlur="return validate_ipaddr(this, 'dmz_ip')" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">�S�����ε{��
            </td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">�Y�����ε{���ݭn�S�����B�z�{���Ӭ�VIP���ɾ��C�ж�J�i�ҥθӺ����Ϊ������ѼơC
         </td>
</tr>
<tr>
<td class="content_header_td">Starcraft�]Battle.Net�^
           </td><td class="content_input_td"><input type="radio" value="1" name="sp_battle_ips" class="content_input_fd" onClick="return change_common_radio(this, 'IPConnection', 'sp_battle_ips', '1')" <% nvram_match_x("IPConnection","sp_battle_ips", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="sp_battle_ips" class="content_input_fd" onClick="return change_common_radio(this, 'IPConnection', 'sp_battle_ips', '0')" <% nvram_match_x("IPConnection","sp_battle_ips", "0", "checked"); %>>No</input></td>
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
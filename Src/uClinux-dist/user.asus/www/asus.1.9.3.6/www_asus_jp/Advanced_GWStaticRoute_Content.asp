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
    	
<input type="hidden" name="current_page" value="Advanced_GWStaticRoute_Content.asp"><input type="hidden" name="next_page" value="Advanced_DDNS_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="RouterConfig;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">IP�r�� - �X�^�e�B�b�N���[�g</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">���̋@�\�́A�o�H�w��K����ZVMODELVZ�ɒǉ����܂��B����́A�C���^�[�l�b�g�ɑ΂��ē����ڑ������L���邽�߂ɁAZVMODELVZ�̔w��ŕ����̃��[�^��ڑ�����ꍇ�A���ɗ����܂��B
         </td>
</tr>
<tr>
<td class="content_header_td">�o�H�w��\�ɓK�p���܂���?
           </td><td class="content_input_td"><input type="radio" value="1" name="sr_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', 'sr_enable_x', '1')" <% nvram_match_x("RouterConfig","sr_enable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="sr_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', 'sr_enable_x', '0')" <% nvram_match_x("RouterConfig","sr_enable_x", "0", "checked"); %>>No</input></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="GWStatic">�X�^�e�B�b�N���[�g���܂���
         <input type="hidden" name="sr_num_x_0" value="<% nvram_get_x("RouterConfig", "sr_num_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'GWStatic', 6, ' Add ');" name="GWStatic" value="�ǉ�" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'GWStatic', 6, ' Del ');" name="GWStatic" value="�폜" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="button" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return openHelp(this, 'GRouterHelp');" name="GWStatic" value="�w���v" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">�l�b�g���[�N/�z�X�gIP	                
           	        </td><td class="content_list_field_header_td" colspan="">�l�b�g�}�X�N	                
           	        </td><td class="content_list_field_header_td" colspan="">�Q�[�g�E�F�C	                
           	        </td><td class="content_list_field_header_td" colspan="">RouterConfig_GWStaticMT_itemname	                
           	        </td><td class="content_list_field_header_td" colspan="">RouterConfig_GWStaticIF_itemname	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="15" name="sr_ipaddr_x_0" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="15" name="sr_netmask_x_0" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="15" name="sr_gateway_x_0" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="3" name="sr_matric_x_0" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td><td class="content_list_input_td" colspan=""><select name="sr_if_x_0" class="content_input_list_fd"><option value="LAN" <% nvram_match_list_x("RouterConfig","sr_if_x", "LAN","selected", 0); %>>LAN</option><option value="WAN" <% nvram_match_list_x("RouterConfig","sr_if_x", "WAN","selected", 0); %>>WAN</option></select></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="6" name="GWStatic_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("RouterConfig","GWStatic"); %>
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

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
    	
<input type="hidden" name="current_page" value="Advanced_PortTrigger_Content.asp"><input type="hidden" name="next_page" value="Advanced_VirtualServer_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="IPConnection;PPPConnection;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">NAT�]�w - �q�T��Ĳ�o�{��</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">�u�q�T��Ĳ�o�{���v�\�����z�i�H�}�үS�w��TCP��UDP�q�T��ӻP�s��ZVMODELVZ���q���i��q�T�C���ǥѫ��wĲ�o�{���q�T��Τ��ǳq�T�𪺤覡�Y�i�������@�ާ@�C�@��������Ĳ�o�{���q�T��A�e�����w���ǳq�T�𸹪��W�ǫʥ]�K�|��V�z���q���C
         </td>
</tr>
<tr>
<td class="content_header_td">�ҥγq�T��Ĳ�o�{���H
           </td><td class="content_input_td"><input type="radio" value="1" name="autofw_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'IPConnection', 'autofw_enable_x', '1')" <% nvram_match_x("IPConnection","autofw_enable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="autofw_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'IPConnection', 'autofw_enable_x', '0')" <% nvram_match_x("IPConnection","autofw_enable_x", "0", "checked"); %>>No</input></td>
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="TriggerList">Ĳ�o�{���q�T��M��
         <input type="hidden" name="autofw_num_x_0" value="<% nvram_get_x("IPConnection", "autofw_num_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'TriggerList', 10, ' Add ');" name="TriggerList" value="�s�W" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'TriggerList', 10, ' Del ');" name="TriggerList" value="�R��" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="3">���W���ε{���G         
         </td><td class="content_list_field_header_td" colspan="2"><select name="TriggerKnownApps" class="content_input_fd" onChange="change_widzard(this, 'TriggerKnownApps');"><option value="User Defined">User Defined</option></select></td>
</tr>
<tr>
<td></td><td class="content_list_field_header_td" colspan="">Ĳ�o�{���q�T��	                
           	        </td><td class="content_list_field_header_td" colspan="">�q�T��w	                
           	        </td><td class="content_list_field_header_td" colspan="">���ǳq�T��	                
           	        </td><td class="content_list_field_header_td" colspan="">�q�T��w	                
           	        </td><td class="content_list_field_header_td" colspan="">����	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="11" class="content_input_list_fd" size="10" name="autofw_outport_x_0" value="" onKeyPress="return is_portrange(this)"></td><td class="content_list_input_td" colspan=""><select name="autofw_outproto_x_0" class="content_input_list_fd"><option value="TCP" <% nvram_match_list_x("IPConnection","autofw_outproto_x", "TCP","selected", 0); %>>TCP</option><option value="UDP" <% nvram_match_list_x("IPConnection","autofw_outproto_x", "UDP","selected", 0); %>>UDP</option></select></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="11" class="content_input_list_fd" size="10" name="autofw_inport_x_0" value="" onKeyPress="return is_portrange(this)"></td><td class="content_list_input_td" colspan=""><select name="autofw_inproto_x_0" class="content_input_list_fd"><option value="TCP" <% nvram_match_list_x("IPConnection","autofw_inproto_x", "TCP","selected", 0); %>>TCP</option><option value="UDP" <% nvram_match_list_x("IPConnection","autofw_inproto_x", "UDP","selected", 0); %>>UDP</option></select></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="18" size="18" name="autofw_desc_x_0" class="content_input_list_fd" onKeyPress="return is_string(this)"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="TriggerList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("IPConnection","TriggerList"); %>
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

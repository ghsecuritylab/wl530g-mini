<head>
<title>WL530G Web Manager</title>
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
    	
<input type="hidden" name="current_page" value="Advanced_MultiPPPoE_Content.asp"><input type="hidden" name="next_page" value="Advanced_DHCP_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="Layer3Forwarding;LANHostConfig;IPConnection;PPPConnection;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">IP ���ǱԷ��̼� - PPPoE ����</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">�� ����� �����ϰ��� �ϴ� ��ҿ� ���� �Ѱ� �̻��� PPPoE ������ ������ �� �ְ� �մϴ�.
         </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�⺻���� ���ῡ�� ������ �����Ͻʽÿ�. ���� 0�� WAN & LAN�������� ���� PPPoE ������ �ǹ��մϴ�.', LEFT);" onMouseOut="return nd();">�⺻���� PPPoE ����:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'PPPConnection', '')"><option class="content_input_fd" value="0" <% nvram_match_x("PPPConnection","", "0","selected"); %>>PPPoE Session 0</option><option class="content_input_fd" value="1" <% nvram_match_x("PPPConnection","", "1","selected"); %>>PPPoE Session 1</option><option class="content_input_fd" value="2" <% nvram_match_x("PPPConnection","", "2","selected"); %>>PPPoE Session 2</option></select></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">PPPoE ���� 1
            </td>
</tr>
<tr>
<td class="content_header_td">PPPoE ����1�� Ȱ��ȭ�ϰڽ��ϱ�?
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'PPPConnection', '', '1')" <% nvram_match_x("PPPConnection","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'PPPConnection', '', '0')" <% nvram_match_x("PPPConnection","", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� WAN ���������� PPPoE�� ������ ��츸 �̿� �����մϴ�.', LEFT);" onMouseOut="return nd();">����� �̸�:
           </td><td class="content_input_td"><input type="text" maxlength="64" class="content_input_fd" size="32" name="" value="<% nvram_get_x("PPPConnection",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� WAN ���������� PPPoE�� ������ ��츸 �̿� �����մϴ�.', LEFT);" onMouseOut="return nd();">��й�ȣ:
           </td><td class="content_input_td"><input type="password" maxlength="64" class="content_input_fd" size="32" name="" value="<% nvram_get_x("PPPConnection",""); %>" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� Ư���ð��� ����� �� ISP���� ������ ������ �� �ֵ��� ���ǱԷ��̼� �� �� �ֽ��ϴ�. ���� ���� ���ð��� �������� �մϴ�. Tx���� üũ�Ǿ� ������ ���ͳ����� ������ �����Ͱ� ���ð��� ����ϵ��� �ǳʶٱ� �մϴ�.', LEFT);" onMouseOut="return nd();">�ʴ��� ��� �������� �ð�(�ɼ�):
           </td><td class="content_input_td"><input type="text" maxlength="10" class="content_input_fd" size="10" name="" value="<% nvram_get_x("PPPConnection",""); %>" onBlur="validate_range(this, 0, 4294967295)" onKeyPress="return is_number(this)"><input type="checkbox" style="margin-left:30" name="_check" value="" onClick="return change_common_radio(this, 'PPPConnection', '', '1')">Tx Only</input></td>
</tr>
<input type="hidden" name="" value="<% nvram_get_x("PPPConnection",""); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('PPPoE ��Ŷ�� �ִ� ���۴���(MTU;Maximum Transmission Unit)�Դϴ�.', LEFT);" onMouseOut="return nd();">MTU:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="" class="content_input_fd" value="<% nvram_get_x("PPPConnection", ""); %>" onBlur="validate_range(this, 576, 1492)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('PPPoE ��Ŷ�� �ִ� ���Ŵ���(MRU;Maximum Receive Unit)�Դϴ�.', LEFT);" onMouseOut="return nd();">MRU:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="" class="content_input_fd" value="<% nvram_get_x("PPPConnection", ""); %>" onBlur="validate_range(this, 576, 1492)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �׸��� ISP�� ���� �� �ֽ��ϴ�. �ʿ�� ISP�� �����Ͽ� �ۼ��մϴ�.', LEFT);" onMouseOut="return nd();">���� �̸�(�ɼ�):
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("PPPConnection",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �׸��� ISP�� ���� �� �ֽ��ϴ�. �ʿ�� ISP�� �����Ͽ� �ۼ��մϴ�.', LEFT);" onMouseOut="return nd();">�׼��� ������ġ �̸�(�ɼ�):
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("PPPConnection",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">PPPoE ���� 2
            </td>
</tr>
<tr>
<td class="content_header_td">PPPoE ����2�� Ȱ��ȭ�ϰڽ��ϱ�?
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'PPPConnection', '', '1')" <% nvram_match_x("PPPConnection","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'PPPConnection', '', '0')" <% nvram_match_x("PPPConnection","", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� WAN ���������� PPPoE�� ������ ��츸 �̿� �����մϴ�.', LEFT);" onMouseOut="return nd();">����� �̸�:
           </td><td class="content_input_td"><input type="text" maxlength="64" class="content_input_fd" size="32" name="" value="<% nvram_get_x("PPPConnection",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� WAN ���������� PPPoE�� ������ ��츸 �̿� �����մϴ�.', LEFT);" onMouseOut="return nd();">��й�ȣ:
           </td><td class="content_input_td"><input type="password" maxlength="64" class="content_input_fd" size="32" name="" value="<% nvram_get_x("PPPConnection",""); %>" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �ʵ��׸��� Ư���ð��� ����� �� ISP���� ������ ������ �� �ֵ��� ���ǱԷ��̼� �� �� �ֽ��ϴ�. ���� ���� idle�ð��� �������� �մϴ�. Tx���� üũ�Ǿ� ������ ���ͳ����� ������ �����Ͱ� ��� �ð��� ����ϵ��� �ǳʶٱ� �մϴ�.', LEFT);" onMouseOut="return nd();">�ʴ��� ��� �������� �ð�(�ɼ�):
           </td><td class="content_input_td"><input type="text" maxlength="10" class="content_input_fd" size="10" name="" value="<% nvram_get_x("PPPConnection",""); %>" onBlur="validate_range(this, 0, 4294967295)" onKeyPress="return is_number(this)"><input type="checkbox" style="margin-left:30" name="_check" value="" onClick="return change_common_radio(this, 'PPPConnection', '', '1')">Tx Only</input></td>
</tr>
<input type="hidden" name="" value="<% nvram_get_x("PPPConnection",""); %>">
<tr>
<td class="content_header_td" onMouseOver="return overlib('PPPoE ��Ŷ�� �ִ� ���۴���(MTU;Maximum Transmission Unit)�Դϴ�.', LEFT);" onMouseOut="return nd();">MTU:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="" class="content_input_fd" value="<% nvram_get_x("PPPConnection", ""); %>" onBlur="validate_range(this, 576, 1492)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('PPPoE ��Ŷ�� �ִ� ���Ŵ���(MRU;Maximum Receive Unit)�Դϴ�.', LEFT);" onMouseOut="return nd();">MRU:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="" class="content_input_fd" value="<% nvram_get_x("PPPConnection", ""); %>" onBlur="validate_range(this, 576, 1492)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �׸��� ISP�� ���� �� �ֽ��ϴ�. �ʿ�� ISP�� �����Ͽ� �ۼ��մϴ�.', LEFT);" onMouseOut="return nd();">���� �̸�(�ɼ�):
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("PPPConnection",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�� �׸��� ISP�� ���� �� �ֽ��ϴ�. �ʿ�� ISP�� �����Ͽ� �ۼ��մϴ�.', LEFT);" onMouseOut="return nd();">�׼��� ������ġ �̸�(�ɼ�):
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("PPPConnection",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="PPPoERouteList">PPPoE ����� ���
         <input type="hidden" name="PPPoERouteCount_0" value="<% nvram_get_x("PPPConnection", "PPPoERouteCount"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'PPPoERouteList', 4, ' Add ');" name="PPPoERouteList" value="�߰�" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'PPPoERouteList', 4, ' Del ');" name="PPPoERouteList" value="����" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">����	                
           	        </td><td class="content_list_field_header_td" colspan="">IP ����	                
           	        </td><td class="content_list_field_header_td" colspan="">��Ʈ��ũ/ȣ��Ʈ IP	                
           	        </td><td class="content_list_field_header_td" colspan="">��Ʈ��ũ ��Ʈ	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><select name="_0" class="content_input_list_fd"><option value="0" <% nvram_match_list_x("PPPConnection","", "0","selected", 0); %>>0</option><option value="1" <% nvram_match_list_x("PPPConnection","", "1","selected", 0); %>>1</option><option value="2" <% nvram_match_list_x("PPPConnection","", "2","selected", 0); %>>2</option></select></td><td class="content_list_input_td" colspan=""><select name="_0" class="content_input_list_fd"><option value="Source" <% nvram_match_list_x("PPPConnection","", "Source","selected", 0); %>>Source</option><option value="Destination" <% nvram_match_list_x("PPPConnection","", "Destination","selected", 0); %>>Destination</option></select></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="14" name="_0" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="5" style="font-family: fixedsys; font-size: 10pt;" size="8" name="_0" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="4" name="PPPoERouteList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("PPPConnection","PPPoERouteList"); %>
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
    <td class="content_input_td_padding" align="left">��� ������ Ȯ���ϰ� WL530G�� ���� �ٽ� �����մϴ�.</td>
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

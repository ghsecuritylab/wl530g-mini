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
    	
<input type="hidden" name="current_page" value="Advanced_QOS_Content.asp"><input type="hidden" name="next_page" value="SaveRestart.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="PrinterStatus;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">IP ���ǱԷ��̼� - �⺻ ���ǱԷ��̼�</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">QoS�� �ٸ� ���ø����̼��� ���� �뿪���� ������ �� �ֵ��� �մϴ�. QoS ��å ��Ͼ��� ��Ģ���� WAN���� LAN �������� �۵��մϴ�.
         </td>
</tr>
<tr>
<td class="content_header_td">QoS�� Ȱ��ȭ�Ͻðڽ��ϱ�?
           </td><td class="content_input_td"><input type="radio" value="1" name="qos_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'qos_enable_x', '1')" <% nvram_match_x("PrinterStatus","qos_enable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="qos_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'PrinterStatus', 'qos_enable_x', '0')" <% nvram_match_x("PrinterStatus","qos_enable_x", "0", "checked"); %>>No</input></td>
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="x_QRuleList">�ٿ�ε� ��å ���
         <input type="hidden" name="qos_rulenum_x_0" value="<% nvram_get_x("PrinterStatus", "qos_rulenum_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_QRuleList', 8, ' Add ');" name="x_QRuleList" value="�߰�" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_QRuleList', 8, ' Del ');" name="x_QRuleList" value="����" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">IP �ּ�	                
           	        </td><td class="content_list_field_header_td" colspan="">��Ʈ ����	                
           	        </td><td class="content_list_field_header_td" colspan="">�ִ�	                
           	        </td><td class="content_list_field_header_td" colspan="">�ּ�	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="14" name="qos_ipaddr_x_0" onKeyPress="return is_iprange(this)" onKeyUp="change_iprange(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="10" size="10" class="content_input_list_fd" name="qos_port_x_0" onKeyPress="return is_number(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="10" size="7" class="content_input_list_fd" name="qos_maxbw_x_0" onKeyPress="return is_number(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="10" size="7" class="content_input_list_fd" name="qos_minbw_x_0" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="x_QRuleList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("PrinterStatus","x_QRuleList"); %>
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
<td class="content_list_header_td" width="60%" id="x_UQRuleList">���ε� ��å ���
         <input type="hidden" name="qos_urulenum_x_0" value="<% nvram_get_x("PrinterStatus", "qos_urulenum_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_UQRuleList', 8, ' Add ');" name="x_UQRuleList" value="�߰�" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'x_UQRuleList', 8, ' Del ');" name="x_UQRuleList" value="����" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">��Ʈ ����	                
           	        </td><td class="content_list_field_header_td" colspan="">�ִ�	                
           	        </td><td class="content_list_field_header_td" colspan="">�ּ�	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="10" size="10" class="content_input_list_fd" name="qos_uport_x_0" onKeyPress="return is_number(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="10" size="7" class="content_input_list_fd" name="qos_umaxbw_x_0" onKeyPress="return is_number(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="10" size="7" class="content_input_list_fd" name="qos_uminbw_x_0" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="x_UQRuleList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("PrinterStatus","x_UQRuleList"); %>
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

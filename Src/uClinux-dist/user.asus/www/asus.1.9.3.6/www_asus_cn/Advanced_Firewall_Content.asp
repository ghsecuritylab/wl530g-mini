<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
    	
<input type="hidden" name="current_page" value="Advanced_Firewall_Content.asp"><input type="hidden" name="next_page" value="Advanced_URLFilter_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="FirewallConfig;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">����������ǽ - LAN��WAN������</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">�� LAN �� WAN �Ĺ���������������LAN��WAN֮���ָ����������ȣ����ɶ���������򿪵����ڼ�ʱ�䡣���ţ�����ѡ������������ַ��������õ�Ĭ�϶����������ʺ��κ�����״���Ĺ���
         <div align="center">
<img name="InternetFirewall_img" src="graph/internet_some.gif"></div>
</td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">��LAN��WAN�Ĺ�����
            </td>
</tr>
<tr>
<td class="content_header_td">���ô�LAN��WAN�Ĺ�������
           </td><td class="content_input_td"><input type="radio" value="1" name="fw_lw_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_lw_enable_x', '1')" <% nvram_match_x("FirewallConfig","fw_lw_enable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="fw_lw_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_lw_enable_x', '0')" <% nvram_match_x("FirewallConfig","fw_lw_enable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����Ŀ�ɶ����LAN to WAN�������򿪵����ڡ�', LEFT);" onMouseOut="return nd();">��LAN ��WAN�Ĺ������򿪵����ڣ�
           </td><td class="content_input_td"><input type="hidden" maxlength="7" class="content_input_fd" size="7" name="filter_lw_date_x" value="<% nvram_get_x("FirewallConfig","filter_lw_date_x"); %>">
<p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">
<input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Sun">Sun</input><input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Mon">Mon</input><input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Tue">Tue</input><input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Wed">Wed</input>
</p>
<input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Thu">Thu</input><input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Fri">Fri</input><input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Sat">Sat</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����Ŀ�ɶ����LAN to WAN�������򿪵�ʱ������', LEFT);" onMouseOut="return nd();">��LAN ��WAN�Ĺ������򿪵�ʱ�䣺
           </td><td class="content_input_td"><input type="hidden" maxlength="11" class="content_input_fd" size="11" name="filter_lw_time_x" value="<% nvram_get_x("FirewallConfig","filter_lw_time_x"); %>"><input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_lw_time_x_starthour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 0)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_lw_time_x_startmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 1)">-
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_lw_time_x_endhour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 2)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_lw_time_x_endmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 3)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����Ŀ�ɶ�����Щ�ڴ�LAN��WAN�ķ���У���δָ���ڴ�LAN��WAN���������еļ��������ܻ��Ƕ����ķ����', LEFT);" onMouseOut="return nd();">δָ���ģ���LAN��WAN�����Ϊ��
           </td><td class="content_input_td"><select name="filter_lw_default_x" class="content_input_fd" onChange="return change_common(this, 'FirewallConfig', 'filter_lw_default_x')"><option class="content_input_fd" value="DROP" <% nvram_match_x("FirewallConfig","filter_lw_default_x", "DROP","selected"); %>>DROP</option><option class="content_input_fd" value="ACCEPT" <% nvram_match_x("FirewallConfig","filter_lw_default_x", "ACCEPT","selected"); %>>ACCEPT</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����Ŀ�ɶ���һ����LAN �� WAN ICMP������ͽ�����˵��б����磬�����������Echo������8����Echo Reply������0����ICMP�����������������һ�麬�����ֵ��Կո�������ִ�������0 5��', LEFT);" onMouseOut="return nd();">���˺��ICMP����LAN�� WAN��������ͣ�
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="filter_lw_icmp_x" value="<% nvram_get_x("FirewallConfig","filter_lw_icmp_x"); %>" onBlur="return validate_portlist(this, 'filter_lw_icmp_x')" onKeyPress="return is_portlist(this)"></td>
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="LWFilterList">��LAN��WAN��������
         <input type="hidden" name="filter_lw_num_x_0" value="<% nvram_get_x("FirewallConfig", "filter_lw_num_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'LWFilterList', 32, ' Add ');" name="LWFilterList" value="����" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'LWFilterList', 32, ' Del ');" name="LWFilterList" value="ɾ��" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="button" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return openHelp(this, 'FilterHelp');" name="LWFilterList" value="˵��" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="2">֪��Ӧ�ó���         
         </td><td class="content_list_field_header_td" colspan="3"><select name="LWKnownApps" class="content_input_fd" onChange="change_widzard(this, 'LWKnownApps');"><option value="User Defined">User Defined</option></select></td>
</tr>
<tr>
<td></td><td class="content_list_field_header_td" colspan="">ԴIP	                
           	        </td><td class="content_list_field_header_td" colspan="">�˿ڷ�Χ	                
           	        </td><td class="content_list_field_header_td" colspan="">Ŀ��IP	                
           	        </td><td class="content_list_field_header_td" colspan="">�˿ڷ�Χ	                
           	        </td><td class="content_list_field_header_td" colspan="">Э��	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="14" name="filter_lw_srcip_x_0" onKeyPress="return is_iprange(this)" onKeyUp="change_iprange(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="11" class="content_input_list_fd" size="10" name="filter_lw_srcport_x_0" value="" onKeyPress="return is_portrange(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="14" name="filter_lw_dstip_x_0" onKeyPress="return is_iprange(this)" onKeyUp="change_iprange(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="11" class="content_input_list_fd" size="10" name="filter_lw_dstport_x_0" value="" onKeyPress="return is_portrange(this)"></td><td class="content_list_input_td" colspan=""><select name="filter_lw_proto_x_0" class="content_input_list_fd"><option value="TCP" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP","selected", 0); %>>TCP</option><option value="TCP ALL" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP ALL","selected", 0); %>>TCP ALL</option><option value="TCP SYN" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP SYN","selected", 0); %>>TCP SYN</option><option value="TCP ACK" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP ACK","selected", 0); %>>TCP ACK</option><option value="TCP FTN" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP FTN","selected", 0); %>>TCP FTN</option><option value="TCP RST" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP RST","selected", 0); %>>TCP RST</option><option value="TCP URG" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP URG","selected", 0); %>>TCP URG</option><option value="TCP PSH" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP PSH","selected", 0); %>>TCP PSH</option><option value="UDP" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "UDP","selected", 0); %>>UDP</option></select></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="LWFilterList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("FirewallConfig","LWFilterList"); %>
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
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">��WAN��LAN�Ĺ�����
            </td>
</tr>
<tr>
<td class="content_header_td">���ô�WAN��LAN�Ĺ�������
           </td><td class="content_input_td"><input type="radio" value="1" name="fw_wl_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_wl_enable_x', '1')" <% nvram_match_x("FirewallConfig","fw_wl_enable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="fw_wl_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_wl_enable_x', '0')" <% nvram_match_x("FirewallConfig","fw_wl_enable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����Ŀ�ɶ����LAN��WAN�������򿪵����ڡ�', LEFT);" onMouseOut="return nd();">��LAN��WAN�������򿪵����ڣ�
           </td><td class="content_input_td"><input type="hidden" maxlength="7" class="content_input_fd" size="7" name="filter_wl_date_x" value="<% nvram_get_x("FirewallConfig","filter_wl_date_x"); %>">
<p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">
<input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Sun">Sun</input><input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Mon">Mon</input><input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Tue">Tue</input><input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Wed">Wed</input>
</p>
<input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Thu">Thu</input><input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Fri">Fri</input><input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Sat">Sat</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����Ŀ�ɶ����LAN��WAN�������򿪵�ʱ������', LEFT);" onMouseOut="return nd();">��LAN��WAN�������򿪵�ʱ�䣺
           </td><td class="content_input_td"><input type="hidden" maxlength="11" class="content_input_fd" size="11" name="filter_wl_time_x" value="<% nvram_get_x("FirewallConfig","filter_wl_time_x"); %>"><input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_wl_time_x_starthour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 0)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_wl_time_x_startmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 1)">-
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_wl_time_x_endhour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 2)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_wl_time_x_endmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 3)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����Ŀ�ɶ�����Щ�ڴ�WAN��LAN�ķ���У���δָ���ڴ�WAN��LAN���������еļ��������ܻ��Ƕ����ķ����', LEFT);" onMouseOut="return nd();">δָ���ģ���WAN��LAN�����Ϊ��
           </td><td class="content_input_td"><select name="filter_wl_default_x" class="content_input_fd" onChange="return change_common(this, 'FirewallConfig', 'filter_wl_default_x')"><option class="content_input_fd" value="DROP" <% nvram_match_x("FirewallConfig","filter_wl_default_x", "DROP","selected"); %>>DROP</option><option class="content_input_fd" value="ACCEPT" <% nvram_match_x("FirewallConfig","filter_wl_default_x", "ACCEPT","selected"); %>>ACCEPT</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('����Ŀ�ɶ���һ����WAN to LAN ICMP������ͽ�����˵��б����磬�����������Echo������8����Echo Reply������0����ICMP�����������������һ�麬�����ֵ��Կո�������ִ�������0 5��', LEFT);" onMouseOut="return nd();">���˺��ICMP��WAN to LAN��������ͣ�
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="filter_wl_icmp_x" value="<% nvram_get_x("FirewallConfig","filter_wl_icmp_x"); %>" onBlur="return validate_portlist(this, 'filter_wl_icmp_x')" onKeyPress="return is_portlist(this)"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="WLFilterList">��WAN��LAN��������
         <input type="hidden" name="filter_wl_num_x_0" value="<% nvram_get_x("FirewallConfig", "filter_wl_num_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'WLFilterList', 32, ' Add ');" name="WLFilterList" value="����" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'WLFilterList', 32, ' Del ');" name="WLFilterList" value="ɾ��" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="button" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return openHelp(this, 'FilterHelp');" name="WLFilterList" value="˵��" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="2">֪��Ӧ�ó���         
         </td><td class="content_list_field_header_td" colspan="3"><select name="WLKnownApps" class="content_input_fd" onChange="change_widzard(this, 'WLKnownApps');"><option value="User Defined">User Defined</option></select></td>
</tr>
<tr>
<td></td><td class="content_list_field_header_td" colspan="">ԴIP	                
           	        </td><td class="content_list_field_header_td" colspan="">�˿ڷ�Χ	                
           	        </td><td class="content_list_field_header_td" colspan="">Ŀ��IP	                
           	        </td><td class="content_list_field_header_td" colspan="">�˿ڷ�Χ	                
           	        </td><td class="content_list_field_header_td" colspan="">Э��	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="14" name="filter_wl_srcip_x_0" onKeyPress="return is_iprange(this)" onKeyUp="change_iprange(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="11" class="content_input_list_fd" size="10" name="filter_wl_srcport_x_0" value="" onKeyPress="return is_portrange(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="14" name="filter_wl_dstip_x_0" onKeyPress="return is_iprange(this)" onKeyUp="change_iprange(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="11" class="content_input_list_fd" size="10" name="filter_wl_dstport_x_0" value="" onKeyPress="return is_portrange(this)"></td><td class="content_list_input_td" colspan=""><select name="filter_wl_proto_x_0" class="content_input_list_fd"><option value="TCP" <% nvram_match_list_x("FirewallConfig","filter_wl_proto_x", "TCP","selected", 0); %>>TCP</option><option value="TCP ALL" <% nvram_match_list_x("FirewallConfig","filter_wl_proto_x", "TCP ALL","selected", 0); %>>TCP ALL</option><option value="TCP SYN" <% nvram_match_list_x("FirewallConfig","filter_wl_proto_x", "TCP SYN","selected", 0); %>>TCP SYN</option><option value="TCP ACK" <% nvram_match_list_x("FirewallConfig","filter_wl_proto_x", "TCP ACK","selected", 0); %>>TCP ACK</option><option value="TCP FTN" <% nvram_match_list_x("FirewallConfig","filter_wl_proto_x", "TCP FTN","selected", 0); %>>TCP FTN</option><option value="TCP RST" <% nvram_match_list_x("FirewallConfig","filter_wl_proto_x", "TCP RST","selected", 0); %>>TCP RST</option><option value="TCP URG" <% nvram_match_list_x("FirewallConfig","filter_wl_proto_x", "TCP URG","selected", 0); %>>TCP URG</option><option value="TCP PSH" <% nvram_match_list_x("FirewallConfig","filter_wl_proto_x", "TCP PSH","selected", 0); %>>TCP PSH</option><option value="UDP" <% nvram_match_list_x("FirewallConfig","filter_wl_proto_x", "UDP","selected", 0); %>>UDP</option></select></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="WLFilterList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("FirewallConfig","WLFilterList"); %>
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
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Restore ')" type="submit" value=" ��ԭ " name="action"></font></div> 
   </td>  
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Finish ')" type="submit" value=" ���� " name="action"></font></div> 
   </td>
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Apply ')" type="submit" value=" Ӧ�� " name="action"></font></div> 
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
    <td class="content_header_td_15" align="left">��ԭ: </td>
    <td class="content_input_td_padding" align="left">����������ò���ԭ��Ч���á�</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">����: </td>
    <td class="content_input_td_padding" align="left">����ȷ���������ò���������ZVMODELVZ��</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">Ӧ��: </td>
    <td class="content_input_td_padding" align="left">ȷ���������ò�������</td>
</tr>
</table>
</td>
</tr>

</table>
</form>
</body>

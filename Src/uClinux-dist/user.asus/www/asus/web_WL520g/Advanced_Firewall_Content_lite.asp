<head>
<title>WL520g Web Manager</title>
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
    	
<input type="hidden" name="current_page" value="Advanced_Firewall_Content.asp"><input type="hidden" name="next_page" value="Advanced_URLFilter_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="FirewallConfig;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">인터넷 방화벽 - WAN & LAN 필터</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">LAN>WAN 필터는LAN 과 WAN간의 패킷을 블로킹할 수 있도록 합니다. 우선 필터 활성화의 날짜와 시간을 정할 수 있습니다. 그리고 난 후 양방향 필터의 기본설정 액션을 선택하여 예외에 해당하는 규칙을 삽입할 수 있습니다.
         </td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">LAN > WAN 필터
            </td>
</tr>
<tr>
<td class="content_header_td">LAN >WAN필터를 활성화하겠습니까?
           </td><td class="content_input_td"><input type="radio" value="1" name="fw_lw_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_lw_enable_x', '1')" <% nvram_match_x("FirewallConfig","fw_lw_enable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="fw_lw_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_lw_enable_x', '0')" <% nvram_match_x("FirewallConfig","fw_lw_enable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('본 필드항목에서는 LAN>WAN 필터를 활성화하는 날짜를 정합니다.', LEFT);" onMouseOut="return nd();">LAN>WAN 필터 활성화 날짜:
           </td><td class="content_input_td"><input type="hidden" maxlength="7" class="content_input_fd" size="7" name="filter_lw_date_x" value="<% nvram_get_x("FirewallConfig","filter_lw_date_x"); %>">
<p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">
<input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Sun">Sun</input><input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Mon">Mon</input><input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Tue">Tue</input><input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Wed">Wed</input>
</p>
<input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Thu">Thu</input><input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Fri">Fri</input><input type="checkbox" class="content_input_fd" name="filter_lw_date_x_Sat">Sat</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('본 필드항목에서는 LAN>WAN 필터를 활성화하는 시간간격을 정합니다.', LEFT);" onMouseOut="return nd();">LAN>WAN 필터 활성화 시간:
           </td><td class="content_input_td"><input type="hidden" maxlength="11" class="content_input_fd" size="11" name="filter_lw_time_x" value="<% nvram_get_x("FirewallConfig","filter_lw_time_x"); %>"><input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_lw_time_x_starthour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 0)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_lw_time_x_startmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 1)">-
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_lw_time_x_endhour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 2)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_lw_time_x_endmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 3)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('본 필드항목에서는 LAN>WAN필터 테이블에서 정하여지지 않은 LAN>WAN패킷의 드롭여부를 정의합니다.', LEFT);" onMouseOut="return nd();">정하여 지지 않은 패킷(LAN>WAN):
           </td><td class="content_input_td"><select name="filter_lw_default_x" class="content_input_fd" onChange="return change_common(this, 'FirewallConfig', 'filter_lw_default_x')"><option class="content_input_fd" value="DROP" <% nvram_match_x("FirewallConfig","filter_lw_default_x", "DROP","selected"); %>>DROP</option><option class="content_input_fd" value="ACCEPT" <% nvram_match_x("FirewallConfig","filter_lw_default_x", "ACCEPT","selected"); %>>ACCEPT</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('본 필드항목에서는 필터링될 LAN>WAN ICMP 패킷의 목록을 정의합니다. 예를 들면 에코(유형 8)와 에코 응답(유형 0)  ICMP 패킷을 필터링하려면 0 5와 같이 띄어쓰기한 숫자의 문자열을 입력해야 합니다.', LEFT);" onMouseOut="return nd();">필터링된 ICMP(LAN>WAN) 패킷유형:
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
<td class="content_list_header_td" width="60%" id="LWFilterList">LAN > WAN 필터 테이블
         <input type="hidden" name="filter_lw_num_x_0" value="<% nvram_get_x("FirewallConfig", "filter_lw_num_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'LWFilterList', 32, ' Add ');" name="LWFilterList" value="추가" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'LWFilterList', 32, ' Del ');" name="LWFilterList" value="삭제" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="button" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return openHelp(this, 'FilterHelp');" name="LWFilterList" value="도움말" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="2">알려진 어플리케이션:         
         </td><td class="content_list_field_header_td" colspan="3"><select name="LWKnownApps" class="content_input_fd" onChange="change_widzard(this, 'LWKnownApps');"><option value="User Defined">User Defined</option></select></td>
</tr>
<tr>
<td></td><td class="content_list_field_header_td" colspan="">출발지 IP	                
           	        </td><td class="content_list_field_header_td" colspan="">포트영역	                
           	        </td><td class="content_list_field_header_td" colspan="">목적지IP	                
           	        </td><td class="content_list_field_header_td" colspan="">포트영역	                
           	        </td><td class="content_list_field_header_td" colspan="">프로토콜	                
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
<td class="content_section_header_td" colspan="2">WAN > LAN 필터
            </td>
</tr>
<tr>
<td class="content_header_td">Enable WAN > LAN 필터를 활성화하겠습니까?
           </td><td class="content_input_td"><input type="radio" value="1" name="fw_wl_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_wl_enable_x', '1')" <% nvram_match_x("FirewallConfig","fw_wl_enable_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="fw_wl_enable_x" class="content_input_fd" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_wl_enable_x', '0')" <% nvram_match_x("FirewallConfig","fw_wl_enable_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('본 필드항목에서는 WAN>LAN 필터를 활성화하는 날짜를 정합니다.', LEFT);" onMouseOut="return nd();">WAN>LAN 필터 활성화 날짜:
           </td><td class="content_input_td"><input type="hidden" maxlength="7" class="content_input_fd" size="7" name="filter_wl_date_x" value="<% nvram_get_x("FirewallConfig","filter_wl_date_x"); %>">
<p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">
<input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Sun">Sun</input><input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Mon">Mon</input><input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Tue">Tue</input><input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Wed">Wed</input>
</p>
<input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Thu">Thu</input><input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Fri">Fri</input><input type="checkbox" class="content_input_fd" name="filter_wl_date_x_Sat">Sat</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('본 필드항목에서는 WAN>LAN 필터를 활성화하는 시간간격을 정합니다.', LEFT);" onMouseOut="return nd();">WAN>LAN 필터 활성화 시간:
           </td><td class="content_input_td"><input type="hidden" maxlength="11" class="content_input_fd" size="11" name="filter_wl_time_x" value="<% nvram_get_x("FirewallConfig","filter_wl_time_x"); %>"><input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_wl_time_x_starthour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 0)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_wl_time_x_startmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 1)">-
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_wl_time_x_endhour" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 2)">:
                <input type="text" maxlength="2" class="content_input_fd" size="2" name="filter_wl_time_x_endmin" onKeyPress="return is_number(this)" onBlur="return validate_timerange(this, 3)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('본 필드항목에서는 WAN>LAN 필터 테이블에서 정하여지지 않은 WAN>LAN 패킷의 드롭여부를 정의합니다.', LEFT);" onMouseOut="return nd();">정하여 지지 않은 패킷(WAN>LAN):
           </td><td class="content_input_td"><select name="filter_wl_default_x" class="content_input_fd" onChange="return change_common(this, 'FirewallConfig', 'filter_wl_default_x')"><option class="content_input_fd" value="DROP" <% nvram_match_x("FirewallConfig","filter_wl_default_x", "DROP","selected"); %>>DROP</option><option class="content_input_fd" value="ACCEPT" <% nvram_match_x("FirewallConfig","filter_wl_default_x", "ACCEPT","selected"); %>>ACCEPT</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('본 필드항목에서는 필터링될 WAN>LAN ICMP 패킷의 목록을 정의합니다. 예를 들면 에코(유형 8)와 에코 응답(유형 0)  ICMP 패킷을 필터링하려면 0 5와 같이 띄어쓰기한 숫자의 문자열을 입력해야 합니다.', LEFT);" onMouseOut="return nd();">필터링된 ICMP(WAN>LAN) 패킷유형:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="filter_wl_icmp_x" value="<% nvram_get_x("FirewallConfig","filter_wl_icmp_x"); %>" onBlur="return validate_portlist(this, 'filter_wl_icmp_x')" onKeyPress="return is_portlist(this)"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="WLFilterList">WAN > LAN 필터 테이블
         <input type="hidden" name="filter_wl_num_x_0" value="<% nvram_get_x("FirewallConfig", "filter_wl_num_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'WLFilterList', 32, ' Add ');" name="WLFilterList" value="추가" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'WLFilterList', 32, ' Del ');" name="WLFilterList" value="삭제" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="button" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return openHelp(this, 'FilterHelp');" name="WLFilterList" value="도움말" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="2">알려진 어플리케이션:         
         </td><td class="content_list_field_header_td" colspan="3"><select name="WLKnownApps" class="content_input_fd" onChange="change_widzard(this, 'WLKnownApps');"><option value="User Defined">User Defined</option></select></td>
</tr>
<tr>
<td></td><td class="content_list_field_header_td" colspan="">출발지 IP	                
           	        </td><td class="content_list_field_header_td" colspan="">포트영역	                
           	        </td><td class="content_list_field_header_td" colspan="">목적지IP	                
           	        </td><td class="content_list_field_header_td" colspan="">포트영역	                
           	        </td><td class="content_list_field_header_td" colspan="">프로토콜	                
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
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Restore ')" type="submit" value=" 복구 " name="action"></font></div> 
   </td>  
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Finish ')" type="submit" value=" 마침 " name="action"></font></div> 
   </td>
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Apply ')" type="submit" value=" 적용 " name="action"></font></div> 
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
    <td class="content_header_td_15" align="left">복구: </td>
    <td class="content_input_td_padding" align="left">상기 설정을 취소하고 설정복구를 유효화합니다.</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">마침: </td>
    <td class="content_input_td_padding" align="left">모든 설정을 확인하고 WL520g를 지금 다시 시작합니다.</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">적용: </td>
    <td class="content_input_td_padding" align="left">상기설정을 확인하고 계속합니다.</td>
</tr>
</table>
</td>
</tr>

</table>
</form>
</body>

<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="style.css" media="screen">
<script language="JavaScript" type="text/javascript" src="overlib.js"></script>
<script language="JavaScript" type="text/javascript" src="general.js"></script>
<script language="JavaScript" type="text/javascript" src="quick.js"></script>
</head>
<body bgcolor="#FFFFFF" onLoad="loadMode()">
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
<form method="GET" name="form" action="apply.cgi">
<!-- Table for the conntent page -->
<table width="660" border="0" cellpadding="0" cellspacing="0">
<input type="hidden" name="current_page" value="Advanced_OperationMode_Content.asp">
<input type="hidden" name="next_page" value="Basic_SaveRestart.asp">
<input type="hidden" name="next_host" value="">
<input type="hidden" name="action_mode" value="">
<input type="hidden" name="sid_list" value="Layer3Forwarding;IPConnection;">
<input type="hidden" name="wan_proto" value="<% nvram_get_x("Layer3Forwarding","wan_proto"); %>">
<input type="hidden" name="wan_route_x" value="<% nvram_get_x("IPConnection","wan_route_x"); %>">
<input type="hidden" name="wan_nat_x" value="<% nvram_get_x("IPConnection","wan_nat_x"); %>">

<tr>
<td>
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">�t�γ]�w - �ާ@�Ҧ�</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">
ZVMODELVZ�䴩�G�إi�������P�ݨD���ާ@�Ҧ��C�п�ܯ�ŦX�z�{�p���Ҧ��C
</td>
</tr>

<tr>
<td class="content_header_td_30"><input type="radio" name="x_Mode" value="V3"> �L�u����������</td>
<td class="content_desc_td">
�b�u�L�u�����������v�Ҧ����A�A�Ӻ����q�T��εL�u�q�T�˸m���˳]�b�P�@�ϰ����]LAN�^�����C�b�o�ؤ��䴩�PWAN�������\��C
<p></p>
�q�M�~�N�y�����׸����A�L�u�����������Ҧ��O - ��������}�ഫ�]NAT�^�A���\�NZVMODELVZ���@�հϰ�����q�T��εL�u�q�T������b�@�_�C
</td>
</tr>
<tr>
<td class="content_header_td_30"><input type="radio" name="x_Mode"> �a�ιh�D��</td>
<td class="content_desc_td">
�b���ؼҦ����A�ڭ̫�ĳ�z�ȥi�ϥ�ZVMODELVZ���A�Ӻ����q�T��z�LADSL��Cable Modem�ӳs�����ں����C�P�ɡA�b�z�����Ҥ��\�h�H���i���ɦP�@IP�Өϥ�ISP�C
<p></p>
�q�M�~�N�y�����׸����A�h�D���Ҧ��O - �ҥκ�����}�ഫ�]NAT�^�A���\�ϥ�PPPoE�BDHCP client���R�AIP�Ӷi����ں����]WAN�^�s�u�@�~�C�t�~�A�]�䴩�@�ǹ�a�x�Τ�۷��Ϊ��\��A���O�q���H���Y�Ρ]UPnP�^�ΰʺADNS�]DDNS�^�C
</td>
</tr>
<tr>
<td class="content_input_td_less" colspan="2" height="60">
  <p align="right">
  <input class="inputSubmit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" type="submit" value="�M��" name="action" onClick="saveMode(this)">&nbsp;
  </p>
</td>
</tr></table>
</td>
</tr>
</table>
</form>
</body>
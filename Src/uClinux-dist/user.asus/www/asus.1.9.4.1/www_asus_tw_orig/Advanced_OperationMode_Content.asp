<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
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
<td class="content_header_td_title" colspan="2">�ý��� ���� - �۵����</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">
ZVMODELVZ�� �׷� ���������� �䱸������ ������Ű�� ���Ͽ� 3������ �۵���带 �����մϴ�. ��Ȳ�� �´� ��带 �����Ͻʽÿ�.
</td>
</tr>
<tr>
<td class="content_header_td_30"><input type="radio" name="x_Mode"> Ȩ ����Ʈ����</td>
<td class="content_desc_td">
�� ��忡���� ADSL �Ǵ� ���̺� ���� ���� ���ͳ� ������ ���Ͽ� ����ڰ� ZVMODELVZ�� ����ϰ� �ְ� ISP�� ������ IP ȯ���� ������ ������� ���� �ִ� ������ �����մϴ�.
<p></p>
�������� ���� �����ϸ� ����Ʈ���� ���� NAT�� Ȱ��ȭ �ǰ� PPPoE�� DHCP Ŭ���̾�Ʈ �Ǵ� ����IP�� ����Ͽ� WAN ������ �˴ϴ�. �׸��� UPnP�� DDNS�� ���� Ȩ ����ڵ鿡�� ������ �� ������ Ư¡���� �����˴ϴ�.
</td>
</tr>
<tr>
<td class="content_header_td_30"><input type="radio" name="x_Mode" value=""> �����</td>
<td class="content_desc_td">
����� ��忡���� ȸ����� LAN ������ ���Ͽ� ZVMODELVZ�� ����ϰ� �ִ� ������ �����մϴ�. ���� �繫�ǿ��� ������� �䱸������ ������ų �� �ִ� ����� ���������� ������ �� �ֽ��ϴ�.
<p></p>
�������� ���� �����ϸ� ����� ��忡���� NAT�� ��Ȱ��ȭ �Ǿ� �ְ� ���� ����� ���������� ������ �� �ֽ��ϴ�.
</td>
</tr>
<tr>
<td class="content_header_td_30"><input type="radio" name="x_Mode" value="V3"> �׼��� ����Ʈ</td>
<td class="content_desc_td">
�׼��� ����Ʈ ��忡���� 5���� ��� �̴��� ��Ʈ�� ���� ����̽��� ������ ���� ���� ��Ʈ��ũ�� ������ �� �ֽ��ϴ�. WAN ���� ����� �������� �ʽ��ϴ�.
<p></p>
�������� ���� �����ϸ� �׼��� ����Ʈ ��忡���� NAT�� ��Ȱ��ȭ �Ǿ� �ְ� ZVMODELVZ�� 1���� WAN ��Ʈ�� 4���� LAN ��Ʈ�� ���� ����˴ϴ�.
</td>
</tr>
<tr>
<td class="content_input_td_less" colspan="2" height="60">
  <p align="right">
  <input class="inputSubmit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" type="submit" value="����" name="action" onClick="saveMode(this)">&nbsp;
  </p>
</td>
</tr></table>
</td>
</tr>
</table>
</form>
</body>
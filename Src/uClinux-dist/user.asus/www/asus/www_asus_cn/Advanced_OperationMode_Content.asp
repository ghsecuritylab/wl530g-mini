<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
<td class="content_header_td_title" colspan="2">ϵͳ���� - ����ģʽ</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">
ZVMODELVZ֧�����ֿ����㲻ͬ����Ĳ���ģʽ����ѡ���������״��ģʽ��
</td>
</tr>
<tr>
<td class="content_header_td_30"><input type="radio" name="x_Mode"> ��������</td>
<td class="content_desc_td">
�ڴ���ģʽ�У����ǽ�����ʹ��ZVMODELVZͨ��ADSL��Cable Modem�����ӻ�������ͬʱ�������Ļ���������˶��ɹ���ͬһIP��ʹ��ISP��
<p></p>
��רҵ����ĽǶȽ��ͣ�����ģʽ�� -���������ַת����Network Address Translation��NAT��������ʹ��PPPoE��DHCP �û��˻�̬IP�����й�������WAN�����Ӳ��������⣬Ҳ֧��һЩ�Լ�ͥ�û��൱���õĹ��ܣ�����UPNP����̬DNS��DDNS����
</td>
</tr>
<tr>
<td class="content_header_td_30"><input type="radio" name="x_Mode" value=""> ·����</td>
<td class="content_desc_td">
�ڡ�·������ģʽ�У����ǽ�����ʹ��ZVMODELVZ����������˾�ڲ��ľ�������LAN�������ڣ���������·��Э���Է������İ칫��������
<p></p>
��רҵ����ĽǶȽ��ͣ�·����ģʽ����ȡ�������ַת����NAT�����������þ�̬·��Э�顣
</td>
</tr>
<tr>
<td class="content_header_td_30"><input type="radio" name="x_Mode" value="V3"> ����㣨AP��</td>
<td class="content_desc_td">
�ڡ�����㣨AP����ģʽ�У�������̫����˿ڣ�Ethernet ports��������ͨѶ�豸ȫ��������ͬһ�������磨LAN���С������ﲻ֧����WAN��صĹ��ܡ�
<p></p>
��רҵ����ĽǶȽ��ͣ�����㣨AP��ģʽ���ر������ַת����NAT��������ZVMODELVZ��һ�黥�����˿ڣ�WAN port��������������˿ڣ�LAN port���Ž���һ��
</td>
</tr>
<tr>
<td class="content_input_td_less" colspan="2" height="60">
  <p align="right">
  <input class="inputSubmit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" type="submit" value="Ӧ��" name="action" onClick="saveMode(this)">&nbsp;
  </p>
</td>
</tr></table>
</td>
</tr>
</table>
</form>
</body>
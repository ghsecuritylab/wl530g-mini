<head>
<title>WL530G Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet" type="text/css" href="style.css" media="screen">
<script language="JavaScript" type="text/javascript" src="overlib.js"></script>
<script language="JavaScript" type="text/javascript" src="general.js"></script>
<script language="JavaScript" type="text/javascript" src="quick.js"></script>
</head>  
<body bgcolor="#FFFFFF">
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>    
<form method="post" action="upgrade.cgi" enctype="multipart/form-data">
<!-- Table for the conntent page -->	    
<table width="660" border="0" cellpadding="1" cellspacing="0">     	      
    	
<tr>
<td>
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">�ý��� ���� - �߿��� ���׷��̵�</td>
<input type="hidden" name="current_page" value="Basic_Operation_Content.asp">
<input type="hidden" name="next_page" value="Basic_SaveRestart.asp">
<input type="hidden" name="action_mode" value="">
</tr>
<tr class="content_section_header_tr">
<td id="Mode" class="content_section_header_td" colspan="2" width="614"> �Ʒ��� ������ ����:</td>
</tr>

<tr>
<td class="content_desc_td" colspan="2" width="614">
              	<ol>
              		<li>
              <p style="margin-top: 7">
                    ���ο� �߿��� ������ ASUS ������Ʈ�� ���� �ִ� ���� üũ�մϴ�.
              </li>
              		<li>
              <p style="margin-top: 7">
                     ���� ��ǻ�Ϳ� ������ ������ �ٿ�ε��մϴ�.               
              </li>
              		<li>
              <p style="margin-top: 7">
                    "���ο� �߿��� ����"���� �ٿ�ε��ϴ� ������ ��ο� �̸��� �����մϴ�.
              </li>
              		<li>
              <p style="margin-top: 7">
                     "���ε�"�� Ŭ���Ͽ� ������ WL530G�� ���ε� �մϴ�. �� 10�� ���� �ҿ�˴ϴ�.
              </li>
              <li>
              <p style="margin-top: 7">
                    ��Ȯ�� �߿��� ������ ���� �� WL530G �� ���׷��̵� ������ �ڵ����� �����մϴ�. ��� �� ���׷��̵� ������ ������ �ý����� ����õ˴ϴ�.
 	      </li>
              </ol>
</td>
</tr>
<tr>
		<td class="content_header_td" width="30">��ǰ ID:</td><td class="content_input_td" width="595"><input type="text" value="<% nvram_get_f("general.log","productid"); %>" readonly="1"></td>
</tr>
<tr>
		<td class="content_header_td" width="30">�߿��� ����:</td><td class="content_input_td" width="595"><input type="text" value="<% nvram_get_f("general.log","firmver"); %>" readonly="1"></td>
</tr>
<tr>
<td class="content_header_td" width="30">���ο� �߿��� ����:</td><td class="content_input_td">  
                  <input class="inputSubmit" name="file" size="20" type="file" ></td>
</tr>
<tr>
<td class="content_header_td"></td><td class="content_input_td" width="595">
  <p align="left"><input class="inputSubmit" onClick="onSubmitCtrlOnly(this, 'Upload')" type="submit" value="���ε�"> 
  </p>
</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2" width="614">
	             <b>����:</b>
                     <ol>
                     	<li>���� �߿���� ���ο� �߿����� ���ǱԷ��̼� �Ķ���ʹ� ���׷��̵� �������� �����˴ϴ�.</li>
                     	<li>���׷��̵� ������ �����ϸ� WL530G�� �ڵ����� ����� ���°� �˴ϴ�. WL530G�� �տ� ��ġ�� LED ǥ�õ��� �׷��� ��Ȳ�� �˷� �ݴϴ�. �ý��� ������ �Ϸ��� �߿��� ���� ��ƿ��Ƽ�� ����մϴ�.</li>
                     </ol>
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</body>
<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet" type="text/css" href="style.css" media="screen">
<script language="JavaScript" type="text/javascript" src="overlib.js"></script>
<script language="JavaScript" type="text/javascript" src="general.js"></script>
<script language="JavaScript" type="text/javascript" src="quick.js"></script>
</head>  
<body bgcolor="#FFFFFF" onload="load_upload()">
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>    
<form method="post" action="upgrade.cgi" name="form" enctype="multipart/form-data">
<!-- Table for the conntent page -->	    
<table width="660" border="0" cellpadding="1" cellspacing="0">     	      
    	
<tr>
<td>
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">ϵͳ���� - �̼�����</td>
<input type="hidden" name="current_page" value="Basic_Operation_Content.asp">
<input type="hidden" name="next_page" value="Basic_SaveRestart.asp">
<input type="hidden" name="action_mode" value="">
</tr>
<tr class="content_section_header_tr">
<td id="Mode" class="content_section_header_td" colspan="2" width="614"> �밴������˵����</td>
</tr>

<tr>
<td class="content_desc_td" colspan="2" width="614">
              	<ol>
              		<li>
              <p style="margin-top: 7">
                    �뵽��˶��վ�鿴�Ƿ����ṩ�°�Ĺ̼���
              </li>
              		<li>
              <p style="margin-top: 7">
                    ����ȷ�İ汾�����������˵��豸�ϡ�               
              </li>
              		<li>
              <p style="margin-top: 7">
                    �뽫�����ļ���·��������ָ�������¹̼��ļ����С�
              </li>
              		<li>
              <p style="margin-top: 7">
                    ��ѡ���ϴ������ļ��ϴ��� ZVMODELVZ������������ʱԼ80���ӡ�
              </li>
              <li>
              <p style="margin-top: 7">
                    ���յ���ȷ�Ĺ̼��ļ���ZVMODELVZ���Զ���ʼ�����Ĺ��̡�����������ҪһЩʱ������ɣ�����ϵͳ�������¿�����
 	      </li>
              </ol>
</td>
</tr>
<tr>
		<td class="content_header_td" width="30">��Ʒ�ͺţ�</td><td class="content_input_td" width="595"><input type="text" value="<% nvram_get_f("general.log","productid"); %>" readonly="1"></td>
</tr>
<tr>
		<td class="content_header_td" width="30">�̼��汾��</td><td class="content_input_td" width="595"><input type="text" value="<% nvram_get_f("general.log","firmver"); %>" readonly="1"></td>
</tr>
<tr>
<td class="content_header_td" width="30">�¹̼��ļ���</td><td class="content_input_td">  
                  <input class="inputSubmit" name="file" size="20" type="file" ></td>
</tr>
<tr>
<td class="content_header_td"></td><td class="content_input_td" width="595">
  <p align="left"><input class="inputSubmit" name="button" onClick="onSubmitCtrlOnly(this, 'Upload1')" type="button" value="�ϴ�"> 
  </p>
</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2" width="614">
	             <b>ע�⣺</b>
                     <ol>
                     	<li>���ͬʱ�������¾ɹ̼��е����ò����������������������Ĺ����л�һֱ������</li>
                     	<li>����������ʧ�ܣ�ZVMODELVZ���Զ��������ģʽ����ZVMODELVZ�����ϵ�LEDָʾ�ƻ�ָʾ�����������ʹ�ù����ϵġ��̼��ָ�����Firmware Restoration�����ó������ϵͳ��ԭ������</li>
                     </ol>
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</body>

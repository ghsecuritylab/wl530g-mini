<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
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
<td class="content_header_td_title" colspan="2">�t�γ]�w - ����ɯ�</td>
<input type="hidden" name="current_page" value="Basic_Operation_Content.asp">
<input type="hidden" name="next_page" value="Basic_SaveRestart.asp">
<input type="hidden" name="action_mode" value="">
</tr>
<tr class="content_section_header_tr">
<td id="Mode" class="content_section_header_td" colspan="2" width="614"> �п�ӤU�C���ܡG</td>
</tr>

<tr>
<td class="content_desc_td" colspan="2" width="614">
              	<ol>
              		<li>
              <p style="margin-top: 7">
                    �ЦܵغӺ����d�ݬO�_�����ѷs��������C
              </li>
              		<li>
              <p style="margin-top: 7">
                    �N���T�������U���ܱz�ӤH���]�ƤW�C               
              </li>
              		<li>
              <p style="margin-top: 7">
                    �бN�U���ɮת����|�ΦW�٫��w��u�s�����ɮסv���C
              </li>
              		<li>
              <p style="margin-top: 7">
                    �I��u�W�ǡv�N�ɮפW�Ǧ� ZVMODELVZ�C��ӹL�{�ݮɬ�10�����C
              </li>
              <li>
              <p style="margin-top: 7">
                    �b���쥿�T�������ɮ׫�AZVMODELVZ�Y�۰ʶ}�l�ɯŪ��L�{�C��ӹL�{�ݭn�@�Ǯɶ��ӧ����A���ۨt�αN�|���s�}���C
 	      </li>
              </ol>
</td>
</tr>
<tr>
		<td class="content_header_td" width="30">���~�����G</td><td class="content_input_td" width="595"><input type="text" value="<% nvram_get_f("general.log","productid"); %>" readonly="1"></td>
</tr>
<tr>
		<td class="content_header_td" width="30">���骩���G</td><td class="content_input_td" width="595"><input type="text" value="<% nvram_get_f("general.log","firmver"); %>" readonly="1"></td>
</tr>
<tr>
<td class="content_header_td" width="30">�s�����ɮסG</td><td class="content_input_td">  
                  <input class="inputSubmit" name="file" size="20" type="file" ></td>
</tr>
<tr>
<td class="content_header_td"></td><td class="content_input_td" width="595">
  <p align="left"><input class="inputSubmit" onClick="onSubmitCtrlOnly(this, 'Upload')" type="submit" value="�W��"> 
  </p>
</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2" width="614">
	             <b>���G</b>
                     <ol>
                     	<li>�w��P�ɦs�b��s�¶��餤���պA�ѼơA��]�w�Ȧb��ӤɯŪ��L�{���|�@���O�d�C</li>
                     	<li>��ɯŹL�{���ѡAZVMODELVZ�|�۰ʶi�J���Ҧ��C��ZVMODELVZ�����W��LED�H���Y�|���ܦ��ر��p�C�ШϥΥ��ФW���u����״_�v�]Firmware Restoration�^���ε{���i��t���٭�@�~�C</li>
                     </ol>
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</body>

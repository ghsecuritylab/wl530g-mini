<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
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
<td class="content_header_td_title" colspan="2">�V�X�e���Z�b�g�A�b�v - ���샂�[�h</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">
ZVMODELVZ��3�̑��샂�[�h���T�|�[�g���āA�قȂ�O���[�v�̃��[�U�[����قȂ�v���𖞂����܂��B�󋵂Ɉ�v���郂�[�h��I�����Ă��������B
</td>
</tr>
<tr>
<td class="content_header_td_30"><input type="radio" name="x_Mode"> �z�[���Q�[�g�E�F�C</td>
<td class="content_desc_td">
���̃��[�h�ŁA���[�U�[��ZVMODELVZ���g�p���AADSL�܂��̓P�[�u�����f����ʂ��ăC���^�[�l�b�g�ɐڑ�������̂ƁA�܂��A���g���̊��ɂ�IP��ISP�����L���鑽���̃��[�U�[��������̂Ɖ��肵�܂��B
<p></p>
���p��̐���������ƁA�Q�[�g�E�F�C���[�h��NAT���L���AWAN�ڑ���PPPoE�A�܂���DHCP�N���C�A���g�A�܂��̓X�^�e�B�b�NIP���g�p���ċ�����Ă��܂��B����ɁAUPnP��DDNS�Ȃǂ̉ƒ냆�[�U�[�ɖ��ɗ��������̋@�\���A�T�|�[�g����Ă��܂��B
</td>
</tr>
<tr>
<td class="content_header_td_30"><input type="radio" name="x_Mode" value=""> ���[�^</td>
<td class="content_desc_td">
���[�^���[�h�ŁA���[�U�[��ZVMODELVZ���g�p���Ċ�Ƃ�LAN�ɐڑ����Ă�����̂Ɖ��肵�܂��B�]���āA�o�H�w��v���g�R����ݒ肵�ăI�t�B�X�̗v���𖞂������Ƃ��ł��܂��B
<p></p>
���p��̐���������ƁA���[�^���[�h�́ANAT�������A�X�^�e�B�b�N����у_�C�i�~�b�N�o�H�w��v���g�R�����ݒ��������AWAN�ڑ����X�^�e�B�b�NIP���g�p���Ă̂݋�����Ă��܂��B
</td>
</tr>
<tr>
<td class="content_header_td_30"><input type="radio" name="x_Mode" value="V3"> �A�N�Z�X�|�C���g</td>
<td class="content_desc_td">
�A�N�Z�X�|�C���g���[�h�ŁA5�̂��ׂẴC�[�T�l�b�g�|�[�g�ƃ��C�����X�f�o�C�X�͓������[�J���G���A�l�b�g���[�N�ɔz�u����悤�ɐݒ肳��܂��B�@�\�Ɋ֘A���邱����WAN�͂����ł̓T�|�[�g����Ă��܂���B
<p></p>
���p��̐���������ƁA�A�N�Z�X�|�C���g���[�h�́ANAT�������AZVMODELVZ��1��WAN�|�[�g��4��LAN�|�[�g���݂��Ƀu���b�W����Ă��܂��B
</td>
</tr>
<tr>
<td class="content_input_td_less" colspan="2" height="60">
  <p align="right">
  <input class="inputSubmit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" type="submit" value="�K�p" name="action" onClick="saveMode(this)">&nbsp;
  </p>
</td>
</tr></table>
</td>
</tr>
</table>
</form>
</body>
<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
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
    	
<input type="hidden" name="current_page" value="Advanced_WMode_Content.asp"><input type="hidden" name="next_page" value="Advanced_ACL_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="WLANConfig11a;WLANConfig11b;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">���C�����X - �u���b�W</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">���C�����X�u���b�W�i���C�����X�f�B�X�g���r���[�V�����V�X�e���FWDS�j�@�\�ł́A���C�����X��ʂ���1�܂��͕�����AP�ɐڑ��ł��܂��B
         </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('AP�݂̂�I������ƁA���C�����X�@�\�������ɂȂ�܂��BWDS�݂̂�I������ƁA���[�J�����C�����X�[���A�\�V�G�[�V�����������ɂȂ�܂��B�n�C�u���b�h��I������ƃ��C�����X�u���b�W�@�\���L���ɂȂ�A���C�����X�[����AP�Ɋ֘A�t�����܂��B', LEFT);" onMouseOut="return nd();">AP���[�h:
           </td><td class="content_input_td"><select name="wl_mode_x" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_mode_x')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","wl_mode_x", "0","selected"); %>>AP Only</option><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","wl_mode_x", "1","selected"); %>>WDS Only</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11b","wl_mode_x", "2","selected"); %>>Hybrid</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���삵�Ă��閳�����W�I�`�����l����I������', LEFT);" onMouseOut="return nd();">�`�����l��:
           </td><td class="content_input_td"><select name="wl_channel" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', 'wl_channel')">   
<% select_channel("WLANConfig11b"); %>
                </select><input type="hidden" maxlength="15" size="15" name="x_RegulatoryDomain" value="<% nvram_get_x("Regulatory","x_RegulatoryDomain"); %>" readonly="1"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�͂���I������ƁAZVMODELVZ�������[�g�u���b�W���X�g�Ɉꗗ����Ă��鑼��AP�ɐڑ����܂��B', LEFT);" onMouseOut="return nd();">�����[�g�u���b�W���X�g��AP�ɐڑ����܂���?
           </td><td class="content_input_td"><input type="radio" value="1" name="wl_wdsapply_x" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_wdsapply_x', '1')" <% nvram_match_x("WLANConfig11b","wl_wdsapply_x", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wl_wdsapply_x" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_wdsapply_x', '0')" <% nvram_match_x("WLANConfig11b","wl_wdsapply_x", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�͂���I������ƁA���C�����X�u���b�W�����������ɂȂ�܂��B���ׂẴ��C�����X�u���b�W���A�N�Z�X����^�����܂��B��������I������ƁA���C�����X�u���b�W�������L���ɂȂ�܂��B�����[�g�u���b�W���X�g�Ƀ��X�g�A�b�v���ꂽ�u���b�W�݂̂��A�N�Z�X����^�����܂��B', LEFT);" onMouseOut="return nd();">�����������܂���?
           </td><td class="content_input_td"><input type="radio" value="1" name="wl_lazywds" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_lazywds', '1')" <% nvram_match_x("WLANConfig11b","wl_lazywds", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="wl_lazywds" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', 'wl_lazywds', '0')" <% nvram_match_x("WLANConfig11b","wl_lazywds", "0", "checked"); %>>No</input></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="RBRList">�����[�g�u���|�W���X�g
         <input type="hidden" name="wl_wdsnum_x_0" value="<% nvram_get_x("WLANConfig11b", "wl_wdsnum_x"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'RBRList', 16, ' Add ');" name="RBRList" value="�ǉ�" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'RBRList', 16, ' Del ');" name="RBRList" value="�폜" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">MAC�A�h���X	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="12" class="content_input_list_fd" size="32" name="wl_wdslist_x_0" onKeyPress="return is_hwaddr()"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="RBRList_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("WLANConfig11b","RBRList"); %>
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
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Finish ')" type="submit" value=" �I�� " name="action"></font></div> 
   </td>
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Apply ')" type="submit" value=" �K�p " name="action"></font></div> 
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
    <td class="content_input_td_padding" align="left">��̐ݒ���������A�L���ɂȂ��Ă���ݒ�𕜌����܂��B</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">�I��: </td>
    <td class="content_input_td_padding" align="left">���ׂĂ̐ݒ���m�F���āA��ZVMODELVZ���ċN�����܂��B</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">�K�p: </td>
    <td class="content_input_td_padding" align="left">��̐ݒ���m�F���āA���s���܂��B</td>
</tr>
</table>
</td>
</tr>

</table>
</form>
</body>

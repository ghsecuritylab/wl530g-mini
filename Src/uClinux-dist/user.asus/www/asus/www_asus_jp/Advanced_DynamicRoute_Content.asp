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
    	
<input type="hidden" name="current_page" value="Advanced_DynamicRoute_Content.asp"><input type="hidden" name="next_page" value="SaveRestart.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="RouterConfig;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">���[�^ - �_�C�i�~�b�N���[�g</td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('RouterConfig_GWStaticRIP_itemdesc', LEFT);" onMouseOut="return nd();">���I�ȃ��[�g(RIP)��L������?
           </td><td class="content_input_td"><select name="sr_rip_x" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', 'sr_rip_x')"><option class="content_input_fd" value="0" <% nvram_match_x("RouterConfig","sr_rip_x", "0","selected"); %>>Disabled</option><option class="content_input_fd" value="1" <% nvram_match_x("RouterConfig","sr_rip_x", "1","selected"); %>>LAN</option><option class="content_input_fd" value="2" <% nvram_match_x("RouterConfig","sr_rip_x", "2","selected"); %>>WAN</option><option class="content_input_fd" value="3" <% nvram_match_x("RouterConfig","sr_rip_x", "3","selected"); %>>BOTH</option></select></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">WAN
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('RIP�p�P�b�g�̑���M�͂ǂ�����AWAN�|�[�g�ŗL���܂��͖����ɂ���܂��B', LEFT);" onMouseOut="return nd();">WAN��RIP��L���ɂ��܂���?
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', '', '1')" <% nvram_match_x("RouterConfig","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', '', '0')" <% nvram_match_x("RouterConfig","", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�͑I�����ꂽ�C���^�[�t�F�C�X��L���ɂ��āARIP�o�[�W����1�ARIP�o�[�W����2�u�A�܂��͗��������p�P�b�g�𑗎�M���܂��B���������ꍇ�A�p�P�b�g�͈�ĒʐM�Ɠ���ʐM�����s���܂��B', LEFT);" onMouseOut="return nd();">RIP�o�[�W����:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', '')"><option class="content_input_fd" value="RIP1" <% nvram_match_x("RouterConfig","", "RIP1","selected"); %>>RIP1</option><option class="content_input_fd" value="RIP2" <% nvram_match_x("RouterConfig","", "RIP2","selected"); %>>RIP2</option><option class="content_input_fd" value="Both" <% nvram_match_x("RouterConfig","", "Both","selected"); %>>Both</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�X�v���b�g�z���C�]���o�H���J�j�Y�����|�[�g�œK�p����邩�ǂ����𐧌䂵�܂��B', LEFT);" onMouseOut="return nd();">�X�v���b�g�z���C�]����L���ɂ��܂���?
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', '', '1')" <% nvram_match_x("RouterConfig","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', '', '0')" <% nvram_match_x("RouterConfig","", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�|�[�g�ɓK�p�����F�؃��J�j�Y���ƑΉ�����L�[��I�����܂��B', LEFT);" onMouseOut="return nd();">�F�ؕ���:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', '')"><option class="content_input_fd" value="Disable" <% nvram_match_x("RouterConfig","", "Disable","selected"); %>>Disable</option><option class="content_input_fd" value="Text" <% nvram_match_x("RouterConfig","", "Text","selected"); %>>Text</option><option class="content_input_fd" value="MD5" <% nvram_match_x("RouterConfig","", "MD5","selected"); %>>MD5</option></select></td>
</tr>
<tr>
<td class="content_header_td">�F�؃L�[:
           </td><td class="content_input_td"><input type="text" maxlength="16" class="content_input_fd" size="32" name="" value="<% nvram_get_x("RouterConfig",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">LAN
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('RIP�p�P�b�g�̑���M�͋��ɁALAN�|�[�g�ŗL���܂��͖����ɂ���܂��B', LEFT);" onMouseOut="return nd();">LAN��RIP��L���ɂ��܂���?
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', '', '1')" <% nvram_match_x("RouterConfig","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', '', '0')" <% nvram_match_x("RouterConfig","", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('���̃t�B�[���h�͑I�����ꂽ�C���^�[�t�F�C�X��L���ɂ��āARIP�o�[�W����1�ARIP�o�[�W����2�u�A�܂��͗��������p�P�b�g�𑗎�M���܂��B���������ꍇ�A�p�P�b�g�͈�ĒʐM�Ɠ���ʐM�����s���܂��B', LEFT);" onMouseOut="return nd();">RIP�o�[�W����:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', '')"><option class="content_input_fd" value="RIP1" <% nvram_match_x("RouterConfig","", "RIP1","selected"); %>>RIP1</option><option class="content_input_fd" value="RIP2" <% nvram_match_x("RouterConfig","", "RIP2","selected"); %>>RIP2</option><option class="content_input_fd" value="Both" <% nvram_match_x("RouterConfig","", "Both","selected"); %>>Both</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�X�v���b�g�z���C�]���o�H���J�j�Y�����A�|�[�g�ɓK�p����Ă��邩�ǂ����𐧌䂵�܂��B', LEFT);" onMouseOut="return nd();">�X�v���b�g�z���C�]����L���ɂ��܂���?
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', '', '1')" <% nvram_match_x("RouterConfig","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'RouterConfig', '', '0')" <% nvram_match_x("RouterConfig","", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�|�[�g�ɓK�p�����F�؃��J�j�Y���ƑΉ�����L�[��I�����܂��B', LEFT);" onMouseOut="return nd();">�F�ؕ���:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', '')"><option class="content_input_fd" value="Disable" <% nvram_match_x("RouterConfig","", "Disable","selected"); %>>Disable</option><option class="content_input_fd" value="Text" <% nvram_match_x("RouterConfig","", "Text","selected"); %>>Text</option><option class="content_input_fd" value="MD5" <% nvram_match_x("RouterConfig","", "MD5","selected"); %>>MD5</option></select></td>
</tr>
<tr>
<td class="content_header_td">�F�؃L�[:
           </td><td class="content_input_td"><input type="text" maxlength="16" class="content_input_fd" size="32" name="" value="<% nvram_get_x("RouterConfig",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">�^�C�}�[
            </td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�X�V�^�C�}�[�̊e�b���ƂɁARIP�v���Z�X�͂��ׂĂ̗א�RIP���[�^�ɑ΂��銮�S�Ȍo�H�\���܂ޔ񐿋��������b�Z�[�W�𑗐M����悤�ɂ��Ȃ�����܂��B', LEFT);" onMouseOut="return nd();">�X�V����:
           </td><td class="content_input_td"><input type="text" maxlength="5" class="content_input_fd" size="5" name="" value="<% nvram_get_x("RouterConfig",""); %>" onBlur="validate_range(this, 0, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�^�C���A�E�g���I������ƁA�o�H�͂��͂�L���ł͂���܂���;�������A�o�H���E���������Ƃ��ߐڂɒʒm�ł���悤�ɁA�o�H�͒Z���ԁA�o�H�\�Ɉێ�����܂��B', LEFT);" onMouseOut="return nd();">�^�C���A�E�g����:
           </td><td class="content_input_td"><input type="text" maxlength="5" class="content_input_fd" size="5" name="" value="<% nvram_get_x("RouterConfig",""); %>" onBlur="validate_range(this, 0, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('�s�v�����̐����^�C�}�[�̊������؂��ƁA�o�H�͌o�H�\����ŏI�I�ɍ폜����܂��B', LEFT);" onMouseOut="return nd();">�s�v�����̐�������:
           </td><td class="content_input_td"><input type="text" maxlength="5" class="content_input_fd" size="5" name="" value="<% nvram_get_x("RouterConfig",""); %>" onBlur="validate_range(this, 0, 65535)" onKeyPress="return is_number(this)"></td>
</tr>
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">�o�H���z
            </td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">�����̋K���́ARIP�p�X���t�B���^���邽�߂Ɏg�p����܂��B���Ђł́AWAN�����LAN�|�[�g�̓��o�̓f�[�^��\�����߂ɁA4�̊�{�o�H�t�B���^�^�C�v���`���Ă��܂��B�e�^�C�v�ɑ΂��āA�o�H���z�t�B���^�\�Ŏw�肳�ꂽ�����̈�v����l�b�g���[�N�������������邩���Ƃ�����ݒ�ł��܂��B
         </td>
</tr>
<tr>
<td class="content_header_td">WAN�����M���ꂽ�A�^�C�v0�o�H�ɑ΂��āA�ȉ��Ɏw�肳�ꂽ�����̌o�H����:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', '')"><option class="content_input_fd" value="1" <% nvram_match_x("RouterConfig","", "1","selected"); %>>processed</option><option class="content_input_fd" value="0" <% nvram_match_x("RouterConfig","", "0","selected"); %>>dropped</option></select></td>
</tr>
<tr>
<td class="content_header_td">WAN�ɑ��M���ꂽ�A�^�C�v1�o�H�ɑ΂��āA�ȉ��Ɏw�肳�ꂽ�����̌o�H����:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', '')"><option class="content_input_fd" value="1" <% nvram_match_x("RouterConfig","", "1","selected"); %>>processed</option><option class="content_input_fd" value="0" <% nvram_match_x("RouterConfig","", "0","selected"); %>>dropped</option></select></td>
</tr>
<tr>
<td class="content_header_td">LAN�����M���ꂽ�A�^�C�v2�o�H�ɑ΂��āA�ȉ��Ɏw�肳�ꂽ�����̌o�H����:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', '')"><option class="content_input_fd" value="1" <% nvram_match_x("RouterConfig","", "1","selected"); %>>processed</option><option class="content_input_fd" value="0" <% nvram_match_x("RouterConfig","", "0","selected"); %>>dropped</option></select></td>
</tr>
<tr>
<td class="content_header_td">LAN�ɑ��M���ꂽ�A�^�C�v3�o�H�ɑ΂��āA�ȉ��Ɏw�肳�ꂽ�����̌o�H����:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', '')"><option class="content_input_fd" value="1" <% nvram_match_x("RouterConfig","", "1","selected"); %>>processed</option><option class="content_input_fd" value="0" <% nvram_match_x("RouterConfig","", "0","selected"); %>>dropped</option></select></td>
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="RouteFilter">�o�H���z�t�B���^
         <input type="hidden" name="RipDRouteCount_0" value="<% nvram_get_x("RouterConfig", "RipDRouteCount"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'RouteFilter', 16, ' Add ');" name="RouteFilter" value="�ǉ�" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'RouteFilter', 16, ' Del ');" name="RouteFilter" value="�폜" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="button" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return openHelp(this, 'RouterHelp');" name="RouteFilter" value="�w���v" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">�o�H�^�C�v	                
           	        </td><td class="content_list_field_header_td" colspan="">�l�b�g���[�N/�z�X�gIP	                
           	        </td><td class="content_list_field_header_td" colspan="">�l�b�g�}�X�N�r�b�g	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><select name="_0" class="content_input_list_fd"><option value="0" <% nvram_match_list_x("RouterConfig","", "0","selected", 0); %>>0</option><option value="1" <% nvram_match_list_x("RouterConfig","", "1","selected", 0); %>>1</option><option value="2" <% nvram_match_list_x("RouterConfig","", "2","selected", 0); %>>2</option><option value="3" <% nvram_match_list_x("RouterConfig","", "3","selected", 0); %>>3</option></select></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="15" name="_0" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="5" style="font-family: fixedsys; font-size: 10pt;" size="8" name="_0" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="8" name="RouteFilter_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("RouterConfig","RouteFilter"); %>
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
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_section_header_tr">
<td class="content_section_header_td" colspan="2">�o�H���g���b�N�K��
            </td>
</tr>
<tr>
<td class="content_desc_td" colspan="2">RIP���g���b�N�̓l�b�g���[�N�ɑ΂��鋗���̒l�ł��B�ʏ�ARIP�̓l�b�g���[�N������M�����Ƃ��Ƀ��g���b�N�𑝉����܂��B�Ĕz�����ꂽ�o�H�̃f�t�H���g���g���b�N�I�t�Z�b�g�́A1�ɐݒ肳��Ă��܂��B�����̋K���́A�o�H���g���b�N�I�t�Z�b�g�\�Ŏw�肳�ꂽ�܂��͏��O���ꂽ��v�l�b�g���[�N�ɑ΂��Ă̂݁A���g���b�N�I�t�Z�b�g��ύX���邽�߂Ɏg�p�ł��܂��B�������A���̑��̃l�b�g���[�N�̃��g���b�N�I�t�Z�b�g�͂܂�1�ɐݒ肳��܂��B
         </td>
</tr>
<tr>
<td class="content_header_td">�o�H���g���b�N�I�t�Z�b�g:
           </td><td class="content_input_td"><input type="text" maxlength="5" size="5" name="" class="content_input_fd" value="<% nvram_get_x("RouterConfig", ""); %>" onBlur="validate_range(this, 1, 16)" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td class="content_header_td">���͌o�H�ɑ΂��āA���g���b�N�I�t�Z�b�g��ǉ����܂�
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', '')"><option class="content_input_fd" value="0" <% nvram_match_x("RouterConfig","", "0","selected"); %>>none</option><option class="content_input_fd" value="1" <% nvram_match_x("RouterConfig","", "1","selected"); %>>routes specified below</option><option class="content_input_fd" value="2" <% nvram_match_x("RouterConfig","", "2","selected"); %>>routes not specified below</option></select></td>
</tr>
<tr>
<td class="content_header_td">�o�͌o�H�ɑ΂��āA���g���b�N�I�t�Z�b�g��ݒ肵�܂�
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'RouterConfig', '')"><option class="content_input_fd" value="0" <% nvram_match_x("RouterConfig","", "0","selected"); %>>none</option><option class="content_input_fd" value="1" <% nvram_match_x("RouterConfig","", "1","selected"); %>>routes specified below</option><option class="content_input_fd" value="2" <% nvram_match_x("RouterConfig","", "2","selected"); %>>routes not specified below</option></select></td>
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
<table width="666" border="2" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_list_header_tr">
<td class="content_list_header_td" width="60%" id="RipOffset">�o�H���g���b�N�I�t�Z�b�g
         <input type="hidden" name="RipOffsetCount_0" value="<% nvram_get_x("RouterConfig", "RipOffsetCount"); %>" readonly="1"></td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'RipOffset', 16, ' Add ');" name="RipOffset" value="�ǉ�" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="submit" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return markGroup(this, 'RipOffset', 16, ' Del ');" name="RipOffset" value="�폜" size="12">
</div>
</td><td width="10%">
<div align="center">
<input class="inputSubmit" type="button" onMouseOut="buttonOut(this)" onMouseOver="buttonOver(this)" onClick="return openHelp(this, 'RouterHelp');" name="RipOffset" value="�w���v" size="12">
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
<td></td><td class="content_list_field_header_td" colspan="">����	                
           	        </td><td class="content_list_field_header_td" colspan="">�l�b�g���[�N/�z�X�gIP	                
           	        </td><td class="content_list_field_header_td" colspan="">�l�b�g�}�X�N�r�b�g	                
           	        </td><td></td>
</tr>
<tr>
<td></td><td class="content_list_input_td" colspan=""><select name="_0" class="content_input_list_fd"><option value="IN" <% nvram_match_list_x("RouterConfig","", "IN","selected", 0); %>>IN</option><option value="OUT" <% nvram_match_list_x("RouterConfig","", "OUT","selected", 0); %>>OUT</option></select></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="15" class="content_input_list_fd" size="14" name="_0" onKeyPress="return is_ipaddr(this)" onKeyUp="change_ipaddr(this)"></td><td class="content_list_input_td" colspan=""><input type="text" maxlength="5" style="font-family: fixedsys; font-size: 10pt;" size="8" name="_0" onKeyPress="return is_number(this)"></td>
</tr>
<tr>
<td></td><td colspan="10"><select size="4" name="RipOffset_s" multiple="true" style="font-family: 'fixedsys'; font-size: '8pt'">
<% nvram_get_table_x("RouterConfig","RipOffset"); %>
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

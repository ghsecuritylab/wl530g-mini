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
    	
<input type="hidden" name="current_page" value="Advanced_Wireless_Content.asp"><input type="hidden" name="next_page" value="Advanced_WMode_Content.asp"><input type="hidden" name="next_host" value=""><input type="hidden" name="sid_list" value="WLANConfig11a;WLANConfig11b;"><input type="hidden" name="group_id" value=""><input type="hidden" name="modified" value="0"><input type="hidden" name="action_mode" value=""><input type="hidden" name="first_time" value=""><input type="hidden" name="action_script" value="">
<tr>
<td>
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">ワイヤレス - インターフェイス</td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('32文字以内の文字からなる、識別文字列を適用します。', LEFT);" onMouseOut="return nd();">SSID:
           </td><td class="content_input_td"><input type="text" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onKeyPress="return is_string(this)" onBlur="validate_string(this)"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('操作している無線ラジオチャンネルを選択する', LEFT);" onMouseOut="return nd();">チャンネル:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', '')">   
<% select_channel("WLANConfig11b"); %>
                </select><input type="hidden" maxlength="15" size="15" name="x_RegulatoryDomain" value="<% nvram_get_x("Regulatory","x_RegulatoryDomain"); %>" readonly="1"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('このフィールドは、ワイヤレスユーザーの認証に使用される方式を示します。異なる認証方式を選択すると、異なる暗号化方式が有効になります。', LEFT);" onMouseOut="return nd();">認証方式:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', '')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","", "0","selected"); %>>Open System or Shared Key</option><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","", "1","selected"); %>>Shared Key</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11b","", "2","selected"); %>>WPA-PSK</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('このフィールドは、データを暗号化し盗聴を防ぐために使用される暗号化方式を示します。', LEFT);" onMouseOut="return nd();">暗号化:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_wlweptype(this, 'WLANConfig11b')"><option class="content_input_fd" value="0" <% nvram_match_x("WLANConfig11b","", "0","selected"); %>>None</option><option class="content_input_fd" value="1" <% nvram_match_x("WLANConfig11b","", "1","selected"); %>>WEP-64bits</option><option class="content_input_fd" value="2" <% nvram_match_x("WLANConfig11b","", "2","selected"); %>>WEP-128bits</option><option class="content_input_fd" value="3" <% nvram_match_x("WLANConfig11b","", "3","selected"); %>>WEP-152bits</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('TKIPまたはAES暗号化方式を選択しているとき、このフィールドは暗号化プロセスを開始するためのパスワードとして使用されます。WEP-64ビットまたはWEP-128ビットを選択しているとき、このフィールドは4つのWEPキーを自動的に生成するために使用されます。', LEFT);" onMouseOut="return nd();">パスフレーズ:
           </td><td class="content_input_td"><script language="JavaScript" type="text/javascript" src="md5.js"></script><input type="password" maxlength="64" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onKeyUp="return is_wlphrase('WLANConfig11b', '', this)" onBlur="return validate_wlphrase('WLANConfig11b', '', this)"></td>
</tr>
<tr>
<td class="content_header_td">WEPキー1 (10または26桁の16進数字):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEPキー2 (10または26桁の16進数字):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEPキー3 (10または26桁の16進数字):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td">WEPキー4 (10または26桁の16進数字):
           </td><td class="content_input_td"><input type="pssword" maxlength="32" class="content_input_fd" size="32" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onBlur="return validate_wlkey(this, 'WLANConfig11b')" onKeyPress="return is_wlkey(this, 'WLANConfig11b')" onKeyUp="return change_wlkey(this, 'WLANConfig11b')"></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('このフィールドは、デフォルトの伝送WEPキーを示します。', LEFT);" onMouseOut="return nd();">デフォルトキー:
           </td><td class="content_input_td"><select name="" class="content_input_fd" onChange="return change_common(this, 'WLANConfig11b', '')"><option class="content_input_fd" value="Key1" <% nvram_match_x("WLANConfig11b","", "Key1","selected"); %>>Key1</option><option class="content_input_fd" value="Key2" <% nvram_match_x("WLANConfig11b","", "Key2","selected"); %>>Key2</option><option class="content_input_fd" value="Key3" <% nvram_match_x("WLANConfig11b","", "Key3","selected"); %>>Key3</option><option class="content_input_fd" value="Key4" <% nvram_match_x("WLANConfig11b","", "Key4","selected"); %>>Key4</option></select></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('このフィールドは、ブロードキャストSSIDを持つプローブメッセージがブロックされるかを示します。', LEFT);" onMouseOut="return nd();">ブロードキャストSSIDのブロック:
           </td><td class="content_input_td"><input type="radio" value="1" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', '', '1')" <% nvram_match_x("WLANConfig11b","", "1", "checked"); %>>Yes</input><input type="radio" value="0" name="" class="content_input_fd" onClick="return change_common_radio(this, 'WLANConfig11b', '', '0')" <% nvram_match_x("WLANConfig11b","", "0", "checked"); %>>No</input></td>
</tr>
<tr>
<td class="content_header_td" onMouseOver="return overlib('このフィールドは、WPAグループキーが変更される時間間隔を秒で示します。0は、周期的なk-変更が必要ないことを意味します。', LEFT);" onMouseOut="return nd();">WPA Re-keyタイマー:
           </td><td class="content_input_td"><input type="text" maxlength="10" class="content_input_fd" size="10" name="" value="<% nvram_get_x("WLANConfig11b",""); %>" onBlur="validate_range(this, 0, 4294927695)" onKeyPress="return is_number(this)"></td>
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
<table width="666" border="1" cellpadding="0" cellspacing="0" bordercolor="B0B0B0">
<tr bgcolor="#CCCCCC"><td colspan="3"><font face="arial" size="2"><b>&nbsp</b></font></td></tr>
<tr bgcolor="#FFFFFF">  
   <td id ="Confirm" height="25" width="34%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Restore ')" type="submit" value=" 復元 " name="action"></font></div> 
   </td>  
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Finish ')" type="submit" value=" 終了 " name="action"></font></div> 
   </td>
   <td height="25" width="33%">  
   <div align="center"><font face="Arial"> <input class=inputSubmit onMouseOut=buttonOut(this) onMouseOver="buttonOver(this)" onClick="onSubmitCtrl(this, ' Apply ')" type="submit" value=" 適用 " name="action"></font></div> 
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
    <td class="content_header_td_15" align="left">復元: </td>
    <td class="content_input_td_padding" align="left">上の設定を消去し、有効になっている設定を復元します。</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">終了: </td>
    <td class="content_input_td_padding" align="left">すべての設定を確認して、今ZVMODELVZを再起動します。</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td class="content_header_td_15" align="left">適用: </td>
    <td class="content_input_td_padding" align="left">上の設定を確認して、続行します。</td>
</tr>
</table>
</td>
</tr>

</table>
</form>
</body>

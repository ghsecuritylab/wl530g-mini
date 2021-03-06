<head>
<title>ZVMODELVZ Web Manager</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<table width="600" border="0" cellpadding="0" cellspacing="0">     	      
    	
<tr>
<td>
<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="E0E0E0">
<tr class="content_header_tr">
<td class="content_header_td_title" colspan="2">System Setup - Firmware Upgrade</td>
<input type="hidden" name="current_page" value="Basic_Operation_Content.asp">
<input type="hidden" name="next_page" value="Basic_SaveRestart.asp">
<input type="hidden" name="action_mode" value="">
</tr>
<tr class="content_section_header_tr">
<td id="Mode" class="content_section_header_td" colspan="2" width="600"> Follow instructions listed below:</td>
</tr>

<tr>
<td class="content_desc_td" colspan="2" width="614">
              	<ol>
              		<li>
              <p style="margin-top: 7">
                    Check if any new version of firmware is available on website.
              </li>
              		<li>
              <p style="margin-top: 7">
                    Download a proper version to your local machine.               
              </li>
              		<li>
              <p style="margin-top: 7">
                    Specify the path of and name of the downloaded file in the "New Firmware File".
              </li>
              		<li>
              <p style="margin-top: 7">
                    Click "Upload" to upload the file to ZVMODELVZ. It spends about 10 seconds.
              </li>
              <li>
              <p style="margin-top: 7">
                    After receiving a correct firmware file, ZVMODELVZ will automatically start the upgrade process. It takes a few time to finish the process and then the system will reboot.
 	      </li>
              </ol>
</td>
</tr>
<tr>
		<td class="content_header_td" width="30">Product ID:</td><td class="content_input_td" width="595"><input type="text" value="<% nvram_get_f("general.log","productid"); %>" readonly="1"></td>
</tr>
<tr>
		<td class="content_header_td" width="30">Firmware Version:</td><td class="content_input_td" width="595"><input type="text" value="<% nvram_get_f("general.log","firmver"); %>" readonly="1"></td>
</tr>
<tr>
<td class="content_header_td" width="30">New Firmware File:</td><td class="content_input_td">  
                  <input class="inputSubmit" name="file" size="20" type="file" ></td>
</tr>
<tr>
<td class="content_header_td"></td><td class="content_input_td" width="595">
  <p align="left"><input class="inputSubmit" onClick="onSubmitCtrlOnly(this, 'Upload')" type="submit" value="Upload"> 
  </p>
</td>
</tr>
<tr>
<td class="content_desc_td" colspan="2" width="614">
	             <b>Note:</b>
                     <ol>
                     	<li>For a configuration parameter existing both in the old and new firmware, its setting will be kept during the upgrade process.</li>
                     	<li>In case the upgrade process fails, ZVMODELVZ will enter an emergent mode automatically. The LED signals at the front of ZVMODELVZ will indicate such situation. Use the Firmware Restoration utility on the CD to do system recovery.</li>
                     </ol>
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</body>

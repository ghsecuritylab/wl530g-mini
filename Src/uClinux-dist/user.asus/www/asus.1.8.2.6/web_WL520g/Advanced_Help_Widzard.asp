<html>

<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>List Edit Tips</title>
<link rel="stylesheet" type="text/css" href="style.css" media="screen">

<SCRIPT LANGUAGE="JavaScript">

function loadWidzard()
{
   
}

function functionChange(o)
{   
     
}

function optionChange(o)
{      
   
}

function onClose()
{
    window.close();
}

</script>

</head>

<body  onLoad="loadWidzard()">
<form method="POST" name="form" action="--WEBBOT-SELF--" ">  
<!--webbot bot="SaveResults" U-File="fpweb:///_private/form_results.txt"
S-Format="TEXT/CSV" S-Label-Fields="TRUE" -->  
<table border="1" width="542">
  <tr>
    <td class="content_header_td_title"  width="532"><font face="Arial" size="5" color="#FFFFFF">
    <b>List Edit Tips</b>
     </font>
  </td>
  </tr>  
  <tr>
    <td class="content_desc_td" width="532">   
    <p><font size="4"><b>Add/Delete entries</b></font></p>
      <li>
        <b>Add</b> : Input data into first row of table, then press <b>Add</b> to insert it. System will remind you if the table is full or required fields are not fill ok.
      </li> 
      <li>
        <b>Del</b> : Select one entry in table, or press <b>Ctrl</b> and select multiple entries in tables, then press <b>Del</b> to delete them.
      </li> 
    <p><font size="4"><b>Input Format</b></font></p>  
      
      <p>The followings are general input types in WL520g. You may read its real definition while mouse is moved over each field.</p>      
      <li>
        <b>Mac Address</b> : For source or destination IP address, you can input a specific IP address, such as "00E0180010".      
      </li> 
      <li>
        <b>IP Address</b> : For source or destination IP address, you can input a specific IP address, such as "192.168.122.1", or IP addresses within one subnet, such as "192.168.123.*", or "192.168.*.*", or all IP addresses as "*".      
      </li> 
      <li>
        <b>Port or Port Range</b> : For source or destination port range, you can input a specific port, such as "95", or ports within a range, such as "103:315", ">100", or "<65535".
      </li> 
      <li>
        <b>Netmask Bits</b> : It indicates how many bits are for network ID and subnet ID. For example: if the dotted-decimal netmask is 255.255.255.0, then its netmask bits is 24. If the destination is a host, its netmask bits should be 32.
      </li> 
    <p align="right" style="margin-right:20"><input type="button" onClick="onClose()" value="Close" name="Close1">    
        <p>�@</p>
    </td>
  </tr>
</table>
</form>
</body>

</html>

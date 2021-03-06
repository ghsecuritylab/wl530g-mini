<html>
<head>
<title>WL520g</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Expires" content="Fri, Jun 12 1981 00:00:00 GMT">
<meta http-equiv="Cache-control" content="no-cache,must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta name="VI60_defaultClientScript" content="JavaScript">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</HEAD>
<script language="JavaScript">

//each node in the tree is an Array with 4+n positions 
//  node[0] is 0/1 when the node is closed/open
//  node[1] is 0/1 when the folder is closed/open
//  node[2] is 1 if the children of the node are documents 
//  node[3] is the name of the folder
//  node[4]...node[4+n] are the n children nodes

// ***************
// Building the data in the tree
function isMode()
{
   if (parent.titleFrame.document.form.IPConnection_NATEnabled.value == '1')
      mode = 'Gateway';
   else if (parent.titleFrame.document.form.IPConnection_ConnectionType.value == 'IP_Routed')
      mode = 'Router';
   else
      mode = 'AP';
 
   return mode;
}

function isModel()
{
   model = 'WL600';
   pid = parent.titleFrame.document.form.ProductID.value;
   
   if (pid.indexOf("WL500")!=-1) model = 'WL500';
   else if (pid.indexOf("WL300")!=-1) model = 'WL300';
         
   return model;
}

function isBand()
{
   band = 'g';
   pid = parent.titleFrame.document.form.ProductID.value;
   
   if (pid.indexOf("WL500b")!=-1) band = 'b';   
         
   return band;
}


function generateTree()
    {
    var aux1, aux2, aux3, aux4

    mode = isMode();

    foldersTree = folderNode(mode + 'Setting')
    
    aux1 = appendChild(foldersTree, leafNode("主页"))  
    aux1 = appendChild(foldersTree, leafNode("快速安装"))                
    //if (mode == 'AP')
    //{
    //      appendChild(aux1, generateDocEntry(0, "Quick Setup", "Basic_Operation_Content.asp#Wireless", "")) 
    //}
    //else if (mode == 'Gateway')
    //{
    //      appendChild(aux1, generateDocEntry(0, "Quick Setup", "Basic_Operation_Content.asp#Broadband", "")) 
    //}
    //else 
    //{           
    //      appendChild(aux1, generateDocEntry(0, "Quick Setup", "Basic_Operation_Content.asp#WANSetting", ""))                 
    //}       
    	   aux1 = appendChild(foldersTree, leafNode("无线"))
           if (isModel() == 'WL600')    
           {      
              appendChild(aux1, generateDocEntry(0, "界面", "Advanced_Wireless_Content.asp", ""))
              appendChild(aux1, generateDocEntry(0, "t2AES", "Advanced_UniqueKey_Content.asp", ""))
              appendChild(aux1, generateDocEntry(0, "存取控制", "Advanced_ACL_Content.asp",  ""))
           }   
           else
           {
              appendChild(aux1, generateDocEntry(0, "界面", "Advanced_Wireless_Content.asp", ""))               
              //appendChild(aux1, generateDocEntry(0, "Certificate", "Advanced_WCertificate_Content.asp", ""))
              appendChild(aux1, generateDocEntry(0, "无线桥接", "Advanced_WMode_Content.asp", ""))              
              appendChild(aux1, generateDocEntry(0, "存取控制", "Advanced_ACL_Content.asp",  ""))
              appendChild(aux1, generateDocEntry(0, "RADIUS设置", "Advanced_WSecurity_Content.asp", ""))             
              appendChild(aux1, generateDocEntry(0, "高级", "Advanced_WAdvanced_Content.asp", ""))              
           }   
    
    if (mode == 'AP')
    {   
    aux1 = appendChild(foldersTree, leafNode("IP设置"))            
           appendChild(aux1, generateDocEntry(0, "局域网", "Advanced_APLAN_Content.asp", ""))                      
    }       
    else if (mode == 'Gateway')
    {  
    aux1 = appendChild(foldersTree, leafNode("IP设置"))            
           appendChild(aux1, generateDocEntry(0, "广域网 & 局域网（ WAN & LAN ）", "Advanced_LANWAN_Content.asp", ""))                                     
           appendChild(aux1, generateDocEntry(0, "PPPoE区段", "Advanced_MultiPPPoE_Content.asp", ""))                                     
           appendChild(aux1, generateDocEntry(0, "DHCP服务器", "Advanced_DHCP_Content.asp", "")) 
           appendChild(aux1, generateDocEntry(0, "路径", "Advanced_GWStaticRoute_Content.asp", ""))            
           appendChild(aux1, generateDocEntry(0, "其他", "Advanced_DDNS_Content.asp", ""))          

    aux1 = appendChild(foldersTree, leafNode("NAT设置"))   
    	   //if (isModel() == 'WL300')                             
    	   //	appendChild(aux1, generateDocEntry(0, "端口触发",  "Advanced_PortMapping_Content.asp", ""))                  
    	   //else	
    	   appendChild(aux1, generateDocEntry(0, "端口触发",  "Advanced_PortTrigger_Content.asp", ""))            
           appendChild(aux1, generateDocEntry(0, "虚拟服务器",  "Advanced_VirtualServer_Content.asp", ""))      
           appendChild(aux1, generateDocEntry(0, "虚拟DMZ",  "Advanced_Exposed_Content.asp", ""))  
            
    aux1 = appendChild(foldersTree, leafNode("互联网防火墙"))    	  
           appendChild(aux1, generateDocEntry(0, "LAN及WAN过滤器",  "Advanced_Firewall_Content.asp", ""))  
           appendChild(aux1, generateDocEntry(0, " URL过滤器",  "Advanced_URLFilter_Content.asp", ""))
           //appendChild(aux1, generateDocEntry(0, "WAN & WL520g Filter",  "Advanced_LFirewall_Content.asp", ""))      
           
    if (isModel() != 'WL300')    
    {          
       aux1 = appendChild(foldersTree, leafNode("无线防火墙"))
           appendChild(aux1, generateDocEntry(0, "基本设置",  "Advanced_DMZIP_Content.asp", ""))                           
           appendChild(aux1, generateDocEntry(0, "DHCP服务器", "Advanced_DMZDHCP_Content.asp", ""))
	   appendChild(aux1, generateDocEntry(0, "WLAN及WAN过滤器",  "Advanced_DMZDWFilter_Content.asp", ""))                                                                                          
           appendChild(aux1, generateDocEntry(0, "WLAN及WAN过滤器",  "Advanced_DMZDLFilter_Content.asp", ""))                                                                                                                            
    }       
           
      }
    else if (mode == 'Router')
    {
    aux1 = appendChild(foldersTree, leafNode("IP设置"))            
           appendChild(aux1, generateDocEntry(0, "广域网 & 局域网（ WAN & LAN ）", "Advanced_RLANWAN_Content.asp", ""))                          
           appendChild(aux1, generateDocEntry(0, "DHCP服务器", "Advanced_RDHCP_Content.asp", "")) 
           appendChild(aux1, generateDocEntry(0, "其他", "Advanced_RMISC_Content.asp", ""))                          
                   
    aux1 = appendChild(foldersTree, leafNode("路由器"))     
           appendChild(aux1, generateDocEntry(0, "静态路径",  "Advanced_StaticRoute_Content.asp", ""))
           appendChild(aux1, generateDocEntry(0, "动态路径", "Advanced_DynamicRoute_Content.asp", ""))             
           
    aux1 = appendChild(foldersTree, leafNode("互联网防火墙"))               
           appendChild(aux1, generateDocEntry(0, "LAN及WAN过滤器",  "Advanced_Firewall_Content.asp", ""))
           appendChild(aux1, generateDocEntry(0, " URL过滤器",  "Advanced_URLFilter_Content.asp", ""))
           //appendChild(aux1, generateDocEntry(0, "WAN & WL520g Filter",  "Advanced_LFirewall_Content.asp", ""))
    
     if (isModel() != 'WL300')    
     {       
       aux1 = appendChild(foldersTree, leafNode("无线防火墙"))     	            
           appendChild(aux1, generateDocEntry(0, "基本设置",  "Advanced_DMZIP_Content.asp", ""))                         
           appendChild(aux1, generateDocEntry(0, "DHCP服务器", "Advanced_DMZDHCP_Content.asp", ""))   
           appendChild(aux1, generateDocEntry(0, "WLAN及WAN过滤器",  "Advanced_DMZDWFilter_Content.asp", ""))                                                                                          
           appendChild(aux1, generateDocEntry(0, "WLAN及WAN过滤器",  "Advanced_DMZDLFilter_Content.asp", ""))                                                                                          
      }      
  
     }
     
     if (isModel() != 'WL300' && isMode() != 'AP' )    
     {
    	 aux1 = appendChild(foldersTree, leafNode("USB应用程序"))          
           appendChild(aux1, generateDocEntry(0, "FTP服务器", "Advanced_USBStorage_Content.asp", ""))
           appendChild(aux1, generateDocEntry(0, "网络相机", "Advanced_WebCam_Content.asp", ""))
     }      
    
     aux1 = appendChild(foldersTree, leafNode("系统设置"))          
     appendChild(aux1, generateDocEntry(0, "操作模式", "Advanced_OperationMode_Content.asp", "")) 
     appendChild(aux1, generateDocEntry(0, "变更密码", "Advanced_Password_Content.asp",""))
     appendChild(aux1, generateDocEntry(0, "固件升级", "Advanced_FirmwareUpgrade_Content.asp", ""))
     appendChild(aux1, generateDocEntry(0, "设置管理", "Advanced_SettingBackup_Content.asp", ""))
     appendChild(aux1, generateDocEntry(0, "出厂预设值", "Advanced_FactoryDefault_Content.asp", ""))
     //appendChild(aux1, generateDocEntry(0, "Printer Setup", "Advanced_PrinterSetup_Content.asp", ""))
    
    if (mode=='AP')
    {
       aux1 = appendChild(foldersTree, leafNode("状态及历史记录"))
           appendChild(aux1,generateDocEntry(0, "状态", "Main_AStatus_Content.asp", ""))          
           appendChild(aux1,generateDocEntry(0, "无线", "Main_WStatus_Content.asp", ""))
           //appendChild(aux1,generateDocEntry(0, "系统历史记录", "Main_LogStatus_Content.asp", ""))
    }
    else if (mode=='Gateway')
    {
       aux1 = appendChild(foldersTree, leafNode("状态及历史记录"))
           appendChild(aux1,generateDocEntry(0, "状态", "Main_GStatus_Content.asp", ""))          
           appendChild(aux1,generateDocEntry(0, "无线", "Main_WStatus_Content.asp", ""))         
           appendChild(aux1,generateDocEntry(0, "DHCP连线", "Main_DHCPStatus_Content.asp", "")) 
           appendChild(aux1,generateDocEntry(0, "端口转递", "Main_IPTStatus_Content.asp", ""))                    
           appendChild(aux1, generateDocEntry(0, "路由表", "Advanced_RouteStatus_Content.asp", ""))              
           appendChild(aux1,generateDocEntry(0, "系统历史记录", "Main_LogStatus_Content.asp", ""))
    }
    else if (mode=='Router')
    {
       aux1 = appendChild(foldersTree, leafNode("状态及历史记录"))
           appendChild(aux1,generateDocEntry(0, "状态", "Main_RStatus_Content.asp", ""))      
           appendChild(aux1,generateDocEntry(0, "无线", "Main_WStatus_Content.asp", ""))
           appendChild(aux1,generateDocEntry(0, "DHCP连线", "Main_DHCPStatus_Content.asp", ""))            
           appendChild(aux1, generateDocEntry(0, "路由表", "Advanced_RouteStatus_Content.asp", ""))   
           appendChild(aux1,generateDocEntry(0, "系统历史记录", "Main_LogStatus_Content.asp", ""))              
    }
                    
}
    
function clickOnFolderLink(folderName)
{
    mode = isMode();
    
    if (folderName == "主页")
    {
         if (mode == 'AP')
            //top.folderFrame.location="Basic_Operation_Content.asp#Wireless"
            top.folderFrame.location="Main_Index_AccessPoint.asp"
         else if (mode == 'Router')         
            //top.folderFrame.location="Basic_Operation_Content.asp#WANSetting"
            top.folderFrame.location="Main_Index_Router.asp"
         else
            //top.folderFrame.location="Basic_Operation_Content.asp#Wireless"         
            top.folderFrame.location="Main_Index_HomeGateway.asp"
    }
    else if (folderName == "快速安装")
    {
         if (mode == 'AP')
            //top.folderFrame.location="Basic_Operation_Content.asp#Wireless"
            top.folderFrame.location="Basic_AOperation_Content.asp"
         else if (mode == 'Router')         
            //top.folderFrame.location="Basic_Operation_Content.asp#WANSetting"
            top.folderFrame.location="Basic_ROperation_Content.asp"
         else
            //top.folderFrame.location="Basic_Operation_Content.asp#Wireless"         
            top.folderFrame.location="Basic_GOperation_Content.asp"
    }       
    else if (folderName == "无线")
    {
                      
         top.folderFrame.location="Advanced_Wireless_Content.asp" 
       
    }      
    else if (folderName == "IP设置" )
    {
         if (mode == 'AP')
           top.folderFrame.location="Advanced_APLAN_Content.asp"
         else if (mode == 'Router')
           top.folderFrame.location="Advanced_RLANWAN_Content.asp"
         else
           top.folderFrame.location="Advanced_LANWAN_Content.asp"
    }              
    else if (folderName == "互联网防火墙")
         top.folderFrame.location="Advanced_Firewall_Content.asp"                      
    else if (folderName == "无线防火墙")
    {
         top.folderFrame.location="Advanced_DMZIP_Content.asp"     
    }       
    else if (folderName == "USB应用程序")
           top.folderFrame.location="Advanced_USBStorage_Content.asp"
           //top.folderFrame.location="Advanced_WebCam_Content.asp"
    else if (folderName == "路由器")
           top.folderFrame.location="Advanced_StaticRoute_Content.asp"
    else if (folderName == "NAT设置")
    	  //if (isModel() == 'WL300')   
          //    top.folderFrame.location="Advanced_PortMapping_Content.asp"                      
          //else
          top.folderFrame.location="Advanced_PortTrigger_Content.asp"
    else if (folderName == "系统设置")
          if (isModel() == 'WL300')   
              top.folderFrame.location="Advanced_OperationMode_Content.asp" 
          else
              top.folderFrame.location="Advanced_OperationMode_Content.asp"  
    else if (folderName == "状态及历史记录")
    {
         if (mode=='AP') 
                top.folderFrame.location="Main_AStatus_Content.asp"
         else if (mode=='Router')
                top.folderFrame.location="Main_RStatus_Content.asp"
         else        
                top.folderFrame.location="Main_GStatus_Content.asp"
    }            
}    

function clickOnFolderLinkClose(folderName)
{
    mode = isMode();
    
    if (folderName == "快速安装")
    {
         if (mode == 'AP')
            top.folderFrame.location="Basic_Operation_Content.asp#Wireless"
         else if (mode == 'Router')
            top.folderFrame.location="Basic_Operation_Content.asp#WANSetting"
         else
            top.folderFrame.location="Basic_Operation_Content.asp#Broadband"
    }          
}    

// Auxiliary function to build the node
function folderNode(name)
{
    var arrayAux
    
    arrayAux = new Array
    arrayAux[0] = 1
    arrayAux[1] = 1
    arrayAux[2] = 0
    arrayAux[3] = name
            
    return arrayAux
}

// Auxiliary function to build the node
// The entries in arrayAux[4]..array[length-1] are strings built in generate doc entry
function leafNode(name)
    {
    var arrayAux
    arrayAux = new Array
    arrayAux[0] = 0
    arrayAux[1] = 0
    arrayAux[2] = 1
    arrayAux[3] = name
        
    return arrayAux
    }

//this way the generate tree function becomes simpler and less error prone
function appendChild(parent, child)
{    
    parent[parent.length] = child
    return child
}

//these are the last entries in the hierarchy, the local and remote links to html documents
function generateDocEntry(icon, docDescription, link)
    {
    var retString =""
    var szDoc =""
    if (icon==0)
        {
        retString = "<a href='"+link+"' class='wounderline' onClick='return top.checkChanged()' target=folderFrame><img src='./graph/doc.gif' alt='Opens in right frame'"
        szDoc = "<a href='" + link + "' class='wounderline' onClick='return top.checkChanged()' target=folderFrame>" + docDescription + "</a>" 
        }
    else
        {
        retString = "<a href='http://"+link+"' class='wounderline' onClick='return top.checkChanged()' target=_blank><img src='./graph/link.gif' alt='Opens in new window'"
        szDoc = "<a href='" + link + "' class='wounderline' onClick='return top.checkChanged()' target=_blank>" + docDescription + "</a>"
        }
    retString = retString + " border=0></a><td nowrap><font size=-1 face='Arial, Helvetica'>" + szDoc + "</font>"

    return retString
    }


// **********************
// display functions

//redraws the left frame
function redrawTree()
{
    var doc = top.treeFrame.window.document

    mode = isMode();

    doc.clear();                 
    doc.write("<html>");
    doc.write("<head>");
    doc.write("<link rel='stylesheet' type='text/css' href='style.css' media='screen'>");
    doc.write("</head>");   
    doc.write("<body bgcolor='#660066' text='#FFFFFF'>");
    doc.write("<table  width='120' border='0' cellspacing='0' cellpadding='0' height='125'>");
    doc.write("<tr>");
    doc.write("<td>");
    doc.write("<div align='center'>");

    if (mode == 'AP')
       doc.write("<img src='graph/asusLogoA.jpg' width='144' height='66'></div>");
    else if (mode == 'Gateway')
       doc.write("<img src='graph/asusLogoG.jpg' width='144' height='66'></div>");
    else if (mode == 'Router')   
       doc.write("<img src='graph/asusLogoR.jpg' width='144' height='66'></div>");
       
    doc.write("<div align='left'style='margin-left:3'>");

    //if (mode == 'AP')
    //   doc.write("<p height='10' style='font-family: Verdana; font-size: 10pt; font-weight:bold; color:#CCFF00; margin-left: 4'>Access Point</p></div>");
    //else if (mode == 'Gateway')
    //   doc.write("<p height='10' style='font-family: Verdana; font-size: 10pt; font-weight:bold; color:#CCFF00; margin-left: 3'>Home Gateway</p></div>");
    //else if (mode == 'Router')
    //   doc.write("<p height='10' style='font-family: Verdana; font-size: 10pt; font-weight:bold; color:#CCFF00; margin-left: 7'>Router</p></div>");
       
    doc.write("</td>");
    doc.write("</tr>");
    doc.write("</table>");      
    redrawNode(foldersTree, doc, 0, 1, "")     
    doc.close()
    }

//recursive function over the tree structure called by redrawTree
function redrawNode(foldersNode, doc, level, lastNode, leftSide)
    {
    var j=0
    var i=0

if (level>0)
{
    doc.write("<table border=0 cellspacing=0 cellpadding=0>")
    doc.write("<tr><td valign = middle nowrap>")

    doc.write(leftSide)

    if (level>1)
        if (lastNode) //the last 'brother' in the children array
            {
            doc.write("<img src='./graph/lastnode.gif' width=16 height=22>")
            leftSide = leftSide + "<img src='./graph/blank.gif' width=16 height=22>" 
		}
        else
            {
            doc.write("<img src='./graph/node.gif' width=16 height=22>")
            leftSide = leftSide + "<img src='./graph/vertline.gif' width=16 height=22>"
            }

    displayIconAndLabel(foldersNode, doc)
    doc.write("</table>")
}

    if (foldersNode.length > 4 && foldersNode[0]) //there are sub-nodes and the folder is open
        {
        if (!foldersNode[2]) //for folders with folders
            {
            level=level+1
            for (i=4; i<foldersNode.length;i++)
                if (i==foldersNode.length-1)
                    redrawNode(foldersNode[i], doc, level, 1, leftSide)
                else
                    redrawNode(foldersNode[i], doc, level, 0, leftSide)
            }
        else //for folders with documents
            {
            for (i=4; i<foldersNode.length;i++)
                {
                doc.write("<table border=0 cellspacing=0 cellpadding=0 valign=center>")
                doc.write("<tr><td nowrap>")
                doc.write(leftSide)
                if (i==foldersNode.length - 1)
                    doc.write("<img src='./graph/lastnode.gif' width=16 height=22>")
                else
                    doc.write("<img src='./graph/node.gif' width=16 height=22>")
                doc.write(foldersNode[i])
                doc.write("</table>")
                }
            }
        }
    }

//builds the html code to display a folder and its label
function displayIconAndLabel(foldersNode, doc)
    {
    var szOpenIconName = "./graph/openfolder.gif";
    var szCloseIconName = "./graph/closedfolder.gif";
    if (foldersNode[3] == "Access Point")
      {
      szOpenIconName = "./graph/apicon.gif";
      szCloseIconName = "./graph/apicon.gif";
      }
    doc.write("<a href='javascript:top.openBranch(\"" + foldersNode[3] + "\")' onClick='return top.checkChanged()'><img src=")
    if (foldersNode[1])
      doc.write(szOpenIconName + " width=22 height=22 border=noborder></a>")
    else
      doc.write(szCloseIconName + " width=22 height=22 border=noborder></a>")
    doc.write("<td valign=middle align=left nowrap>")
    doc.write("<a href='javascript:top.openBranch(\"" + foldersNode[3] + "\")'  onClick='return top.checkChanged()'>")
    doc.write("<font size=-1 face='Arial, Helvetica' class='wounderline'>"+foldersNode[3]+"</font></a>")
    }

//**********************+
// Recursive functions

//when a parent is closed all children also are
function closeFolders(foldersNode)
    {
    var i=0

    if (!foldersNode[2])
        {
        for (i=4; i< foldersNode.length; i++)
            closeFolders(foldersNode[i])
        }
    foldersNode[0] = 0
    foldersNode[1] = 0
    }

//recursive over the tree structure
//called by openbranch
function clickOnFolderRec(foldersNode, folderName)
{
    var i=0
        
    if (foldersNode[3] == folderName)
    {
        
        if (foldersNode[0])
        {
            closeFolders(foldersNode)           
        }    
        else
        {
            clickOnFolderLink(folderName)
            if (folderName != '快速安装' && folderName != '主页')
            {
               foldersNode[0] = 1
               foldersNode[1] = 1     
            }   
            else
            {
               //closeFolders(foldersTree)
               initializeTree()
            }                                                      
        }            
    }
    else
    {
        if (!foldersNode[2])
        {
            for (i=4; i< foldersNode.length; i++)
            {
                clickOnFolderRec(foldersNode[i], folderName)
            }    
        }       
    }
}

// ********************
// Event handlers

//called when the user clicks on a folder
function openBranch(branchName)
{
    clickOnFolderRec(foldersTree, branchName);
    if (branchName=="WL600 Setting" && foldersTree[0]==0)
    {
        top.folderFrame.location="Main_Index_Content.asp";
    }        
            
    timeOutId = setTimeout("redrawTree()",100);
 
}

//called after this html file is loaded
function initializeTree()
{   
    foldersTree = 0;
    generateTree();
    redrawTree();        
}

function checkChanged()
{
    if (pageChanged == '1')
    {
        if (pageChangedCount==6)
        {          
           //widzard = window.open("Advanced_ShowTime_Widzard.asp", "ShowTime", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no,width=500,height=400");
    	   //if (!widzard.opener) widzard.opener = self;     
    	   pageChangedCount = 0;
    	   ret = 1;
        }   
        else if (pageChangedCount>2)
        {
           ret = confirm('Please, please, please press "Apply" or "Finish" to confirm setting if you DO NOT ignore your changes!!!!!');
        }   
        else
           ret = confirm('Page has been modified, are you sure to ignore changes?');
        
        if (ret)
        {
           pageChanged = 0;
           pageChangedCount = 0;
        }   
        else
        {
           pageChangedCount++;
        }
                         
        
        return ret;
    }   
    else return true;
}

var foldersTree = 0
var timeOutId = 0
var pageChanged = 0;
var pageChangedCount = 0;
var goquick=0;
</script>

<frameset cols="120,506" border="0" framespacing="0" frameborder="0" onLoad="initializeTree()">
<noscript>
<p><b>You are using a browser which does not support JavaScript.</b>
<p>If you are using Netscape 2.01 or later then you can enable JavaScript.<br>
<p>Version 2 or 3: Choose Options|Network Preferences, choose the Languages tab, click Enable Javascript and then click OK.
<P>Version 4: Choose Edit|Preferences|Advanced, click Enable JavaScript and then click OK.
<br>
<P>Note: If you are using Internet Explorer and see this message, then your version does not support JavaScript.  (JavaScript cannot be disabled in Internet Explorer.) Upgrade to 3.1 or later.
<P><HR>
</noscript>
<frame src="Main_List.asp" marginwidth="10" marginheight="0" name="treeFrame">
<frameset rows="80,*" border="0" framespacing="0" on>
<frame src="Title.asp" marginwidth="0" marginheight="0" name="titleFrame" scrolling="no">
<frame src="<% urlcache(); %>" name="folderFrame" marginwidth="0" marginheight="0">
</frameset>
</frameset>
<noframes>
<body bgcolor="#FFFFFF" text="#000000"></body>
</noframes>
</html>
my file
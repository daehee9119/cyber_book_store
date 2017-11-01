<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title> 인터넷 서점 컴북 </title>
<link href="style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript"> 
<!--
var pos = 0;
var a = 0;
var message = new Array();
message[0] = "안녕하세요..";
message[1] = "컴북입니다..";

function typing(){
a = a + 1;
window.status = message[pos].substring(0, a);
if(a == message[pos].length + 5){
  pos = pos + 1;
  a = 0;
  }
if(pos > 1){
  pos = 0;
  }
setTimeout("typing()", 100);
}
//-->
</SCRIPT>
</head>

<body onload="typing();" oncontextmenu='return false' bgcolor="#FFFFFF" topmargin="0">

	<%@ include file="../mall/Top.jsp" %>

<!--//////////////////////////////////////////////////////-->

<table width="800"  align="center" cellspacing="0" style="border-collapse:collapse;">
	
	
    <tr valign="top">
        <td align="left" width="200" style="border-width:1; border-color:black; border-style:none;" height="241">
			<jsp:include page="../mall/Left.jsp" flush="true"/>
		</td>
   
   
        <td  valign="top" width="590" height="716" style="border-width:1; border-color:black; border-style:none;">                                    <CENTER>
               
				<table width="604" cellspacing="0" style="border-collapse:collapse;">
                    <tr>
                        <td width="594" style="border-width:1; border-color:black; border-style:none;">                            <p>
						<img src="../jpg/main_img.gif" width="590" height="188" border="0"></p>
						</td>
                    </tr>
                    <tr>
                        <td width="600" style="border-width:1; border-color:black; border-style:none;" height="25">
                            <p>&nbsp;
						<jsp:include page="../mall/ProductM.jsp" flush="true"/></p>
</td>
                    </tr>
               
                </table>
</CENTER>           
</td>
	</tr>


</table>

<!--//////////////////////////////////////////////////////-->

	<%@ include file="../mall/Bottom.jsp" %>

</body>
</html>  
  
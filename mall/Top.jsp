<%
	String mem_id = (String)session.getAttribute("idKey");

	String log="";
	if(mem_id == null) log ="<a href=../mall/Login.jsp> �α��� </a>";	// �α���(���)
	else log = "<a href=../mall/Logout.jsp> �α׾ƿ� </a>";				// �α׾ƿ�

	String mem="";
	if(mem_id == null) mem ="<a href=../mall/Register.jsp> ȸ������ </a>";
	else mem = "<a href=../mall/MemberUpdate.jsp> �������� </a>";
%>
<script language="JavaScript">

function checkB() {
     if (document.searchB.keyWordB.value == "") 
		{
		 alert("�˻�� �Է��ϼ���.");
		 document.searchB.keyWordB.focus();
		 return;
	    }
	 document.searchB.submit();
 }

 function bookmark(){
  window.external.AddFavorite('http://218.234.13.188:8081/Book/main.jsp', '�������� �ĺ�')
 }

</script>
<title></title>




<table width="800" align="center" topmargin=10 cellspacing="0" style="border-collapse:collapse;">
    <tr>
        <td width="798" height="10" colspan="3" style="border-width:0; border-color:white; border-style:none;"><font size="1">&nbsp;</font></td>
    </tr>
	
    <tr>
        <td width="405" style="border-width:0; border-color:white; border-style:none;" height="40" colspan="2">
            <p><font size="1"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" 
			 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
			 namo_flashbutton width="291" height="39">
            <param name="movie" value="../jpg/banner.swf">
            <param name="play" value="true">
            <param name="loop" value="true">
            <param name="quality" value="high">
            <param name="WMode" value="Transparent">
</object></font></p>

		</td>
<td width="391" height="40" style="border-width:0; border-color:white; border-style:none;">
            <p align="right"><font size="2" color="blue"><A HREF="#" onclick="bookmark()">���ã��</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
			
			<a style="cursor:hand" HREF onClick="this.style.behavior='url(#default#homepage)';
 this.setHomePage('http://218.234.13.188:8081/Book/main.jsp');"><font size="2" color="blue">������������</font></a><font size="2" color="blue">&nbsp;&nbsp;&nbsp;</font><font size="2">&nbsp;</font><font size="1">&nbsp;&nbsp;&nbsp;
</font></p>
</td>
    </tr>
    <tr>
        <td width="798" colspan="3" bgcolor="red" height="4" 
			style="border-width:0; border-color:white; border-style:none;">
            <p><span style="font-size:4pt;">&nbsp;</span></p>
</td>
    </tr>
    <tr>
        <td width="798" colspan="3" bgcolor="#9999FF" bordercolor="#9999FF" style="border-width:0; border-color:white; border-style:none;" height="38">
            <div align="right">
                <table width="362">
                    <tr>
                        <td width="100">  

                            <p align="center">
<font size="2" face="����">														<%= log %> </font><font size="2"></font></p>
</td>
                        <td width="100">

                            <p align="center"><font size="2" face="����">
							<%= mem %></font><font size="2"></font></p>
</td>
                        <td width="100">

                            <p align="center"><font size="2" face="����"><a href="../mall/CartList.jsp">��ٱ��� </a> </font><font size="2"></font></p>
</td>
                        <td width="100">

                            <p align="left"><font size="2" face="����"><a href="../mall/OrderList.jsp">�ֹ������ȸ </a> </font><font size="2"></font></p>
</td>
                        <td width="22">&nbsp;</td>
                </tr>
            </table>       
            </div>
		</td>
    </tr>
    <tr bgcolor="#9999FF">
        <td width="340" height="41" bgcolor="#9999FF" bordercolor="#9999FF" style="border-width:0; border-color:white; border-style:none;">
            <div align="right">

            <form name="searchB" method="post" action="../mall/PList.jsp">
			<table border=0 width="280" cellpadding=0 cellspacing=0>
                <tr bgcolor="#99CC00">
                    <td width="251" height="35" bgcolor="#9999FF">
					   <select name="keyFieldB" size=1>
                            <option value="name">������</option>
                            <option value="juja">��&nbsp;&nbsp;&nbsp;��</option>
					 </select>
					<input type="text" size=16 name="keyWordB"  value="">
					<input type="button"  value="�˻�" onClick="checkB();">	
					<td width="29" bgcolor="#9999FF" height="35">&nbsp;
				</tr>
				</table>
			</form>
            </div>
 
</td>
        <td width="63" height="41" bgcolor="#9999FF" bordercolor="#9999FF" style="border-width:0; border-color:white; border-style:none;">
            <p align="right">
			
			
			&nbsp;</p>
</td>
        <td width="391" height="41" bgcolor="#9999FF" bordercolor="#9999FF" style="border-width:0; border-color:white; border-style:none;">            
		<div align="right">

            <table width="381">
                <tr>
                        <td width="83" height="26">  

                            <p align="center"> 
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" 
			codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" 
			namo_flashbutton width="80" height="30">
                            <param name="movie" value="../jpg/012_btn_2.swf">
                            <param name="play" value="true">
                            <param name="loop" value="true">
                            <param name="quality" value="high">
                            <param name="WMode" value="Transparent">
<embed width="80" height="30" src="../jpg/012_btn_2.swf" play="true" loop="true" quality="high" WMode="Transparent" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></embed></object></p>
</td>
                        <td width="80" height="26">

                            <p align="center">  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" namo_flashbutton width="80" height="30">
                            <param name="movie" value="../jpg/012_btn_3.swf">
                            <param name="play" value="true">
                            <param name="loop" value="true">
                            <param name="quality" value="high">
                            <param name="WMode" value="Transparent">
<embed width="80" height="30" src="../jpg/012_btn_3.swf" play="true" loop="true" quality="high" WMode="Transparent" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></embed></object></p>
</td>
                        <td width="80" height="26">

                            <p align="center">
							<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
							 namo_flashbutton width="80" height="30">
                            <param name="movie" value="../jpg/012_btn_4.swf">
                            <param name="play" value="true">
                            <param name="loop" value="true">
                            <param name="quality" value="high">
                            <param name="WMode" value="Transparent">
<embed width="80" height="30" src="../jpg/012_btn_4.swf" play="true" loop="true" quality="high" WMode="Transparent" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></embed></object></p>
</td>
                        <td width="84" height="26">

                            <p align="center"> <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" namo_flashbutton width="80" height="30">
                            <param name="movie" value="../jpg/012_btn_5.swf">
                            <param name="play" value="true">
                            <param name="loop" value="true">
                            <param name="quality" value="high">
                            <param name="WMode" value="Transparent">
<embed width="80" height="30" src="../jpg/012_btn_5.swf" play="true" loop="true" quality="high" WMode="Transparent" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></embed></object></p>
</td>
                        <td width="31" height="26">

                            <p align="center"> &nbsp;</p>
</td> 
                </tr>
            </table>
            </div>
</td>
    </tr>
    <tr>
        <td width="798" height="10" colspan="3" bgcolor="#9999FF" bordercolor="#9999FF" style="border-width:0; border-color:white; border-style:none;"><font size="1">&nbsp;</font></td>
    </tr>
</table>




<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head>
<title>�ĺϰ���</title>
<link href="../style.css" rel="stylesheet" type="text/css">
</head>

<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("../admin/AdminLogin.jsp");
	}
%>


<body bgcolor="" topmargin="50" bgcolor=>


	<table width="800" align="center" bgcolor="#CCCCCC" cellspacing="0" style="border-collapse:collapse;">
    <tr bordercolor="">
        <td width="356" height="50" align="center" colspan="2" style="border-width:1; border-color:black; border-style:none;" bgcolor="white">
            <p align="left"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" namo_flashbutton width="300" height="40">
            <param name="movie" value="banner_02.swf">
            <param name="play" value="true">
            <param name="loop" value="true">
            <param name="quality" value="high">
            <param name="WMode" value="Transparent">
<embed width="300" height="40" src="banner_02.swf" play="true" loop="true" quality="high" WMode="Transparent" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></embed></object></p>
</td>
        <td width="437" height="50" align="center" style="border-width:1; border-color:black; border-style:none;" bgcolor="white">
			<a href="../admin/AdminLogout.jsp"><font size=5>�α׾ƿ�</font></a>
		</td>
	</tr>
    <tr bordercolor="">
        <td width="796" height="10" align="center" style="border-width:1; border-color:black; border-style:none;" colspan="3" bgcolor="white">&nbsp;</td>
	</tr>
    <tr bordercolor="">
        <td width="195" height="428" align="center" style="border-width:2; border-color:black; border-style:double;" rowspan="10" bgcolor="white">
            <p align="center"><span style="font-size:18pt;">��������</span></p>
</td>
        <td width="598" align="center" style="border-top-width:2; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:double; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" height="40" colspan="2" bgcolor="white">
            <p align="center"><a href="../admin/ProductMgr.jsp" target="_blank"><font size="4">���� ��� ����</font></a></p>
</td>
	</tr>
    <tr bordercolor="">
        <td width="158" height="397" align="center" style="border-top-width:1; border-right-width:1; border-bottom-width:2; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:dotted; border-bottom-style:double; border-left-style:dotted;" rowspan="9" bgcolor="white">

            <p align="center"><font size="4">�������</font></p>
</td>
        <td width="437" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" bgcolor="white">            <p><a href="../admin/ProductInsert1.jsp" target="_blank"><font size="4">�ü��</font></a></p>
</td>
	</tr>
	<tr bordercolor=""> 
        <td width="437" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" bgcolor="white">            <p><a href="../admin/ProductInsert2.jsp" target="_blank"><font size="4">�����ͺ��̽�</font></a></p>
</td>
	</tr>
	<tr bordercolor=""> 
        <td width="437" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" bgcolor="white">            <p><a href="../admin/ProductInsert3.jsp" target="_blank"><font size="4">�׷���</font></a></p>
</td>
	</tr>
	<tr bordercolor=""> 
        <td width="437" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" bgcolor="white">            <p><a href="../admin/ProductInsert4.jsp" target="_blank"><font size="4">��/Ȩ������</font></a></p>
</td>
	</tr>
	<tr bordercolor=""> 
        <td width="437" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" bgcolor="white">            <p><a href="../admin/ProductInsert5.jsp" target="_blank"><font size="4">���α׷���</font></a></p>
</td>
	</tr>
	<tr bordercolor=""> 
        <td width="437" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" bgcolor="white">            <p><a href="../admin/ProductInsert6.jsp" target="_blank"><font size="4">��ǻ�Ͱ���</font></a></p>
</td>
	</tr>
	<tr bordercolor=""> 
        <td width="437" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" bgcolor="white">            <p><a href="../admin/ProductInsert7.jsp" target="_blank"><font size="4">�Թ�/Ȱ��</font></a></p>
</td>
	</tr>
    <tr bordercolor="">
        <td width="437" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" bgcolor="white">            
            <p><a href="../admin/ProductInsert8.jsp" target="_blank"><font size="4">�ڰ�/���輭</font></a></p>
</td>
	</tr>
	<tr bordercolor=""> 
        <td width="437" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:2; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:double; border-left-style:dotted;" bgcolor="white">            <p><a href="../admin/ProductInsert10.jsp" target="_blank"><font size="4">�Ⱓ��������</font></a></p>
</td>
	</tr>
    <tr bordercolor="">
        <td height="157" align="center" width="195" style="border-width:2; border-color:black; border-style:double;" rowspan="6" bgcolor="white">
            <p align="center"><span style="font-size:18pt;">�Խ��ǰ���</span></p>
</td>
        <td width="598" height="40" align="center" style="border-top-width:2; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:double; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" colspan="2" bgcolor="white">
            <p align="center"><a href="../board_2/board_list.jsp" target="_blank"><font size="4">�ڷ��</font><font size="4">/�ڷ��</font></a></p>
</td>
	</tr>
    <tr bordercolor="">
        <td width="598" height="40" align="center" colspan="2" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" bgcolor="white"><a href="../board_4/AList.jsp" target="_blank"><font size="4">Q &amp; A</font></a></td>
	</tr>
	<tr bordercolor=""> 
        <td width="598" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" colspan="2" bgcolor="white">
            <p align="center"><a href="../board_5/AList.jsp" target="_blank"><font size="4">F A Q</font></a></p>
</td>
	</tr>
	<tr bordercolor=""> 
        <td width="598" height="40" align="center" colspan="2" bgcolor="white" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;"><a href="../board_1/AList.jsp" target="_blank"><font size="4">��������</font></a></td>
	</tr>
	<tr bordercolor=""> 
        <td width="598" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:1; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:dotted; border-left-style:dotted;" colspan="2" bgcolor="white">
            <p align="center"><a href="../board_3/JujaList.jsp" target="_blank"><font size="4">��ȹ/�������</font></a></p>
</td>
	</tr>
	<tr bordercolor=""> 
        <td width="598" height="40" align="center" style="border-top-width:1; border-right-width:2; border-bottom-width:2; border-left-width:1; border-color:black; border-top-style:dotted; border-right-style:double; border-bottom-style:double; border-left-style:dotted;" colspan="2" bgcolor="white">
            <p align="center"><a href="../board_6/List.jsp" target="_blank"><font size="4">����������û</font></a></p>
</td>
	</tr>
	<tr bordercolor=""> 
        <td height="39" align="center" width="195" style="border-width:2; border-color:black; border-style:double;" bgcolor="white">

            <p align="center"><span style="font-size:18pt;">�ֹ�����</span></p>
</td>
        <td width="598" height="40" align="center" style="border-width:2; border-color:black; border-style:double;" colspan="2" bgcolor="white">
            <p align="center"><a href="../admin/OrderMgr.jsp" target="_blank"><font size="4">�����ֹ�/��۰���</font></a></p>
</td>
	</tr>
	<tr bordercolor=""> 
        <td height="40" align="center" width="195" style="border-width:2; border-color:black; border-style:double;" bgcolor="white">
            <p align="center"><span style="font-size:18pt;"><font color="#666666">��������</font></span></p>
</td>
        <td width="598" height="40" align="center" style="border-width:2; border-color:black; border-style:double;" colspan="2" bgcolor="white">
            <p align="center"><a href="http://" target="_blank"><font size="4" color="#666666">��������</font></a></p>
</td>
	</tr>
    <tr bordercolor="">
        <td width="195" height="40" align="center" style="border-width:2; border-color:black; border-style:double;" bgcolor="white">

            <p align="center"><span style="font-size:18pt;">ȸ������</span></p>
</td>
        <td width="598" align="center" style="border-width:2; border-color:black; border-style:double;" height="40" colspan="2" bgcolor="white">

            <p align="center"><a href="../admin/MemberMgr.jsp" target="_blank"><font size="4">ȸ������</font></a></p>
</td>
	</tr>
	</table>



</body>
</html>    
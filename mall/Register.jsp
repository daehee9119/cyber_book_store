<%@ page contentType="text/html;charset=EUC-KR"%>
<html>
<head>
<title> �ĺ� ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="" topmargin="0">

	<%@ include file="../mall/Top.jsp" %>

<center>	
	<table width="800" align="center" bgcolor="">
	
		<form bgcolor="#FFFFff" name="regForm" method="post" action="../mall/MemberInsert.jsp">
        <tr align="center">
            <td height="81" width="694" colspan="3">
                <p align="left">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../jpg/fall.gif" width="319" height="69" border="0"></p>
			</td>
			</tr>
			<tr> 
            <td width="42" height="30">&nbsp;</td>
            <td width="118" height="30">
                <p align="justify">���̵�</p>
</td>
            <td width="526" height="30"><input type="text" name="mem_id" size="15">				
				<A HREF="#" onclick="idCheck(mem_id.value);">			
				<img src="../jpg/idok.gif" width="90" height="20" border="0">
				</a>
				<!--input type="button" value="ID�ߺ�Ȯ��" onclick="idCheck(this.form.mem_id.value)"-->
			</td>
			</tr>
			<tr> 
            <td width="42" height="30">&nbsp;</td>
            <td width="118" height="30">
                <p align="justify">�н�����</p>
</td>
            <td width="526" height="30">
                 <p><input type="password" name="mem_passwd" size="15"> 
				Ȯ�� <input type="password" name="mem_repasswd" size="15"> </p>
                
</td>
			</tr>
			<tr> 
            <td width="42" height="30">&nbsp;</td>
            <td width="118" height="30">
                <p align="justify">�̸�</p>
</td>
				<td width="526" height="30"><input type="text" name="mem_name" size="15"> </td>
			</tr>
			<tr> 
            <td width="42" height="31">&nbsp;</td>
            <td width="118" height="31">
                <p align="justify">�ֹε�Ϲ�ȣ</p>
</td>
				<td width="526" height="31"><input type="text" name="mem_num1" size="6">-
				<input type="password" name="mem_num2" size="7"></td>
			</tr>
			<tr> 
            <td width="42" height="29">&nbsp;</td>
            <td width="118" height="29">
                <p align="justify">�̸���</p>
</td>
				<td width="526" height="29"><input type="text" name="mem_email" size="27"> </td>
			</tr>
			<tr>  
            <td width="42" height="30">&nbsp;</td>
            <td width="118" height="30">
                <p align="justify">��ȭ��ȣ</p>
</td>
				<td width="526" height="30"><input type="text" name="mem_phone" size="20">
				&nbsp;&nbsp;012-2345-7777
				</td>
			</tr>
			<tr>  
            <td width="42" height="30">&nbsp;</td>
            <td width="118" height="30">
                <p align="justify">�����ȣ</p>
</td>
            <td width="526" height="30">
			<input type="text" name="mem_zipcode" size="7">
			&nbsp;
			<A HREF="#" onclick="zipCheck()">
			<img src="../jpg/post.gif" width="80" height="20" border="0"></a>
			
			</td>
			</tr>
			<tr>  
            <td width="42" height="30">&nbsp;</td>
            <td width="118" height="30">
                <p align="justify">�ּ�</p>
</td>
				<td width="526" height="30"><input type="text" name="mem_address" size="77"></td>
			</tr>
			<tr>  
            <td width="42" height="30">&nbsp;</td>
            <td width="118" height="30">
                <p align="justify">��α�</p>
</td>
				<td width="526" height="30"><input type="text" name="mem_blog" size="60" value="http://blog."></td>
			</td>

			</tr>
		<tr> 
            <td align="center" width="42">&nbsp;</td>
            <td colspan="2" align="center" width="648"> 
				<A HREF="#" onclick="inputCheck();">
				<img src="../jpg/regis_submit_bt.gif" align=absmiddle width="127" height="42" border="0"></A>
				&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
				
				<A HREF="#" onclick="history.go(-1);">
				<img src="../jpg/regis_cancle_bt.gif" width="127" height="42" border="0">
				</A>
			</td>
		</tr>
		</form>
	</table>
&nbsp;</center>

<br><br><br><br><br>
	<%@ include file="../mall/Bottom.jsp" %>

</body>
</html> 


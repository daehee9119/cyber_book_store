<%@ page contentType="text/html;charset=EUC-KR" %>

<html>
<head>
<title>�ĺ� ���� ���</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("../admin/AdminLogin.jsp");
	}
%>

<body bgcolor="#ffffff" topmargin="20">


	<table width="800" align="center" bgcolor="white">
	<tr> 
	<td align="center" bgcolor="#FFFFff">

		<form name="regForm" method="post" action="ProductProc.jsp?flag=insert" enctype="multipart/form-data">
			<table width="800" align="center" bgcolor="white" border="1">
			<tr bgcolor="#996600"> 
                        <td colspan="2" align="center" bgcolor="yellow">
                            <p align="center"><b><font size="7" color="red">���� ���</font></b></p>
</td>
			</tr>
			<tr> 
			<td align="center" width="104" bgcolor="#99CCCC">�����з�</td>
			<td align="left" width="523" bgcolor="#FFCC99">
				<input type="text" name="code" size="20" value="�Ⱓ����">
			</td>
			</tr>
			<tr> 
                        <td align="center" width="104" bgcolor="#99CCCC">��&nbsp;�� ��</td>
			<td align="left" width="523" bgcolor="#FFCC99"><input type="text" name="name" size="20"></td>
			</tr>
			<tr> 
                        <td align="center" width="104" bgcolor="#99CCCC">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
			<td align="left" width="523" bgcolor="#FFCC99"><input type="text" name="juja" size="20"></td>
			</tr>
			<tr> 
                        <td align="center" width="104" bgcolor="#99CCCC">�� �� ��</td>
			<td align="left" width="523" bgcolor="#FFCC99"><input type="text" name="chool" size="20" value="�ĺ�"></td>
			</tr>

			<tr> 
			<td align="center" width="104" bgcolor="#99CCCC">��������</td>
                        <td width="523" bgcolor="#FFCC99">
                            <p align="left"><textarea rows="10" cols="70" name="detail"></textarea></p>
</td>
			</tr>
<tr> 
			<td align="center" width="104" bgcolor="#99CCCC">��������</td>
                        <td width="523" bgcolor="#FFCC99"><input type="text" name="price" size="10" maxlength="6" value=" "> ��</td>
			</tr>
<tr> 
                        <td width="104" align="center" bgcolor="#99CCCC">                            <p>��������</p>
</td>
                        <td width="523" bgcolor="#FFCC99">
                                               <p><input type="text" name="day" size="10" maxlength="8">  (ex: YYYY-MM) ������</p>
</td>
			</tr>
			<tr> 
			<td align="center" width="104" bgcolor="#99CCCC">I S B N</td>
			<td width="523" bgcolor="#FFCC99"><input type="text" name="isbn" size="10" maxlength="10"></td>
			</tr>
			<tr> 
                        <td align="center" width="104" height="29" bgcolor="#99CCCC">�� Ŀ&nbsp;��</td>
			<td width="523" height="29" bgcolor="#FFCC99"><input type="file" name="image"></td>
			</tr>
			<tr> 
			<td colspan="2" align="center" width="633" bgcolor="yellow" height="49"> 
				<input type="button" value="�������" onclick="inputCheck2();">&nbsp;&nbsp;&nbsp;
				<input type="reset" value="�ٽþ���">
			</td>
			</tr>
			</table>
		</form>
	
	</td>
	</tr>
	</table>


</body>
</html>


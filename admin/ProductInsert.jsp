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


<body bgcolor="#ffffff" topmargin="0">


	<table width="800" align="center" bgcolor="white">
	<tr> 
	<td align="center" bgcolor="#FFFFff">

		<form method="post" action="ProductProc.jsp?flag=insert" enctype="multipart/form-data">
			<table width="95%" align="center" bgcolor="white" border="1">
			<tr bgcolor="#996600"> 
			<td colspan="2" align="center" bgcolor="yellow" width=""><b>
			<font size="7" color="red">���� ���</font></b></td>
			</tr>
			<tr> 
			<td align="center" width="104" bgcolor="#99CCCC">�����з�</td>
			<td align="left" width="523" bgcolor="#FFCC99">
				<select name="code" size="1">
					<option selected value="0">�����ϼ���</option>
					<option value="�ü��">�ü��</option>
					<option value="�����ͺ��̽�">�����ͺ��̽�</option>
					<option value="�׷���">�׷���</option>
					<option value="��/Ȩ������">��/Ȩ������</option>
					<option value="�Թ�/Ȱ��">�Թ�/Ȱ��</option>
					<option value="��ǻ�Ͱ���">��ǻ�Ͱ���</option>
					<option value="���α׷���">���α׷���</option>
					<option value="�ڰ�/���輭">�ڰ�/���輭</option>
				</select>
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
                        <td width="523" bgcolor="#FFCC99"><input type="text" name="day" size="10" maxlength="8"> (ex: YYYY-MM)</td>
			</tr>
			<tr> 
			<td align="center" width="104" bgcolor="#99CCCC">��������</td>
			<td width="523" bgcolor="#FFCC99"><input type="text" name="stock" size="10" value="10000">��</td>
			</tr>
			<tr> 
			<tr> 
			<td align="center" width="104" bgcolor="#99CCCC">��������</td>
			<td width="523" bgcolor="#FFCC99"><input type="text" name="price" size="10" maxlength="6">��</td>
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
				<input type="submit" value="�������">&nbsp;&nbsp;&nbsp;
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


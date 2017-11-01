<%@ page contentType="text/html;charset=EUC-KR" %>

<html>
<head>
<title>컴북 관리자 로그인</title>
<link href="../mall/style.css" rel="stylesheet" type="text/css">
</head>
<body background="../jpg/texture02_red.gif" bgcolor="#ffffff" topmargin="100">


	<table width="375" align="center" bgcolor="#FFFFff" background="../jpg/texture02_red.gif">
	<tr bordercolor="#FFFFff">  
	<td height="190" width="369">
	
		<form method="post" action="../admin/AdminLoginProc.jsp">
			<table width="50%" align="center" cellspacing="0" style="border-collapse:collapse;">
				<tr bordercolor="#FFFFff"> 
                        <td colspan="2" align="center" style="border-width:1; border-color:black; border-style:none;"><b><span style="font-size:28pt;"><font color="#99FF00">ComBook</font></span> </b></td>
				</tr>
				<tr> 
				<td width="47%" align="center" style="border-width:1; border-color:black; border-style:none;"><b>Admin ID</b></td>
				<td width="53%" align="center" style="border-width:1; border-color:black; border-style:none;"><input type="password" name="admin_id"></td>
				</tr>
				<tr> 
				<td align="center" style="border-width:1; border-color:black; border-style:none;"><b>Password</b></td>
				<td align="center" style="border-width:1; border-color:black; border-style:none;">
				<input type="password" name="admin_passwd"></td>
				</tr>
				<tr> 
                        <td colspan="2" align="center" style="border-width:1; border-color:black; border-style:none;">								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value="LogIn" border="0">&nbsp;&nbsp; 
				<input type="reset" value="Reset">				</td>
				</tr>
			</table>
		</form>
		
	</td>
	</tr>
	</table>

	
</body>
</html>
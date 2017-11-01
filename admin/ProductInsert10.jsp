<%@ page contentType="text/html;charset=EUC-KR" %>

<html>
<head>
<title>컴북 도서 등록</title>
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
                            <p align="center"><b><font size="7" color="red">도서 등록</font></b></p>
</td>
			</tr>
			<tr> 
			<td align="center" width="104" bgcolor="#99CCCC">도서분류</td>
			<td align="left" width="523" bgcolor="#FFCC99">
				<input type="text" name="code" size="20" value="출간예정">
			</td>
			</tr>
			<tr> 
                        <td align="center" width="104" bgcolor="#99CCCC">도&nbsp;서 명</td>
			<td align="left" width="523" bgcolor="#FFCC99"><input type="text" name="name" size="20"></td>
			</tr>
			<tr> 
                        <td align="center" width="104" bgcolor="#99CCCC">저&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자</td>
			<td align="left" width="523" bgcolor="#FFCC99"><input type="text" name="juja" size="20"></td>
			</tr>
			<tr> 
                        <td align="center" width="104" bgcolor="#99CCCC">출 판 사</td>
			<td align="left" width="523" bgcolor="#FFCC99"><input type="text" name="chool" size="20" value="컴북"></td>
			</tr>

			<tr> 
			<td align="center" width="104" bgcolor="#99CCCC">도서설명</td>
                        <td width="523" bgcolor="#FFCC99">
                            <p align="left"><textarea rows="10" cols="70" name="detail"></textarea></p>
</td>
			</tr>
<tr> 
			<td align="center" width="104" bgcolor="#99CCCC">도서가격</td>
                        <td width="523" bgcolor="#FFCC99"><input type="text" name="price" size="10" maxlength="6" value=" "> 원</td>
			</tr>
<tr> 
                        <td width="104" align="center" bgcolor="#99CCCC">                            <p>출판일자</p>
</td>
                        <td width="523" bgcolor="#FFCC99">
                                               <p><input type="text" name="day" size="10" maxlength="8">  (ex: YYYY-MM) 예정일</p>
</td>
			</tr>
			<tr> 
			<td align="center" width="104" bgcolor="#99CCCC">I S B N</td>
			<td width="523" bgcolor="#FFCC99"><input type="text" name="isbn" size="10" maxlength="10"></td>
			</tr>
			<tr> 
                        <td align="center" width="104" height="29" bgcolor="#99CCCC">북 커&nbsp;버</td>
			<td width="523" height="29" bgcolor="#FFCC99"><input type="file" name="image"></td>
			</tr>
			<tr> 
			<td colspan="2" align="center" width="633" bgcolor="yellow" height="49"> 
				<input type="button" value="도서등록" onclick="inputCheck2();">&nbsp;&nbsp;&nbsp;
				<input type="reset" value="다시쓰기">
			</td>
			</tr>
			</table>
		</form>
	
	</td>
	</tr>
	</table>


</body>
</html>


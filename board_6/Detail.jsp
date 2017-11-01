<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, mall.*"%>
<jsp:useBean id="DB" class="mall.BookMgr" />

<html>
<head>
<title>도서증정신청</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script>
	function Delete(no) {
		document.del.no.value=no;
		document.del.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" topmargin="100">

	
	<%BookBean jujaB = DB.getBook(request.getParameter("no"));%>

	<table width="800" align="center" bgcolor="##CCFF33">
	<tr> 
	<td align="center" bgcolor=#CCCC99>

		<table width="100%" align="center" bgcolor=#CCCC99 border="1">
		<tr bgcolor="#996600"> 
		<td colspan="3" align="center" width="744"><font color="#FFFFFF"></font></td>
		</tr>
		<tr> 
                    <td width="28%">		
                        <p align="center"><%=jujaB.getName()%></p>
		</td>
                    <td width="28%" >

                        <p align="center"><%=jujaB.getPhone()%></p>
		</td>
                    <td width="41%" >
                        <p align="center"><%=jujaB.getEmail()%></p>
</td>
		</tr>
		<tr> 
	                <td align="center" colspan="3" width="744"><%=jujaB.getContent1()%></td>
		</tr>
		<tr> 
                    <td align="center" colspan="3" width="744"><%=jujaB.getContent2()%></td>
		</tr>
		
		<tr> 
		</tr>
		<tr> 
		<td colspan="3" align="center" width="744">
		<a href="mailto:<%=jujaB.getEmail()%>">메일보내기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:Delete('<%=jujaB.getNum()%>')">삭제하기</a>
		</td>
		</tr>
		</table>

	</td>
	</tr>
	</table>



	<form name="del" method="post" action="../board_6/InsertProc.jsp?flag=delete">
	<input type=hidden name=no>
	</form>


</body>
</html>



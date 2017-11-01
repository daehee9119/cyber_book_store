<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, mall.*"%>
<jsp:useBean id="juja" class="mall.JujaMgr" />

<html>
<head>
<title>출판 신청 목록</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script>
	function JujaDelete(no) {
		document.del.no.value=no;
		document.del.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" topmargin="100">

	
	<%JujaBean jujaB = juja.getJuja(request.getParameter("no"));%>

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
                    <td align="center" colspan="3" width="744"><%=jujaB.getContent3()%></td>
		</tr>
		<tr> 
                    <td align="center" colspan="3" width="744">파일</td>
		</tr>
		<tr> 
		<td colspan="3" align="center" width="744">
		<a href="mailto:<%=jujaB.getEmail()%>">메일보내기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:JujaDelete('<%=jujaB.getNum()%>')">삭제하기</a>
		</td>
		</tr>
		</table>

	</td>
	</tr>
	</table>



	<form name="del" method="post" action="../board_3/JujaInsertProc.jsp?flag=delete">
	<input type=hidden name=no>
	</form>


</body>
</html>



<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*, mall.*"%>
<!-- 상품과 관련하여 처리를 담당할 빈을 생성 -->
<jsp:useBean id="juja" class="mall.JujaMgr" />

<html>
<head>
<title>출판 신청 목록</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function JujaDetail(no) {
		document.detail.no.value=no;
		document.detail.submit();
	}
</script>
</head>
 
<body oncontextmenu='return false' bgcolor="#ffFFFF" topmargin="100">

	<% //상품목록을 가져온다. 이처럼 여러 정보를 담아오기 위해 Vector를 사용%>
	<%Vector vResult = juja.getJujaList();%>

	<table width="800" align="center" bgcolor="#CCFF33">
	<tr> 
		<td>

		<table width="100%" align="center" bgcolor="">
		<tr>
			<td align="center"><B>성명</B></td>
			<td align="center"><B>전화번호</B></td>
			<td align="center"><B>이메일</B></td>
		</tr>

		<%
		for(int i=0; i<vResult.size(); i++){
			JujaBean jujaB = (JujaBean)vResult.get(i);
		%>

		<tr bgcolor=#CCCC99> 
			<td align="center"> <A HREF="javascript:JujaDetail('<%=jujaB.getNum()%>')"> <%=jujaB.getName()%> </A>  </td>
			<td align="center"> <%=jujaB.getPhone()%> </td>
			<td align="center"> <%=jujaB.getEmail()%> </td>
		</tr>
		<%}%>
		</table>

		</td>
	</tr>
	</table>

	
	<form name="detail" method="post" action="../board_3/JujaDetail.jsp">
	<input type="hidden" name="no">
	</form>

</body>
</html>


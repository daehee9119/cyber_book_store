<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*, mall.*"%>
<!-- ��ǰ�� �����Ͽ� ó���� ����� ���� ���� -->
<jsp:useBean id="juja" class="mall.JujaMgr" />

<html>
<head>
<title>���� ��û ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function JujaDetail(no) {
		document.detail.no.value=no;
		document.detail.submit();
	}
</script>
</head>
 
<body oncontextmenu='return false' bgcolor="#ffFFFF" topmargin="100">

	<% //��ǰ����� �����´�. ��ó�� ���� ������ ��ƿ��� ���� Vector�� ���%>
	<%Vector vResult = juja.getJujaList();%>

	<table width="800" align="center" bgcolor="#CCFF33">
	<tr> 
		<td>

		<table width="100%" align="center" bgcolor="">
		<tr>
			<td align="center"><B>����</B></td>
			<td align="center"><B>��ȭ��ȣ</B></td>
			<td align="center"><B>�̸���</B></td>
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


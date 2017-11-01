<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, mall.*"%>
<jsp:useBean id="juja" class="mall.BookMgr" />

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
 
<body bgcolor="#ffffff" topmargin="0">



	<table width="800" align="center" bgcolor="#FFFFff">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">
 
		<table width="800" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td align="center"><font color="#FFFFFF">이름</font></td>
		<td align="center">&nbsp;</font></td>
		</tr>
		<%
		Vector vResult= juja.getJujaList();
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="5">등록된 내용 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i<vResult.size(); i++){
			JujaBean jujaB = (JujaBean)vResult.get(i);
		%>
		<tr> 
		<td align="center"><%=jujaB.getName()%></td>
		<td align="center"><a href="javascript:Detail('<%=jujaB.getNum()%>')">상세보기</a></td>
		</tr>
		<%}
		}%>
		</table>
		
	</td>
	</tr>
	</table>

	
	<form name="detail" method="post" action="../board_6/Detail.jsp" >
		<input type="hidden" name="no">
	</form>

</body>
</html>
   
<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, mall.*"%>
<jsp:useBean id="memMgr" class="mall.MemberMgr" />

<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("../admin/AdminLogin.jsp");
	}
%>

<html>
<head>
<title>컴북 회원관리</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#ffffff" topmargin="20">

	<%Vector vResult= memMgr.getMemberList();%>

	<table width="800" align="center" bgcolor="#FFFFff">
	<tr> 
	<td align="center" bgcolor="#FFFFff">

		<table width="799" align="center" bgcolor="#FFFFff" cellspacing="0" style="border-collapse:collapse;">
		<tr bgcolor="#ffffff"> 
		<td align="center" width="127" style="border-width:1; border-color:black; border-style:none;" bgcolor="#CCCC66"><font size="5" color="#0033FF">이름</font></td>
                    <td align="center" width="128" style="border-width:1; border-color:black; border-style:none;" bgcolor="#CCCC66"><font size="5" color="#0033FF">I.D.</font></td>
                    <td align="center" width="129" style="border-width:1; border-color:black; border-style:none;" bgcolor="#CCCC66"><font size="5" color="#0033FF">P/W</font></td>
		<td align="center" width="139" style="border-width:1; border-color:black; border-style:none;" bgcolor="#CCCC66"><font size="5" color="#0033FF">전화번호</font></td> 
		<td align="center" width="187" style="border-width:1; border-color:black; border-style:none;" bgcolor="#CCCC66"><font size="5" color="#0033FF">이메일</font></td>
		<td align="center" width="70" style="border-width:1; border-color:black; border-style:none;" bgcolor="#CCCC66"><font size="5" color="#0033FF">삭제</font></td>
		</tr>
		<%
		for(int i=0; i<vResult.size(); i++){
		RegisterBean regBean = (RegisterBean)vResult.get(i);
		%>
		<tr> 
		<td align="center" bgcolor="#99FFCC" width="127" style="border-width:1; border-color:black; border-style:none;"><%=regBean.getMem_name()%></td>
		<td align="center" bgcolor="#99FFCC" width="128" style="border-width:1; border-color:black; border-style:none;">
			<a href="javascript:Update('<%=regBean.getMem_id()%>')">
			<%=regBean.getMem_id()%></a></td>
		<td align="center" bgcolor="#99FFCC" width="129" style="border-width:1; border-color:black; border-style:none;"><%=regBean.getMem_passwd()%></td>
		<td align="center" bgcolor="#99FFCC" width="139" style="border-width:1; border-color:black; border-style:none;"><%=regBean.getMem_phone()%></td>
		<td align="center" bgcolor="#99FFCC" width="187" style="border-width:1; border-color:black; border-style:none;"><%=regBean.getMem_email()%></td>
		<td align="center" bgcolor="#99FFCC" width="70" style="border-width:1; border-color:black; border-style:none;">
			<a href="javascript:Del('<%=regBean.getMem_id()%>')">삭제</a></td>
		</tr>
		<%}%>
		</table>
	</td>
	</tr>
	</table>

	

	<form name="update" method="post" action="../admin/MemberUpdate.jsp">
	<input type=hidden name="mem_id">
	</form>

	<form  name="del" method="post" action="../admin/MemberDelProc.jsp">
		<input type=hidden name="mem_id">
	</form>
</body>
</html>

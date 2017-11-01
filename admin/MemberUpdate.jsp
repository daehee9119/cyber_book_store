<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import ="java.util.*,mall.*" %> 
<% 
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="memMgr" class="mall.MemberMgr" />


<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("../admin/AdminLogin.jsp");
	}
%>


<html>
<head>
<title>회원수정</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#ffffff">
<br>

	<%
	String mem_id = request.getParameter("mem_id");
	RegisterBean regBean= memMgr.getMember(mem_id);
	%>
	 
	<table width="800" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="100%" align="center" bgcolor="#FFFF99" cellspacing="0" style="border-collapse:collapse;">
		<form name="regForm" method="post" action="../admin/MemberUpdateProc.jsp">
		<tr align="center" bgcolor="#996600"> 
		<td colspan="3" bgcolor="#0099FF" width="783" height="33" style="border-width:1; border-color:rgb(0,102,255); border-style:none;"><font color="#FFFFFF">
		<b> <%=regBean.getMem_name()%> 회원님(<%=regBean.getMem_id()%>)의 정보를 수정합니다.</b></font> </td>
		</tr>
		<tr> 
                    <td bgcolor="#CCCC99" width="93" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30">
                        <p align="right">아이디</p>
</td>
		<td bgcolor="#CCCC99" width="681" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30"><%=regBean.getMem_id()%></td>
		</tr>
		<tr> 
                    <td bgcolor="#CCCC99" width="93" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30">
                        <p align="right">패스워드</p>
</td>
		<td bgcolor="#CCCC99" width="681" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30"><input type="text" name="mem_passwd" value="<%=regBean.getMem_passwd()%>"></td>
		</tr>
		<tr> 
                    <td bgcolor="#CCCC99" width="93" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30">
                        <p align="right">이름</p>
</td>
		<td bgcolor="#CCCC99" width="681" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30"><input type="text" name="mem_name" value="<%=regBean.getMem_name()%>"></td>
		</tr>
		<tr> 
                    <td bgcolor="#CCCC99" width="93" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30">
                        <p align="right">주민번호</p>
</td>
		<td bgcolor="#CCCC99" width="681" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30"><input type="password" name="mem_num1" size="6" value="<%=regBean.getMem_num1()%>">-
		<input type="password" name="mem_num2" size="7"	value="<%=regBean.getMem_num2()%>"></td>
		</tr>
		<tr> 
                    <td bgcolor="#CCCC99" width="93" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30">
                        <p align="right">이메일</p>
</td>
		<td bgcolor="#CCCC99" width="681" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30"><input type="text" name="mem_email"  size="30" value="<%=regBean.getMem_email()%>"></td>
		</tr>
		<tr> 
                    <td bgcolor="#CCCC99" width="93" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30">
                        <p align="right">전화번호</p>
</td>
		<td bgcolor="#CCCC99" width="681" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30"><input type="text" name="mem_phone" value="<%=regBean.getMem_phone()%>"></td>
		</tr>
		<tr> 
                    <td bgcolor="#CCCC99" width="93" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30">
                        <p align="right">우편번호</p>
</td>
		<td bgcolor="#CCCC99" width="681" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30"><input type="text" name="mem_zipcode" value="<%=regBean.getMem_zipcode()%>">
		&nbsp;<a href="#" onClick="zipCheck();"><img src="../jpg/post.gif" width="80" height="20" border="0"></a>
		</td>
		</tr>
		<tr> 
                    <td bgcolor="#CCCC99" width="93" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30">
                        <p align="right">주소</p>
</td>
		<td bgcolor="#CCCC99" width="681" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30"><input type="text" name="mem_address" size="50" value="<%=regBean.getMem_address()%>"></td>
		</tr>
		<tr> 
                    <td bgcolor="#CCCC99" width="93" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30">
                        <p align="right">블로그</p>
</td>
		<td bgcolor="#CCCC99" width="681" style="border-width:1; border-color:rgb(0,102,255); border-style:none;" height="30"><input type="text" name="mem_blog" size="70" value="<%=regBean.getMem_blog()%>">
		</td>
		</tr>
		<tr> 
		<td colspan="2" align="center" bgcolor="#0099FF" width="780" style="border-width:1; border-color:rgb(0,102,255); border-style:none;">
		<input type="submit" value="수정완료"> 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<input type="reset" value="다시쓰기"> 
		</td>
		</tr>
		<input type="hidden" name="mem_id" value="<%=mem_id%>">
		</form>
		</table>

	</td>
	</tr>
	</table>
	
		
</body>
</html>

<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import ="java.util.*,mall.*" %> 
<% 
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="memMgr" class="mall.MemberMgr" />


<html>
<head>
<title>ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#CCFFFF">
<br>

	<%@ include file="Top.jsp" %>
	<%RegisterBean regBean= memMgr.getMember(mem_id);%>
	
	<table width="75%" align="center" bgcolor="#CCCCFF">
	<tr> 
	<td align="center" bgcolor="#CCCCFF">

		<table width="95%" align="center" bgcolor="#CCCCFF" border="1">
		<form name="regForm" method="post" action="UpdateProc.jsp">
		<tr align="center" bgcolor="#996600"> 
		<td colspan="3"><font color="#FFFFFF"><b> 
		<%=regBean.getMem_name()%>
		ȸ������ ������ �����մϴ�.</b></font> </td>
		</tr>
		<tr> 
		<td>���̵�</td>
		<td><%=regBean.getMem_id()%></td>
		</tr>
		<tr> 
		<td>�н�����</td>
		<td><input type="text" name="mem_passwd" value="<%=regBean.getMem_passwd()%>"></td>
		</tr>
		<tr> 
		<td>�̸�</td>
		<td><input type="text" name="mem_name" value="<%=regBean.getMem_name()%>"></td>
		</tr>
		<tr> 
		<td>�ֹε�Ϲ�ȣ</td>
		<td><input type="text" name="mem_num1" size="6" value="<%=regBean.getMem_num1()%>">-
		<input type="text" name="mem_num2" size="7"	value="<%=regBean.getMem_num2()%>"></td>
		</tr>
		<tr> 
		<td>�̸���</td>
		<td><input type="text" name="mem_email"  size="30" value="<%=regBean.getMem_email()%>"></td>
		</tr>
		<tr> 
		<td>��ȭ��ȣ</td>
		<td><input type="text" name="mem_phone" value="<%=regBean.getMem_phone()%>"></td>
		</tr>
		<tr> 
		<td>�����ȣ</td>
		<td><input type="text" name="mem_zipcode" value="<%=regBean.getMem_zipcode()%>">
		<input type="button" value="�����ȣã��" onClick="zipCheck()">
		</td>
		</tr>
		<tr> 
		<td>�ּ�</td>
		<td><input type="text" name="mem_address" size="50" value="<%=regBean.getMem_address()%>"></td>
		</tr>
		<tr> 
		<td>��α�</td>
		<td>
			<input type="text" name="mem_blog" size="70" value="http://blog.">
			<script>document.regForm.mem_blog.value="<%=regBean.getMem_blog()%>"</script>
		</td>
		</tr>
		<tr> 
		<td colspan="2" align="center">
		<input type="submit" value="�����Ϸ�"> 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<input type="reset" value="�ٽþ���"> 
		</td>
		</tr>
		<input type="hidden" name="mem_id" value="<%=mem_id%>">
		</form>
		</table>

	</td>
	</tr>
	</table>
	
	<%@ include file="Bottom.jsp" %>
		
</body>
</html>

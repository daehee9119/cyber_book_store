<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import ="java.util.*, mall.*" %> 
<% 
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="regBean" class="mall.RegisterBean"/>
	<jsp:setProperty name="regBean" property="*" />


<html>
<head>
<title>�ĺ� ȸ������ Ȯ��</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#ffFFFF">
<br>

	<%@ include file="../mall/Top.jsp" %>
	
	<table width="800" align="center" bgcolor="#ffFFFF">
	<tr> 
	<td align="center" bgcolor="#FFFFff">

		<table width="800" align="center" bgcolor="#FFFF99" cellspacing="0" style="border-collapse:collapse;">
		
		
		<form name="regForm" method="post" action="../mall/MemberInsert.jsp">
		<tr align="center" bgcolor="#996600"> 
		<td colspan="3" bgcolor="white" style="border-width:1; border-color:black; border-style:none;"><b> 
<font size="4" color="blue">		
<jsp:getProperty name="regBean" property="mem_name" />
		ȸ������ �ۼ��Ͻ� �����Դϴ�. Ȯ���� �ּ���</font></b></td>
		</tr> 
		<tr> 
		<td>���̵�</td>
		<td> <input type="text" name="mem_id" 
		value="<jsp:getProperty name="regBean" property="mem_id" />"></td>
		</tr>
		<tr> 
		<td>�н�����</td>
		<td><input type="text" name="mem_passwd" 
		value="<jsp:getProperty name="regBean" property="mem_passwd" />"></td>
		</tr>
		<tr> 
		<td>�̸�</td>
		<td><input type="text" name="mem_name" 
		value="<jsp:getProperty name="regBean" property="mem_name" />"></td>
		</tr>
		<tr> 
		<td>�ֹι�ȣ</td>
		<td><input type="text" name="mem_num1" size="6"
		value="<jsp:getProperty name="regBean" property="mem_num1" />"> -
		<input type="text" name="mem_num2" size="7"
		value="<jsp:getProperty name="regBean" property="mem_num2" />"></td>
		</tr>
		<tr> 
		<td>�̸���</td>
		<td><input type="text" name="mem_email"  size="30" 
		value="<jsp:getProperty name="regBean" property="mem_email" />"></td>
		</tr>
		<tr> 
		<td>��ȭ��ȣ</td>
		<td><input type="text" name="mem_phone" 
		value="<jsp:getProperty name="regBean" property="mem_phone" />"></td>
		</tr>
		<tr> 
		<td>�����ȣ</td>
		<td><input type="text" name="mem_zipcode" 
		value="<jsp:getProperty name="regBean" property="mem_zipcode" />"></td>
		</tr>
		<tr> 
		<td>�ּ�</td>
		<td><input type="text" name="mem_address" size="50" 
		value="<jsp:getProperty name="regBean" property="mem_address" />"></td>
		</tr>
		<tr> 
		<td>��α�</td>
		<td><input type="text" name="mem_blog"  size="50"
		value="<jsp:getProperty name="regBean" property="mem_blog" />"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:none;"><input type="submit" value="Ȯ�οϷ�"> 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<input type="button" value="�ٽþ���" onClick="history.back()"> 
		</td>
		</tr>
		</form>
		</table>

	</td>
	</tr>
	</table>
	
	<%@ include file="../mall/Bottom.jsp" %>
		
</body>
</html>

<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import ="java.util.*, mall.*" %> 
<% 
	//������ ���۵� �ѱ��� ó���ϱ� ���� ���
	request.setCharacterEncoding("euc-kr");
%>
<!-- ������� ������ �о�������� MemberMgr ���� ���� -->
<jsp:useBean id="memMgr" class="mall.MemberMgr" />

<%
	if(session.getAttribute("idKey") == null) {
		response.sendRedirect("Login.jsp");
		}else{
%>	
<html>
<head>
<title>ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#ffFFFF" topmargin="20">
<br>

	<%@ include file="../mall/Top.jsp" %>
	<%//mem_id�� ���ؼ� ������� ���̵� �ش��ϴ� ������ �о�� --%>
	<%RegisterBean regBean= memMgr.getMember(mem_id);%>
	

<table width="800" valign="top" align="center" bgcolor="#ffFFFF">
<tr>
	<td width="200" valign="top">
		<jsp:include page="../mall/Left.jsp" flush="true"/>
	</td>

	<td width="600" valign="top">

	<table width="600" valign="top" align="center" bgcolor="#ffFFFF">
	<tr> 
                    <td align="center" bgcolor="#CCFFFF">
<p style="line-height:100%; margin-top:0; margin-bottom:0;"><img src="../jpg/main_qna.gif" width="600" height="188" border="0"></p>
		<table width="100%" valign="top" bgcolor="#ffFFFF" cellspacing="0" style="line-height:100%; margin-top:0; margin-bottom:0;">
		<!-- ȸ�������� ���� ��û�� �ϸ� MemberUpdateProc.jsp�� ȸ��
		������ �Ѱ� �޾� ó���ϰ� �ȴ�.-->
		<form name="regForm" method="post" action="../mall/MemberUpdateProc.jsp">
		<tr align="center" bgcolor="#ffFFFF"> 
                                <td colspan="3" width="591" style="border-width:1; border-color:black; border-style:none;" bgcolor="#FFCCCC" height="28">

                                    <p style="line-height:100%; margin-top:0; margin-bottom:0;">		<b> <i><font color="#996600"><%=regBean.getMem_name()%> ȸ����(<%=regBean.getMem_id()%>)�� ������ �����մϴ�.</font></i></b></p>
</td>
		</tr>
		<tr> 
                                <td width="87" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35">
                                    <p align="right"><font color="blue"><b>���̵�</b></font></p>
</td>
		<td width="498" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35"><%=regBean.getMem_id()%></td>
		</tr>
		<tr> 
                                <td width="87" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35">
                                    <p align="right"><font color="blue"><b>�н�����</b></font></p>
</td>
		<td width="498" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35"><input type="password" name="mem_passwd" value="<%=regBean.getMem_passwd()%>"></td>
		</tr>
		<tr> 
                                <td width="87" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35">
                                    <p align="right"><font color="blue"><b>�̸�</b></font></p>
</td>
		<td width="498" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35"><input type="text" name="mem_name" value="<%=regBean.getMem_name()%>"></td>
		</tr>
		<tr> 
                                <td width="87" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35">
                                    <p align="right"><font color="blue"><b>�ֹι�ȣ</b></font></p>
</td>
		<td width="498" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35"><input type="text" name="mem_num1" size="6" value="<%=regBean.getMem_num1()%>">-
		<input type="password" name="mem_num2" size="7"	value="<%=regBean.getMem_num2()%>"></td>
		</tr>
		<tr> 
                                <td width="87" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35">
                                    <p align="right"><font color="blue"><b>�̸���</b></font></p>
</td>
		<td width="498" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35"><input type="text" name="mem_email"  size="30" value="<%=regBean.getMem_email()%>"></td>
		</tr>
		<tr> 
                                <td width="87" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35">
                                    <p align="right"><font color="blue"><b>��ȭ��ȣ</b></font></p>
</td>
		<td width="498" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35"><input type="text" name="mem_phone" value="<%=regBean.getMem_phone()%>"></td>
		</tr>
		<tr> 
                                <td width="87" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35">
                                    <p align="right"><font color="blue"><b>�����ȣ</b></font></p>
</td>
                    <td width="498" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35"><input type="text" name="mem_zipcode" value="<%=regBean.getMem_zipcode()%>">
		&nbsp;<a href="#" onClick="zipCheck();"><img src="../jpg/post.gif" width="80" height="20" border="0"></a>
		<!--input type="button" value="�����ȣã��" onClick="zipCheck()"-->
		</td>
		</tr>
		<tr> 
                                <td width="87" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35">
                                    <p align="right"><font color="blue"><b>�ּ�</b></font></p>
</td>
		<td width="498" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35"><input type="text" name="mem_address" size="65" value="<%=regBean.getMem_address()%>"></td>
		</tr>
		<tr> 
                                <td width="87" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35">
                                    <p align="right"><font color="blue"><b>��α�</b></font></p>
</td>
		<td width="498" style="border-width:1; border-color:black; border-style:none;" bgcolor="#99FFFF" height="35"><input type="text" name="mem_blog" size="65" value="<%=regBean.getMem_blog()%>">
		</td>
		</tr>
		<tr> 
                                <td colspan="2" align="center" width="589" style="border-width:1; border-color:black; border-style:none;">
		<input type="submit" value="�����Ϸ�" onclick="inputCheck()"> 
		&nbsp;  
		<input type="reset" value="�ٽþ���"> 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:Del('<%=regBean.getMem_id()%>')"><font size="2" color="red">Ż���ϱ�</font></a>	</td>
		</tr>
		<input type="hidden" name="mem_id" value="<%=mem_id%>">
		</form>
		</table>

	</td>
	</tr>
	</table>

</td>
</tr>
</table>

<form  name="del" method="post" action="../mall/MemberDelProc.jsp">
		<input type=hidden name="mem_id">
	</form>

	<%@ include file="../mall/Bottom.jsp" %>
		
</body>
</html>
<%}%>
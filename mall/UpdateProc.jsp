<%@ page contentType="text/html;charset=EUC-KR"%>
<% 
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="memMgr" class="mall.MemberMgr" />
<jsp:useBean id="regBean" class="mall.RegisterBean" />
<jsp:setProperty name="regBean" property="*" />
<%
    boolean flag = memMgr.memberUpdate(regBean);
%>

<html>
<head>
<title>ȸ������ ó��</title>
<link href="style.css" rel="stylesheet" type="text/css">
<html>
<body bgcolor="#FFFFCC">
<br><br>
<center>
<%
if(flag){
	  out.println("<b>���������� �����Ǿ����ϴ�..</b><p>");
	  out.println("<a href=Index.jsp>ó������</a>");
	}else{
	  out.println("<b>�ٽ� �Է��Ͽ� �ֽʽÿ�.</b><p>");
	  out.println("<a href=Update.jsp>�ٽ� �Է�</a>");
	  }
%>
</center>
</body>
</html>


<%@ page contentType="text/html;charset=EUC-KR"%>

<% 
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="memMgr" class="mall.JujaMgr" />
<jsp:useBean id="regBean" class="mall.JujaBean" />
<jsp:setProperty name="regBean" property="*" />
<%
    boolean flag = memMgr.insertJuja(regBean);
%>

<html>
<head>
<title>���ڸ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<html>
<body bgcolor="#cc66ff" topmargin="50">
<br><br>
<center>
<%
if(flag){
	  out.println("<b>���۵Ǿ�����.</b><p>");
	  out.println("<a href=../mall/Index.jsp>Ȯ��</a>");
	}else{
	  out.println("<b>�ٽ� �Է��Ͽ� �ֽʽÿ�.</b><p>");
	  out.println("<a href=../board_3/JujaInsert.jsp>�ٽ� �Է��ϱ�</a>");
	}
%>
</center>
</body>
</html>

<%@ page contentType="text/html;charset=EUC-KR"%>

<% 
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="memMgr" class="mall.BookMgr" />
<jsp:useBean id="regBean" class="mall.BookBean" />
<jsp:setProperty name="regBean" property="*" />
<%
    boolean flag = memMgr.insertBook(regBean);
%>

<html>
<head>
<title>����������û</title>
<link href="style.css" rel="stylesheet" type="text/css">
<html>
<body bgcolor="#cc66ff" topmargin="50">
<br><br>
<center>
<%
if(flag){%>

	  <CENTER>
	  <b><H3>���۵Ǿ�����.</H3></b><br><br>
	  <A HREF="#" onclick="self.close();"><B>�ݱ�</B></a>
	  </CENTER>	  

<%}else{
	  out.println("<b>�����Դϴ�. </br>�ٽ� �Է��Ͽ� �ֽʽÿ�.</b><p>");
	  out.println("<a href=../board_6/Form.jsp>�ٽ� �Է��ϱ�</a>");
	}
%>
</center>
</body>
</html>

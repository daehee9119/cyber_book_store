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
<title>도서증정신청</title>
<link href="style.css" rel="stylesheet" type="text/css">
<html>
<body bgcolor="#cc66ff" topmargin="50">
<br><br>
<center>
<%
if(flag){%>

	  <CENTER>
	  <b><H3>전송되었습다.</H3></b><br><br>
	  <A HREF="#" onclick="self.close();"><B>닫기</B></a>
	  </CENTER>	  

<%}else{
	  out.println("<b>오류입니다. </br>다시 입력하여 주십시오.</b><p>");
	  out.println("<a href=../board_6/Form.jsp>다시 입력하기</a>");
	}
%>
</center>
</body>
</html>

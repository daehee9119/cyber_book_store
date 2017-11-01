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
<title>저자모집</title>
<link href="style.css" rel="stylesheet" type="text/css">
<html>
<body bgcolor="#cc66ff" topmargin="50">
<br><br>
<center>
<%
if(flag){
	  out.println("<b>전송되었습다.</b><p>");
	  out.println("<a href=../mall/Index.jsp>확인</a>");
	}else{
	  out.println("<b>다시 입력하여 주십시오.</b><p>");
	  out.println("<a href=../board_3/JujaInsert.jsp>다시 입력하기</a>");
	}
%>
</center>
</body>
</html>

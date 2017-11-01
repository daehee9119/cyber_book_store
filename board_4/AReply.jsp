<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="mall.*"%>
<jsp:useBean id="myDB" class="mall.BoardMgr_4"/>
<%
	int nowPage = Integer.parseInt(request.getParameter("page"));
	int num = Integer.parseInt(request.getParameter("num"));
    BoardBean_4 tempBoard = myDB.getBoard(num);
	String subject = tempBoard.getSubject();
	String content = tempBoard.getContent(); 
%>
<html>
<head> <title>Q &amp; A</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>


<center>
<br><br>
 <table width="586" cellspacing=0 cellpadding=3>
  <tr>
   <td bgcolor=#CCCC00 height=21 align=center width="580">답변하기</td>
  </tr>
</table>
<form name=post method=post action="../board_4/AReplyProc.jsp">
<table width=600 cellspacing=0 cellpadding=7>
 <tr>
  <td align=center>
   <table border=0>
    <tr>
     <td width=20%>성 명</td>
     <td width=80%>
	  <input type=text name=name size=30 maxlength="40" value="관리자"></td>
    </tr>
    <tr>
     <td width=20%>E-Mail</td>
     <td width=80%>
	  <input type=text name=email size=30 maxlength=30 value="youngle7@combook.com"></td>
    </tr>
    <tr>
     <td width=20%>제 목</td>
     <td width=80%>
	  <input type=text name=subject size=50 value="답변 : <%=subject%>" maxlength=50></td> 
    </tr>
	<tr>
     <td width=20%>내 용</td>
     <td width=80%>
	  <textarea name=content rows=12 cols=50 style="color:rgb(0,51,255);">
안녕하세요! 컴북입니다.      </textarea></td>
    </tr>
    <tr>
     <td width=20%>비밀 번호</td> 
     <td width=80%>
	  <input type=password name=pass size=15 maxlength=15 value="admin"></td> 
    </tr>
    <tr>
     <td colspan=2 height=5><hr size=1></td>
    </tr>
	<tr> 
     <td colspan=2>
	  <input type=submit value="답변등록">
      <input type=reset value="다시쓰기">
      <input type=button value="뒤로" onClick="history.go(-1)"></td>
    </tr> 
   </table>
  </td>
 </tr>
 <input type=hidden name=ip value="<%=request.getRemoteAddr()%>">
 <input type=hidden name=page value="<%=nowPage%>">
 <input type=hidden name=num value="<%=num%>">
</table>
</form> 
</center>



</body>
</html>

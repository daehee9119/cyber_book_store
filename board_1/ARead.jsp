<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="mall.*"%>

<jsp:useBean id="myDB" class="mall.BoardMgr_1" />
<jsp:useBean id="utilMgr" class="mall.UtilMgr"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int nowPage = Integer.parseInt(request.getParameter("page"));
	String keyField = request.getParameter("keyField"); 
    String keyWord = request.getParameter("keyWord");

	BoardBean_1 tempBoard = myDB.getBoard(num);
	myDB.upCount(num);
	
	String name = tempBoard.getName();
	String email = tempBoard.getEmail();
	String homepage = tempBoard.getHomepage();
	String subject = tempBoard.getSubject();
	String regdate = tempBoard.getRegdate();
	String content = tempBoard.getContent();
	String ip = tempBoard.getIp();
	int count= tempBoard.getCount();
%>
<html>
<head><title>공지사항</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
function list(){
	document.list.action="../board_1/AList.jsp";
 	document.list.submit();
 } 
</script>
</head>


<body bgcolor="#ffFFFF">
	
	<%//@ include file="../mall/Top.jsp" %>

<table bgcolor="#ffFFFF" width="800" border=0 align="center">
<tr>
	<td valign="top" width="200">
		<!--jsp:include page="../mall/Left.jsp" flush="true"/-->
	</td>

<td>

<br><br>
<table align=center width=600 border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>공 지 내 용 보 기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
                            <tr>
                                <td align=center bgcolor=#dddddd width="587" colspan="2"> 
                                    <p align="left">&nbsp;&nbsp;등록일 : <%=regdate%></p>
</td>
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd width="64"> 제 목</td>
     <td bgcolor=#ffffe8 width="517"><%=subject%> </td>
   </tr>
   <tr> 
    <td colspan="2" width="587"><br><%=utilMgr.getContent(content)%><br></td>
   </tr>
   <tr>
    <td colspan="2" align=right width="587">
  조회수  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="javascript:list()">목 록</a> | 
	<a href="../board_1/AUpdate.jsp?page=<%=nowPage%>&num=<%=num%>">수 정</a> |
	<a href="../board_1/ADelete.jsp?page=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br>
  </td>
 </tr>
</table>
<%
if(keyWord==null || keyWord.equals("null")){ %>
<form name="list" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="page" value="<%=nowPage%>">
</form>
<%} else{ %>
<form name="list" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="page" value="<%=nowPage%>">
<input type="hidden" name="keyField" value="<%=keyField%>">
<input type="hidden" name="keyWord" value="<%=keyWord%>">
</form>
<%}%>

</td>
</tr>
</table>

<%//@ include file="../mall/Bottom.jsp" %>

</body>
</html>

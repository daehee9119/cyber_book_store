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
	document.list.action="../board_1/List.jsp";
 	document.list.submit();
 } 
</script>
</head>


<body bgcolor="#ffFFFF">
	
	<%@ include file="../mall/Top.jsp" %>

<table bgcolor="#ffFFFF" width="800" border=0 align="center">
<tr>
	<td valign="top" width="200">
		<jsp:include page="../mall/Left.jsp" flush="true"/>
	</td>

<td valign="top">
<p align="center" style="line-height:100%; margin-top:0; margin-bottom:0;"><img src="../jpg/main_qna.gif" width="600" height="179" border="0"><br>
</p>
<table align=center width="605" border=0 cellspacing=3 cellpadding=0 style="line-height:100%; margin-top:0; margin-bottom:0;">
 <tr>
                    <td bgcolor="#CCFF99" height="31" align=center class=m width="600"><font color="#CC6600"><b>공 지 내 용 보 기</b></font></td>
 </tr>
 <tr>
  <td colspan=2 width="599">
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
     <td align=center bgcolor=#dddddd width="59"> <font color="blue">제 목</font></td>
     <td bgcolor=#ffffe8 width="526"><font color="blue"><%=subject%> </font></td>
   </tr>
   <tr> 
    <td colspan="2" width="591"><br><%=utilMgr.getContent(content)%><br></td>
   </tr>
   <tr>
    <td colspan="2" align=right width="591">
  조회수  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2 width="599"> 
	<hr size=1>
	[ <a href="javascript:list()">목 록</a>  ]<br>
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

<%@ include file="../mall/Bottom.jsp" %>

</body>
</html>

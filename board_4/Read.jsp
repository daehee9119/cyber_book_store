<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="mall.*"%>

<jsp:useBean id="myDB" class="mall.BoardMgr_4" />
<jsp:useBean id="utilMgr" class="mall.UtilMgr"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int nowPage = Integer.parseInt(request.getParameter("page"));
	String keyField = request.getParameter("keyField"); 
    String keyWord = request.getParameter("keyWord");

	BoardBean_4 tempBoard = myDB.getBoard(num);
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
<head><title>Q &amp; A</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
function list(){
	document.list.action="../board_4/List.jsp";
 	document.list.submit();
 } 
</script>
</head>


<body>

	<%@ include file="../mall/Top.jsp" %>


<table valign="top" bgcolor="#ffFFFF" width="800" border=0 align="center">
<tr>
	<td valign="top" width="200">
		<jsp:include page="../mall/Left.jsp" flush="false"/>
	</td>

<td valign="top">
            <p align="center" style="line-height:100%; margin-top:0; margin-bottom:0;"><img src="../jpg/main_qna.gif" width="600" height="188" border="0"></p>
<table align=center width="610" border=0 cellspacing=3 cellpadding=0 style="line-height:100%; margin-top:0; margin-bottom:0;">
 <tr>
                    <td bgcolor="#99CCCC" height="30" align=center class=m width="600"><font color="#0066FF"><b>글 읽 기</b></font></td>
 </tr>
 <tr>
  <td colspan=2 width="604">
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=#dddddd width=10% height="25"> 이 름 </td>
	 <td bgcolor=#ffffe8 width="109" height="25"><%=name%></td>
	 <td align=center bgcolor=#dddddd width="15%" height="25"> 등록날짜 </td>
	 <td bgcolor=#ffffe8 width="303" height="25"><%=regdate%></td>
	</tr>
                            <tr>
	 <td align=center bgcolor=#dddddd width=10% height="25"> 메 일 </td>
                                <td bgcolor=#ffffe8 width="509" colspan="3" height="25"><a href="mailto:<%=email%>"><%=email%></a></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd width="60" height="25"> 제 목</td>
     <td bgcolor=#ffffe8 colspan=3 width="509" height="25"><%=subject%> </td>
   </tr>
   <tr> 
                                <td colspan=4 width="575" valign="middle">
                                    <p>&nbsp;</p>
                                    <p><%=utilMgr.getContent(content)%><br></p>
                                    <p>&nbsp;</p>
</td>
   </tr>
   <tr>
    <td colspan=4 align=right width="575" valign="middle">
      조회수  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2 width="604"> 
	<hr size=1>
	[ <a href="javascript:list()">목 록</a> | 
	<a href="../board_4/Update.jsp?page=<%=nowPage%>&num=<%=num%>">수 정</a> |
	<a href="../board_4/Delete.jsp?page=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br>
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

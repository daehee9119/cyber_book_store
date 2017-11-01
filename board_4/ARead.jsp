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
	document.list.action="../board_4/AList.jsp";
 	document.list.submit();
 } 
</script>
</head>


<body>


<br><br>
<table align=center width="603" border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m width="595">���б�</td>
 </tr>
 <tr>
  <td colspan=2 width="597">
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=#dddddd width=10%> �� �� </td>
	 <td bgcolor=#ffffe8 width="153"><%=name%></td>
	 <td align=center bgcolor=#dddddd width="19%"> ��ϳ�¥ </td>
	 <td bgcolor=#ffffe8 width="245"><%=regdate%></td>
	</tr>
                <tr>
	 <td align=center bgcolor=#dddddd width=10%> �� �� </td>
                    <td bgcolor=#ffffe8 width="522" colspan="3"><a href="mailto:<%=email%>"><%=email%></a></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd width="59"> �� ��</td>
     <td bgcolor=#ffffe8 colspan=3 width="522"><%=subject%> </td>
   </tr>
   <tr> 
    <td colspan=4 width="587"><br><%=utilMgr.getContent(content)%><br></td>
   </tr>
   <tr>
    <td colspan=4 align=right width="587">
  ��ȸ��  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2 width="597"> 
	<hr size=1>
	[ <a href="javascript:list()">�� ��</a> | 
	<a href="../board_4/AUpdate.jsp?page=<%=nowPage%>&num=<%=num%>">�� ��</a> |
	<a href="../board_4/AReply.jsp?page=<%=nowPage%>&num=<%=num%>">�� ��</a> |
	<a href="../board_4/ADelete.jsp?page=<%=nowPage%>&num=<%=num%>">�� ��</a> ]<br>
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


</body>



</html>

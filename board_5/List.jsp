<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="mall.*,java.util.*"%>

<jsp:useBean id="myDB" class="mall.BoardMgr_5" />

<%
  request.setCharacterEncoding("euc-kr");
%>
<%
   int nowPage = 0; 
   int nowBlock = 0; 
   int totalRecord = 0; 
   int numPerPage = 10; 
   int pagePerBlock = 10;
   int totalPage = 0;       
   int totalBlock = 0;         
   int beginPerPage =0;    


   Vector boardList;
%>
<% 
   String keyField ="" ;
   String keyWord ="" ; 

	if(request.getParameter("keyWord") !=null){
			keyWord =request.getParameter("keyWord");
			keyField =request.getParameter("keyField");
		}
		
	if(request.getParameter("reload") !=null){
		if(request.getParameter("reload").equals("true")){
			keyWord ="";
			keyField ="";
			}
	}

	boardList= myDB.getBoardList(keyField,keyWord); 
	totalRecord = boardList.size(); 
	if (request.getParameter("page") != null) { nowPage= Integer.parseInt(request.getParameter("page")); } 
	beginPerPage = nowPage * numPerPage;
	totalPage =(int)Math.ceil((double)totalRecord / numPerPage);
	if (request.getParameter("nowBlock") != null) {nowBlock = Integer.parseInt(request.getParameter("nowBlock"));}
	
	totalBlock =(int)Math.ceil((double)totalPage / pagePerBlock);
%>
<html>
<head><title>F  A  Q</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
function check() {
     if (document.search.keyWord.value == "") 
		{
		 alert("�˻�� �Է��ϼ���.");
		 document.search.keyWord.focus();
		 return;
	    }
	 document.search.submit();
 }

function list(){
	document.list.action="../board_5/List.jsp";
 	document.list.submit();
 }

 function read(value){
	document.read.action="../board_5/Read.jsp";
	document.read.num.value=value;
	document.read.submit();   
 }
//-->
</SCRIPT>

</head>
<body bgcolor="#ffFFFF">
	
	<%@ include file="../mall/Top.jsp" %>

<table bgcolor="#ffFFFF" width="800" border=0 align="center">
<tr>
	<td valign="top" width="200">
		<jsp:include page="../mall/Left.jsp" flush="true"/>
	</td>

<td valign="top">

<center>
                <p align="left" style="line-height:100%; margin-top:0; margin-bottom:0;"><img src="../jpg/main_qna.gif" width="600" height="188" border="0"></p>
                <p align="left" style="line-height:100%; margin-top:0; margin-bottom:0;"><img src="../jpg/center_title.gif" width="355" height="31" border="0"></p>
                <p style="line-height:100%; margin-top:0; margin-bottom:0;">&nbsp;<img src="../jpg/faq_title.gif" width="555" height="59" border="0"><br>
</p>
                <p><img src="../jpg/center_find_bg1.gif" width="561" height="35" border="0"></p>                <p><FONT color=#666666>���� �Ͻñ��� �˻��� ������ �亯�� ��ٸ��� �ʿ䰡 �����ϴ�.</FONT></p>

<form action="../board_5/List.jsp" name="search" method="post">
	<table border=0 width="" align=center cellpadding=4 cellspacing=0>
	 <tr>
	  <td align=center valign=bottom>
	   <select name="keyField" size=1>
<option value="subject"> �� ��

                        </option>
<option value="content"> �� ��

                        </option>
</select>
	   <input type="text" size=16 name="keyWord"  value="">
	   <input type="button"  value="ã��" onClick="check()">
	   <input type="hidden" name="page" value="0">
	  </td>
	 </tr>
	</table>
	</form>


<table valign="top" align=center border=0 width="590">
 <tr>
  <td align=left width="590">Total : <%=totalRecord%> Articles</td>
 </tr>
</table>
<table valign="top" align="center" width="90%" border=0 cellspacing=0 cellpadding=3>
 <tr>
            <td align=center colspan=2>
<% 
   if (boardList.isEmpty()) { 
%> 
��ϵ� ����&nbsp;�����ϴ�.
<%  }
   else {
%>   <table border=0 width=100% cellpadding=2 cellspacing=0>
                                <tr align=center bgcolor=#CCFFFF height=120%>
     <td width="83" bgcolor="#009966">�� ȣ</td>
                                    <td width="457" bgcolor="#009966">�� ��</td>
	 <td width="86" bgcolor="#009966">��ȸ��</td>
    </tr>
<% 
	for (int i = beginPerPage;i < (beginPerPage+numPerPage); i++) { 
	if (i==totalRecord) break;

	BoardBean_5 tempBoard = (BoardBean_5)boardList.elementAt(i);
	String name =tempBoard.getName();
	String subject = tempBoard.getSubject();
	String email = tempBoard.getEmail();
	String regdate = tempBoard.getRegdate();
	int depth = tempBoard.getDepth();
	int num = tempBoard.getNum(); 
	int count =tempBoard.getCount();
%>
                                <tr>
     <td align=center width="83"><%= totalRecord - i %></td>
                                    <td width="457">
<%
	if (depth > 0) { 
	for (int re = 0; re < depth; re++) {
%> 
&nbsp;&nbsp;
<% 
	 }
   }
%><a href="javascript:read('<%=num%>')"><%= subject %></a>
     </td>
     <td align=center width="86"><%=count%> </td>
    </tr>
<% 
   } 
%>

   </table> 
<% 
   } 
%> 
  </td>
 </tr>
 <tr>
  <td><br><br></td>
 </tr>
 <tr>
  <td align="left"> Page 
<% if(totalRecord !=0){ %> 
<% if (nowBlock > 0) {%> 
<a href="../board_5/List.jsp?nowBlock=<%=nowBlock - 1 %>&page=<%=((nowBlock - 1) * pagePerBlock)%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">
���� <%=pagePerBlock %> ��</a>
<%}%> 
:::
<%
for (int i = 0; i < pagePerBlock; i++) { %>
<a href="../board_5/List.jsp?nowBlock=<%=nowBlock %>&page=<%=(nowBlock*pagePerBlock) + i %>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">
<%=(nowBlock * pagePerBlock) + i + 1 %></a>

<% if ((nowBlock * pagePerBlock) + i + 1 == totalPage)  break; %>
<%} %>

::: 

<% if (totalBlock > nowBlock + 1) {%> 
<a href="../board_5/List.jsp?nowBlock=<%=nowBlock + 1 %>&page=<%=((nowBlock + 1) * pagePerBlock) %>&keyField=<%=keyField%>&keyWord=<%=keyWord%>"> 
���� <%=pagePerBlock %> ��</a>
<%}%>

<%} %>
  </td> 
  <td align=right> 
   <a href="javascript:list()">[ó������]</a> 
  </td>
 </tr>
</table>

	<br>
	
	<form name="read" method="post">
		<input type="hidden" name="num" value="">
		<input type="hidden" name="page" value="<%=nowPage%>">
		<input type="hidden" name="nowBlock" value="<%=nowBlock%>">
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	 </form>
	<form name="list" method="post">
		 <input type="hidden" name="reload" value="true">
		 <input type="hidden" name="page" value="0">
		 <input type="hidden" name="nowBlock" value="0"> 
	</form>
</center>

</td>
</tr>
</table> <!---->

</td>
</tr>
</table>

<%@ include file="../mall/Bottom.jsp" %>

</body>
</html>

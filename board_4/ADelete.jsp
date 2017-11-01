<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="mall.*"%>

<jsp:useBean id="Bean" class="mall.BoardBean_4" />
<jsp:useBean id="myDB" class="mall.BoardMgr_4" />

<%
   int num;
   int nowPage;
   String inPass=""; 
   String DBPass="";
   
   nowPage = Integer.parseInt(request.getParameter("page"));
   num = Integer.parseInt(request.getParameter("num"));

  if((request.getParameter("pass")) !=null){
	BoardBean_4 tempBoard = myDB.getBoard(num);
    inPass = request.getParameter("pass"); 
    DBPass = tempBoard.getPass(); 
  if(!(inPass.equals(DBPass))) {

%>
<script>
	alert("입력하신 비밀번호가 올바르지 않습니다. 다시 확인해주세요.");
	history.go(-1);
</script>
<%
	}else{
	  myDB.deleteBoard(num);
	  response.sendRedirect("../board_4/AList.jsp?page=" + nowPage);
	}
  }
%>

	<%BoardBean_4 tempBoard = myDB.getBoard(num);%>


<html>
<head><title>Q &amp; A</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>

</script>
</head>
<body>


<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
            <td bgcolor=#dddddd height=21 align=center width="800">
      삭제 하시겠습니까? </td>
 </tr>
</table>
<table width=70% cellspacing=0 cellpadding=2>
<form name=form method=post action="../board_4/ADelete.jsp">
 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    <tr> 
     <td align=center>  
	  <input type=password name="pass" size=17 maxlength=15 value="<%=tempBoard.getPass()%>">
	 </td> 
    </tr>
    <tr>
     <td><hr size=1 color=#eeeeee></td>
    </tr>
    <tr>
     <td align=center>
	  <input type=submit value="삭제완료"> 
      <input type=reset value="다시쓰기"> 
      <input type=button value="뒤로" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
 <input type=hidden name=page value="<%=nowPage%>">
 <input type=hidden name=num value="<%=num%>">
</form> 
</table>
</center>


</body>
</html>

<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="mall.*"%>

<jsp:useBean id="myDB" class="mall.BoardMgr_5" />
<%
   int num;
   int nowPage;
   String inPass=""; 
   String DBPass="";
   
   nowPage = Integer.parseInt(request.getParameter("page"));
   num = Integer.parseInt(request.getParameter("num"));

  if((request.getParameter("pass")) !=null){
	BoardBean_5 tempBoard = myDB.getBoard(num);
    inPass = request.getParameter("pass"); 
    DBPass = tempBoard.getPass(); 
  if(!(inPass.equals(DBPass))) {

%>
<script>
	alert("�Է��Ͻ� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�. �ٽ� Ȯ�����ּ���.");
	history.go(-1);
</script>
<%
	}else{
	  myDB.deleteBoard(num);
	  response.sendRedirect("../board_5/AList.jsp?page=" + nowPage);
	}
  }
%>
<html>
<head><title>��������</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.form.pass.value == "") {
		alert("�н����带 �Է��ϼ���.");
		form.pass.focus();
		return false;
		}
		document.form.submit();
	}
</script>
</head>
<body bgcolor="#ffFFFF">
	

<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=#dddddd height=21 align=center>
      ������ �����Ͻðڽ��ϱ�?</td>
 </tr>
</table>


<table width=70% cellspacing=0 cellpadding=2>
<form name=form method=post action="ADelete.jsp">
 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    
    <tr>
     <td><hr size=1 color=#eeeeee></td>
    </tr>
	<tr> 
     <td align=center>  
	  <input type=hidden name="pass" size=17 value="word">
	 </td> 
    </tr>
    <tr>
     <td align=center>
	  <input type=submit value="�����Ϸ�" onClick="check()"> 
      <input type=button value="�ڷ�" onClick="history.go(-1)">
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

&nbsp;

</body>
</html>

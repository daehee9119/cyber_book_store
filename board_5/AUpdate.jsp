<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="mall.*"%>

<jsp:useBean id="myDB" class="mall.BoardMgr_5" />
<% 
	int nowPage = Integer.parseInt(request.getParameter("page")); 
	int num = Integer.parseInt(request.getParameter("num"));
	BoardBean_5 tempBoard = myDB.getBoard(num);
	String subject = tempBoard.getSubject();
	String name = tempBoard.getName(); 
	String content = tempBoard.getContent(); 
	String email = tempBoard.getEmail(); 
%>

<html>
<head> <title>F A Q</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
	   if (document.form.pass.value == "") {
		 alert("������ ���� �н����带 �Է��ϼ���.");
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
<table width=600 cellspacing=0 cellpadding=3>
  <tr>
   <td bgcolor=#FFffff  height=21 align=center class=m>�����ϱ�</td>
  </tr>
</table>

<form name=form method=post action="../board_5/AUpdateProc.jsp">
<table width=90% cellspacing=0 cellpadding=7>
 <tr>
  <td align=center>
   <table border=0>
	<tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <input type=text name=subject size=50 value="<%=subject%>" maxlength=50>
	 </td>
    <tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <textarea name=content rows=10 cols=50><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td width=20%>&nbsp;</td> 
     <td width=80%><input type=hidden name=pass size=15 maxlength=15 value="word">
      </td>
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=1></td>
    </tr>
	<tr>
     <td colspan=2>
	  <input type=Button value="�����Ϸ�" onClick="check()">
      <input type=reset value="�ٽü���"> 
      <input type=button value="�ڷ�" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
 <input type=hidden name=page value="<%=nowPage %>">
 <input type=hidden name=num value="<%=num%>">
</table>
</form> 
</center>


<%%>

</body>
</html>
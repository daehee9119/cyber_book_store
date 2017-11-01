<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="mall.*"%>

<jsp:useBean id="myDB" class="mall.BoardMgr_4" />
<% 
	int nowPage = Integer.parseInt(request.getParameter("page")); 
	int num = Integer.parseInt(request.getParameter("num"));
	BoardBean_4 tempBoard = myDB.getBoard(num);
	String subject = tempBoard.getSubject();
	String name = tempBoard.getName(); 
	String content = tempBoard.getContent(); 
	String email = tempBoard.getEmail(); 
%>

<html>
<head> <title>Q &amp; A</title>
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
<body>

	<%@ include file="../mall/Top.jsp" %>


<table valign="top" bgcolor="#ffFFFF" width="800" border=0 align="center">
<tr>
	<td valign="top" width="200">
		<jsp:include page="../mall/Left.jsp" flush="false"/>
	</td>

<td valign="top">

<center>
<br><br>
<table width=600 cellspacing=0 cellpadding=3>
  <tr>
   <td bgcolor=#FF9018  height=21 align=center class=m>�����ϱ�</td>
  </tr>
</table>

<form name=form method=post action="../board_4/UpdateProc.jsp">
<table width=600 cellspacing=0 cellpadding=7>
 <tr>
  <td align=center>
   <table border=0>
    <tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <input type=text name=name value="<%=name%>" size=30 maxlength=20>
	 </td>
	</tr>
    <tr>
     <td width=20%>E-Mail</td>
     <td width=80%>
	  <input type=text name=email size=30 value="<%=email%>" maxlength=30>
	 </td>
    </tr>
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
     <td width=20%>��� ��ȣ</td> 
     <td width=80%><input type=password name=pass size=15 maxlength=15>
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


</td>
</tr>
</table>

<%@ include file="../mall/Bottom.jsp" %>
</body>
</html>
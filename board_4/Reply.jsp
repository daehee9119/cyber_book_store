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

<script>
	function check() {
		if(document.regForm.name.value==""){
			alert("���� ������ �Է��� �ּ���.");
			document.regForm.name.focus();
			return;
		}
		if(document.regForm.email.value==""){
			alert("�̸����� �Է��� �ּ���.");
			document.regForm.email.focus();
			return;
		}
		if(document.regForm.subject.value==""){
			alert("���� �Է��� �ּ���.");
			document.regForm.subject.focus();
			return;
		}
		if(document.regForm.content.value==""){
			alert("������ �Է��� �ּ���.");
			document.regForm.content.focus();
			return;
		}
		if(document.regForm.pass.value==""){
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.regForm.pass.focus();
			return;
		}
	  document.regForm.submit();
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
   <td bgcolor=#CCCC00 height=21 align=center>�亯�ϱ�</td>
  </tr>
</table>
<form name=regForm method=post action="../board_4/ReplyProc.jsp">
<table width=600 cellspacing=0 cellpadding=7>
 <tr>
  <td align=center>
   <table border=0>
    <tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <input type=text name=name size=30 maxlength="40"></td>
    </tr>
                                    <tr>
                                        <td width=20%>E-Mail</td>
                                        <td width=80%>
	  <input type=text name=email size=30 maxlength=30></td>
    </tr>
    <tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <input type=text name=subject size=50 value="�亯 : <%=subject%>" maxlength=50></td> 
    </tr>
	<tr>
     <td width=20%>�� ��</td>
     <td width=80%>
	  <textarea name=content rows=12 cols=50>
      <%=content %>

========�亯 ���� ������.=======

      </textarea></td>
    </tr>
    <tr>
     <td width=20%>��� ��ȣ</td> 
     <td width=80%>
	  <input type=password name=pass size=15 maxlength=15></td> 
    </tr>
    <tr>
     <td colspan=2 height=5><hr size=1></td>
    </tr>
	<tr> 
     <td colspan=2>
	  <input type=button value="�亯���" onClick="check();">
      <input type=reset value="�ٽþ���">
      <input type=button value="�ڷ�" onClick="history.go(-1)"></td>
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


</td>
</tr>
</table>

<%@ include file="../mall/Bottom.jsp" %>
</body>
</html>

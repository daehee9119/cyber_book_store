<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="mall.MemberMgr" %>
<jsp:useBean id="memMgr" class="mall.MemberMgr" />

<%
   request.setCharacterEncoding("euc-kr");
   String mem_id = request.getParameter("mem_id");
   boolean check = memMgr.checkId(mem_id);
%>

<html>
<head>
<title>ID�ߺ�üũ</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#FFFFCC">
<br>
<center>
<b><%=mem_id%></b>
<%
  if(check){
     out.println("�� �̹� ������Դϴ�.<p>");
}else{    
     out.println("�� ��� ���� �մϴ�.<p>");
}
%>
<a href="javascript:this.close();">�ݱ�</a>
</center>
</body>
</html>
<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*"%>
<%@ page import="mall.*"%>

<% 
	request.setCharacterEncoding("euc-kr");
%>


<jsp:useBean id="DB" class="mall.BookMgr" />


<%
	String flag = request.getParameter("flag");
	boolean result = false;
	
    if(flag.equals("delete")){
		result=DB.deleteBook(request.getParameter("no"));
	}else{
		response.sendRedirect("../board_6/List.jsp");
	}
	
	if(result){
%>
	  <script>
	    alert("ó���Ͽ����ϴ�");
		location.href="../board_6/List.jsp";
	  </script>


<%	}else{%>
	  <script>
	    alert("������ �߻��Ͽ����ϴ�.");
		location.href="../board_6/List.jsp";
	  </script>
<%	}%>


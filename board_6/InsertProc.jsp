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
	    alert("처리하였습니다");
		location.href="../board_6/List.jsp";
	  </script>


<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="../board_6/List.jsp";
	  </script>
<%	}%>


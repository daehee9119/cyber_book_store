<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*"%>
<%@ page import="mall.*"%>

<% 
	request.setCharacterEncoding("euc-kr");
%>


<jsp:useBean id="DB" class="mall.JujaMgr" />


<%
	String flag = request.getParameter("flag");
	boolean result = false;
	
    if(flag.equals("delete")){
		result=DB.deleteJuja(request.getParameter("no"));
	}else{
		response.sendRedirect("../board_3/JujaList.jsp");
	}
	
	if(result){
%>
	  <script>
	    alert("처리하였습니다");
		location.href="../board_3/JujaList.jsp";
	  </script>


<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="../board_3/JujaList.jsp";
	  </script>
<%	}%>


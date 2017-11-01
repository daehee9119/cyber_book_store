<%@ page contentType="text/html" %>
<jsp:useBean id="memMgr" class="mall.MemberMgr" />
<%
	String mem_id = request.getParameter("mem_id");
	String mem_passwd = request.getParameter("mem_passwd");
	String mem_name = request.getParameter("mem_name");
	boolean loginCheck = memMgr.loginCheck(mem_id, mem_passwd); 
%>
<%
   if(loginCheck){
	  session.setAttribute("idKey", mem_id);
	  session.setAttribute("nameKey", mem_name);
	  response.sendRedirect("Index.jsp");
   }else{
      response.sendRedirect("LogError.jsp");
   }
%>


<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="mall.*"%>
<%
  request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="myBoard" class="mall.BoardBean_4" />
<jsp:setProperty name="myBoard" property="*" />
<jsp:useBean id="myDB" class="mall.BoardMgr_4" />
<% 
  myDB.insertBoard(myBoard);
  response.sendRedirect("../board_4/List.jsp");
%>

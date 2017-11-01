<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="mall.*"%>
<%
  request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="myBoard" class="mall.BoardBean_1" />
<jsp:setProperty name="myBoard" property="*" />
<jsp:useBean id="myDB" class="mall.BoardMgr_1" />
<% 
  myDB.insertBoard(myBoard);
  response.sendRedirect("../board_1/AList.jsp");
%>

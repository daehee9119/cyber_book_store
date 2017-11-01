<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="mall.*"%>
<%
  request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="myBoard" class="mall.BoardBean_4" />
  <jsp:setProperty name="myBoard" property="*" />
<jsp:useBean id="myDB" class="mall.BoardMgr_4" />
<%
    int nowPage = Integer.parseInt(request.getParameter("page"));
	int num = Integer.parseInt(request.getParameter("num"));
	BoardBean_4 tempBoard = myDB.getBoard(num);
    int pos = tempBoard.getPos();
	int depth = tempBoard.getDepth();
	myBoard.setPos(pos); 
	myBoard.setDepth(depth); 
	myDB.replyupMyBoard(myBoard);
	myDB.replyMyBoard(myBoard);

	response.sendRedirect("../board_4/AList.jsp?page=" + nowPage); 
%> 
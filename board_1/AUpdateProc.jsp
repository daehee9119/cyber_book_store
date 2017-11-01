<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="mall.*"%>
<%
  request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="updateBoard" class="mall.BoardBean_1"/>
  <jsp:setProperty name="updateBoard" property="*" />
<jsp:useBean id="myDB" class="mall.BoardMgr_1" />
<%
	int nowPage = Integer.parseInt(request.getParameter("page"));
    int num = Integer.parseInt(request.getParameter("num"));
	BoardBean_1 tempBoard = myDB.getBoard(num);
	String inputPass = updateBoard.getPass();
	String storePass = tempBoard.getPass();
	if (!inputPass.equals(storePass)) {
%>
<script>
	alert("입력하신 비밀번호가 올바르지 않습니다. 다시 확인해주세요.");
	history.go(-1);
</script>
<% 
    } else {
      myDB.updateBoard(updateBoard);
      response.sendRedirect("../board_1/AList.jsp?page=" + nowPage);
    }
%>
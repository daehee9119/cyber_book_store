<%@ page contentType="text/html" %>
<%
	//세션에서 모든정보 삭제
	session.invalidate();
%>
<script language="JavaScript">
    alert("로그아웃 되었습니다.\n"+
		   "다음에 또 오세요!~");
	location.href="Index.jsp";
</script>





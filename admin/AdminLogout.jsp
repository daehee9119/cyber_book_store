<%@ page contentType="text/html;charset=EUC-KR" %>
<%
	//세션에 담겨진 관리 정보를 없애도록 한다(세션정보만 삭제)
    session.removeAttribute("adminKey");
%>
<script>
    alert("로그아웃 되었습니다.");
	location.href="../admin/Index.jsp";
</script>




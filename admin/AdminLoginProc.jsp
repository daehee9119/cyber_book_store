<%@ page contentType="text/html;charset=EUC-KR" %>
<jsp:useBean id="memMgr" class="mall.MemberMgr" />
<%
	// 사용자가 입력한 관리자 ID와 비밀번호를 읽어옴
	// DB에서 직접 Insert
	String admin_id = request.getParameter("admin_id");
	String admin_passwd = request.getParameter("admin_passwd");

	// 관리자 정보가 맞는지를 체크하여 그 결과를 adminCheck 변수에 넣음
	boolean adminCheck = memMgr.adminCheck(admin_id, admin_passwd);
    if(adminCheck) {
		// 관리자의 정보가 맞다면 session에 관리자의 정보를 입력
	    session.setAttribute("adminKey", admin_id);
%>

   <script>
			location.href="Index.jsp";
   </script>

<%}else{%>

   <script>
   alert("입력한 정보가 정확하지 않습니다.");
   location.href="AdminLogin.jsp";
   </script>

<%}%>
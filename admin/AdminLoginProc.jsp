<%@ page contentType="text/html;charset=EUC-KR" %>
<jsp:useBean id="memMgr" class="mall.MemberMgr" />
<%
	// ����ڰ� �Է��� ������ ID�� ��й�ȣ�� �о��
	// DB���� ���� Insert
	String admin_id = request.getParameter("admin_id");
	String admin_passwd = request.getParameter("admin_passwd");

	// ������ ������ �´����� üũ�Ͽ� �� ����� adminCheck ������ ����
	boolean adminCheck = memMgr.adminCheck(admin_id, admin_passwd);
    if(adminCheck) {
		// �������� ������ �´ٸ� session�� �������� ������ �Է�
	    session.setAttribute("adminKey", admin_id);
%>

   <script>
			location.href="Index.jsp";
   </script>

<%}else{%>

   <script>
   alert("�Է��� ������ ��Ȯ���� �ʽ��ϴ�.");
   location.href="AdminLogin.jsp";
   </script>

<%}%>
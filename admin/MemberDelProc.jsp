<%@ page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="memMgr" class="mall.MemberMgr" />
<jsp:useBean id="regBean" class="mall.RegisterBean" />
<jsp:setProperty name="regBean" property="*" />
<%
    boolean flag = memMgr.deleteMember(regBean.getMem_id());
%>

<%
if(flag){
%>
		<script>
		alert("���������� �����Ͽ����ϴ�");
		location.href="../admin/MemberMgr.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("�������� ������ �߻��Ͽ����ϴ�.");
		history.back();
		</script>

<%
	  }
%>

<%@ page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr");%>
<!-- ������� ������ ó���� MemberMgr ���� ���� -->
<jsp:useBean id="memMgr" class="mall.MemberMgr" />
<!-- ������� ������ ��� ���� Register ���� ���� -->
<jsp:useBean id="regBean" class="mall.RegisterBean" />
<!-- ������� ������ �̹� ������ Register �� ���� -->
<jsp:setProperty name="regBean" property="*" />

<%
	//ȸ�������� ������ ó���ϰ� �� ���� ������� flag�� ����
    boolean flag = memMgr.memberUpdate(regBean);
%>

<%
if(flag){
%>
		<script>
		alert("���������� �����Ͽ����ϴ�");
		location.href="../mall/Index.jsp";
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



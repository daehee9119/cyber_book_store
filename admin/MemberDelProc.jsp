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
		alert("성공적으로 삭제하였습니다");
		location.href="../admin/MemberMgr.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("삭제도중 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>

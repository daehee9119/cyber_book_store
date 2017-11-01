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

	session.invalidate();
%>
		<script>
		alert("탈퇴되었습니다.");
		location.href="../mall/Index.jsp";
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

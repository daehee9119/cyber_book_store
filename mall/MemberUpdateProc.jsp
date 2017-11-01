<%@ page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr");%>
<!-- 사용자의 정보를 처리할 MemberMgr 빈을 생성 -->
<jsp:useBean id="memMgr" class="mall.MemberMgr" />
<!-- 사용자의 정보를 담기 위해 Register 빈을 생성 -->
<jsp:useBean id="regBean" class="mall.RegisterBean" />
<!-- 사용자의 정보를 이미 생성한 Register 빈에 저장 -->
<jsp:setProperty name="regBean" property="*" />

<%
	//회원정보를 수정을 처리하고 난 뒤의 결과값을 flag에 넣음
    boolean flag = memMgr.memberUpdate(regBean);
%>

<%
if(flag){
%>
		<script>
		alert("성공적으로 수정하였습니다");
		location.href="../mall/Index.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("수정도중 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>



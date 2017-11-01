<%@ page contentType="text/html;charset=euc-kr"%>
<!-- 사용자의 장바구니를 담고 있는 빈을 가져옴 -->
<jsp:useBean id="cartMgr" class="mall.CartMgr" scope="session"/>
<!-- 장바구니 정보를 담을 빈을 생성 -->
<jsp:useBean id="order" class="mall.OrderBean" />
<!-- OrderBean에 정보를 저장 -->
<jsp:setProperty name="order" property="*" />
<%
	String flag=request.getParameter("flag");
	String id= (String)session.getAttribute("idKey");
	
	if(id == null) {
		//로그인 하지 않은경우 로그인 페이지로 이동
		response.sendRedirect("Login.jsp"); 
	}else{

		// 장바구니 추가인 경우
		if(flag == null){ 
		order.setId(id);		
		cartMgr.addCart(order);	
%>
		<script>
		alert("장바구니에 담았습니다.");
		location.href="CartList.jsp";
		</script>
<%
		// 장바구니 수정인 경우
		}else if(flag.equals("update")){
	    order.setId(id);
		cartMgr.updateCart(order);
%>
		<script>
		alert("수정 하였습니다.");
		location.href="CartList.jsp";
		</script>
<%		
		// 장바구니 삭제인 경우
		}else{
		cartMgr.deleteCart(order);
%>
		<script>
		alert("삭제 하였습니다.");
		location.href="CartList.jsp";
		</script>
<%
		}
	}
%>
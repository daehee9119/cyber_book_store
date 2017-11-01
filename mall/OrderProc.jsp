<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, mall.*" %>
<jsp:useBean id="cartMgr" class="mall.CartMgr" scope="session"/>
<jsp:useBean id="orderMgr" class="mall.OrderMgr" />
<jsp:useBean id="proMgr" class="mall.ProductMgr" />
<%
	// 장바구니를 가져옴
	Hashtable hCart = cartMgr.getCartList();
	// 장바구니 목록을 읽음
	Enumeration hCartKey=hCart.keys();
	// 장바구니가 비었는지 조사
	if(hCart.size() !=0){
		// 장바구니의 목록이 있다면 while 구문을 돌면서 주문처리
		while(hCartKey.hasMoreElements()){
			// 장바구니의 주문내역을 읽음
			OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
			// 주문을 한다
			orderMgr.insertOrder(order);
			// 상품재고를 줄인다
			proMgr.reduceProduct(order);		
			// 주문처리된 장바구니 내역을 삭제
			cartMgr.deleteCart(order);
		}
%>
	<script>
	   alert("주문처리 하였습니다");
	   location.href="../mall/OrderList.jsp";
	</script>
<%}else{ %>
	<script>
		alert("장바구니가 비어있습니다.");
		location.href="../mall/OrderList.jsp";
	</script>
<%}%>


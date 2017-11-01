<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, mall.*" %>
<jsp:useBean id="cartMgr" class="mall.CartMgr" scope="session"/>
<jsp:useBean id="orderMgr" class="mall.OrderMgr" />
<jsp:useBean id="proMgr" class="mall.ProductMgr" />
<%
	// ��ٱ��ϸ� ������
	Hashtable hCart = cartMgr.getCartList();
	// ��ٱ��� ����� ����
	Enumeration hCartKey=hCart.keys();
	// ��ٱ��ϰ� ������� ����
	if(hCart.size() !=0){
		// ��ٱ����� ����� �ִٸ� while ������ ���鼭 �ֹ�ó��
		while(hCartKey.hasMoreElements()){
			// ��ٱ����� �ֹ������� ����
			OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
			// �ֹ��� �Ѵ�
			orderMgr.insertOrder(order);
			// ��ǰ��� ���δ�
			proMgr.reduceProduct(order);		
			// �ֹ�ó���� ��ٱ��� ������ ����
			cartMgr.deleteCart(order);
		}
%>
	<script>
	   alert("�ֹ�ó�� �Ͽ����ϴ�");
	   location.href="../mall/OrderList.jsp";
	</script>
<%}else{ %>
	<script>
		alert("��ٱ��ϰ� ����ֽ��ϴ�.");
		location.href="../mall/OrderList.jsp";
	</script>
<%}%>


<%@ page contentType="text/html;charset=euc-kr"%>
<!-- ������� ��ٱ��ϸ� ��� �ִ� ���� ������ -->
<jsp:useBean id="cartMgr" class="mall.CartMgr" scope="session"/>
<!-- ��ٱ��� ������ ���� ���� ���� -->
<jsp:useBean id="order" class="mall.OrderBean" />
<!-- OrderBean�� ������ ���� -->
<jsp:setProperty name="order" property="*" />
<%
	String flag=request.getParameter("flag");
	String id= (String)session.getAttribute("idKey");
	
	if(id == null) {
		//�α��� ���� ������� �α��� �������� �̵�
		response.sendRedirect("Login.jsp"); 
	}else{

		// ��ٱ��� �߰��� ���
		if(flag == null){ 
		order.setId(id);		
		cartMgr.addCart(order);	
%>
		<script>
		alert("��ٱ��Ͽ� ��ҽ��ϴ�.");
		location.href="CartList.jsp";
		</script>
<%
		// ��ٱ��� ������ ���
		}else if(flag.equals("update")){
	    order.setId(id);
		cartMgr.updateCart(order);
%>
		<script>
		alert("���� �Ͽ����ϴ�.");
		location.href="CartList.jsp";
		</script>
<%		
		// ��ٱ��� ������ ���
		}else{
		cartMgr.deleteCart(order);
%>
		<script>
		alert("���� �Ͽ����ϴ�.");
		location.href="CartList.jsp";
		</script>
<%
		}
	}
%>
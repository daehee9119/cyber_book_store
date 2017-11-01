<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, mall.*"%>
<jsp:useBean id="orderMgr" class="mall.OrderMgr" />
<jsp:useBean id="proMgr" class="mall.ProductMgr" />


<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("../admin/AdminLogin.jsp");
	}
%>

<html>
<head>
<title>컴북관리자</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
 
<body bgcolor="#ffffff" topmargin="20">

 
	<table width="800" align="center" bgcolor="#FFFFff">
	<tr> 
	<td align="center" bgcolor="#CCCC66">

		<table width="100%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#ffffff"> 
		<td align="center" bgcolor="#CCCC99"><font color="#0066FF">주문번호</font></td>
		<td align="center" bgcolor="#CCCC99"><font color="#0066FF">고객명</font></td>
		<td align="center" bgcolor="#CCCC99"><font color="#0066FF">수량</font></td>
		<td align="center" bgcolor="#CCCC99"><font color="#0066FF">날짜</font></td>
		<td align="center" bgcolor="#CCCC99"><font color="#0066FF">상태</font></td>
		</tr>
		<%
		Vector vResult = orderMgr.getOrderList();
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="5" bgcolor="#CCCC99"> 주문 내역이 없습니다</td>
		</tr>
		<%}else{
			for(int i=0; i< vResult.size(); i++){
			OrderBean order = (OrderBean)vResult.get(i);			
			ProductBean product = proMgr.getProduct(order.getProduct_no());
		%>
		<tr> 
		<td align="center" bgcolor="#CCCC99">
		<a href="javascript:orderDetail('<%=order.getNo()%>')"><%=order.getNo()%></a></td>
		<td align="center" bgcolor="#CCCC99"><%=order.getId()%></td>
		<td align="center" bgcolor="#CCCC99"><%=order.getQuantity()%></td>
		<td align="center" bgcolor="#CCCC99"><%=order.getDate()%></td>
		<td align="center" bgcolor="#CCCC99">
		<%
		switch(Integer.parseInt(order.getState())){
		case 1 : out.println("접수중");
		break;
		case 2 : out.println("접수");
		break;
		case 3 : out.println("입금확인");
		break;
		case 4 : out.println("배송준비");
		break;
		case 5 : out.println("배송중");
		break;
		default : out.println("완료");
		}%>
		</td>
		<%}
		}%>
		</table>
	
	</td>
	</tr>
	</table>
	

	<form name="detail" method="post" action="../admin/OrderDetail.jsp">
	<input type="hidden" name="no">
	</form>

</body>
</html>

<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*, mall.*" %>
<jsp:useBean id="cartMgr" class="mall.CartMgr" scope="session"/>
<jsp:useBean id="proMgr" class="mall.ProductMgr" />
<%
	if(session.getAttribute("idKey") == null) {
		response.sendRedirect("Login.jsp");
	}else{
%>	
<html>
<head>
<title>�ĺ� ��ٱ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#ffFFFF" topmargin="0">

	<%@ include file="../mall/Top.jsp" %>

	<table width="800" align="center" bgcolor="#ffFFFF">
	<tr>
	<td width="200" valign="top">
		<jsp:include page="../mall/Left.jsp" flush="false"/>
	</td>

<td width="590" valign="top">
<p style="line-height:100%; margin-top:0; margin-bottom:0;"><img src="../jpg/h_baguni_title.gif" width="189" height="53" border="0"></p>
            <p style="line-height:100%; margin-top:0; margin-bottom:0;"><img src="../jpg/h_baguni_sub_title.gif" width="231" height="53" border="0"></p>
            <p style="line-height:100%; margin-top:0; margin-bottom:0;">&nbsp;</p>
		<table width="590" bgcolor="#CCFFFF" cellspacing="0" style="border-collapse:collapse;">
		
		<tr>
			<td align="center" bgcolor="#FF9999" width="250" height="37" style="border-width:1; border-color:black; border-style:dotted;">
			<font color="blue"><b>������</b></font>
			</td>
            <td align="center" bgcolor="#FF9999" width="95" height="37" 
			style="border-width:1; border-color:black; border-style:dotted;">
			<font color="blue"><b>��&nbsp;&nbsp;��</b></font>
			</td>
            <td align="center" bgcolor="#FF9999" width="90" height="37" 
			style="border-width:1; border-color:black; border-style:dotted;">
			<font color="blue"><b>��&nbsp;&nbsp;��</b></font>
			</td>
			<td align="center" bgcolor="#FF9999" width="134" height="37" style="border-width:1; border-color:black; border-style:dotted;">
			<font color="blue"><b>����/����</b></font>
			</td>
		</tr>


		<%
		int totalPrice =0 ;		
		Hashtable hCart = cartMgr.getCartList();
		if(hCart.size() == 0){
		%>


		<tr>
			<td colspan="4" align="center" bgcolor="#66CCFF" width="587" style="border-width:1; border-color:black; border-style:dotted;" height="59">�����Ͻ� ��������� �����ϴ�.</td>
		</tr>	

		<%
		}else{
		Enumeration hCartKey=hCart.keys();
			while(hCartKey.hasMoreElements()){
			OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
			ProductBean product = proMgr.getProduct(order.getProduct_no());
			int price = Integer.parseInt(product.getPrice());
			int quantity = order.getQuantity();
			int subTotal = price*quantity;
			totalPrice += price*quantity;
			
		%>

		<!-- ��ٱ��ϸ� �����ϰų� �����ϴ� ���� ���ó���� CartProc.jsp�� ��� -->
		<form method="post" action="CartProc.jsp">
		<!-- �ش��ǰ�� ��ǰ��ȣ�� ������ ������ �Ѱ��ְ� �ȴ�.
		     ��ٱ����� ��ǰ���� �����̳� ������ ���� �ʿ� -->
		<input type="hidden" name="product_no" value="<%=product.getNo()%>">
		<!-- CartProc.jsp���� ��ٱ��ϸ� ó���� �� ����/������ �����ϱ� ���� ���Ǿ� ����
		     flag�� ���� ����/���� �ش� ��ũ��Ʈ�� �����ϴ� �������� �����Ǿ���
			 CartProc.jsp�� �Ѿ�� �ȴ� -->
		<input type="hidden" name="flag">
		
		<tr> 
		<td align="center" bgcolor="#66CCFF" width="250" style="border-width:1; border-color:black; border-style:dotted;" height="38">	
		<a href="javascript:productDetail('<%=product.getNo()%>')">
		<%=product.getName()%></a>
		</td>
		<td align="center" bgcolor="#66CCFF" width="95" style="border-width:1; border-color:black; border-style:dotted;" height="38">
<input type=text name=quantity value="<%=order.getQuantity()%>" size=5 style="text-align:right;">��
		</td>
		<td align="center" bgcolor="#66CCFF" width="90" style="border-width:1; border-color:black; border-style:dotted;" height="38"><%=subTotal+""%>
		</td>
        <td align="center" bgcolor="#66CCFF" width="134" style="border-width:1; border-color:black; border-style:dotted;" height="38">
        <p align="center">
		<!-- ��ٱ��� ��ǰ�� ������ �����ϰų� ����: flag ���� �����Ǿ� ���� -->
		
		<input type="image" src="../jpg/edit.gif" onclick="javascript:cartUpdate(this.form)" 
		width="37" height="18" border="0">	
		<input type="image" src="../jpg/del.gif" onclick="javascript:cartDelete(this.form)" 
		width="37" height="18" border="0">
			
</p>
	
		</tr>
		</form>
		<%}%>
         <tr>
              <td colspan="4" align="right" bgcolor="#66CCFF" width="587" style="border-width:1; border-color:black; border-style:dotted;" height="32">
              <p align="center">�� �ݾ� :   <%=totalPrice%> ��&nbsp; 
			  
			  <a href="OrderProc.jsp">
			  �ֹ��ϱ�</a>   &nbsp; 
				<A HREF="#" onclick="history.go(-2);">
				��������</a></p>
			</td>
		<!-- ��ٱ��Ͽ� ����� ��ǰ�� �ֹ� -->
		</tr>
		<%
		}
		%>			
			
		</table>

	</td>
	</tr>
	</table>
	
	<%@ include file="../mall/Bottom.jsp" %>

	<!-- ��ǰ �������� ���� ���� �ʿ��� �� -->
	<form name="detail" method="post" action="../mall/ProductDetail.jsp">
	<input type="hidden" name="no">
	</form>	
		
</body>
</html>
<%}%>
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
<title>컴북 장바구니</title>
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
			<font color="blue"><b>도서명</b></font>
			</td>
            <td align="center" bgcolor="#FF9999" width="95" height="37" 
			style="border-width:1; border-color:black; border-style:dotted;">
			<font color="blue"><b>수&nbsp;&nbsp;량</b></font>
			</td>
            <td align="center" bgcolor="#FF9999" width="90" height="37" 
			style="border-width:1; border-color:black; border-style:dotted;">
			<font color="blue"><b>가&nbsp;&nbsp;격</b></font>
			</td>
			<td align="center" bgcolor="#FF9999" width="134" height="37" style="border-width:1; border-color:black; border-style:dotted;">
			<font color="blue"><b>수정/삭제</b></font>
			</td>
		</tr>


		<%
		int totalPrice =0 ;		
		Hashtable hCart = cartMgr.getCartList();
		if(hCart.size() == 0){
		%>


		<tr>
			<td colspan="4" align="center" bgcolor="#66CCFF" width="587" style="border-width:1; border-color:black; border-style:dotted;" height="59">선택하신 도서목록이 없습니다.</td>
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

		<!-- 장바구니를 수정하거나 삭제하는 등의 모든처리는 CartProc.jsp가 담당 -->
		<form method="post" action="CartProc.jsp">
		<!-- 해당상품의 상품번호를 숨겨진 값으로 넘겨주게 된다.
		     장바구니의 상품개수 수정이나 삭제를 위해 필요 -->
		<input type="hidden" name="product_no" value="<%=product.getNo()%>">
		<!-- CartProc.jsp에서 장바구니를 처리할 때 수정/삭제를 구분하기 위해 사용되어 진다
		     flag의 값은 수정/삭제 해당 스크립트를 실행하는 시점에서 결정되어져
			 CartProc.jsp로 넘어가게 된다 -->
		<input type="hidden" name="flag">
		
		<tr> 
		<td align="center" bgcolor="#66CCFF" width="250" style="border-width:1; border-color:black; border-style:dotted;" height="38">	
		<a href="javascript:productDetail('<%=product.getNo()%>')">
		<%=product.getName()%></a>
		</td>
		<td align="center" bgcolor="#66CCFF" width="95" style="border-width:1; border-color:black; border-style:dotted;" height="38">
<input type=text name=quantity value="<%=order.getQuantity()%>" size=5 style="text-align:right;">개
		</td>
		<td align="center" bgcolor="#66CCFF" width="90" style="border-width:1; border-color:black; border-style:dotted;" height="38"><%=subTotal+""%>
		</td>
        <td align="center" bgcolor="#66CCFF" width="134" style="border-width:1; border-color:black; border-style:dotted;" height="38">
        <p align="center">
		<!-- 장바구니 상품의 개수를 수정하거나 삭제: flag 값이 결정되어 진다 -->
		
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
              <p align="center">총 금액 :   <%=totalPrice%> 원&nbsp; 
			  
			  <a href="OrderProc.jsp">
			  주문하기</a>   &nbsp; 
				<A HREF="#" onclick="history.go(-2);">
				이전으로</a></p>
			</td>
		<!-- 장바구니에 담겨진 상품을 주문 -->
		</tr>
		<%
		}
		%>			
			
		</table>

	</td>
	</tr>
	</table>
	
	<%@ include file="../mall/Bottom.jsp" %>

	<!-- 상품 상세정보를 보기 위해 필요한 폼 -->
	<form name="detail" method="post" action="../mall/ProductDetail.jsp">
	<input type="hidden" name="no">
	</form>	
		
</body>
</html>
<%}%>
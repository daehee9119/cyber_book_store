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

<%
OrderBean order = orderMgr.getOrderDetail(request.getParameter("no"));
ProductBean product = proMgr.getProduct(order.getProduct_no());
%>


<html>
<head>
<title>컴북 관리자</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
 
<body bgcolor="#ffffff" topmargin="20">

 
	<table width="567" align="center" bgcolor="#FFFFff">
	<tr> 
	<td align="center" bgcolor="#FFFFff" width="561">

		<form method=post name="order" action="OrderProc.jsp">
		<table width="95%" align="center" bgcolor="#FFFF99" cellspacing="0" style="border-collapse:collapse;">
		<tr bgcolor="#996600"> 
		<td colspan="2" align="center" bgcolor="white" height="40" style="border-width:1; border-color:black; border-style:dotted;" width="528" background="../jpg/_bg.jpg"><font size="5" color="blue">주문 상세내역</font></td>
		</tr>
		<tr> 
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="217" background="../jpg/_bg.jpg"><font color="#0033FF">고객아이디</font></td>
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="308" background="../jpg/_bg.jpg"><%=order.getId()%></td>
		</tr>
		<tr> 
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="217" background="../jpg/_bg.jpg"><font color="#0033FF">주문번호</font></td>
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="308" background="../jpg/_bg.jpg"><%=order.getNo()%></td>
		</tr>
		<tr> 
                        <td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="217" background="../jpg/_bg.jpg"><font color="#0033FF">도서번호</font></td>
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="308" background="../jpg/_bg.jpg"><%=product.getNo()%></td>
		</tr>				
		<tr> 
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="217" background="../jpg/_bg.jpg"><font color="#0033FF">도 서 명</font></td>
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="308" background="../jpg/_bg.jpg"><%=product.getName()%></td>
		</tr>
		<tr> 
                        <td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="217" background="../jpg/_bg.jpg"><font color="#0033FF">도서가격</font></td>
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="308" background="../jpg/_bg.jpg"><%=product.getPrice()%>원</td>
		</tr>
		<tr> 
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="217" background="../jpg/_bg.jpg"><font color="#0033FF">주문수량</font></td>
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="308" background="../jpg/_bg.jpg"><%=order.getQuantity()+""%>개</td>
		</tr>
		<tr> 
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="217" background="../jpg/_bg.jpg"><font color="#0033FF">재고수량</font></td>
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="308" background="../jpg/_bg.jpg"><%=product.getStock()%>개</td>
		</tr>		
		<tr> 
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="217" background="../jpg/_bg.jpg"><font color="#0033FF">주문날짜</font></td>
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="308" background="../jpg/_bg.jpg"><%=order.getDate()%></td>
		</tr>
		<tr> 
                        <td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="217" background="../jpg/_bg.jpg"><font color="#0033FF">금 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</font></td>
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="308" background="../jpg/_bg.jpg"><%=order.getQuantity()*Integer.parseInt(product.getPrice())%>원</td>
		</tr>
		<tr> 
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="217" background="../jpg/_bg.jpg"><font color="#0033FF">주문상태</font></td>
		<td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:dotted;" height="40" width="308" background="../jpg/_bg.jpg">
		<select name="state">
		<option value="1">접수중</option>
		<option value="2">접수</option>
		<option value="3">입금확인</option>
		<option value="4">배송준비</option>
		<option value="5">배송중</option>
		<option value="6">완료</option>
		</select>
		<script>document.order.state.value=<%=order.getState()%></script>
		</td>
		</tr>
                    <tr>
                        <td align="center" bgcolor="white" style="border-width:1; border-color:black; border-style:none;" height="40" width="217" background="../jpg/_bg.jpg">
                            <p><a href=# onClick="window.print()"><b><span style="background-color:rgb(0,0,51);"><font color="#CCFF66">Print</font></span></b></a></p>
</td>
                        <td width="308" height="40" align="center" bgcolor="white" background="../jpg/_bg.jpg" style="border-width:1; border-color:black; border-style:none;">                            <p>
	<input type="image" name="formimage1" src="../jpg/edit.gif" width="37" height="18" border="0"	onclick="javascript:orderUpdate(this.form)">&nbsp;
	<input type="image" name="formimage1" src="../jpg/del.gif" width="37" height="18" border="0"	onclick="javascript:orderDelete(this.form)">
		</p>
</td>
		</tr>
		</table>
		<input type="hidden" name="no" value="<%=order.getNo()%>">
		<input type="hidden" name="flag">
		</form>		
			
	</td>
	</tr>
	</table>
	
	
</body>
</html>


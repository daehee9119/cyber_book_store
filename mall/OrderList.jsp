<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="java.util.*, mall.*" %>
<!-- 상품 및 주문과 관련된 처리를 담당할 빈을 생성 -->
<jsp:useBean id="proMgr" class="mall.ProductMgr" />
<jsp:useBean id="orderMgr" class="mall.OrderMgr" />
<%
	if(session.getAttribute("idKey") == null) {
		//사용자의 로그인 여부를 체크
		response.sendRedirect("Login.jsp");
	}else{
%>

<html>
<head>
<title>컴북 도서 주문 조회</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body oncontextmenu='return false' bgcolor="#ffFFFF" topmargin="0">

	<%@ include file="../mall/Top.jsp" %>
	<table width="800" align="center" bgcolor="#ffFFFF">
	<tr>
	<td width="200" valign="top">
		<TABLE width="177">
			<TR>
				<TD width="171"><jsp:include page="../mall/Left.jsp" flush="false"/></TD>
			</TR>
		</TABLE>
	</td>

	<td width="200" valign="top">

	<table width="606" align="center" bgcolor="#ffFFFF">
	<tr> 
                    <td align="center" bgcolor="#ffFFFF" width="600">
<p><img src="../jpg/main_qna.gif" width="600" height="179" border="0"></p>
		<table width="588" align="center" bgcolor="#ffFFFF" cellspacing="0" style="border-collapse:collapse;">
		<tr bgcolor="#eeeeee"> 
		<td align="center" width="70" height="35" background="../jpg/_bg.jpg" style="border-width:1; border-color:rgb(102,153,204); border-style:ridge;"><font color="blue">주문번호</font></td>
		<td align="center" width="213" height="35" background="../jpg/_bg.jpg" style="border-width:1; border-color:rgb(102,153,204); border-style:ridge;"><font color="blue">도서명</font></td>
		<td align="center" width="80" height="35" background="../jpg/_bg.jpg" style="border-width:1; border-color:rgb(102,153,204); border-style:ridge;"><font color="blue">주문수량</font></td>
		<td align="center" width="103" height="35" background="../jpg/_bg.jpg" style="border-width:1; border-color:rgb(102,153,204); border-style:ridge;"><font color="blue">주문날짜</font></td>
		<td align="center" width="106" height="35" background="../jpg/_bg.jpg" style="border-width:1; border-color:rgb(102,153,204); border-style:ridge;"><font color="blue">주문상태</font></td>
		</tr>
		<%
			//사용자의 ID로 해당 사용자의 주문내역을 읽어옴
			Vector vResult = orderMgr.getOrder(mem_id);
			if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="5" width="584" background="../jpg/_bg.jpg" style="border-width:1; border-color:rgb(102,153,204); border-style:ridge;" height="30">
			주문하신 도서목록이 없습니다.
		</td>
		</tr>		
		<%}
			//Vector에 담겨진 사용자의 주문내역의 정보를 루프로 돌리면서 출력
			else{
			for(int i=0; i< vResult.size(); i++){
			OrderBean order = (OrderBean)vResult.get(i);
			ProductBean product = proMgr.getProduct(order.getProduct_no());
		%>
		<tr> 
		<td align="center" width="70" background="../jpg/_bg.jpg" style="border-width:1; border-color:rgb(102,153,204); border-style:ridge;" height="30"><%=order.getNo()%></td>
		<td align="center" width="213" background="../jpg/_bg.jpg" style="border-width:1; border-color:rgb(102,153,204); border-style:ridge;" height="30"><a href="javascript:productDetail('<%=order.getProduct_no()%>')">
		<%=product.getName()%></a></td>
		<td align="center" width="80" background="../jpg/_bg.jpg" style="border-width:1; border-color:rgb(102,153,204); border-style:ridge;" height="30"><%=order.getQuantity()%></td>
		<td align="center" width="103" background="../jpg/_bg.jpg" style="border-width:1; border-color:rgb(102,153,204); border-style:ridge;" height="30"><%=order.getDate()%></td>
		<td align="center" width="106" background="../jpg/_bg.jpg" style="border-width:1; border-color:rgb(102,153,204); border-style:ridge;" height="30">
		<%
		// 문자형식의 값을 숫자형식으로 변환
		switch(Integer.parseInt(order.getState())){
			case 1 : out.println("접수중");
					break;
			case 2 : out.print("<a href=");
					 out.print("../sample/INIsecurepay.html");
					 out.print(" target=_blank>");
					 out.print("결재하기");
					 out.print("</a>");
					break;
			case 3 : out.println("입급확인");
					break;
			case 4 : out.println("배송준비");
					break;
			case 5 : out.println("배송중");
					break;
			default : out.println("완료");
		}
		%> 
		<%}
		}%>
		</table> 
	
	</td>
	</tr>
	</table>
	
</td>
</tr>
</table>

	<%@ include file="../mall/Bottom.jsp" %>
	<form name="detail" method="post" action="../mall/ProductDetail_order.jsp">
	<input type="hidden" name="no">
	</form>
</body>
</html>
<%}%>



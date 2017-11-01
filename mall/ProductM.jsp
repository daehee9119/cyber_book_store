<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*, mall.*"%>
<!-- 상품과 관련하여 처리를 담당할 빈을 생성 -->
<jsp:useBean id="proMgr" class="mall.ProductMgr" />

<html>
<head>
<title>컴북 도서</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
 
<body oncontextmenu='return false' bgcolor="#ffFFFF" topmargin="0">

	<% //상품목록을 가져온다. 이처럼 여러 정보를 담아오기 위해 Vector를 사용%>
	<%Vector vResult= proMgr.getProductList();%>


            <table valign="top" width="600" align="center" bgcolor="white" cellspacing="0" style="border-collapse:collapse;">
                <tr bgcolor="#CCFFFF">
        <td align="center" width="590" height="25" bgcolor="#0099FF" style="border-width:1; border-color:black; border-style:none;"> 
<font color="white"><b>도 &nbsp;서 &nbsp;목 &nbsp;록</b></font></td>
				</tr> 
<% 
	//Vector에 담겨진 정보만큼 루프를 돌면서 출력
	//등록된 상품이 전혀 없다면 그냥 벗어남
	for(int i=0; i<vResult.size(); i++){
	ProductBean product = (ProductBean)vResult.get(i);
%>
		
				<tr>
                    <td width="196" style="border-width:1; border-color:black; border-style:none;">
					
&nbsp;												
                        <tr>
                    <td width="590" height="23" style="border-width:1; border-color:black; border-style:none;">

                        <p>								
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:productDetail('<%=product.getNo()%>')">&nbsp;
				<%=product.getName()%>&nbsp;/ <%=product.getJuja()%> </a>&nbsp;
				</p>
							</td>
						</tr>
					<!------------------------------------------------------------->
			<%}%>
		

	</table>

	
	<form name="detail" method="post" action="ProductDetail.jsp">
	<input type="hidden" name="no">
	</form>

</body>
</html>


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

	<%@ include file="../mall/Top.jsp" %>
	<% //상품목록을 가져온다. 이처럼 여러 정보를 담아오기 위해 Vector를 사용%>
	<%Vector vResult= proMgr.getProductList();%>


	<table width="800" align="center" bgcolor="#ffFFFF">
	<tr> 
          <td width="200" valign="top">
			<!-------------------------------------------------------->
			<TABLE width="177">
			<TR>
				<TD width="171">a</TD>
			</TR>
			</TABLE>

			<!-------------------------------------------------------->
		  </td>

<%//////////////////////////////////////////////////////////////////////////////////////%>
<%//////////////////////////////////////////////////////////////////////////////////////%>
	
        <td width="600" align="center" bgcolor="white">
            <table valign="top" width="600" align="center" bgcolor="white" border="1">
                <tr bgcolor="#CCFFFF">
                    <td align="center" width="590" colspan=2 height="44" bgcolor="#99FF00"> 
					<font size="5"> 분야 서적 </font></td>
				</tr> 
<% 
	//Vector에 담겨진 정보만큼 루프를 돌면서 출력
	//등록된 상품이 전혀 없다면 그냥 벗어남
	for(int i=0; i<vResult.size(); i++){
	ProductBean product = (ProductBean)vResult.get(i);
%>
		
				<tr>
                    <td width="196">
					
					<!----------------------------------------------------------------->
						<tr>
							<td width="196" rowspan="3" height="198">
								<p align="center">					
								<a href="javascript:productDetail('<%=product.getNo()%>')">
								<img src="../productImage/<%=product.getImage()%>" height="170" width="121"></a></p>
							</td>
							<td width="388" height="30%">
								<a href="javascript:productDetail('<%=product.getNo()%>')">
								<%=product.getName()%></a>
							</td>
						</tr>
						<tr>
							<td width="388" height="30%">
								<%=product.getDate()%>
							</td>
						</tr>
						<tr>
							<td width="388" height="30%">
								<%=product.getJuja()%> | <%=product.getChool()%>
							</td>
						</tr>
					<!------------------------------------------------------------->
			<%}%>
			</td>
		</tr>
		</table>
		
<%//////////////////////////////////////////////////////////////////////////////////////%>

	</table>

	<%@ include file="../mall/Bottom.jsp" %>
	
	<form name="detail" method="post" action="ProductDetail.jsp">
	<input type="hidden" name="no">
	</form>

</body>
</html>


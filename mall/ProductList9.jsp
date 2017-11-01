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
	<%Vector vResult= proMgr.getProductList9();%>


	<table width="800" align="center" bgcolor="#ffFFFF">
	<tr> 
          <td width="200" valign="top">
			<!-------------------------------------------------------->
			<TABLE width="177">
			<TR>
				<TD width="171"><jsp:include page="../mall/Left.jsp" flush="false"/></TD>
			</TR>
			</TABLE>

			<!-------------------------------------------------------->
		  </td>

<%//////////////////////////////////////////////////////////////////////////////////////%>
<%//////////////////////////////////////////////////////////////////////////////////////%>
	
        <td valign="top" width="590" align="left" bgcolor="white">
            <table valign="top" width="590" align="center" bgcolor="white" cellspacing="0" style="border-collapse:collapse;">
                <tr bgcolor="#CCFFFF">
                    <td align="center" width="586" colspan=2 height="44" bgcolor="#33FFFF" style="border-width:1; border-color:black; border-style:none;"> 
<b><font size="5" color="#FF0033"><span style="border-width:1; border-color:black; border-style:none;">신간 도서목록</span></font></b><font size="5">  </font></td>
				</tr> 
<% 
	//Vector에 담겨진 정보만큼 루프를 돌면서 출력
	//등록된 상품이 전혀 없다면 그냥 벗어남
	for(int i=0; i<vResult.size(); i++){
	ProductBean product = (ProductBean)vResult.get(i);
%>
		
				<tr>
                    <td width="176" style="border-width:1; border-color:black; border-style:none;">
					
					<!----------------------------------------------------------------->
						<tr>
							<td width="176" rowspan="3" height="163" style="border-width:1; border-top-color:fuchsia; border-right-color:black; border-bottom-color:fuchsia; border-left-color:fuchsia; border-style:none;">
								<p align="center">					
								<a href="javascript:productDetail('<%=product.getNo()%>')">
								<img src="../productImage/<%=product.getImage()%>" height="140" width="100"></a></p>
							</td>
                    <td width="407" height="30%" style="border-width:1; border-top-color:fuchsia; border-right-color:fuchsia; border-bottom-color:black; border-left-color:black; border-style:none;" valign="bottom">

                        <p>도서명 : <a href="javascript:productDetail('<%=product.getNo()%>')"><%=product.getName()%></a>
</p>
							</td>
						</tr>
						<tr>
                    <td width="407" height="30%" style="border-width:1; border-top-color:black; border-right-color:fuchsia; border-bottom-color:black; border-left-color:black; border-style:none;" valign="middle">
출판일 : <%=product.getDate()%>
							</td>
						</tr>
						<tr>
                    <td width="407" height="30%" style="border-width:1; border-top-color:black; border-right-color:fuchsia; border-bottom-color:fuchsia; border-left-color:black; border-style:none;" valign="top">

                        <p align="left">저자 :  <%=product.getJuja()%> |&nbsp;출판사 :  <%=product.getChool()%>
</p>
                        <p align="left">&nbsp;</p>
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


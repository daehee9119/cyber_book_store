<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*, mall.*"%>
<!-- ��ǰ�� �����Ͽ� ó���� ����� ���� ���� -->
<jsp:useBean id="proMgr" class="mall.ProductMgr" />

<html>
<head>
<title>�ĺ� ����</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
 
<body oncontextmenu='return false' bgcolor="#ffFFFF" topmargin="0">

	<%@ include file="../mall/Top.jsp" %>
	<% //��ǰ����� �����´�. ��ó�� ���� ������ ��ƿ��� ���� Vector�� ���%>
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
					<font size="5"> �о� ���� </font></td>
				</tr> 
<% 
	//Vector�� ����� ������ŭ ������ ���鼭 ���
	//��ϵ� ��ǰ�� ���� ���ٸ� �׳� ���
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


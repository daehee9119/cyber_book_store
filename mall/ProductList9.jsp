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
<b><font size="5" color="#FF0033"><span style="border-width:1; border-color:black; border-style:none;">�Ű� �������</span></font></b><font size="5">  </font></td>
				</tr> 
<% 
	//Vector�� ����� ������ŭ ������ ���鼭 ���
	//��ϵ� ��ǰ�� ���� ���ٸ� �׳� ���
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

                        <p>������ : <a href="javascript:productDetail('<%=product.getNo()%>')"><%=product.getName()%></a>
</p>
							</td>
						</tr>
						<tr>
                    <td width="407" height="30%" style="border-width:1; border-top-color:black; border-right-color:fuchsia; border-bottom-color:black; border-left-color:black; border-style:none;" valign="middle">
������ : <%=product.getDate()%>
							</td>
						</tr>
						<tr>
                    <td width="407" height="30%" style="border-width:1; border-top-color:black; border-right-color:fuchsia; border-bottom-color:fuchsia; border-left-color:black; border-style:none;" valign="top">

                        <p align="left">���� :  <%=product.getJuja()%> |&nbsp;���ǻ� :  <%=product.getChool()%>
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


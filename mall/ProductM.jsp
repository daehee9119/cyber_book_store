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

	<% //��ǰ����� �����´�. ��ó�� ���� ������ ��ƿ��� ���� Vector�� ���%>
	<%Vector vResult= proMgr.getProductList();%>


            <table valign="top" width="600" align="center" bgcolor="white" cellspacing="0" style="border-collapse:collapse;">
                <tr bgcolor="#CCFFFF">
        <td align="center" width="590" height="25" bgcolor="#0099FF" style="border-width:1; border-color:black; border-style:none;"> 
<font color="white"><b>�� &nbsp;�� &nbsp;�� &nbsp;��</b></font></td>
				</tr> 
<% 
	//Vector�� ����� ������ŭ ������ ���鼭 ���
	//��ϵ� ��ǰ�� ���� ���ٸ� �׳� ���
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


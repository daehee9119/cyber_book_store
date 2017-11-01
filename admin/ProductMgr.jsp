<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, mall.*"%>
<jsp:useBean id="proMgr" class="mall.ProductMgr" />

<html>
<head>
<title>컴북 도서 등록</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("../admin/AdminLogin.jsp");
	}
%>
 
<body bgcolor="#ffffff" topmargin="20">



	<table width="800" align="center" bgcolor="#FFFFff">
	<tr> 
	<td align="center" bgcolor="#FFFFff">
 
		<table width="100%" align="center" bgcolor="#FFFFff" border="1">
                <tr bgcolor="#ffffff">
                    <td align="center" width="109" height="36">
                        <p><font color="blue">도서분류</font></p>
</td>
		<td align="center" width="384" height="36"><font color="blue">도서명</font></td>
		<td align="center" width="127" height="36"><font color="blue">저자</font></td>
                    <td align="center" width="146" height="36">

                        <p><font color="blue">ISBN</font></p>
</td>
		</tr>
		<%
		Vector vResult= proMgr.getProductList();
		if(vResult.size() ==0){
		%>
		<tr> 
                    <td align="center" colspan="4" width="784">
					<font color="red">등록된 도서 목록이 없습니다.</font></td>
		</tr>
		<%}else{
			for(int i=0; i<vResult.size(); i++){
			ProductBean product = (ProductBean)vResult.get(i);
		%>
                <tr>
                    <td align="center" bgcolor="#99CC66" width="109">                        

                        
		
                        <p><%=product.getCode()%></p>
</td>
		<td align="center" bgcolor="#99CC66" width="384">
		<a href="javascript:productDetail('<%=product.getNo()%>')">
		<%=product.getName()%></a></td>
		<td align="center" bgcolor="#99CC66" width="127"><%=product.getJuja()%></td>
                    <td align="center" bgcolor="#99CC66" width="146">

                        <p><%=product.getIsbn()%></p>
</td>
		</tr>
		<%}
		}%>
		<tr>
		<td colspan="4" align="center" width="784" height="46"><a href="ProductInsert.jsp">도서등록</a></td>
		</tr>
		</table>
		
	</td>
	</tr>
	</table>

	<form name="proForm" method="post" action="ProductMgr.jsp">
	<input type="hidden" name="no">
	</form>

	<form name="detail" method="post" action="ProductDetail.jsp">
	<input type="hidden" name="no">
	</form>

</body>
</html>
   
<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, mall.*"%>
<jsp:useBean id="proMgr" class="mall.ProductMgr" />


<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("../admin/AdminLogin.jsp");
	}
%>


<html>
<head>
<title>컴북 도서 등록</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#ffffff" topmargin="0">

	
	<%ProductBean product= proMgr.getProduct(request.getParameter("no"));%>

	<table width="800" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFff">

		<table width="800" align="center" bgcolor="white" cellspacing="0" style="border-collapse:collapse;">
		<tr bgcolor="#996600"> 
		<td colspan="3" align="center" width="790" bgcolor="yellow" height="31" style="border-width:1; border-color:black; border-style:none;"><font size="4" color="blue"><%=product.getName()%></font></td>
		</tr>
		<tr> 
                    <td width="24%" colspan="2" height="201" style="border-width:1; border-color:black; border-style:none;">
				
                        <p align="center"><img src="../productImage/<%=product.getImage()%>" height="180" width="130">
</p>
		</td>
                    <td width="74%" valign="top" height="201" style="border-width:1; border-color:black; border-style:none;">
			<table width="100%" heigth="100%" cellspacing="0" style="border-collapse:collapse;">
			<tr>
                                <td style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
			</tr>			
			<tr>
                                <td style="border-width:1; border-color:black; border-style:none;"><b>도 &nbsp;서 명 : </b><%=product.getName()%></td>
			</tr>			
			<tr>
                                <td style="border-width:1; border-color:black; border-style:none;"><b>저 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자 : </b><%=product.getJuja()%></td>
			</tr>
			<tr>
                                <td style="border-width:1; border-color:black; border-style:none;"><b>출판일자 : </b><%=product.getDate()%></td>
			</tr>
			<tr>
			<td style="border-width:1; border-color:black; border-style:none;"><b>    </b><b>가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격 : </b><%=product.getPrice()%></td>
			</tr>
			<tr>
                                <td style="border-width:1; border-color:black; border-style:none;">                                    
                                    <p><b>&nbsp;I&nbsp;S&nbsp;B&nbsp;N&nbsp;&nbsp;: </b><%=product.getIsbn()%></p>
</td>
			</tr>
			<tr>
                                <td style="border-width:1; border-color:black; border-style:none;">
                                    <p><b>&nbsp;재 고 량 : </b><%=product.getStock()%></p>
</td>
			</tr>
			</table>
		
		</td>
		</tr>
                <tr>
                    <td width="108" valign="top" style="border-width:1; border-color:black; border-style:none;">
                        <p align="center"><b>도서설명</b>
</p>
                        <pre>&nbsp;</pre></td>
                    <td width="676" valign="top" colspan="2" style="border-width:1; border-color:black; border-style:none;">                        
                        <form name="form1">
<pre><textarea name="formtextarea1" rows="10" cols="95"><%=product.getDetail()%></textarea></pre>
                        </form>
                        <p>&nbsp;</p>
</td>
		</tr>
		<tr> 
		<td colspan="3" align="center" width="790" height="36" style="border-width:1; border-color:black; border-style:none;">
		<a href="javascript:productUpdate('<%=product.getNo()%>')">수정하기</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:productDelete('<%=product.getNo()%>')">삭제하기</a>
		</td>
		</tr>
		</table>

	</td>
	</tr>
	</table>


	<form name="update" method="post" action="ProductUpdate.jsp">
	<input type=hidden name=no>
	</form>
	
	<form name="del" method="post" action="ProductProc.jsp?flag=delete">
	<input type=hidden name=no>
	</form>


</body>
</html>



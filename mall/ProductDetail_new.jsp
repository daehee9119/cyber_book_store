<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, mall.*"%>
<!-- ��ǰ������ �������� ���ؼ� ��ǰó���� ����ϴ� ���� ���� -->
<jsp:useBean id="proMgr" class="mall.ProductMgr" />

<html>
<head>
<title>�ĺ� ����</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#ffFFFF" topmargin="0">

	<%//��ǰ �������� ��ǰ��ȣ(no)�� ���� �����´� %>
	<%ProductBean product= proMgr.getProduct(request.getParameter("no"));%>
	
            <table valign="top" width="543" align="center" bgcolor="#ffFFFF" cellspacing="0" style="border-collapse:collapse;">
                <tr bgcolor="#ffFFFF">
                    <td colspan="2" align="center" width="539" style="border-width:1; border-color:black; border-style:none;" height="70">
					<b><font color="blue"><span style="font-size:20pt;"><%=product.getName()%></span></font></b></td>
		</tr>
                <tr>
                    <td width="24%" height="235" style="border-width:1; border-color:black; border-style:none;">
                        <p align="center" valign="top"><!-- ��ǰ�� �̹����� ��θ� ����Ͽ� �̹��� ��� -->
		<img src="../productImage/<%=product.getImage()%>" height="180" width="120" align="top">
</p>
                        <p align="center" valign="top">
&nbsp;</p>
		</td>
                    <td width="404" valign="top" height="235" style="border-width:1; border-color:black; border-style:none;">

                        <form name="cart" action="../mall/CartProc.jsp">
                            <table border="0" width="100%" heigth="100%">
                                <tr>
                                    <td width="382" valign="bottom"><b>�� &nbsp;&nbsp;�� : </b><%=product.getCode()%></td>
								</tr>			
                                <tr>
                                    <td width="382" valign="bottom">
                                        <p><b>    ��&nbsp;&nbsp;&nbsp;�� : </b><%=product.getJuja()%></p>
									</td>
								</tr>
                                <tr>
                                    <td width="382" valign="bottom">
                                        <p><b>    ������ : </b><%=product.getDate()%></p>
									</td>
								</tr>
                                <tr>
                                    <td width="382" valign="bottom">
                                        <p><b>    &nbsp;ISBN&nbsp; :</b>
										<%=product.getIsbn()%></p>
									</td>
								</tr>
                                <tr>
                                    <td width="382" valign="bottom">
                                        <p><b>��    &nbsp;&nbsp;�� : </b>
										<%=product.getPrice()%></p>
									</td>
								</tr>
                                <tr>
                                    <td align="center" width="382" valign="bottom">			
                                        
										<p align="center">
										<A HREF="#" onclick="history.go(-1);">
										<input type="button" value="��������"></a></p>
</td>
			</tr>
			</table>
			<p><input type=hidden name=product_no value=<%=product.getNo()%>></p>
</form>
		
		
		</td>
		</tr>
                <tr valing="top">
                    <td width="132" height="238" valing="top" style="border-width:1; border-color:black; border-style:none;" valign="top">                        <p><b>��������</b><br></p>
                        <ul>
                            <pre>&nbsp;</pre>
                        </ul>
</td>
                    <td width="404" height="238" valign="top" style="border-width:1; border-color:black; border-style:none;">                        <pre><%=product.getDetail()%></pre>
</td>
		</tr>
		</table>

</body>
</html>





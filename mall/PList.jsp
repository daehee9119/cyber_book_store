<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*, mall.*"%>
<!-- ��ǰ�� �����Ͽ� ó���� ����� ���� ���� -->
<jsp:useBean id="proMgr" class="mall.ProductMgr" />
<%
  request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<title>�ĺ� ����</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
   String keyFieldB ="" ;
   String keyWordB ="" ; 
  
	if(request.getParameter("keyWordB") !=null){
			keyWordB =request.getParameter("keyWordB");
			keyFieldB =request.getParameter("keyFieldB");
		}
		
	if(request.getParameter("reload") !=null){
		if(request.getParameter("reload").equals("true")){
			keyWordB ="";
			keyFieldB ="";
			}
	}

%>

<body oncontextmenu='return false' bgcolor="#ffFFFF" topmargin="0">

	<%@ include file="../mall/Top.jsp" %>
	<% //��ǰ����� �����´�. ��ó�� ���� ������ ��ƿ��� ���� Vector�� ���%>
	<%Vector vResult= proMgr.getProductList(keyFieldB, keyWordB);%>


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
	
        <td valign="top" width="600" align="center" bgcolor="white">
            <table valign="top" width="600" align="center" bgcolor="white" cellspacing="0" style="border-collapse:collapse;">
                <tr bgcolor="#CCFFFF">
                    <td align="center" width="590" colspan=2 height="44" style="border-width:1; border-color:black; border-style:none;"> 
<b><font size="5" color="#333399">�� �� �� ��</font></b><font size="5" color="#00CCFF"><b> </b></font></td>
				</tr> 
<% 
	//Vector�� ����� ������ŭ ������ ���鼭 ���
	//��ϵ� ��ǰ�� ���� ���ٸ� �׳� ���
	for(int i=0; i<vResult.size(); i++){
	ProductBean product = (ProductBean)vResult.get(i);
%>   	

				
				<tr>
                    <td width="196" style="border-width:1; border-color:black; border-style:none;">
					
					<!----------------------------------------------------------------->
						<tr>
							<td width="196" rowspan="3" height="198" style="border-width:1; border-color:black; border-style:none;">
								<p align="center">					
								<a href="javascript:productDetail('<%=product.getNo()%>')">
								<img src="../productImage/<%=product.getImage()%>" height="170" width="121"></a></p>
							</td>
							<td width="388" height="30%" style="border-width:1; border-color:black; border-style:none;">
								<a href="javascript:productDetail('<%=product.getNo()%>')">
								<%=product.getName()%></a>
							</td>
						</tr>
						<tr>
							<td width="388" height="30%" style="border-width:1; border-color:black; border-style:none;">
								<%=product.getDate()%>
							</td>
						</tr>
						<tr>
							<td width="388" height="30%" style="border-width:1; border-color:black; border-style:none;">
								<%=product.getJuja()%> | <%=product.getChool()%>
							</td>
						</tr>
					<!------------------------------------------------------------->
			<%}%>
			</td>
					
			

		</tr>
		</table>
		<!------------------------------------------------------------------------>
		<center> <br><br>
			<font size="4" color="#FF3366">
			<% if (vResult.size()==0) { out.println("�˻��� ������ �����ϴ�"); } %>
			</font>	
		<center>
		<!------------------------------------------------------------------------>

	</table>

	<%@ include file="../mall/Bottom.jsp" %>
	
	<form name="detail" method="post" action="ProductDetail.jsp">
	<input type="hidden" name="no">
	</form>

</body>
</html>


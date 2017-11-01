<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, mall.*"%>
<jsp:useBean id="proMgr" class="mall.ProductMgr" />

<html>
<head>
<title>컴북 도서 수정등록</title>
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

	
	<%ProductBean product= proMgr.getProduct(request.getParameter("no"));%>

<table width="800" align="center" bgcolor="white">
    <tr>
        <td align="center" bgcolor="#FFFFff">
		<form method="post" name="regFrom" action="ProductProc.jsp?flag=update" enctype="multipart/form-data">
                <table width="800" align="center" bgcolor="white" border="1">
                    <tr bgcolor="#996600">
                        <td colspan="2" align="center" bgcolor="yellow"><b>
						<font size="7" color="red">도서 수정등록</font></b></td>
			</tr>
                    <tr>
                        <td align="center" width="104" bgcolor="#99CCCC">도서분류</td>
                        <td align="left" width="523" bgcolor="#FFCC99">
						<select name="code" size="1">
							<option selected value="0">선택하세요</option>
							<option value="운영체제">운영체제</option>
							<option value="데이터베이스">데이터베이스</option>
							<option value="그래픽">그래픽</option>
							<option value="웹/홈페이지">웹/홈페이지</option>
							<option value="입문/활용">입문/활용</option>
							<option value="컴퓨터공학">컴퓨터공학</option>
							<option value="프로그래밍">프로그래밍</option>
							<option value="자격/수험서">자격/수험서</option>
						</select>
						<script> 
								document.regFrom.code.value="<%=product.getCode()%>" 
						</script>
						</td>
					</tr>
                    <tr>
                        <td align="center" width="104" bgcolor="#99CCCC">도&nbsp;서 명</td>
                        <td align="left" width="523" bgcolor="#FFCC99"><input type="text" name="name" size="20" value="<%=product.getName()%>"></td>
					</tr>
                    <tr>
                        <td align="center" width="104" bgcolor="#99CCCC">저&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자</td>
                        <td align="left" width="523" bgcolor="#FFCC99"><input type="text" name="juja" size="20" value="<%=product.getJuja()%>"></td>
			</tr>
                    <tr>
                        <td align="center" width="104" bgcolor="#99CCCC">출 판 사</td>
                        <td align="left" width="523" bgcolor="#FFCC99"><input type="text" name="chool" size="20" value="<%=product.getChool()%>"></td>
			</tr>

			<tr>
                        <td align="center" width="104" bgcolor="#99CCCC">도서설명</td>
                        <td width="523" bgcolor="#FFCC99">

                            <p align="left"><textarea rows="10" cols="70" name="detail"><%=product.getDetail()%></textarea></p>
</td>
			</tr>
                    <tr>
                        <td align="center" width="104" bgcolor="#99CCCC">출판일자</td>
                        <td width="523" bgcolor="#FFCC99">
						<input type="text" name="day" size="10" value="<%=product.getDate()%>"></td>
			</tr>
                    <tr>
                        <td align="center" width="104" bgcolor="#99CCCC">도서수량</td>
                        <td width="523" bgcolor="#FFCC99">
						<input type="text" name="stock" size="10" value="<%=product.getStock()%>">개</td>
			</tr>
                    <tr>
						<tr>
                            <td align="center" width="104" bgcolor="#99CCCC">도서가격</td>
                            <td width="523" bgcolor="#FFCC99">
							<input type="text" name="price" size="10" value="<%=product.getPrice()%>">원</td>
			</tr>
                        <tr>
                            <td align="center" width="104" bgcolor="#99CCCC">I S B N</td>
                            <td width="523" bgcolor="#FFCC99">
							<input type="text" name="isbn" size="10" value="<%=product.getIsbn()%>" maxlength="10"></td>
			</tr>
                        <tr>
                            <td align="center" width="104" height="29" bgcolor="#99CCCC">
							북 커&nbsp;버</td>
                            <td width="523" height="29" bgcolor="#FFCC99">
								<img src="../productImage/<%=product.getImage()%>">
								<input type="file" name="image">
							</td>
						</tr>

					    <tr>
                            <td colspan="2" align="center" bgcolor="yellow" height="49"> 
				<input type="submit" value="도서수정">&nbsp;&nbsp;&nbsp;
				<input type="reset" value="다시쓰기">
			</td>
			</tr>
			</table>
					<input type=hidden name="no" value="<%=product.getNo()%>">
		</form>
	
	</td>
	</tr>
	</table><p>&nbsp;</p>



</body>
</html>
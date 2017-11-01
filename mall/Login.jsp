<%@ page contentType="text/html;charset=EUC-KR"%>

<html>
<head>
<title>컴북 로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

	<%@ include file="Top.jsp" %>

<body bgcolor="#FFFFFF" topmargin="0">

	<table width="600" border="0" align="center">
    <tr bordercolor="#FFFF66">
        <td colspan="2" align="center" width="685">
			<img src="../jpg/login_new.jpg" width="680" height="136" border="0">
		</td>
	</tr>
    <tr>
        <td width="295" align="center" height="167">
            <p>&nbsp;</p>
            <p><img src="../jpg/str_01.gif" width="318" height="29" border="0"></p>
			
			<!--로그인-->
			<form method="post" action="LoginProc.jsp">
			<table width="266" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td width="68" style="border-width:1; border-color:black; border-style:none;" height="34"><img src="../jpg/ico_id.gif" width="64" height="17" border="0"></td>
                    <td width="87" style="border-width:1; border-color:black; border-style:none;" height="34">
                        <p><input type="text" name="mem_id" maxlength="8" size="8"></p>
					</td>
                        <td width="101" rowspan="2" style="border-width:1; border-color:black; border-style:none;" height="53">
					                            <p><a href="../mall/LoginProc.jsp">
												<INPUT TYPE=IMAGE src="../jpg/btn_submit.gif" width="91" height="54" border="0">
</a></p>
</td>
                </tr>
                <tr>
                    <td width="68" style="border-width:1; border-color:black; border-style:none;" height="19"><img src="../jpg/ico_pwd.gif" width="64" height="16" border="0"></td>
                    <td width="87" style="border-width:1; border-color:black; border-style:none;" height="19">
                     <p><input type="password" name="mem_passwd" maxlength="8" size="8"></p>
					</td>
                </tr>
			</table>
			</form>
		 <!--로그인-->
		</td>

        <td width="384" align="center" rowspan="2" height="275"><img src="../jpg/login_hellow.gif" width="361" height="286" border="0"></td>
		</tr>
    <tr>
        <td align="center" width="295" height="86">
            <p style="line-height:100%; margin-top:0; margin-bottom:0;">&nbsp;</p>
            <p style="line-height:150%; margin-top:0; margin-bottom:0;"><span style="font-size:10pt;">회원으로 가입하시겠습니까? &nbsp;</span></p>
            <p style="line-height:150%; margin-top:0; margin-bottom:0;"><a href="../mall/Register.jsp"><img src="../jpg/regis.gif" width="100" height="27" border="0"></a></p>
            <p>&nbsp;</p>
		</td>
	</tr>
	

	</table>

	<%@ include file="Bottom.jsp" %>
	
</body>
</html>
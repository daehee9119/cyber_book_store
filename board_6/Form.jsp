<%@ page contentType="text/html; charset=EUC-KR"%>

<html>
<head>
<title>컴북 교재채택관련</title>
</head>

<script  language="JavaScript">

	function inputCheck(){
		if(document.regForm.name.value==""){
			alert("고객님 성명을 입력해 주세요.");
			document.regForm.name.focus();
			return;
		}
		if(document.regForm.email.value==""){
			alert("이메일을 입력해 주세요.");
			document.regForm.email.focus();
			return;
		}
		if(document.regForm.phone.value==""){
			alert("연락처를 입력해 주세요.");
			document.regForm.phone.focus();
			return;
		}
		if(document.regForm.content1.value==""){
			alert("제목을 입력해 주세요.");
			document.regForm.content1.focus();
			return;
		}
		if(document.regForm.content2.value==""){
			alert("내용을 입력해 주세요.");
			document.regForm.content2.focus();
			return;
		}
		document.regForm.submit();
	}

	function JujaDetail(no) {
		document.detail.no.value=no;
		document.detail.submit();
	}

</script>



<body>


		<form method="post" name="regForm" action="../board_6/Insert.jsp"> &nbsp;			
		<table width="600" cellspacing="0">
                <tr>
            <td width="600" colspan="3" height="42">

                <p><img src="../jpg/title-3.gif" width="146" height="32" border="0"></p>
					</td>	
                </tr>
                <tr>
                    <td width="119" height="10">
                        <p align="right"><font color="blue">성 &nbsp;&nbsp;명 </font></p>
					</td>
                    <td width="10" height="22">&nbsp;</td>
                    <td width="471" height="22">

                        <p><input type="text" name="name" size="20"></p>
					</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
                        <p align="right"><font color="blue">이메일</font></p>
					</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="471" style="border-width:1; border-color:black; border-style:none;">
                            <p><input type="text" name="email" size="41"></p>
					</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
                        <p align="right"><font color="blue">전화번호</font></p>
</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="471" style="border-width:1; border-color:black; border-style:none;">
                            <p><input type="text" name="phone" size="41"></p>
</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
                        <p align="right"><font color="blue">제 &nbsp;&nbsp;목</font></p>
</td>
                    <td width="10">&nbsp;</td>
                    <td width="471">

                        <p><input type="text" name="content1" size="65"></p>
					</td>
                </tr>
                <tr>
                    <td width="119">
                        <p align="right"><font color="blue">내 &nbsp;&nbsp;용</font></p>
					</td>
                    <td width="10">&nbsp;</td>
                    <td width="471">       <p>
					<textarea name="content2" rows="9" cols="65">교재명 : 
학교명 : 
담당교과 :
담당교수 :
e-mail : 
연락처 : 
주   소 :</textarea></p>
					</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
<font color="blue">&nbsp;</font>					</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="471" style="border-width:1; border-color:black; border-style:none;">                        &nbsp;					</td>
                </tr>
                
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
            <td width="471" style="border-width:1; border-color:black; border-style:none;">
                        
						<A HREF="#" onclick="inputCheck();">
						<img src="../jpg/btn_regis.gif" width="98" height="27" border="0"></a>
						
						<A HREF="#" onclick="self.close();">
						<img src="../jpg/btn_cancel.gif" style='cursor:pointer;' width="98" height="27" border="0">
						</a>
					</td>
                </tr>
            
			</table>
			</form>

</body>
</html> 
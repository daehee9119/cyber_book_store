<%@ page contentType="text/html; charset=EUC-KR"%>

<html>
<head>
<title>저자모집</title>
</head>

<script  language="JavaScript">

	function inputCheck(){
		if(document.jujaForm.name.value==""){
			alert("이름을 입력해 주세요.");
			document.jujaForm.name.focus();
			return;
		}
		if(document.jujaForm.phone.value==""){
			alert("전화번호을 입력해 주세요.");
			document.jujaForm.phone.focus();
			return;
		}
		if(document.jujaForm.email.value==""){
			alert("이메일을 입력해 주세요.");
			document.jujaForm.email.focus();
			return;
		}

		if(document.jujaForm.content3.value==""){
			alert("자기소개서를 입력해 주세요.");
			document.jujaForm.content3.focus();
			return;
		}
		document.jujaForm.submit();
	}

	function JujaDetail(no) {
		document.detail.no.value=no;
		document.detail.submit();
	}

</script>



<body>

	<%@ include file="../mall/Top.jsp" %>



<table  width="800" align="center" cellspacing="0" style="border-collapse:collapse;">
    <tr>
        <td width="200" valign="top">
				<jsp:include page="../mall/Left.jsp" flush="false"/>
		</td>
        
		<td width="396">

		<form method="post" name=jujaForm action="../board_3/Insert.jsp"> 
		<table width="600" cellspacing="0">
                <tr>
                    <td width="600" colspan="3">
                        <p><img src="../jpg/juja1.gif" width="588" height="107" border="0"></p>
                        <p><img src="../jpg/juja2.gif" width="600" height="265" border="0"></p>
					</td>	
                </tr>
                <tr>
                    <td width="119" height="10">
                        <p align="right">성 &nbsp;&nbsp;명 </p>
					</td>
                    <td width="10" height="22">&nbsp;</td>
                    <td width="471" height="22">

                        <p><input type="text" name="name" size="20"></p>
					</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
                        <p align="right">이메일</p>
					</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="471" style="border-width:1; border-color:black; border-style:none;">
                            <p><input type="text" name="email" size="41"></p>
					</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
                        <p align="right">전화번호</p>
</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="471" style="border-width:1; border-color:black; border-style:none;">
                            <p><input type="text" name="phone" size="41"></p>
</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
                        <p align="right">이력사항</p>
</td>
                    <td width="10">&nbsp;</td>
                    <td width="471">

                        <p><textarea name="content1" rows="8" cols="67">성 별 :
주민등록번호 :
주 소 :
최종학력 :</textarea></p>
					</td>
                </tr>
                <tr>
                    <td width="119">
                        <p align="right">경력사항</p>
					</td>
                    <td width="10">&nbsp;</td>
                    <td width="471">       <p>
					<textarea name="content2" rows="8" cols="67">근무경력
집필경력
저술 및 병역경력</textarea></p>
					</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
                        <p align="right">자기소개서</p>
					</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="471" style="border-width:1; border-color:black; border-style:none;">                        <p><textarea name="content3" rows="8" cols="67"></textarea></p>
					</td>
                </tr>
                
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="471" style="border-width:1; border-color:black; border-style:none;">
                        <input type="button" value="등록" onclick="inputCheck();" >
						<input type="reset" value="다시쓰기">
					</td>
                </tr>
            
			</table>
			</form>

		</td>
</tr>
</table>


<p>&nbsp;</p>

	<%@ include file="../mall/Bottom.jsp" %>

</body>
</html> 
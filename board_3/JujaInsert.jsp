<%@ page contentType="text/html; charset=EUC-KR"%>

<html>
<head>
<title>���ڸ���</title>
</head>

<script  language="JavaScript">

	function inputCheck(){
		if(document.jujaForm.name.value==""){
			alert("�̸��� �Է��� �ּ���.");
			document.jujaForm.name.focus();
			return;
		}
		if(document.jujaForm.phone.value==""){
			alert("��ȭ��ȣ�� �Է��� �ּ���.");
			document.jujaForm.phone.focus();
			return;
		}
		if(document.jujaForm.email.value==""){
			alert("�̸����� �Է��� �ּ���.");
			document.jujaForm.email.focus();
			return;
		}

		if(document.jujaForm.content3.value==""){
			alert("�ڱ�Ұ����� �Է��� �ּ���.");
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
                        <p align="right">�� &nbsp;&nbsp;�� </p>
					</td>
                    <td width="10" height="22">&nbsp;</td>
                    <td width="471" height="22">

                        <p><input type="text" name="name" size="20"></p>
					</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
                        <p align="right">�̸���</p>
					</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="471" style="border-width:1; border-color:black; border-style:none;">
                            <p><input type="text" name="email" size="41"></p>
					</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
                        <p align="right">��ȭ��ȣ</p>
</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="471" style="border-width:1; border-color:black; border-style:none;">
                            <p><input type="text" name="phone" size="41"></p>
</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
                        <p align="right">�̷»���</p>
</td>
                    <td width="10">&nbsp;</td>
                    <td width="471">

                        <p><textarea name="content1" rows="8" cols="67">�� �� :
�ֹε�Ϲ�ȣ :
�� �� :
�����з� :</textarea></p>
					</td>
                </tr>
                <tr>
                    <td width="119">
                        <p align="right">��»���</p>
					</td>
                    <td width="10">&nbsp;</td>
                    <td width="471">       <p>
					<textarea name="content2" rows="8" cols="67">�ٹ����
���ʰ��
���� �� �������</textarea></p>
					</td>
                </tr>
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">
                        <p align="right">�ڱ�Ұ���</p>
					</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="471" style="border-width:1; border-color:black; border-style:none;">                        <p><textarea name="content3" rows="8" cols="67"></textarea></p>
					</td>
                </tr>
                
                <tr>
                    <td width="119" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="10" style="border-width:1; border-color:black; border-style:none;">&nbsp;</td>
                    <td width="471" style="border-width:1; border-color:black; border-style:none;">
                        <input type="button" value="���" onclick="inputCheck();" >
						<input type="reset" value="�ٽþ���">
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
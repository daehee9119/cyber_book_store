<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head><title>Q &amp; A</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
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
		if(document.regForm.subject.value==""){
			alert("제목 입력해 주세요.");
			document.regForm.subject.focus();
			return;
		}
		if(document.regForm.content.value==""){
			alert("내용을 입력해 주세요.");
			document.regForm.content.focus();
			return;
		}
		if(document.regForm.pass.value==""){
			alert("비밀번호를 입력해 주세요.");
			document.regForm.pass.focus();
			return;
		}
	  document.regForm.submit();
	}   
 </script>
</head>


<body>

	<%@ include file="../mall/Top.jsp" %>


<table valign="top" bgcolor="#ffFFFF" width="800" border=0 align="center">
<tr>
	<td valign="top" width="200">
		<jsp:include page="../mall/Left.jsp" flush="false"/>
	</td>

<td valign="top">

<center>
<br><br>
<table width="489" cellspacing=0 cellpadding=3>
 <tr>
     <td bgcolor=84F399 height="37" align=center width="483">
	 <font size="4">글 쓰 기</font></td>
 </tr>
</table>
<br>

<table width="527" cellspacing=0 cellpadding=3 align=center>
<form name=regForm method=post action="../board_4/PostProc.jsp">
 <tr>
  <td align=center width="521">
   <table border=0 width="491" align=center>
    <tr>
     <td width="20%">
      <p align="center">성 &nbsp;&nbsp;명</p>
</td>
     <td width="78%"><input type=text name=name size=10 maxlength=8></td>
    </tr>
    <tr>
         <td width="20%">
         <p align="center">E-Mail</p>
</td>
	 <td width="78%"><input type=text name=email size=30 maxlength=30></td>
    </tr>
    <tr>
                                    <td width="20%">
                                        <p align="center">제 &nbsp;&nbsp;&nbsp;목</p>
</td>
     <td width="78%"><input type=text name=subject size=50 maxlength=30></td>
    </tr>
    <tr>
                                    <td width="20%">
                                        <p align="center">내 &nbsp;&nbsp;&nbsp;용</p>
</td>
     <td width="78%"><textarea name=content rows=10 cols=50></textarea></td>
    </tr>
    <tr>
                                    <td width="20%">
                                        <p align="center">비밀 번호</p>
</td> 
     <td width="78%"><input type=password name=pass size=15 maxlength=15></td>
    </tr>
    <tr>
     <td colspan=2 width="485"><hr size=1>
                                        
	<form name="form1">
    <p align="center"><input type=button value="등록" onClick="check()">&nbsp;&nbsp;
    <input type=reset value="다시쓰기">&nbsp;&nbsp;
	<input type=button value="이전으로" onClick="history.go(-1)">
</p>
                                        </form>
</td>
    </tr>
    <tr>
     <td width="100">&nbsp;     </td>
    </tr> 
    <input type=hidden name=ip value="<%=request.getRemoteAddr()%>">
   </table>
  </td>
 </tr>
</form> 
</table>
</center>

</td>
</tr>
</table>

<%@ include file="../mall/Bottom.jsp" %>

</body>
</html>

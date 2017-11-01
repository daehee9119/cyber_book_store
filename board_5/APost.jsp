<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head><title>F A Q</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		 if (document.post.content.value == ""){
             alert("내용을 입력해 주세요.");
               document.post.content.focus();
               return;
              }
		if(document.post.subject.value==""){
			alert("제목 입력해 주세요.");
			document.post.subject.focus();
			return;
		}
              document.post.submit();
	}   
 </script>
</head>

<body bgcolor="#ffFFFF">
	


<center>
<table valign="top" width="70%" cellspacing=0 cellpadding=3>
 <tr>
            <td bgcolor=84F399 height="30" align=center>F&nbsp;A&nbsp;Q 등록</td>
 </tr>
</table>
<br>
<table width="70%" cellspacing=0 cellpadding=3 align=center>
<form name=post method=post action="../board_5/APostProc.jsp">
 <tr>
  <td align=center>
   <table border=0 width="100%" align=center>
                                <tr>
                                    <td width="21%">
                                        <p>제 목</p>
</td>
                                    <td width="78%">
                                        <p><input type=text name=subject size="65" maxlength="90"></p>
</td>
    </tr>
    <tr>
     <td width="21%">내 용</td>
     <td width="78%"><textarea name=content rows=10 cols="65"></textarea></td>
    </tr>
    <tr>
     <td width="21%">&nbsp;</td> 
     <td width="78%"><input type=hidden name=pass size=15 maxlength=15 value="word"></td>
    </tr>
    <tr>
     <td colspan=2 width="601" height="35"><hr size=1>
                            <form name="form1">
                                <p align="center">
							<input type=button value="등록" onClick="check()">&nbsp;&nbsp;
							<input type=reset value="다시쓰기">&nbsp;
							<input type=button value="뒤로" onClick="history.go(-1)"></p>
                            </form>
</td>
    </tr>
    <tr>
                        
    </tr> 
    <input type=hidden name=ip value="<%=request.getRemoteAddr()%>">
   </table>
  </td>
 </tr>
</form> 
</table>
</center>


</body>
</html>

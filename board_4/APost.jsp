<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head><title>Q &amp; A</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		 if (document.post.content.value == ""){
                            alert("������ �Է��� �ּ���.");
                           document.post.content.focus();
                           return;
              }
              document.post.submit();
	}   
 </script>
</head>



<center>
<br><br>
<table width="528" cellspacing=0 cellpadding=3>
 <tr>
                        <td bgcolor=84F399 height="37" align=center width="522"><font size="4">�� �� ��</font></td>
 </tr>
</table>
<br>
<table width="527" cellspacing=0 cellpadding=3 align=center>
<form name=post method=post action="../board_4/APostProc.jsp">
 <tr>
  <td align=center width="521">
   <table border=0 width="491" align=center>
    <tr>
                                    <td width="20%">
                                        <p align="center">�� &nbsp;&nbsp;��</p>
</td>
     <td width="78%"><input type=text name=name size=10 maxlength=8 value="������"></td>
    </tr>
    <tr>
                                    <td width="20%">
                                        <p align="center">E-Mail</p>
</td>
	 <td width="78%"><input type=text name=email size=30 maxlength=30 value="youngle7@combook.com"></td>
    </tr>
    <tr>
                                    <td width="20%">
                                        <p align="center">�� &nbsp;&nbsp;&nbsp;��</p>
</td>
     <td width="78%"><input type=text name=subject size=50 maxlength=30></td>
    </tr>
    <tr>
                                    <td width="20%">
                                        <p align="center">�� &nbsp;&nbsp;&nbsp;��</p>
</td>
     <td width="78%"><textarea name=content rows=10 cols=50></textarea></td>
    </tr>
    <tr>
                                    <td width="20%">
                                        <p align="center">��� ��ȣ</p>
</td> 
     <td width="78%"><input type=password name=pass size=15 maxlength=15 value="admin"></td>
    </tr>
    <tr>
     <td colspan=2 width="485"><hr size=1>
                                        <form name="form1">
                                            <p align="center"><input type=button value="���" onClick="check()">&nbsp;&nbsp;
         <input type=reset value="�ٽþ���">&nbsp;&nbsp;
		 <input type=button value="��������" onClick="history.go(-1)">
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


&nbsp;</html>

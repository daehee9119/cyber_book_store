<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, mall.*" %> 
<jsp:useBean id="memMgr" class="mall.MemberMgr" />

<%
   request.setCharacterEncoding("euc-kr");

   String check = request.getParameter("check");
   String area3 = request.getParameter("area3");
   
   Vector zipcodeList = memMgr.zipcodeRead(area3);
   int totalList = zipcodeList.size(); 
%>

<html>
<head>
<title>우편번호검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<script>
function dongCheck(){
	if (document.zipForm.area3.value == ""){
		alert("동/면 이름을 입력하세요");
		document.zipForm.area3.focus();
		return;
	}
	document.zipForm.submit();
}

function sendAddress(zipcode,area1,area2,area3,area4){
	var address =area1+" "+area2+" "+area3+" "+area4;
	opener.document.regForm.mem_zipcode.value=zipcode;
	opener.document.regForm.mem_address.value=address;
	self.close();
}
</script>
</head>
<body bgcolor="#ccff66">
<center>
<b><font color="blue">우편번호검색</font></b>
<table>
 <form name="zipForm" method="post" action="ZipCheck.jsp">
      <tr>
            <td>
                <p align="center" style="line-height:100%; margin-top:0; margin-bottom:0;"><br>
<SPAN class=gray01>'동(읍/면/리)' 이름을 입력하세요</SPAN><br></p>
                <p align="center" style="line-height:100%; margin-top:0; margin-bottom:0;"> <input name="area3" type="text">
          <input type="button" value="검색" onclick= "dongCheck();">
</p>
        </td>
      </tr>
     <input type="hidden" name="check" value="n">
    </form>
<%
if(check.equals("n")){
%>
<%
   if (zipcodeList.isEmpty()) { 
%> 
   <tr>            <td align="center"><br><font color="red">존재하지 않는 지역입니다.</font></td></tr>
<% }
else {
%>
<tr><td align="center"><br> 아래 <font color="blue"><b>우편번호를 클릭</b></font>하면 자동으로 입력됩니다.</td></tr>
<%
for (int i=0;i<totalList;i++) {
ZipcodeBean zipBean = (ZipcodeBean)zipcodeList.elementAt(i);
String tempZipcode =zipBean.getZipcode();
String temptArea1 =zipBean.getArea1();
String temptArea2 =zipBean.getArea2();
String temptArea3 =zipBean.getArea3();
String temptArea4 =zipBean.getArea4();
%>
<tr><td>
<a href="javascript:sendAddress('<%=tempZipcode%>','<%=temptArea1%>','<%=temptArea2%>','<%=temptArea3%>','<%=temptArea4%>')">
         <%=tempZipcode%>&nbsp;<%=temptArea1%>&nbsp;<%=temptArea2%>&nbsp;
		 <%=temptArea3%>&nbsp;<%=temptArea4%></a><br>
<%
 }//for
}
%>
<%}%>
</td></tr>
<tr><td align="center"><br><a href="javascript:this.close();">닫기</a><tr></td>
</table>
</center>
</body>
</html>
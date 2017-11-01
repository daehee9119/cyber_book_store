<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.test.util.Utility" %>
<%@ page import="com.test.bean.Board_Entity" %>
<%@ page import="com.test.util.ServerInfo" %>

<jsp:useBean id="b_data" scope="page" class="com.test.bean.Board_Entity"/>
<jsp:setProperty name="b_data" property="*"/>

<jsp:useBean id="b_query" scope="page" class="com.test.bean.Board_Query"/>

<%
//out.println("data = "+ b_data.toInfoString());
boolean han_yn	 	= ServerInfo.GET_HAN;
try{
	b_query.getSin_Data(b_data);
    //out.println("Msg = "+ b_query.show_msg()); 
	out.println(b_query.Error_show()); 
}catch(Exception e){
	out.println("error ="+ e +"<Br>");
}	 	
%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" href="../ssem.css" type="text/css">
<script language="JavaScript" src="./js/board_mod.js"></script>
</HEAD>

<BODY bgcolor="#ffffff" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0" width="776" height=500>


	<%@ include file="../mall/Top.jsp" %> 

<table valign="top" bgcolor="#ffFFFF" width="800" border=0 align="center">
<tr>
	<td valign="top" width="200">
		<jsp:include page="../mall/Left.jsp" flush="false"/>
	</td>

<td valign="top">


<center><img src="images/blank.gif" width="1" height="3" alt="" border="0"><img src="../jpg/main_qna.gif" width="600" height="179" border="0"><br>


<TABLE border="0" cellpadding="0" cellspacing="0">
	<TR>	
		<TD width=25><img src="images/blank.gif" width="25" height="1" alt="" border="0"></TD>
		<!-- body 시작 -->
		<TD width=549 valign=top>
			<TABLE border="0" cellpadding="0" cellspacing="0">
				<TR>
					<TD width=529 valign=top>
						<TABLE border="0" cellpadding="0" cellspacing="0">
							<TR><TD><img src="images/blank.gif" width="1" height="15" alt="" border="0"></TD></TR>
							<TR>
                                    <TD background="images/page_title_bg.gif" width=529 height=44>
									<font size=3 color="#FFFFFF"><b>&nbsp;</b></font><b><font size="5" color="white">&nbsp;&nbsp;자료실 &amp; 정오표</font></b><font size=3 color="#FFFFFF"><b></b></font>
								</TD>
							</TR>
							<TR><TD><img src="images/blank.gif" width="1" height="25" alt="" border="0"></TD></TR>
							<TR>
								<TD>
									<TABLE border="0" cellpadding="0" cellspacing="0" width="529">
										<TR><TD colspan="2" height=30 bgcolor="#369BD0" align=center width="529"><font size="3" color="#FFFFFF"><b><%=b_data.getTitle(false)%></b></font></TD></TR>
										<TR><TD colspan="2" bgcolor="#8E8E8E" width="529"><img src="images/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
                                            <TR>
                                                <TD width="307" height=25>
                                                    <p><b>등록일자</b> :  <%= Utility.date_format1(b_data.getReg_date(), ".")%></p>
</TD>
											<TD width="222" font class=board><b>조회</b> : <%=b_data.getHit_cnt()%></TD>
										</TR>
										<TR><TD colspan="2" background="images/board_linebg.gif" width="529"><img src="images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
                                            <TR>
                                                <TD width="307" height=25>
                                                    <p><b>첨부파일1</b> : 
 
                                                    <%		if(b_data.getFile_name1(false).trim().length() > 0 ) { %>		
											<a href='./system/download.jsp?file_name1=<%=b_data.getFile_name1(false)%>'><img src="images/icon/<%=Utility.file_ImgSel(b_data.getFile_name1(false).trim())%>" height="32" alt="" border="0"></a>
									<%		}else { out.println("※ 파일 없음");  }  %></p>
</TD>
										</TR>
										<TR><TD colspan="2" bgcolor="#8E8E8E" width="529"><img src="images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>

										<TR onMouseOver="this.style.backgroundColor='#EFEFEF'" onMouseOut="this.style.backgroundColor='' " align=center height=150>
											<TD colspan="2" valign=top align="left" width="529">
												<TABLE border="0" cellpadding="0" cellspacing="0" width="529">
													<TR><TD colspan=3><img src="images/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>
													<TR><TD colspan=3 align="left"><%= Utility.getBrStr(b_data.getContent(han_yn))%></TD></TR>
													<TR><TD colspan=3><img src="images/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR><TD colspan="2" bgcolor="#D4D0C8" width="529"><img src="images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
										<TR><TD colspan="2" bgcolor="#369BD0" height=25 font class=boardtext align=right width="529">
										 
										
										<a href="Uboard_list.jsp">[목록보기]</a>&nbsp;&nbsp;</TD></TR>
										<TR><TD colspan="2" width="529"><img src="images/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>
									</TABLE>							
								</TD>
							</TR>
						</TABLE>
					</TD>
					<TD width=20><img src="images/blank.gif" width="20" height="1" alt="" border="0"></TD>
				</TR>
			</TABLE>
		</TD>
		<!-- body 끝 -->
	</TR>
</TABLE>
<form  name=frm1  method=POST  action="" enctype="multipart/form-data">
<input type=hidden  name=cmd  value='delete'>
<input type=hidden  name=num  value='<%=b_data.getNum()%>'>
<input type=hidden  name=state value='<%=b_data.getState()%>'>
</form>
</center>


</td>
</tr>
</table> <!---->

<%@ include file="../mall/Bottom.jsp" %>

</body>
</html>
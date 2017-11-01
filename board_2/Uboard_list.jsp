<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.test.util.Utility" %>
<%@ page import="com.test.bean.Board_Entity" %>
<%@ page import="com.test.util.ServerInfo" %>

<jsp:useBean id="b_sel" scope="page" class="com.test.bean.Board_Query" />

<%
boolean han_yn = ServerInfo.GET_HAN;
Vector list  = new Vector();
try{
	list = b_sel.getMulti_Data(request);
	//out.println(b_sel.show_msg()); 
	out.println(b_sel.Error_show()); 
}catch(Exception e){
	out.println("error ="+ e +"<Br>");
}	
int cnt = list.size();
%>	

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" href="../ssem.css" type="text/css">
<script language="JavaScript" src="./js/board_write.js"></script>
</HEAD>

<BODY bgcolor="#ffffff" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0" width="776" height=500>

	<%@ include file="../mall/Top.jsp" %> 

<table valign="top" bgcolor="#ffFFFF" width="800" border=0 align="center">
<tr>
	<td valign="top" width="200">
		<jsp:include page="../mall/Left.jsp" flush="false"/>
	</td>

<td valign="top">

<center>
                <p><img src="../jpg/main_qna.gif" width="600" height="179" border="0"><br>
</p>
<TABLE border="0" cellpadding="0" cellspacing="0" width="597">
	<TR>	
		<TD width="14">&nbsp;</TD>
		<!-- body 시작 -->
		<TD width="583" valign=top>
			<TABLE border="0" cellpadding="0" cellspacing="0" width="590">
				<TR>
					<TD width="557" valign=top>
						<TABLE border="0" cellpadding="0" cellspacing="0" width="566">
							<TR><TD width="566"><img src="images/blank.gif" width="1" height="15" alt="" border="0"></TD></TR>
							<TR>
                                    <TD background="images/page_title_bg.gif" width="566" height=44>
									<b><font size="5" color="white">&nbsp;&nbsp;&nbsp;자료실 &amp; 정오표</font></b><font size=3 color="#FFFFFF"><b></b></font>
								</TD>
							</TR>

							<TR><TD width="566"><img src="images/blank.gif" width="1" height="25" alt="" border="0"></TD></TR>
							<tr><td width="566">총 게시물수 :  <%=b_sel.getTotal()%> 개 Page : <%=b_sel.getCurrent_page()%> / <%=b_sel.getTotal_page()%> </td></tr>
							<TR>
								<TD width="566">
							<form  name=frm2  action=""  method="POST">
							<input type='hidden' name='cmd' value='multi_del'> 		
									<TABLE border="0" cellpadding="0" cellspacing="0" width="575">
										<TR><TD colspan="6" bgcolor="#8E8E8E" width="561"><img src="images/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
                                                <TR align=center>
                                                    <TD width="60" height=30>
																						
                                                        <p>No.</p>
</TD>
                                                    <TD width="263" font class=board>

                                                        <p>제&nbsp;&nbsp;&nbsp;&nbsp;목</p>
</TD>
                                                    <TD width="67" font class=board>&nbsp;&nbsp;파일</TD>
											<TD width="84" font class=board>등록일자</TD>
											<TD width="61" font class=board>조회수</TD>
											<TD width="26" font class=board>&nbsp;</TD>
										</TR>
										<TR><TD colspan="6" bgcolor="#8E8E8E" width="561"><img src="images/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
								<%  
									int number = b_sel.getMax();
									for(int i = 0; i < cnt; i++){
										Board_Entity be = (Board_Entity)list.get(i);
								%>
                                                <TR onMouseOver="this.style.backgroundColor='#EFEFEF'" onMouseOut="this.style.backgroundColor='' " align=center height=25>
                                                    <TD width="60">
                                                        <p><img src="images/blank.gif" width="1" height="3" alt="" border="0"><img src="images/blank.gif" width="1" height="3" alt="" border="0"><br><%=(number--)%></p>
</TD>
                                                    <TD width="263">
                                                        <p><img src="images/blank.gif" width="1" height="3" alt="" border="0">
   <a href="Uboard_view.jsp?num=<%=be.getNum()%>">
   <% if("Y".equals(be.getState())) {  out.println(be.getTitle(han_yn)); }%></a>

   <% if("N".equals(be.getState())) { out.println("<font color=#CCCCCC>삭제되었습니다.</font>"); } %> 
</p>
</TD>
											
										<%	if(be.getDoc_step() == 0){ //부모글일 경우 	%>	
										<%	} else { //답글일 경우
												int xpos = 0;
												int title_length = 0;
												int title_end_value = 0;
												String blank_f = "";
	
												for (xpos=0; xpos < be.getDoc_pos(); xpos++) { blank_f += "&nbsp;&nbsp;&nbsp;"; }
												blank_f += "<img src='../images/reply.gif' align='absmiddle' border='0'>";
										%>	
											    <TD align=left width="67"><img src="images/blank.gif" width="1" height="3" alt="" border="0"><br>
								   				<%=blank_f%><a href="board_view.jsp?num=<%=be.getNum()%>">
								   		<%	if("Y".equals(be.getState())) {  out.println(be.getTitle(han_yn)); }
											else { out.println("<font color=#FF0000>[del]"+be.getTitle(han_yn)+"</font>"); }
										%>		</a>
								   				</TD>
										<%  }  %>
										<%  if(be.getFile_name1(han_yn).trim().length() > 0 ) {  %>
<TD width="84"><img src="images/icon/<%=Utility.file_ImgSel(be.getFile_name1(han_yn).trim())%>" 
alt="" border="0"></TD>
										<%	}else { %>
											   <TD width="61">&nbsp;</TD>
										<%	}  %>
											<TD width="26"><img src="images/blank.gif" width="1" height="3" alt="" border="0"><br><%=Utility.date_format1(be.getReg_date(), ".")%></TD>
                                                    <TD width="14"><img src="images/blank.gif" width="1" height="3" alt="" border="0"><br><%=be.getHit_cnt()%></TD>
										<%	if("Y".equals(be.getState())) {   %>	
										<%	} else {   %>
										<%	}  %>	
										</TR>
										<TR><TD colspan="7" bgcolor="#D4D0C8" width="575"><img src="images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
								<%	} 
									if(cnt < 1 ) {	 %>
										<TR onMouseOver="this.style.backgroundColor='#EFEFEF'" onMouseOut="this.style.backgroundColor='' " align=center height=25>
											<TD colspan="6" align="center" width="561"> 해당된 데이타가 없습니다!</TD>
										</TR>
										<TR><TD colspan="6" bgcolor="#D4D0C8" width="561"><img src="images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
								<%	}   %>
							</form>	
								<%		String query = request.getQueryString();  
										if(query == null) query ="";
								%>
										<TR>
											<TD colspan="6" bgcolor="#369BD0" height=25 align=center width="561">
												<TABLE border="0" cellpadding="0" cellspacing="0" width=529>
                                                            <TR>
                                                                <TD width="529" font class=boardnum  align="center"><%= b_sel.getPage_navi()%></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
			
									<form  name=frm1  action=""  method="GET">
										
								<%		String  s_key = request.getParameter("s_key");
										String  s_str = request.getParameter("s_str");
										if(s_str == null) s_str="";
										s_str = Utility.han(s_str);
								%>		
										<TR>
											<TD colspan="6" bgcolor="#035F8E" height=30 width="561">
												&nbsp;&nbsp;&nbsp;&nbsp;<select name="s_key" class="form"> 
													<option value="all" <% if("all".equals(s_key)) out.println(" selected "); %>>전체</option>
			                                        <option value="title" <% if("title".equals(s_key)) out.println(" selected "); %>>제목</option>
			                                        <option value="content" <% if("content".equals(s_key)) out.println(" selected "); %>>내용</option>			
												</select>
												
												&nbsp;&nbsp;
												<input type=text name="s_str" value='<%=s_str%>' class="form" style="width:100;height:18px;">
												<input type="Button" value=" 검색" onClick="javascript:checkU();" class=form>
											</TD>
										</TR>
									</form>	
										<TR><TD colspan="6" width="561"><img src="images/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>									
									</TABLE>							
								</TD>
							</TR>
						</TABLE>
					</TD>
					<TD width="33">&nbsp;</TD>
				</TR>
			</TABLE>
		</TD>
		<!-- body 끝 -->
	</TR>
</TABLE>
</center>

</td>
</tr>
</table> <!---->

<%@ include file="../mall/Bottom.jsp" %>

</body>
</html>
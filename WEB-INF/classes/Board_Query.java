package com.test.bean;

import java.sql.*;
import java.io.*;
import java.util.Vector;
import javax.servlet.http.*;  
import com.test.util.Utility;
import com.test.db.DBManager;
import com.test.bean.Board_Entity; //�ڷ���
                               
public class Board_Query {   

	private DBManager mgr;                 
	private Utility util;
	
	private String Error_msg   	= ""; //���� �޼��� ����
	private String msg			= ""; //Ư�� �� ���� ����

	private String page_navi 	= ""; //������ �׺���̼�(html)
	private int max 			= 0; //�Խù� �� ����
	private int total 			= 0; //�� �Խù�
	private int total_page		= 0; //�� ������
	private int current_page	= 0; //���� ������
	
	private String today		= "";
	 		
	//������
	public Board_Query() {   
		this.mgr = new DBManager();
		this.util = new Utility();  
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
		today = formatter.format(new java.util.Date());
	}
	
	//���ϰ� Select==================================
	public void getSin_Data(Board_Entity data){
			
		Connection con 				= null;
		PreparedStatement  pstmt 	= null;
		ResultSet  rs				= null;
		String sql 					= "";
			
		try{
			con = mgr.getConnection("oracle");
				
			//�Խù� ��ȸ�� ����
			sql = "UPDATE BOARD1_TBL SET HIT_CNT = HIT_CNT+1  WHERE  NUM = ? " ;
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, data.getNum());
			pstmt.executeUpdate();

			//�Խù� ��� SQL ���� 
			sql  = " select num, title, reg_name, reg_date, hit_cnt, ip_num, file_name1, content, state ";
			sql += " from   BOARD1_TBL  where  num = ? ";

			pstmt 	= con.prepareStatement(sql);
			pstmt.setInt(1, data.getNum());
    		rs = pstmt.executeQuery();
			
			int k=1;    			
			if(rs.next()) {
				data.setNum(rs.getInt(k++));
				data.setTitle(rs.getString(k++));
				data.setReg_name(rs.getString(k++));
				data.setReg_date(rs.getString(k++));
				data.setHit_cnt(rs.getInt(k++));
				data.setIp_num(rs.getString(k++));
				data.setFile_name1(rs.getString(k++));
				data.setContent(rs.getString(k++));
				data.setState(rs.getString(k++));
			}
			if(rs != null) rs.close();
			msg = sql;
		}
  		catch(Exception e){
  			Error_msg = "<br>sql : "+ sql +"<br>Error "+ e.toString();
  		}
  		finally{
  		  if(pstmt != null) try { pstmt.close(); } catch(Exception e){} 
		  if(con != null)  try { con.close(); } catch(Exception e){}
  		}
	}
	
	
	//���߰� select ================================
	public Vector getMulti_Data(HttpServletRequest request){
	 	Connection con 				= null;
		PreparedStatement  pstmt 	= null;
		ResultSet  rs				= null;
		
		String sql 					= "";
		String sql_where			= ""; //�˻�����..
		String order_group 			= ""; 

		int k						= 1;
			
		//�ڽ��� Url�ּҸ� ����
		String self_url = request.getRequestURI(); 
	
		//Page���� ����
		int int_pg					= 0;
		int max_num					= 0; // �Ѽ���
		int list_num		  		= 15;// List�� ����� ����
		
		//����� �����ϴ� ���� ����
		Vector list   	= new Vector(); 
		
		//Search ������ �����ϴ� �κ�1`
		String s_key	= request.getParameter("s_key");//�˻� Ű
		String s_str  	= request.getParameter("s_str"); //�˻� ���ڿ�
		if(s_str != null) s_str = Utility.han(s_str);

		//Page�Ķ���͸� �޴´�.
		int_pg 	= Utility.numChk(request.getParameter("req_pg"), 1); 
  		current_page = int_pg;

		int sw1 = 0;
		if(s_str != null && s_str.trim().length() > 0 ) {
			if("all".equals(s_key)) {
				sql_where += " where ( reg_name like  ? OR  title like ? OR  content like  ? ) ";
				sw1 = 1;
			}else {
				sql_where += " where " + s_key + " like  ? ";
			    sw1 = 2;
			}    
		}

		try{
			con = mgr.getConnection("oracle");
			
			sql = "select count(num)  from BOARD1_TBL " + sql_where;
			pstmt 	= con.prepareStatement(sql);	
			
			if(sw1 != 0 ) {
				if(sw1 == 1 ) {
					pstmt.setString(k++, "%"+s_str+"%");
					pstmt.setString(k++, "%"+s_str+"%");
					pstmt.setString(k++, "%"+s_str+"%");
				}else {
					pstmt.setString(k++, "%"+s_str+"%");
				}
			}
			rs = pstmt.executeQuery();
			
			if(rs.next())	{
				max_num = rs.getInt(1);
				this.total = max_num;
			}
			if(rs != null) rs.close();
		
			//page natigation ���� �� Page����.
			page_navi  = Utility.pageNavigation(self_url, ((request.getQueryString() == null)?"":request.getQueryString()), max_num, list_num, int_pg);
			total_page = Utility.totalpage(max_num, list_num ); 
			this.max = max_num - ((int_pg-1)*list_num);
		
			order_group = " order by reg_date desc, doc_group desc, doc_step "; 
			
			sql  = " select a.num, a.reg_name, a.title, a.file_name1,a.hit_cnt,a.reg_date, a.state, a.doc_group, a.doc_pos, a.doc_step ";
			sql += " from (select num, reg_name, title, file_name1, hit_cnt,reg_date, state, doc_group, doc_pos, doc_step, ceil( rownum / ? ) as page ";
      		sql += "   	   from (select num,reg_name,title,file_name1,hit_cnt,reg_date,state,doc_group,doc_pos,doc_step from BOARD1_TBL " + sql_where + order_group + " ) x) a ";
     		sql += " where a.page = ? "; 
     		msg = sql;
					
			pstmt 	= con.prepareStatement(sql);
			k= 1;
			pstmt.setInt(k++, list_num);	
			
			if(sw1 != 0 ) {
				if(sw1 == 1 ) {
					pstmt.setString(k++, "%"+s_str+"%");
					pstmt.setString(k++, "%"+s_str+"%");
					pstmt.setString(k++, "%"+s_str+"%");
				}else {
					pstmt.setString(k++, "%"+s_str+"%");
				}			
			}
			pstmt.setInt(k++, int_pg);
			rs = pstmt.executeQuery();
			
			//�ش� ���� ��´�.
			while(rs.next())	{
				k=1;
				Board_Entity  data	= new Board_Entity();	
				data.setNum(rs.getInt(k++));
				data.setReg_name(rs.getString(k++));
				data.setTitle(rs.getString(k++));		
				data.setFile_name1(rs.getString(k++));
				data.setHit_cnt(rs.getInt(k++));				
				data.setReg_date(rs.getString(k++));				
				data.setState(rs.getString(k++));	
				data.setDoc_group(rs.getInt(k++));	
				data.setDoc_pos(rs.getInt(k++));	
				data.setDoc_step(rs.getInt(k++));	
				list.addElement(data);
  			}		
  			if(rs != null ) rs.close();		
		}catch(Exception e){
			Error_msg = "<br>sql : "+ sql +"<br>Error "+ e.toString();
  		}
  		finally{
  		  	if(pstmt != null) try { pstmt.close(); } catch(Exception e){} 
			if(con != null)  try { con.close(); } catch(Exception e){}
  		}
  		
		return list;
	}	

	public String getPage_navi() {
	 	if(this.page_navi == null) {  return "";	}
	 	else {	return this.page_navi;		}
	}
	public int getMax() {	return this.max;	}
	public int getTotal() {	return this.total;	}
	public int getTotal_page() {  return this.total_page;	}
	public int getCurrent_page() {	return this.current_page;	}

	public String Error_show() throws Exception {
	 	return Error_msg;
	}	
	public String show_msg() throws Exception {
		return msg;
	}
	 
}//end_class	
/**
	저자모집 : 이영섭

*/

package mall;

import java.sql.*;
import java.util.*;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.http.HttpServletRequest;
import java.util.Vector;


public class BoardMgr3 {

	private DBConnectionMgr pool = null;

    public BoardMgr() {
	   try{
			pool = DBConnectionMgr.getInstance();
	   }catch(Exception e){
			System.out.println("Error : 커넥션 가져오기 실패!!");
		}
    }

//////////////////////////////////////////////////////////////////////////////////

	public Vector getBoardList(String keyField, String keyWord) {
          Connection con = null;
		  Statement stmt = null;
		  ResultSet rs = null;
		  String strQuery = null;
		  Vector boardList = new Vector();
   		  
		  try {	 
			 con = pool.getConnection();
			 stmt = con.createStatement();
			 if(keyWord.equals("null") || keyWord.equals("")){
			   strQuery = "select * from juja_book order by name asc";
			 }else{
			   strQuery = "select * from juja_book where "
			   +keyField+" like '%" + keyWord +"%' order by name asc";
			 }
			rs = stmt.executeQuery(strQuery);
			while (rs.next()) {
			BoardBean3 tempBean = new BoardBean3();

			tempBean.setNum(rs.getInt("num"));
			tempBean.setName(rs.getString("name"));
			tempBean.setEmail(rs.getString("email"));
			tempBean.setPhone(rs.getString("phone"));
			tempBean.setContent1(rs.getString("content1"));
			tempBean.setContent2(rs.getString("content3"));
			tempBean.setContent3(rs.getString("content2"));
			boardList.addElement(tempBean);
			
			}
		  }catch(Exception ex){
			 System.out.println("getBoardList Exception " + ex);
		  }finally{
	        pool.freeConnection(con,stmt,rs);	  
		  }
		return boardList;
	}

	public void insertBoard(BoardBean3 boardBean){
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  upPos();
		  
		  try {
			con = pool.getConnection();
			String strQuery = "insert into juja_book" 
					+ "(num, name, email, phone, content1, content2, content3 )" 
					+ " values(jujanum.nextval,?,?,?,?,?,?)"; 
																			 
					pstmt = con.prepareStatement(strQuery);
					pstmt.setString(1,boardBean.getName());
					pstmt.setString(2,boardBean.getEmail());
					pstmt.setString(3,boardBean.getPhone());
					pstmt.setString(4,boardBean.getContent1());
					pstmt.setString(5,boardBean.getContent2());
					pstmt.setString(6,boardBean.getContent3());
					pstmt.setString(7,boardBean.getContent());
					pstmt.executeUpdate();

		  }catch(Exception ex) {
				System.out.println("insertBoard Exception " + ex);
		  }finally{
	         pool.freeConnection(con, pstmt);		  
		  }
	}

	public BoardBean getBoard(int num) { 
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		  BoardBean3 tempBean = new BoardBean3();
		
		  try {
			con = pool.getConnection();
			String strQuery = "select * from juja_book where jujanum = ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
		    while (rs.next()) {
	
				tempBean.setNum(rs.getInt("num"));
				tempBean.setName(rs.getString("name"));
				tempBean.setEmail(rs.getString("email"));
				tempBean.setHomepage(rs.getString("homepage"));
				tempBean.setSubject(rs.getString("subject")); 
				tempBean.setContent(rs.getString("content"));
				tempBean.setPos(rs.getInt("pos"));
				tempBean.setDepth(rs.getInt("depth"));
				tempBean.setRegdate(rs.getString("regdate"));
				tempBean.setPass(rs.getString("pass")); 
				tempBean.setCount(rs.getInt("count"));
				tempBean.setIp(rs.getString("ip"));
			}
		  }catch(Exception ex) {
			  System.out.println("select * from board where num Exception" + ex);
		  }finally{
	         pool.freeConnection(con,pstmt,rs);	  
		  }
		return tempBean;
	}

	public void deleteBoard(int num) {  
		  Connection con = null;
		  PreparedStatement pstmt = null;
		
		  try{
			con = pool.getConnection();
			String strQuery = "delete from juja_book where num = ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
		  }catch(Exception ex) {
		      System.out.println("delete from board Exception" + ex);
		  }finally{
	        pool.freeConnection(con,pstmt);		  
		  }
	}
/*
	public void updateBoard(BoardBean boardBean){
		  Connection con = null;
		  PreparedStatement pstmt = null;
		
	      try{
			con = pool.getConnection();
			String strQuery = "update board set "
							+ "name=?,email=?,homepage=?,subject=?,content=?" 
							+ "where num=?";
					
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1,boardBean.getName());
			pstmt.setString(2,boardBean.getEmail());
			pstmt.setString(3,boardBean.getHomepage());
			pstmt.setString(4,boardBean.getSubject());
			pstmt.setString(5,boardBean.getContent());
			pstmt.setInt(6,boardBean.getNum());
			pstmt.executeUpdate();
			}catch(Exception ex) {
			System.out.println("updateBoard Exception" + ex);
			}finally{
	           pool.freeConnection(con,pstmt);		  
		  }
	}

	public void replyupMyBoard(BoardBean reBoardBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			con = pool.getConnection();
			int pos = reBoardBean.getPos();
			String strQuery = "update board set pos = pos + 1 where pos > ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1,pos);
			pstmt.executeUpdate();
		}catch(Exception ex) {
			System.out.println("replyupMyBoard Exception" + ex);
		}finally{
	        pool.freeConnection(con,pstmt);		  
		}
	}

	public void replyMyBoard(BoardBean reBoardBean){
		  Connection con = null;
		  PreparedStatement pstmt = null;
		
		  try{
			con = pool.getConnection();
			int depth = reBoardBean.getDepth() + 1;
			int pos = reBoardBean.getPos()+1;
			String strQuery = "insert into board" 
				   + "(num,name,email,homepage,subject,content,pos,depth,regdate,pass,count,ip)" 
				   + " values (num.nextval,?,?,?,?,?,?,?,sysdate,?,?,?)";
																  
					pstmt = con.prepareStatement(strQuery);
					pstmt.setString(1,reBoardBean.getName());
					pstmt.setString(2,reBoardBean.getEmail());
					pstmt.setString(3,reBoardBean.getHomepage());
					pstmt.setString(4,reBoardBean.getSubject());
					pstmt.setString(5,reBoardBean.getContent());
					pstmt.setInt(6,pos);
					pstmt.setInt(7,depth);
					pstmt.setString(8,reBoardBean.getPass());
					pstmt.setInt(9,reBoardBean.getCount());
					pstmt.setString(10,reBoardBean.getIp());
					pstmt.executeUpdate();
							
		  }catch(Exception ex) {
			 System.out.println("replyMyBoard Exception" + ex);
		  }finally{
	         pool.freeConnection(con,pstmt);		  		  
		  }
	  }


	public void upPos(){ 
		  Connection con = null;
		  Statement stmt = null;
		  
		  try{
			con = pool.getConnection();
			stmt=con.createStatement();
			String strQuery="update board set pos=pos+1";
			stmt.executeUpdate(strQuery);
		  }catch(Exception ex) {
				System.out.println("update board Exception" + ex);
	      }finally{
	        pool.freeConnection(con,stmt);		  
		  }
	}

	public void upCount(int num) { 
		  Connection con = null;
		  PreparedStatement pstmt = null;
		
		  try{
			con = pool.getConnection();
			String strQuery="update board set count=count+1 where num= ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
		  }catch(Exception ex) {
			System.out.println("update board set Exception" + ex);
	      }finally{
	        pool.freeConnection(con,pstmt);		  
		  }
	}
*/
}

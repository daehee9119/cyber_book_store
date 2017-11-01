/** 
	FAQ : 이영섭 
*/

package mall;

import java.sql.*;
import java.util.*;


public class BoardMgr_5 {

	private DBConnectionMgr pool = null;

    public BoardMgr_5() {
	   try{
			pool = DBConnectionMgr.getInstance();
	   }catch(Exception e){
			System.out.println("Error : 커넥션 가져오기 실패!!");
		}
    }

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
			   strQuery = "select * from board_5 order by pos asc";
			 }else{
			   strQuery = "select * from board_5 where "
			   +keyField+" like '%" + keyWord +"%' order by pos asc";
			 }
			rs = stmt.executeQuery(strQuery);
			while (rs.next()) {
			BoardBean_5 tempBean = new BoardBean_5();

			tempBean.setNum(rs.getInt("num5"));
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
			boardList.addElement(tempBean);
			
			}
		  }catch(Exception ex){
			 System.out.println("Exception" + ex);
		  }finally{
	        pool.freeConnection(con,stmt,rs);	  
		  }
		return boardList;
	}

	public void insertBoard(BoardBean_5 boardBean){
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  upPos();
		  
		  try {
			con = pool.getConnection();
			String strQuery = "insert into board_5" 
					+ "(num5, name,email,homepage,subject,content,pos,depth,regdate,pass,count,ip)" 
				        //다음 값 반환
					+ " values(num5.nextval,?,?,?,?,?,?,?,sysdate,?,?,?)"; 
																			 
					pstmt = con.prepareStatement(strQuery);
					pstmt.setString(1,boardBean.getName());
					pstmt.setString(2,boardBean.getEmail());
					pstmt.setString(3,boardBean.getHomepage());
					pstmt.setString(4,boardBean.getSubject());
					pstmt.setString(5,boardBean.getContent());
					pstmt.setInt(6,boardBean.getPos());
					pstmt.setInt(7,boardBean.getDepth());
					pstmt.setString(8,boardBean.getPass());
					pstmt.setInt(9,boardBean.getCount());
					pstmt.setString(10,boardBean.getIp());
					pstmt.executeUpdate();

		  }catch(Exception ex) {
				System.out.println("insert into Exception" + ex);
		  }finally{
	         pool.freeConnection(con, pstmt);		  
		  }
	}

	public void upPos(){ 
		  Connection con = null;
		  Statement stmt = null;
		  
		  try{
			con = pool.getConnection();
			stmt=con.createStatement();
			String strQuery="update board_5 set pos=pos+1";
			stmt.executeUpdate(strQuery);
		  }catch(Exception ex) {
				System.out.println("update board Exception" + ex);
	      }finally{
	        pool.freeConnection(con,stmt);		  
		  }
	}

	public BoardBean_5 getBoard(int num) { 
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		  BoardBean_5 tempBean = new BoardBean_5();
		
		  try {
			con = pool.getConnection();
			String strQuery = "select * from board_5 where num5 = ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
		    while (rs.next()) {
	
				tempBean.setNum(rs.getInt("num5"));
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
			  System.out.println("select * from board_5 where num5 Exception" + ex);
		  }finally{
	         pool.freeConnection(con,pstmt,rs);	  
		  }
		return tempBean;
	}

	public void upCount(int num) { 
		  Connection con = null;
		  PreparedStatement pstmt = null;
		
		  try{
			con = pool.getConnection();
			String strQuery="update board_5 set count=count+1 where num5= ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
		  }catch(Exception ex) {
			System.out.println("update board_5 set Exception" + ex);
	      }finally{
	        pool.freeConnection(con,pstmt);		  
		  }
	}

	public void deleteBoard(int num) {  
		  Connection con = null;
		  PreparedStatement pstmt = null;
		
		  try{
			con = pool.getConnection();
			String strQuery = "delete from board_5 where num5 = ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
		  }catch(Exception ex) {
		      System.out.println("delete from board_5 Exception" + ex);
		  }finally{
	        pool.freeConnection(con,pstmt);		  
		  }
	}

	public void updateBoard(BoardBean_5 boardBean){
		  Connection con = null;
		  PreparedStatement pstmt = null;
		
	      try{
			con = pool.getConnection();
			String strQuery = "update board_5 set "
							+ "subject=?,content=?" 
							+ "where num5=?";
					
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1,boardBean.getSubject());
			pstmt.setString(2,boardBean.getContent());
			pstmt.setInt(3,boardBean.getNum());
			pstmt.executeUpdate();
			}catch(Exception ex) {
			System.out.println("updateBoard Exception" + ex);
			}finally{
	           pool.freeConnection(con,pstmt);		  
		  }
	}

}

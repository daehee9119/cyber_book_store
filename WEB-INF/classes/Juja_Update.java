package mall;

import java.sql.*;
import mall.DBManager;
import mall.Juja_Data;
	                      
public class Juja_Update{  
	
   private DBManager mgr;                
   private String  today = "";
   private boolean success  = false;

   private String  error_msg  = "";
   private String  msg = "";
   //����Ʈ ������
   public Juja_Update() {  
      //Connection ������ ��� ���� ��ü ����
      this.mgr = new DBManager();
      //���� ��¥ ����
      // java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
      // today = formatter.format(new java.util.Date());
   }
	
   //DML ���� ó���ϰ� ����� �����Ѵ�.
   public boolean  execUpdate(Juja_Data data) throws Exception {
	  
      Connection con  = null;
      PreparedStatement  pstmt  = null;
      ResultSet  rs = null;
      String sql  = "";
      try{
         con = mgr.getConnection("oracle");
         sql  = "insert into juja_book" +
 						   "(jujanum, name, email, phone, content1, content2, content3)" +
				           " values(jujanum.nextval, ?, ?, ?, ?, ?, ?)";
         pstmt = con.prepareStatement(sql); 
         //�� ����
         pstmt.setString(1, data.getName());  
         pstmt.setString(2, data.getEmail()); 
         pstmt.setString(3, data.getPhone()); 
         pstmt.setString(4, data.getContent1()); 
		 pstmt.setString(5, data.getContent2());
		 pstmt.setString(6, data.getContent3());
         //����
         pstmt.executeUpdate(); 
         msg = sql;
         success = true;
      }catch(Exception e){
         error_msg = "<br>Error : "+ e.toString() + "<br>";
      }//end_catch 
      finally{
         if(pstmt != null) try { pstmt.close(); } catch(Exception e){}
         if(con != null)  try {con.close(); } catch(Exception e){}
      }//end_finally 

      return success;
   }

   //error Message �� �����ִ� �޼ҵ�
   public String error_Show() throws Exception {
     return error_msg;
   } 
   //SQL ���� �����ִ� �޼ҵ�
   public String show_sql() throws Exception {
     return msg;
   } 
	
}//end_class

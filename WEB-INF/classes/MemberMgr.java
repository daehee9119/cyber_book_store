package mall;

import java.sql.*;
import java.util.Vector;


public class MemberMgr {

    private DBConnectionMgr pool = null;

    public MemberMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }

    public boolean checkId(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
			//커넥션 연결
            con = pool.getConnection();
			//해당 아이디 사용자의 정보를 얻음
            String strQuery = "select id from member where id = ?";
			//작성된 쿼리를 통해 PreparedStatement를 준비
            pstmt = con.prepareStatement(strQuery);
			// ?에 해당 값을 넣음
            pstmt.setString(1, id);
			//쿼리를 수행한 후에 그 결과를 ResultSet에 저장
            rs = pstmt.executeQuery();
            checkCon = rs.next();

        } catch (Exception ex) {
            System.out.println("checkId Exception " + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return checkCon;
    }

    public Vector zipcodeRead(String area3) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        try {
            con = pool.getConnection();
            String strQuery = "select * from zipcode where area3 like '" + area3 + "%'";
            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ZipcodeBean tempZipcode = new ZipcodeBean();
                tempZipcode.setZipcode(rs.getString("zipcode"));
                tempZipcode.setArea1(rs.getString("area1"));
                tempZipcode.setArea2(rs.getString("area2"));
                tempZipcode.setArea3(rs.getString("area3"));
                tempZipcode.setArea4(rs.getString("area4"));
                vecList.addElement(tempZipcode);
            }

        } catch (Exception ex) {
            System.out.println(" zipcodeRead Exception " + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vecList;
    }

    public boolean memberInsert(RegisterBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into member values(?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getMem_id());
            pstmt.setString(2, regBean.getMem_passwd());
            pstmt.setString(3, regBean.getMem_name());
            pstmt.setString(4, regBean.getMem_num1());
            pstmt.setString(5, regBean.getMem_num2());
            pstmt.setString(6, regBean.getMem_email());
            pstmt.setString(7, regBean.getMem_phone());
            pstmt.setString(8, regBean.getMem_zipcode());
            pstmt.setString(9, regBean.getMem_address());
            pstmt.setString(10, regBean.getMem_blog());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("memberInsert Exception " + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    public RegisterBean getMember(String mem_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RegisterBean regBean = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * from member where id=?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();

			//일치하는 사용자 정보가 이다면 if문 안을 수행
            if (rs.next()) {
				//DB에서 읽어온 사용자의 정보를 담기위해 RegisterBean을 생성
				//빈의 setXxx 메소드를 통해 사용자의 정보를 RegisterBean에 저장
                regBean = new RegisterBean();
                regBean.setMem_id(rs.getString("id"));
                regBean.setMem_passwd(rs.getString("passwd"));
                regBean.setMem_name(rs.getString("name"));
                regBean.setMem_num1(rs.getString("mem_num1"));
                regBean.setMem_num2(rs.getString("mem_num2"));
                regBean.setMem_phone(rs.getString("phone"));
                regBean.setMem_zipcode(rs.getString("zipcode"));
                regBean.setMem_address(rs.getString("address"));
                regBean.setMem_email(rs.getString("e_mail"));
                regBean.setMem_blog(rs.getString("blog"));
            }
        } catch (Exception ex) {
            System.out.println("getMember Exception " + ex);
        } finally {
			//얻어온 커넥션을 반환
            pool.freeConnection(con, pstmt, rs);
        }
		//사용자의 정보를 담은 빈을 반환
        return regBean;
    }

///////////////////////////////////////////////////////////////////////////////
// 관리자부분 /////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
    public Vector getMemberList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from member";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                RegisterBean regBean = new RegisterBean();
                regBean.setMem_id(rs.getString("id"));
                regBean.setMem_passwd(rs.getString("passwd"));
                regBean.setMem_name(rs.getString("name"));
                regBean.setMem_num1(rs.getString("mem_num1"));
                regBean.setMem_num2(rs.getString("mem_num2"));
                regBean.setMem_phone(rs.getString("phone"));
                regBean.setMem_email(rs.getString("e_mail"));
                vecList.add(regBean);
            }
        } catch (Exception ex) {
            System.out.println("getMemberList() Exception " + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }

    public boolean memberUpdate(RegisterBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "update member set passwd=?, name=?, mem_num1=?, mem_num2=?,";
            strQuery = strQuery + " e_mail=?, phone=?, zipcode=?, address=?, blog=?";
			//사용자의 정보를 수정하기 위해서 쿼리를 생성
			strQuery = strQuery + " where id=? ";
			//RegisterBean을 통해 넘겨온 사용자 정보를 쿼리를 통해 저장하기 위해 
			//쿼리 중 ?에 해당하는 값을 순서대로 하나씩 저장
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getMem_passwd());
            pstmt.setString(2, regBean.getMem_name());
            pstmt.setString(3, regBean.getMem_num1());
            pstmt.setString(4, regBean.getMem_num2());
            pstmt.setString(5, regBean.getMem_email());
            pstmt.setString(6, regBean.getMem_phone());
            pstmt.setString(7, regBean.getMem_zipcode());
            pstmt.setString(8, regBean.getMem_address());
            pstmt.setString(9, regBean.getMem_blog());
            pstmt.setString(10, regBean.getMem_id());
			//쿼리를 수행: update 쿼리를 수행한 후에는 반영된 결과를 int형으로 반환받아 저장
            int count = pstmt.executeUpdate();

			//update를 수행한 결과(count)가 제대로 되었다면 Boolean 형의 flag 값에 true
			//flag값을 반환해 줌으로써 JSP 페이지 내에서 호출한 후 제대로 수행 됐는지 판단
            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("memberUpdate Exception " + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
		//처리결과를 반환
        return flag;
    }

    public boolean loginCheck(String id, String passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select id, passwd from member where id = ? and passwd = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println(" loginCheck Exception " + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }
/////////////////////////////////////////////////////////////////////////////////
    public boolean adminCheck(String admin_id, String admin_passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select admin_id, admin_passwd from admin where admin_id = ? and admin_passwd = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, admin_id);
            pstmt.setString(2, admin_passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } 
		catch (Exception ex) {
            System.out.println("adminCheck Exception" + ex);
        }	
		finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }



	 public boolean deleteMember(String mem_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete member where id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, mem_id);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception e) {
            System.out.println("deleteMember Exception :" + e);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
////////////////////////////////////////////////////////////////////////////////////////////
}

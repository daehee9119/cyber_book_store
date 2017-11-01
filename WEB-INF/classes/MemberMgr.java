package mall;

import java.sql.*;
import java.util.Vector;


public class MemberMgr {

    private DBConnectionMgr pool = null;

    public MemberMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : Ŀ�ؼ� �������� ����!!");
        }
    }

    public boolean checkId(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
			//Ŀ�ؼ� ����
            con = pool.getConnection();
			//�ش� ���̵� ������� ������ ����
            String strQuery = "select id from member where id = ?";
			//�ۼ��� ������ ���� PreparedStatement�� �غ�
            pstmt = con.prepareStatement(strQuery);
			// ?�� �ش� ���� ����
            pstmt.setString(1, id);
			//������ ������ �Ŀ� �� ����� ResultSet�� ����
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

			//��ġ�ϴ� ����� ������ �̴ٸ� if�� ���� ����
            if (rs.next()) {
				//DB���� �о�� ������� ������ ������� RegisterBean�� ����
				//���� setXxx �޼ҵ带 ���� ������� ������ RegisterBean�� ����
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
			//���� Ŀ�ؼ��� ��ȯ
            pool.freeConnection(con, pstmt, rs);
        }
		//������� ������ ���� ���� ��ȯ
        return regBean;
    }

///////////////////////////////////////////////////////////////////////////////
// �����ںκ� /////////////////////////////////////////////////////////////////
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
			//������� ������ �����ϱ� ���ؼ� ������ ����
			strQuery = strQuery + " where id=? ";
			//RegisterBean�� ���� �Ѱܿ� ����� ������ ������ ���� �����ϱ� ���� 
			//���� �� ?�� �ش��ϴ� ���� ������� �ϳ��� ����
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
			//������ ����: update ������ ������ �Ŀ��� �ݿ��� ����� int������ ��ȯ�޾� ����
            int count = pstmt.executeUpdate();

			//update�� ������ ���(count)�� ����� �Ǿ��ٸ� Boolean ���� flag ���� true
			//flag���� ��ȯ�� �����ν� JSP ������ ������ ȣ���� �� ����� ���� �ƴ��� �Ǵ�
            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("memberUpdate Exception " + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
		//ó������� ��ȯ
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

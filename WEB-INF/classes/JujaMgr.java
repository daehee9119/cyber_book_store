package mall;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.Vector;


public class JujaMgr {

    private DBConnectionMgr pool = null;

    public JujaMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : Ŀ�ؼ� �������� ����!!");
        }
    }

//////////////////////////////////////////////////////////////////////////////////
// ����ڸ�� ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
	public boolean insertJuja(JujaBean Juja) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String strQuery = "insert into juja_book" +
 						   "(jujanum, name, email, phone, content1, content2, content3)" +
				           " values(jujanum.nextval, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, Juja.getName());
            pstmt.setString(2, Juja.getEmail());
            pstmt.setString(3, Juja.getPhone());
            pstmt.setString(4, Juja.getContent1());
            pstmt.setString(5, Juja.getContent2());
            pstmt.setString(6, Juja.getContent3());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                result = true;
				System.out.println("���Լ���");
          }
			

        } catch (Exception ex) {
            System.out.println("insertJuja Exception " + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }

//////////////////////////////////////////////////////////////////////////////


    public JujaBean getJuja(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        JujaBean Juja = null;

        try {
            con = pool.getConnection();
			//���ϴ� ��ǰ ������ ������� ������ �ۼ�
            String query = "select * from juja_book where jujanum = ?";
            pstmt = con.prepareStatement(query);
			// ? �� ���� ��ǰ��ȣ�� ����(bean)
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
			// ������ ������ ����� �ִٸ� ��ǰ������ ����
            if (rs.next()) {
				// ��ǰ������ ������ ���� ����
                Juja = new JujaBean();
				//DB�� �÷��� �о�� �� ����
                Juja.setNum(rs.getInt("jujanum"));
                Juja.setName(rs.getString("name"));
                Juja.setEmail(rs.getString("email"));
                Juja.setPhone(rs.getString("phone"));
                Juja.setContent1(rs.getString("content1"));
				Juja.setContent2(rs.getString("content2"));
				Juja.setContent3(rs.getString("content3"));

				System.out.println("���ڵ���������");

            }
        } catch (Exception ex) {
            System.out.println("getJuja Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return Juja;

    }

//////////////////////////////////////////////////////////////////////////////////
// �����ڸ�� ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

    public Vector getJujaList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ����� ������ ���͸� �����Ѵ�.
        Vector vJuja = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from juja_book order by name";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                JujaBean Juja = new JujaBean();
				//DB�� �÷��� �о�� JujaBean�� ����
				Juja.setNum(rs.getInt("jujanum"));
                Juja.setName(rs.getString("name"));
                Juja.setEmail(rs.getString("email"));
                Juja.setPhone(rs.getString("phone"));
                Juja.setContent1(rs.getString("content1"));
				Juja.setContent2(rs.getString("content2"));
				Juja.setContent3(rs.getString("content3"));
				//������ ��� �ִ� JujaBean�� ���Ϳ� ����
                vJuja.add(Juja);

				System.out.println("���ں�� ����");

            }
        } catch (Exception ex) {
            System.out.println("getJujaList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vJuja;
    }


    public boolean deleteJuja(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from juja_book where jujanum = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;

			System.out.println("��������");


        } catch (Exception ex) {
            System.out.println("deleteJuja Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }



}
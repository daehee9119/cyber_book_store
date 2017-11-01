package mall;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.Vector;


public class BookMgr {

    private DBConnectionMgr pool = null;

    public BookMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : Ŀ�ؼ� �������� ����!!");
        }
    }

//////////////////////////////////////////////////////////////////////////////////
// ����ڸ�� ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
	public boolean insertBook(BookBean BooC) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String strQuery = "insert into book_c" +
 						   "(book, name, email, phone, content1, content2)" +
				           " values(book.nextval, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, BooC.getName());
            pstmt.setString(2, BooC.getEmail());
            pstmt.setString(3, BooC.getPhone());
            pstmt.setString(4, BooC.getContent1());
            pstmt.setString(5, BooC.getContent2());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                result = true;
				System.out.println("���Լ���");
          }
			

        } catch (Exception ex) {
            System.out.println("insertBook Exception " + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }

//////////////////////////////////////////////////////////////////////////////


    public BookBean getBook(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BookBean BooC = null;

        try {
            con = pool.getConnection();
			//���ϴ� ��ǰ ������ ������� ������ �ۼ�
            String query = "select * from book_c where book = ?";
            pstmt = con.prepareStatement(query);
			// ? �� ���� ��ǰ��ȣ�� ����(bean)
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
			// ������ ������ ����� �ִٸ� ��ǰ������ ����
            if (rs.next()) {
				// ��ǰ������ ������ ���� ����
                BooC = new BookBean();
				//DB�� �÷��� �о�� �� ����
                BooC.setNum(rs.getInt("book"));
                BooC.setName(rs.getString("name"));
                BooC.setEmail(rs.getString("email"));
                BooC.setPhone(rs.getString("phone"));
                BooC.setContent1(rs.getString("content1"));
				BooC.setContent2(rs.getString("content2"));

				System.out.println("�������");

            }
        } catch (Exception ex) {
            System.out.println("getBooK Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return BooC;

    }

//////////////////////////////////////////////////////////////////////////////////
// �����ڸ�� ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

    public Vector getBookList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ����� ������ ���͸� �����Ѵ�.
        Vector vBook = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from book_c order by name";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                BookBean BooC = new BookBean();
				//DB�� �÷��� �о�� BookBean�� ����
				BooC.setNum(rs.getInt("book"));
                BooC.setName(rs.getString("name"));
                BooC.setEmail(rs.getString("email"));
                BooC.setPhone(rs.getString("phone"));
                BooC.setContent1(rs.getString("content1"));
				BooC.setContent2(rs.getString("content2"));
				//������ ��� �ִ� BooCBean�� ���Ϳ� ����
                vBook.add(BooC);

				System.out.println("been read");

            }
        } catch (Exception ex) {
            System.out.println("getBooCList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vBook;
    }


    public boolean deleteBook(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from book_c where book = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;

			System.out.println("��������");


        } catch (Exception ex) {
            System.out.println("deleteBook Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
}
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
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }

//////////////////////////////////////////////////////////////////////////////////
// 사용자모드 ////////////////////////////////////////////////////////////////////
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
				System.out.println("삽입성공");
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
			//원하는 상품 정보를 얻기위해 쿼리를 작성
            String query = "select * from book_c where book = ?";
            pstmt = con.prepareStatement(query);
			// ? 의 값을 상품번호로 지정(bean)
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
			// 쿼리를 실행한 결과가 있다면 상품정보를 저장
            if (rs.next()) {
				// 상품정보를 저장할 빈을 생성
                BooC = new BookBean();
				//DB의 컬럼을 읽어와 빈에 넣음
                BooC.setNum(rs.getInt("book"));
                BooC.setName(rs.getString("name"));
                BooC.setEmail(rs.getString("email"));
                BooC.setPhone(rs.getString("phone"));
                BooC.setContent1(rs.getString("content1"));
				BooC.setContent2(rs.getString("content2"));

				System.out.println("정보얻기");

            }
        } catch (Exception ex) {
            System.out.println("getBooK Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return BooC;

    }

//////////////////////////////////////////////////////////////////////////////////
// 관리자모드 ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

    public Vector getBookList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 목록을 저장할 벡터를 생성한다.
        Vector vBook = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from book_c order by name";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                BookBean BooC = new BookBean();
				//DB의 컬럼을 읽어와 BookBean에 넣음
				BooC.setNum(rs.getInt("book"));
                BooC.setName(rs.getString("name"));
                BooC.setEmail(rs.getString("email"));
                BooC.setPhone(rs.getString("phone"));
                BooC.setContent1(rs.getString("content1"));
				BooC.setContent2(rs.getString("content2"));
				//정보를 담고 있는 BooCBean를 벡터에 저장
                vBook.add(BooC);

				System.out.println("been read");

            }
        } catch (Exception ex) {
            System.out.println("getBooCList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
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

			System.out.println("삭제성공");


        } catch (Exception ex) {
            System.out.println("deleteBook Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
}
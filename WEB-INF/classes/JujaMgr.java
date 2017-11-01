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
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }

//////////////////////////////////////////////////////////////////////////////////
// 사용자모드 ////////////////////////////////////////////////////////////////////
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
				System.out.println("삽입성공");
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
			//원하는 상품 정보를 얻기위해 쿼리를 작성
            String query = "select * from juja_book where jujanum = ?";
            pstmt = con.prepareStatement(query);
			// ? 의 값을 상품번호로 지정(bean)
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
			// 쿼리를 실행한 결과가 있다면 상품정보를 저장
            if (rs.next()) {
				// 상품정보를 저장할 빈을 생성
                Juja = new JujaBean();
				//DB의 컬럼을 읽어와 빈에 넣음
                Juja.setNum(rs.getInt("jujanum"));
                Juja.setName(rs.getString("name"));
                Juja.setEmail(rs.getString("email"));
                Juja.setPhone(rs.getString("phone"));
                Juja.setContent1(rs.getString("content1"));
				Juja.setContent2(rs.getString("content2"));
				Juja.setContent3(rs.getString("content3"));

				System.out.println("저자등록정보얻기");

            }
        } catch (Exception ex) {
            System.out.println("getJuja Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return Juja;

    }

//////////////////////////////////////////////////////////////////////////////////
// 관리자모드 ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

    public Vector getJujaList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 목록을 저장할 벡터를 생성한다.
        Vector vJuja = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from juja_book order by name";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                JujaBean Juja = new JujaBean();
				//DB의 컬럼을 읽어와 JujaBean에 넣음
				Juja.setNum(rs.getInt("jujanum"));
                Juja.setName(rs.getString("name"));
                Juja.setEmail(rs.getString("email"));
                Juja.setPhone(rs.getString("phone"));
                Juja.setContent1(rs.getString("content1"));
				Juja.setContent2(rs.getString("content2"));
				Juja.setContent3(rs.getString("content3"));
				//정보를 담고 있는 JujaBean를 벡터에 저장
                vJuja.add(Juja);

				System.out.println("저자빈즈에 저장");

            }
        } catch (Exception ex) {
            System.out.println("getJujaList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
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

			System.out.println("삭제성공");


        } catch (Exception ex) {
            System.out.println("deleteJuja Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }



}
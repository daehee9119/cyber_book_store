package mall;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.Vector;


public class ProductMgr {

    private DBConnectionMgr pool = null;

    public ProductMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }

//////////////////////////////////////////////////////////////////////////////////
// 관리자모드 ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
    public boolean insertProduct(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
			// 등록상품의 이미지 저장 폴더지정
            String uploadDir = "c:/ComBook/productImage";
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "euc-kr", new DefaultFileRenamePolicy());

            con = pool.getConnection();           
            String query = "insert into shop_bproduct (no_bp, name, code, juja, chool, price, detail, isbn, day, stock, image)"
 						 + " values(no_bp.nextval, ?, ?, ?, ? , ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("name"));
            pstmt.setString(2, multi.getParameter("code"));
            pstmt.setString(3, multi.getParameter("juja"));
            pstmt.setString(4, multi.getParameter("chool"));
            pstmt.setString(5, multi.getParameter("price"));
            pstmt.setString(6, multi.getParameter("detail"));
            pstmt.setString(7, multi.getParameter("isbn"));
            pstmt.setString(8, multi.getParameter("day"));
			pstmt.setString(9, multi.getParameter("stock"));

            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(10, "ready.jpg");
            } else {
                pstmt.setString(10, multi.getFilesystemName("image"));
            }
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;

        } catch (Exception ex) {
            System.out.println("insertProduct Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
//////////////////////////////////////////////////////////////////////////////

    public ProductBean getProduct(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProductBean product = null;

        try {
            con = pool.getConnection();
			//원하는 상품 정보를 얻기위해 쿼리를 작성
            String query = "select * from shop_bproduct where no_bp = ?";
            pstmt = con.prepareStatement(query);
			// ? 의 값을 상품번호로 지정(bean)
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
			// 쿼리를 실행한 결과가 있다면 상품정보를 저장
            if (rs.next()) {
				// 상품정보를 저장할 빈을 생성
                product = new ProductBean();
				//DB의 컬럼을 읽어와 빈에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setCode(rs.getString("code"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
            }
        } catch (Exception ex) {
            System.out.println("getProduct Exception : " + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return product;

    }

////////////////////////////////////////////////////////////////////////////////////////
// 검색도서
////////////////////////////////////////////////////////////////////////////////////////
   public Vector getProductList(String keyField, String keyWord) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();
        PreparedStatement pstmt = null;
		String strQuery = null;

        try {
            con = pool.getConnection();
            stmt = con.createStatement();
          
			if(keyWord.equals("null") || keyWord.equals("")){
			   strQuery = "select * from shop_bproduct order by name";
			 }
			 else if (keyField.equals("juja"))
			 {
			   strQuery = "select * from shop_bproduct where " +
			   "juja like '%" + keyWord + "%' order by juja";
			 }
			 else if (keyField.equals("name"))
			 {
			   strQuery = "select * from shop_bproduct where "+
			   "name like '%"+keyWord+"%' order by name";
			 }
			 else 
			 {
			   strQuery = "select * from shop_bproduct where " +
			   keyField + " like '%"+keyWord+"%' order by name";
			 }

			rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }




//////////////////////////////////////////////////////////////////////////////////
// 관리자모드 ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
     public boolean updateProduct(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        String uploadDir = "c:/ComBook/productImage";

        try {
            con = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024,
									"euc-kr", new DefaultFileRenamePolicy());

            if (multi.getFilesystemName("image") == null) {
                String query = "update shop_bproduct set"+
								" name = ?, code = ?, juja = ?,  chool = ?, price = ?," +
								" detail = ?, isbn = ?, day = ?, stock = ?  where no_bp = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
	            pstmt.setString(2, multi.getParameter("code"));
	            pstmt.setString(3, multi.getParameter("juja"));
		        pstmt.setString(4, multi.getParameter("chool"));
			    pstmt.setString(5, multi.getParameter("price"));
				pstmt.setString(6, multi.getParameter("detail"));
	            pstmt.setString(7, multi.getParameter("isbn"));
		        pstmt.setString(8, multi.getParameter("day"));
				pstmt.setString(9, multi.getParameter("stock"));
				pstmt.setString(10, multi.getParameter("no"));
            } else {
                String query = "update shop_bproduct set"+
								" name = ?, code = ?, juja = ?,  chool = ?, price = ?," +
								" detail = ?, isbn = ?, day = ?, stock = ?, image = ? " +
								" where no_bp = ?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, multi.getParameter("name"));
	            pstmt.setString(2, multi.getParameter("code"));
	            pstmt.setString(3, multi.getParameter("juja"));
		        pstmt.setString(4, multi.getParameter("chool"));
			    pstmt.setString(5, multi.getParameter("price"));
				pstmt.setString(6, multi.getParameter("detail"));
	            pstmt.setString(7, multi.getParameter("isbn"));
		        pstmt.setString(8, multi.getParameter("day"));
				pstmt.setString(9, multi.getParameter("stock"));
				pstmt.setString(10, multi.getFilesystemName("image"));
				pstmt.setString(11, multi.getParameter("no"));
            }
            int count = pstmt.executeUpdate();
            if (count == 1) 
				result = true;

        } catch (Exception ex) {
            System.out.println("updateProduct Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }

    public void reduceProduct(OrderBean order) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = pool.getConnection();
			// 해당 상품의 재고수량을 줄이기 위해 쿼리를 작성
            String query = "update shop_bproduct set stock = (stock - ? ) where no_bp = ? ";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, order.getQuantity());		//도서수량
            pstmt.setString(2, order.getProduct_no());	//도서번호
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("reduceProduct Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }
	
	/////////////////////////////////////////////////////
	// 전체보기
	/////////////////////////////////////////////////////
    public Vector getProductList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct " +
						   "order by code, name";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// 운영체제
	/////////////////////////////////////////////////////
    public Vector getProductList1() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code ='운영체제' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// 데이터베이스
	/////////////////////////////////////////////////////
    public Vector getProductList2() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code ='데이터베이스' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }


	/////////////////////////////////////////////////////
	// 그래픽
	/////////////////////////////////////////////////////
    public Vector getProductList3() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code ='그래픽' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }


	/////////////////////////////////////////////////////
	// 웹/홈페이지
	/////////////////////////////////////////////////////
    public Vector getProductList4() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code ='웹/홈페이지' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }


	/////////////////////////////////////////////////////
	// 프로그래밍
	/////////////////////////////////////////////////////
    public Vector getProductList5() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code ='프로그래밍' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }

 	/////////////////////////////////////////////////////
	// 컴퓨터공학
	/////////////////////////////////////////////////////
    public Vector getProductList6() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code='컴퓨터공학' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// 입문/활용
	/////////////////////////////////////////////////////
    public Vector getProductList7() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code='입문/활용' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }
	
	/////////////////////////////////////////////////////
	// 자격/수험서
	/////////////////////////////////////////////////////
    public Vector getProductList8() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code='자격/수험서' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// 신간도서
	/////////////////////////////////////////////////////
    public Vector getProductList9() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct "+
							"where day like '2006-09' or day like '2006-08'" +
							"order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// 출간예정도서
	/////////////////////////////////////////////////////
    public Vector getProductList10() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct "+
							" where code = '출간예정'"+
							" order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// 메인 중앙 목록
	/////////////////////////////////////////////////////
    public Vector getProductList11() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct "+
							"where stock < '3000'" +
							"order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_bp"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
				product.setJuja(rs.getString("juja"));
				product.setChool(rs.getString("chool"));
				product.setIsbn(rs.getString("isbn"));
				product.setCode(rs.getString("code"));
				//상품정보를 담고 있는 ProductBean를 벡터에 저장
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// 상품정보를 저장하고 있는 벡터를 반환
        return vProduct;
    }
	public boolean deleteProduct(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from shop_bproduct where no_bp = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("deleteProduct Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }


}
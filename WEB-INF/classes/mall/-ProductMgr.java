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
            String query = "insert into shop_product (no_p, name, price, detail, day, stock, image)"
 							               +  "values(no_p.nextval, ?, ?, ?, sysdate, ?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("name"));
            pstmt.setString(2, multi.getParameter("price"));
            pstmt.setString(3, multi.getParameter("detail"));
			pstmt.setString(4, multi.getParameter("stock"));

            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(5, "ready.jpg");
            } else {
                pstmt.setString(5, multi.getFilesystemName("image"));
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
            String query = "select * from shop_product where no_p=?";
            pstmt = con.prepareStatement(query);
			// ? 의 값을 상품번호로 지정(bean)
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
			// 쿼리를 실행한 결과가 있다면 상품정보를 저장
            if (rs.next()) {
				// 상품정보를 저장할 빈을 생성
                product = new ProductBean();
				//DB의 컬럼을 읽어와 빈에 넣음
                product.setNo(rs.getInt("no_p"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
            }
        } catch (Exception ex) {
            System.out.println("getProduct Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return product;

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
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "euc-kr", new DefaultFileRenamePolicy());

            if (multi.getFilesystemName("image") == null) {
                String query = "update shop_product set name = ?, price = ?, detail = ?, stock = ?  where no_p = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("price"));
                pstmt.setString(3, multi.getParameter("detail"));
                pstmt.setString(4, multi.getParameter("stock"));
                pstmt.setString(5, multi.getParameter("no"));
            } else {
                String query = "update shop_product set name =?, price = ?, detail = ?,stock = ?, image = ?  where no_p = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("price"));
                pstmt.setString(3, multi.getParameter("detail"));
                pstmt.setString(4, multi.getParameter("stock"));
                pstmt.setString(5, multi.getFilesystemName("image"));
                pstmt.setString(6, multi.getParameter("no"));
            }
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
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
            String query = "update shop_product set stock = (stock - ? ) where no_p = ? ";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, order.getQuantity());		//상품수량
            pstmt.setString(2, order.getProduct_no());	//상품번호
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("reduceProduct Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }


    public Vector getProductList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// 상품목록을 저장할 벡터를 생성한다.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_product order by no_p desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB의 컬럼을 읽어와 ProductBean에 넣음
                product.setNo(rs.getInt("no_p"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("day"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
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
            String query = "delete from shop_product where no_p = ?";
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
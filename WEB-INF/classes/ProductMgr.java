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
            System.out.println("Error : Ŀ�ؼ� �������� ����!!");
        }
    }

//////////////////////////////////////////////////////////////////////////////////
// �����ڸ�� ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
    public boolean insertProduct(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
			// ��ϻ�ǰ�� �̹��� ���� ��������
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
			//���ϴ� ��ǰ ������ ������� ������ �ۼ�
            String query = "select * from shop_bproduct where no_bp = ?";
            pstmt = con.prepareStatement(query);
			// ? �� ���� ��ǰ��ȣ�� ����(bean)
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
			// ������ ������ ����� �ִٸ� ��ǰ������ ����
            if (rs.next()) {
				// ��ǰ������ ������ ���� ����
                product = new ProductBean();
				//DB�� �÷��� �о�� �� ����
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
// �˻�����
////////////////////////////////////////////////////////////////////////////////////////
   public Vector getProductList(String keyField, String keyWord) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
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
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }




//////////////////////////////////////////////////////////////////////////////////
// �����ڸ�� ////////////////////////////////////////////////////////////////////
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
			// �ش� ��ǰ�� �������� ���̱� ���� ������ �ۼ�
            String query = "update shop_bproduct set stock = (stock - ? ) where no_bp = ? ";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, order.getQuantity());		//��������
            pstmt.setString(2, order.getProduct_no());	//������ȣ
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("reduceProduct Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }
	
	/////////////////////////////////////////////////////
	// ��ü����
	/////////////////////////////////////////////////////
    public Vector getProductList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct " +
						   "order by code, name";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// �ü��
	/////////////////////////////////////////////////////
    public Vector getProductList1() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code ='�ü��' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// �����ͺ��̽�
	/////////////////////////////////////////////////////
    public Vector getProductList2() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code ='�����ͺ��̽�' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }


	/////////////////////////////////////////////////////
	// �׷���
	/////////////////////////////////////////////////////
    public Vector getProductList3() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code ='�׷���' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }


	/////////////////////////////////////////////////////
	// ��/Ȩ������
	/////////////////////////////////////////////////////
    public Vector getProductList4() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code ='��/Ȩ������' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }


	/////////////////////////////////////////////////////
	// ���α׷���
	/////////////////////////////////////////////////////
    public Vector getProductList5() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code ='���α׷���' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }

 	/////////////////////////////////////////////////////
	// ��ǻ�Ͱ���
	/////////////////////////////////////////////////////
    public Vector getProductList6() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code='��ǻ�Ͱ���' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// �Թ�/Ȱ��
	/////////////////////////////////////////////////////
    public Vector getProductList7() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code='�Թ�/Ȱ��' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }
	
	/////////////////////////////////////////////////////
	// �ڰ�/���輭
	/////////////////////////////////////////////////////
    public Vector getProductList8() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct where code='�ڰ�/���輭' order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// �Ű�����
	/////////////////////////////////////////////////////
    public Vector getProductList9() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
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
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// �Ⱓ��������
	/////////////////////////////////////////////////////
    public Vector getProductList10() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_bproduct "+
							" where code = '�Ⱓ����'"+
							" order by name asc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
        return vProduct;
    }

	/////////////////////////////////////////////////////
	// ���� �߾� ���
	/////////////////////////////////////////////////////
    public Vector getProductList11() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
		// ��ǰ����� ������ ���͸� �����Ѵ�.
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
				//DB�� �÷��� �о�� ProductBean�� ����
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
				//��ǰ������ ��� �ִ� ProductBean�� ���Ϳ� ����
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("getProductList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
		// ��ǰ������ �����ϰ� �ִ� ���͸� ��ȯ
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
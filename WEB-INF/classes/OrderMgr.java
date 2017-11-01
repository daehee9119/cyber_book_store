package mall;

import java.sql.*;
import java.util.Vector;

public class OrderMgr {

    private DBConnectionMgr pool = null;


    public OrderMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }


    public void insertOrder(OrderBean order) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = pool.getConnection();
			// 주문테이블에 사용자의 주문을 입력하기 위해 쿼리를 작성
            String query = "insert into shop_order(no_n, product_no, quantity, day, state, id)"
                                        + " values(no_n.nextval, ?, ?, sysdate, ?, ?)";
			//쿼리를 실행하기 위해 prepareStatement 객체를 준비
            pstmt = con.prepareStatement(query);
			// 첫 번째 ?에 주문한 상품의 번호를 
            pstmt.setString(1, order.getProduct_no());
			// 두 번째 ?에 주문한 상품의 번호를
			pstmt.setInt(2, order.getQuantity());
			// 세 번째 ?에 주문상태를 입력 (1~6)
            pstmt.setString(3, "2"); // 1 : 접수 중을 의미
			// 네 번째 ?에 사용자의 ID를 입력
			pstmt.setString(4, order.getId());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("insertOrder Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }


    public Vector getOrder(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vResult = new Vector();

        try {
            con = pool.getConnection();
			// 주어진 ID에 해당하는 사용자의 주문내역을 가져오기 위해 쿼리를 준비
            String query = "select * from shop_order where id = ? order by no_n desc";
            pstmt = con.prepareStatement(query);
			// ?에 사용자 ID 지정
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
			// 주문 내역이 있을 경우 주문 내역을 저장
            while (rs.next()) {
                OrderBean order = new OrderBean();
                order.setId(rs.getString("id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("day"));//sql
                order.setNo(rs.getString("no_n"));//sql
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
                vResult.add(order);
            }
        } catch (Exception ex) {
            System.out.println("getOrder Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vResult;
    }
////////////////////////////////////////////////////////////////////////////////
// 관리자 부분 /////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
    public Vector getOrderList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vResult = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_order order by no_n desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                OrderBean order = new OrderBean();
                order.setId(rs.getString("id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("day"));
                order.setNo(rs.getString("no_n"));
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
                vResult.add(order);
            }
        } catch (Exception ex) {
            System.out.println("getOrderList Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vResult;
    }


    public OrderBean getOrderDetail(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        OrderBean order = null;

        try {
            con = pool.getConnection();
            String query = "select * from shop_order where no_n = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                order = new OrderBean();
                order.setId(rs.getString("id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("day"));
                order.setNo(rs.getString("no_n"));
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
            }
        } catch (Exception e) {
            System.out.println("getOrderDetail Exception :" + e);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return order;
    }


    public boolean updateOrder(String no, String state) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            con = pool.getConnection();
            String query = "update shop_order set state = ? where no_n = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, state);
            pstmt.setString(2, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("updateOrder Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }


    public boolean deleteOrder(String no) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from shop_order where no_n = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception e) {
            System.out.println("deleteOrder Exception :" + e);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
///////////////////////////////////////////////////////////////////////*/

}

package mall;

import java.util.Hashtable;

public class CartMgr {

    private Hashtable hCart = new Hashtable();

    public CartMgr() {
    }

    public void addCart(OrderBean order) {
        String product_no = order.getProduct_no();
		// OrderBean으로부터 선택한 상품의 상품번호와 수량을 가져옴
        int quantity = order.getQuantity();
		// 선택한 상품수량이 적어도 1개 이상을 경우 실행
        if (quantity > 0) {
			// 선택한 상품이 이미 장바구니에 있는지 검사
            if (hCart.containsKey(product_no)) {
				//이미 장바구니에 있는 상품이라면 상품의 수량을 가져옴
                OrderBean tempOrder = (OrderBean) hCart.get(product_no);
				//장바구니에 있는 상품수량에 현재 신청한 수량을 더해 준다
                quantity += tempOrder.getQuantity();
				//총 수량을 저장
                tempOrder.setQuantity(quantity);
				//장바구니를 새로이 저장
                hCart.put(product_no, tempOrder);
            } else {
				//중복된 상품이 아니라면 장바구니에 새롭게 상품을 추가
                hCart.put(product_no, order);
            }
        }
    }

    public Hashtable getCartList() {
        return hCart;
    }

    public void updateCart(OrderBean order) {
        String product_no = order.getProduct_no();
		//장바구니의 정보를 수정하기 위해서 장바구니 정보를 새로 입력
        hCart.put(product_no, order);
    }

    public void deleteCart(OrderBean order) {
        String product_no = order.getProduct_no();
		// Hashtable에 저장되어 있는 장바구니 목록을 지우기 위해서
		// remove("이름") 메소드를 이용하게 된다.
        hCart.remove(product_no);
    }

}
package mall;

import java.util.Hashtable;

public class CartMgr {

    private Hashtable hCart = new Hashtable();

    public CartMgr() {
    }

    public void addCart(OrderBean order) {
        String product_no = order.getProduct_no();
		// OrderBean���κ��� ������ ��ǰ�� ��ǰ��ȣ�� ������ ������
        int quantity = order.getQuantity();
		// ������ ��ǰ������ ��� 1�� �̻��� ��� ����
        if (quantity > 0) {
			// ������ ��ǰ�� �̹� ��ٱ��Ͽ� �ִ��� �˻�
            if (hCart.containsKey(product_no)) {
				//�̹� ��ٱ��Ͽ� �ִ� ��ǰ�̶�� ��ǰ�� ������ ������
                OrderBean tempOrder = (OrderBean) hCart.get(product_no);
				//��ٱ��Ͽ� �ִ� ��ǰ������ ���� ��û�� ������ ���� �ش�
                quantity += tempOrder.getQuantity();
				//�� ������ ����
                tempOrder.setQuantity(quantity);
				//��ٱ��ϸ� ������ ����
                hCart.put(product_no, tempOrder);
            } else {
				//�ߺ��� ��ǰ�� �ƴ϶�� ��ٱ��Ͽ� ���Ӱ� ��ǰ�� �߰�
                hCart.put(product_no, order);
            }
        }
    }

    public Hashtable getCartList() {
        return hCart;
    }

    public void updateCart(OrderBean order) {
        String product_no = order.getProduct_no();
		//��ٱ����� ������ �����ϱ� ���ؼ� ��ٱ��� ������ ���� �Է�
        hCart.put(product_no, order);
    }

    public void deleteCart(OrderBean order) {
        String product_no = order.getProduct_no();
		// Hashtable�� ����Ǿ� �ִ� ��ٱ��� ����� ����� ���ؼ�
		// remove("�̸�") �޼ҵ带 �̿��ϰ� �ȴ�.
        hCart.remove(product_no);
    }

}
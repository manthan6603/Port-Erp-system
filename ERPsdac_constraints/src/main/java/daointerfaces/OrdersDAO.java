package daointerfaces;

import java.util.List;

import models.OrdersPojo;

public interface OrdersDAO {

    List<OrdersPojo> viewOrders();
    void updateOrderStatus(int OrderId, String newStatus);
	public void PlaceOrder(OrdersPojo ordersPojo);
	
	public List<OrdersPojo> viewOrdersConsumer(String port_id);
}

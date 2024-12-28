package interfaces;

import java.util.List;

import models.OrdersPojo;

public interface Orders {

	public List<OrdersPojo> viewOrders(OrdersPojo ordersPojo);
	
	public void PlaceOrder(OrdersPojo ordersPojo);
	
	public List<OrdersPojo> viewOrdersConsumer(String port_id);
}

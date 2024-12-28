package models;

import java.util.List;


import implementors.ProductsImplementor;


public class ProductsPojo {
	private int product_id;
	private String product_name;
	private int quantity;
	private float price;

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
	
	public List<ProductsPojo> viewProducts(ProductsPojo productsPojo) {
		return new ProductsImplementor().viewProducts(productsPojo) ;
	}
	
	public void updateProductDetails(ProductsPojo productsPojo) {
		// TODO Auto-generated method stub
		new ProductsImplementor().updateProductDetails(productsPojo);
		
	}
	
	public void DeleteProduct(ProductsPojo productsPojo)
	{
		new ProductsImplementor().DeleteProduct(productsPojo); 
	}
	
	public void AddProduct(ProductsPojo productsPojo) {
		new ProductsImplementor().AddProduct(productsPojo);
	}
	
	public ProductsPojo viewProductDetails(int productId) {
	    return new ProductsImplementor().viewProductDetails(productId);
	}

	
	
}

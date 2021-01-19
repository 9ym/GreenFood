package com.kh.greenfood.domain;

public class OrderDetailDto{
	
	private String product_title;
	private String product_code;
	private int order_quantity;
	private int product_price;
	private int order_total_price;
	public String getProduct_title() {
		return product_title;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getOrder_total_price() {
		return order_total_price;
	}
	public void setOrder_total_price(int order_total_price) {
		this.order_total_price = order_total_price;
	}
	@Override
	public String toString() {
		return "OrderDetailDto [product_title=" + product_title + ", product_code=" + product_code + ", order_quantity="
				+ order_quantity + ", product_price=" + product_price + ", order_total_price=" + order_total_price
				+ "]";
	}
	
	
}

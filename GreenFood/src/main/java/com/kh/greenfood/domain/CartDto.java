package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class CartDto {
	
	private String cart_no;
	private String user_id;
	private String product_code;
	private String product_title;
	private int product_price;
	private int product_sale_rate;
	private int cart_quantity;
	private Timestamp cart_date;
	
	public CartDto() { super(); }

	public CartDto(String user_id, String product_code, String product_title, int product_price, int product_sale_rate,
			int cart_quantity) {
		super();
		this.user_id = user_id;
		this.product_code = product_code;
		this.product_title = product_title;
		this.product_price = product_price;
		this.product_sale_rate = product_sale_rate;
		this.cart_quantity = cart_quantity;
	}

	public CartDto(String cart_no, String user_id, String product_code, String product_title, int product_price,
			int product_sale_rate, int cart_quantity, Timestamp cart_date) {
		super();
		this.cart_no = cart_no;
		this.user_id = user_id;
		this.product_code = product_code;
		this.product_title = product_title;
		this.product_price = product_price;
		this.product_sale_rate = product_sale_rate;
		this.cart_quantity = cart_quantity;
		this.cart_date = cart_date;
	}
	
	public String getCart_no() {
		return cart_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getProduct_code() {
		return product_code;
	}
	public String getProduct_title() {
		return product_title;
	}
	public int getProduct_price() {
		return product_price;
	}
	public int getProduct_sale_rate() {
		return product_sale_rate;
	}
	public int getCart_quantity() {
		return cart_quantity;
	}
	public Timestamp getCart_date() {
		return cart_date;
	}
	public void setCart_no(String cart_no) {
		this.cart_no = cart_no;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public void setProduct_sale_rate(int product_sale_rate) {
		this.product_sale_rate = product_sale_rate;
	}
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	public void setCart_date(Timestamp cart_date) {
		this.cart_date = cart_date;
	}

	@Override
	public String toString() {
		return "CartDto [cart_no=" + cart_no + ", user_id=" + user_id + ", product_code=" + product_code
				+ ", product_title=" + product_title + ", product_price=" + product_price + ", product_sale_rate="
				+ product_sale_rate + ", cart_quantity=" + cart_quantity + ", cart_date=" + cart_date + "]";
	}
	
}

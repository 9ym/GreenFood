package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class CartDto {
	
	private String cart_no;
	private String user_id;
	private String product_code;
	private int cart_quantity;
	private Timestamp cart_date;
	
	public CartDto() { super(); }

	public CartDto(String user_id, String product_code, int cart_quantity) {
		super();
		this.user_id = user_id;
		this.product_code = product_code;
		this.cart_quantity = cart_quantity;
	}

	public CartDto(String cart_no, String user_id, String product_code, int cart_quantity, Timestamp cart_date) {
		super();
		this.cart_no = cart_no;
		this.user_id = user_id;
		this.product_code = product_code;
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
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	public void setCart_date(Timestamp cart_date) {
		this.cart_date = cart_date;
	}

	@Override
	public String toString() {
		return "CartDto [cart_no=" + cart_no + ", user_id=" + user_id + ", product_code=" + product_code
				+ ", cart_quantity=" + cart_quantity + ", cart_date=" + cart_date + "]";
	}

}

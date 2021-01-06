package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class OrderVo {
	
	private String user_id;
	private String order_code;
	private Timestamp order_date;
	private int order_total_price;
	private String order_state;
	private String order_state_dsc;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public int getOrder_total_price() {
		return order_total_price;
	}
	public void setOrder_total_price(int order_total_price) {
		this.order_total_price = order_total_price;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public String getOrder_state_dsc() {
		return order_state_dsc;
	}
	public void setOrder_state_dsc(String order_state_dsc) {
		this.order_state_dsc = order_state_dsc;
	}
	@Override
	public String toString() {
		return "OrderVo [user_id=" + user_id + ", order_code=" + order_code + ", order_date=" + order_date
				+ ", order_total_price=" + order_total_price + ", order_state=" + order_state + ", order_state_dsc="
				+ order_state_dsc + "]";
	}
	
	
}

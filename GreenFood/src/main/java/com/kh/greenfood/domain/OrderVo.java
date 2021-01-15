package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class OrderVo {
	
	private String user_id;
	private String order_code;
	private Timestamp order_date;
	private int order_total_price;
	private String order_state;
	private String order_state_dsc;
	private String order_addr1;
	private String order_addr2;
	private String order_addr3;
	
	public OrderVo() { super(); }

	public OrderVo(String user_id, int order_total_price, String order_state, String order_addr1, String order_addr2,
			String order_addr3) {
		super();
		this.user_id = user_id;
		this.order_total_price = order_total_price;
		this.order_state = order_state;
		this.order_addr1 = order_addr1;
		this.order_addr2 = order_addr2;
		this.order_addr3 = order_addr3;
	}

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
	public String getOrder_addr1() {
		return order_addr1;
	}
	public void setOrder_addr1(String order_addr1) {
		this.order_addr1 = order_addr1;
	}
	public String getOrder_addr2() {
		return order_addr2;
	}
	public void setOrder_addr2(String order_addr2) {
		this.order_addr2 = order_addr2;
	}
	public String getOrder_addr3() {
		return order_addr3;
	}
	public void setOrder_addr3(String order_addr3) {
		this.order_addr3 = order_addr3;
	}
	
	@Override
	public String toString() {
		return "OrderVo [user_id=" + user_id + ", order_code=" + order_code + ", order_date=" + order_date
				+ ", order_total_price=" + order_total_price + ", order_state=" + order_state + ", order_state_dsc="
				+ order_state_dsc + ", order_addr1=" + order_addr1 + ", order_addr2=" + order_addr2 + ", order_addr3="
				+ order_addr3 + "]";
	}
	
}

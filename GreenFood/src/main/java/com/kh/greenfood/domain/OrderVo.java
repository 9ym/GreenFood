package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class OrderVo {

	
	private String user_id;
	private String order_code;
	private Timestamp order_date;
	private int order_total_price;
	private int order_sale_price;
	private int order_point_use;
	private String order_state;
	private String order_state_dsc;
	private String order_addr1;
	private String order_addr2;
	private String order_addr3;
	private String order_pay_method;
	private int order_origin_price;
	
	public OrderVo() { super(); }

	public OrderVo(String user_id, int order_total_price, int order_sale_price, int order_point_use, String order_state,
			String order_addr1, String order_addr2, String order_addr3, String order_pay_method) {
		super();
		this.user_id = user_id;
		this.order_total_price = order_total_price;
		this.order_sale_price = order_sale_price;
		this.order_point_use = order_point_use;
		this.order_state = order_state;
		this.order_addr1 = order_addr1;
		this.order_addr2 = order_addr2;
		this.order_addr3 = order_addr3;
		this.order_pay_method = order_pay_method;
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

	public int getOrder_sale_price() {
		return order_sale_price;
	}

	public void setOrder_sale_price(int order_sale_price) {
		this.order_sale_price = order_sale_price;
	}

	public int getOrder_point_use() {
		return order_point_use;
	}

	public void setOrder_point_use(int order_point_use) {
		this.order_point_use = order_point_use;
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

	public String getOrder_pay_method() {
		return order_pay_method;
	}

	public void setOrder_pay_method(String order_pay_method) {
		this.order_pay_method = order_pay_method;
	}

	public int getOrder_origin_price() {
		return order_origin_price;
	}

	public void setOrder_origin_price(int origin) {
		this.order_origin_price = origin;
	}

	@Override
	public String toString() {
		return "OrderVo [user_id=" + user_id + ", order_code=" + order_code + ", order_date=" + order_date
				+ ", order_total_price=" + order_total_price + ", order_sale_price=" + order_sale_price
				+ ", order_point_use=" + order_point_use + ", order_state=" + order_state + ", order_state_dsc="
				+ order_state_dsc + ", order_addr1=" + order_addr1 + ", order_addr2=" + order_addr2 + ", order_addr3="
				+ order_addr3 + ", order_pay_method=" + order_pay_method + ", order_origin_price=" + order_origin_price
				+ "]";
	}
	
}

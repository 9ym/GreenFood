package com.kh.greenfood.domain;

public class OrderListCountDto {
	
	private int order_count;
	private String user_id;
	private String order_state;
	private String order_state_dsc;
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
		return "OrderListCountDto [order_count=" + order_count + ", user_id=" + user_id + ", order_state=" + order_state
				+ ", order_state_dsc=" + order_state_dsc + "]";
	}
	
	

}

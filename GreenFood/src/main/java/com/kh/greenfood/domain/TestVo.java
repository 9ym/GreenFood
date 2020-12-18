package com.kh.greenfood.domain;

public class TestVo {

	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_address;
	private String user_phone;
	private String user_email;
	private int user_point;
	private int user_level;
	private String user_code;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	public int getUser_level() {
		return user_level;
	}
	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	@Override
	public String toString() {
		return "TestVo [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_address="
				+ user_address + ", user_phone=" + user_phone + ", user_email=" + user_email + ", user_point="
				+ user_point + ", user_level=" + user_level + ", user_code=" + user_code + "]";
	}
	
}

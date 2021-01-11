package com.kh.greenfood.domain;

public class StarDto {

	private int star_point_no;
	private String user_id;
	private String order_code;
	private String product_code;
	private int star_point;
	
	public StarDto() { super(); }

	public StarDto(int star_point_no, String user_id, String order_code, String product_code, int star_point) {
		super();
		this.star_point_no = star_point_no;
		this.user_id = user_id;
		this.order_code = order_code;
		this.product_code = product_code;
		this.star_point = star_point;
	}

	public int getStar_point_no() {
		return star_point_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getOrder_code() {
		return order_code;
	}

	public String getProduct_code() {
		return product_code;
	}

	public int getStar_point() {
		return star_point;
	}

	public void setStar_point_no(int star_point_no) {
		this.star_point_no = star_point_no;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public void setStar_point(int star_point) {
		this.star_point = star_point;
	}

	@Override
	public String toString() {
		return "StarDto [star_point_no=" + star_point_no + ", user_id=" + user_id + ", order_code=" + order_code
				+ ", product_code=" + product_code + ", star_point=" + star_point + "]";
	}

}

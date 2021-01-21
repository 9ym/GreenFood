package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class ReviewVo {

	private String user_id;
	private String order_code;
	private int review_no;
	private String review_content;
	private Timestamp review_date;
	private String review_title;
	private int review_readcount;
	private String review_image;
	private String product_code;
	private String product_title;
	private String star_point;
	
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
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public int getReview_readcount() {
		return review_readcount;
	}
	public void setReview_readcount(int review_readcount) {
		this.review_readcount = review_readcount;
	}
	public String getReview_image() {
		return review_image;
	}
	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_title() {
		return product_title;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public String getStar_point() {
		return star_point;
	}
	public void setStar_point(String star_point) {
		this.star_point = star_point;
	}
	@Override
	public String toString() {
		return "ReviewVo [user_id=" + user_id + ", order_code=" + order_code + ", review_no=" + review_no
				+ ", review_content=" + review_content + ", review_date=" + review_date + ", review_title="
				+ review_title + ", review_readcount=" + review_readcount + ", review_image=" + review_image
				+ ", product_code=" + product_code + ", product_title=" + product_title + ", star_point=" + star_point
				+ "]";
	}
	
}

package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class ProductVo {
	private String product_code;
	private String product_category;
	private String product_title;
	private int product_price;
	private Timestamp product_registrantion_date;
	private int product_shelf_life;
	private String product_sub_title;
	private String product_content;
	private int product_heart;
	
	public ProductVo() { }

	public ProductVo(String product_code, String product_category, String product_title, int product_price,
			Timestamp product_registrantion_date, int product_shelf_life, String product_sub_title,
			String product_content, int product_heart) {
		super();
		this.product_code = product_code;
		this.product_category = product_category;
		this.product_title = product_title;
		this.product_price = product_price;
		this.product_registrantion_date = product_registrantion_date;
		this.product_shelf_life = product_shelf_life;
		this.product_sub_title = product_sub_title;
		this.product_content = product_content;
		this.product_heart = product_heart;
	}

	public String getProduct_code() {
		return product_code;
	}
	public String getProduct_category() {
		return product_category;
	}
	public String getProduct_title() {
		return product_title;
	}
	public int getProduct_price() {
		return product_price;
	}
	public Timestamp getProduct_registrantion_date() {
		return product_registrantion_date;
	}
	public int getProduct_shelf_life() {
		return product_shelf_life;
	}
	public String getProduct_sub_title() {
		return product_sub_title;
	}
	public String getProduct_content() {
		return product_content;
	}
	public int getProduct_heart() {
		return product_heart;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public void setProduct_registrantion_date(Timestamp product_registrantion_date) {
		this.product_registrantion_date = product_registrantion_date;
	}
	public void setProduct_shelf_life(int product_shelf_life) {
		this.product_shelf_life = product_shelf_life;
	}
	public void setProduct_sub_title(String product_sub_title) {
		this.product_sub_title = product_sub_title;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public void setProduct_heart(int product_heart) {
		this.product_heart = product_heart;
	}
	
	@Override
	public String toString() {
		return "ProductVo [product_code=" + product_code + ", product_category=" + product_category + ", product_title="
				+ product_title + ", product_price=" + product_price + ", product_registrantion_date="
				+ product_registrantion_date + ", product_shelf_life=" + product_shelf_life + ", product_sub_title="
				+ product_sub_title + ", product_content=" + product_content + ", product_heart=" + product_heart + "]";
	}
	
}

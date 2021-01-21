package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class ProductVo {
	private String product_code;
	private String product_category;
	private String product_title;
	private int product_price;
	private Timestamp product_registration_date;
	private Timestamp product_sales_deadlines;
	private int product_shelf_life;
	private String product_sub_title;
	private String product_content;
	private String product_weight;
	private String product_sales_unit;
	private String product_origin;
	private int product_order_count;
	private int product_star;
	private int product_sale_rate;
	private int rnum; // 관리자 - 상품 검색시에만 필요
	
	public ProductVo() { }

	public ProductVo(String product_category, String product_title, int product_price, String product_sub_title,
			String product_content, String product_weight, String product_sales_unit, String product_origin) {
		super();
		this.product_category = product_category;
		this.product_title = product_title;
		this.product_price = product_price;
		this.product_sub_title = product_sub_title;
		this.product_content = product_content;
		this.product_weight = product_weight;
		this.product_sales_unit = product_sales_unit;
		this.product_origin = product_origin;
	}

	public ProductVo(String product_code, String product_category, String product_title, int product_price,
			Timestamp product_registration_date, Timestamp product_sales_deadlines, int product_shelf_life,
			String product_sub_title, String product_content, String product_weight,
			String product_sales_unit, String product_origin, int product_order_count, int product_star,
			int product_sale_rate, int rnum) {
		super();
		this.product_code = product_code;
		this.product_category = product_category;
		this.product_title = product_title;
		this.product_price = product_price;
		this.product_registration_date = product_registration_date;
		this.product_sales_deadlines = product_sales_deadlines;
		this.product_shelf_life = product_shelf_life;
		this.product_sub_title = product_sub_title;
		this.product_content = product_content;
		this.product_weight = product_weight;
		this.product_sales_unit = product_sales_unit;
		this.product_origin = product_origin;
		this.product_order_count = product_order_count;
		this.product_star = product_star;
		this.product_sale_rate = product_sale_rate;
		this.rnum = rnum;
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

	public Timestamp getProduct_registration_date() {
		return product_registration_date;
	}

	public Timestamp getProduct_sales_deadlines() {
		return product_sales_deadlines;
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

	public String getProduct_weight() {
		return product_weight;
	}

	public String getProduct_sales_unit() {
		return product_sales_unit;
	}

	public String getProduct_origin() {
		return product_origin;
	}

	public int getProduct_order_count() {
		return product_order_count;
	}

	public int getProduct_star() {
		return product_star;
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

	public void setProduct_registration_date(Timestamp product_registration_date) {
		this.product_registration_date = product_registration_date;
	}

	public void setProduct_sales_deadlines(Timestamp product_sales_deadlines) {
		this.product_sales_deadlines = product_sales_deadlines;
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

	public void setProduct_weight(String product_weight) {
		this.product_weight = product_weight;
	}

	public void setProduct_sales_unit(String product_sales_unit) {
		this.product_sales_unit = product_sales_unit;
	}

	public void setProduct_origin(String product_origin) {
		this.product_origin = product_origin;
	}

	public void setProduct_order_count(int product_order_count) {
		this.product_order_count = product_order_count;
	}

	public void setProduct_star(int product_star) {
		this.product_star = product_star;
	}

	public int getProduct_sale_rate() {
		return product_sale_rate;
	}

	public void setProduct_sale_rate(int product_sale_rate) {
		this.product_sale_rate = product_sale_rate;
	}
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "ProductVo [product_code=" + product_code + ", product_category=" + product_category + ", product_title="
				+ product_title + ", product_price=" + product_price + ", product_registration_date="
				+ product_registration_date + ", product_sales_deadlines=" + product_sales_deadlines
				+ ", product_shelf_life=" + product_shelf_life + ", product_sub_title=" + product_sub_title
				+ ", product_content=" + product_content + ", product_weight=" + product_weight
				+ ", product_sales_unit=" + product_sales_unit + ", product_origin=" + product_origin
				+ ", product_order_count=" + product_order_count + ", product_star=" + product_star
				+ ", product_sale_rate=" + product_sale_rate + ", rnum=" + rnum + "]";
	}

}

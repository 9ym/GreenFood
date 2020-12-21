package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class ProductImageDto {
	private String image_code;
	private String product_code;
	private String image_file_name;
	private Timestamp image_registrantion_date;
	
	public ProductImageDto() { }

	public ProductImageDto(String image_code, String product_code, String image_file_name,
			Timestamp image_registrantion_date) {
		super();
		this.image_code = image_code;
		this.product_code = product_code;
		this.image_file_name = image_file_name;
		this.image_registrantion_date = image_registrantion_date;
	}

	public String getImage_code() {
		return image_code;
	}
	public String getProduct_code() {
		return product_code;
	}
	public String getImage_file_name() {
		return image_file_name;
	}
	public Timestamp getImage_registrantion_date() {
		return image_registrantion_date;
	}
	public void setImage_code(String image_code) {
		this.image_code = image_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public void setImage_file_name(String image_file_name) {
		this.image_file_name = image_file_name;
	}
	public void setImage_registrantion_date(Timestamp image_registrantion_date) {
		this.image_registrantion_date = image_registrantion_date;
	}

	@Override
	public String toString() {
		return "ProductImageDto [image_code=" + image_code + ", product_code=" + product_code + ", image_file_name="
				+ image_file_name + ", image_registrantion_date=" + image_registrantion_date + "]";
	}
	
}

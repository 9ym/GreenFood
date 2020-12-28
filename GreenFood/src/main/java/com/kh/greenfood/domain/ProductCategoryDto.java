package com.kh.greenfood.domain;

public class ProductCategoryDto {
	
	private String product_category;
	private String product_category_dsc;

	public ProductCategoryDto() { super(); }

	public ProductCategoryDto(String product_category, String product_category_dsc) {
		super();
		this.product_category = product_category;
		this.product_category_dsc = product_category_dsc;
	}

	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_category_dsc() {
		return product_category_dsc;
	}
	public void setProduct_category_dsc(String product_category_dsc) {
		this.product_category_dsc = product_category_dsc;
	}

	@Override
	public String toString() {
		return "ProductCategoryDto [product_category=" + product_category + ", product_category_dsc="
				+ product_category_dsc + "]";
	}
	
}

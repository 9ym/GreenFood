package com.kh.greenfood.domain;

public class SearchDto {
	private String searchAnd;
	private String searchWhere;
	private String searchBy;
	private String searchWhat;
	
	public SearchDto() { super(); }

	public SearchDto(String searchAnd, String searchWhere, String searchBy, String searchWhat) {
		super();
		this.searchAnd = searchAnd;
		this.searchWhere = searchWhere;
		this.searchBy = searchBy;
		this.searchWhat = searchWhat;
	}

	public String getSearchAnd() {
		return searchAnd;
	}

	public void setSearchAnd(String searchAnd) {
		this.searchAnd = searchAnd;
	}

	public String getSearchWhere() {
		return searchWhere;
	}

	public void setSearchWhere(String searchWhere) {
		this.searchWhere = searchWhere;
	}

	public String getSearchBy() {
		return searchBy;
	}

	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}

	public String getSearchWhat() {
		return searchWhat;
	}

	public void setSearchWhat(String searchWhat) {
		this.searchWhat = searchWhat;
	}

	@Override
	public String toString() {
		return "SearchDto [searchAnd=" + searchAnd + ", searchWhere=" + searchWhere + ", searchBy=" + searchBy
				+ ", searchWhat=" + searchWhat + "]";
	}

}

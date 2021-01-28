package com.kh.greenfood.domain;

public class SearchDto {
	private String searchAnd;
	private String searchWhere;
	private String searchBy;
	private String searchWhat;
	private int page = 1;      // 현재페이지
	private final int perPage = 10;  // 게시글 몇개 보여줄지
	private int startRow = 1;  // 현재 페이지의 시작 행
	private int endRow = 10;   // 현재 페이지의 끝 행
	private int startPage = 1; // 게시판 하단의 Pagination의 시작값
	private int endPage;	   // 게시판 하단의 Pagination의 끝값
	private int totalCount;    // 게시글 갯수
	private int totalPage; 	   // 페이지 수
	private final int PAGE_BLOCK = 10; // Pagination의 갯수
//	private String selectType; // 검색 조건 (제목, 내용, ...)
//	private String keyword;    // 검색어
	
	public void setPagingInfo(int totalCount) {
		this.totalPage = (int)Math.ceil((double)totalCount / perPage);
		
		this.endRow = page * perPage;
		this.startRow = this.endRow - (perPage - 1);
		this.startPage = (this.page - 1) / PAGE_BLOCK * PAGE_BLOCK + 1;
		this.endPage = this.startPage + (PAGE_BLOCK - 1);
		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}
	
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
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	/*public void setPerPage(int perPage) {
		this.perPage = perPage;
	}*/

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPAGE_BLOCK() {
		return PAGE_BLOCK;
	}

	@Override
	public String toString() {
		return "SearchDto [searchAnd=" + searchAnd + ", searchWhere=" + searchWhere + ", searchBy=" + searchBy
				+ ", searchWhat=" + searchWhat + ", page=" + page + ", perPage=" + perPage + ", startRow=" + startRow
				+ ", endRow=" + endRow + ", startPage=" + startPage + ", endPage=" + endPage + ", totalCount="
				+ totalCount + ", totalPage=" + totalPage + ", PAGE_BLOCK=" + PAGE_BLOCK + "]";
	}
	
}

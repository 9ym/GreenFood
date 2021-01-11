package com.kh.greenfood.domain;

public class PagingDto {

	private int page = 1;				// 해당 페이지
	private int perPage = 10;			// 페이지당 보여질 게시글의 갯수
	private int startRow = 1;			// 해당 페이지의 시작행
	private int endRow = 10;			// 해당 페이지의 끝행
	private int startPage = 1;			// 게시판 하단의 페이지네이션의 시작값
	private int endPage;				// 게시판 하단의 페이지네이션의 끝값
	private int totalCount;				// 개시글 갯수
	private int totalPage;				// 페이지 수
	private final int PAGE_BLOCK = 10;  // 페이지네이션의 갯수
	/*private String searchType;			// 검색조건			
	private String keyword;				// 검색어
*/	
	public void setPagingInfo() {
//		this.searchType = searchType;
//		this.keyword = keyword;
//		this.perPage = perPage;
		this.totalPage = (int)Math.ceil((double)totalCount / perPage);
//		this.page = page;
		
		this.endRow = page * perPage;
		this.startRow = this.endRow - (perPage - 1);
		this.startPage = (this.page - 1) / PAGE_BLOCK * PAGE_BLOCK + 1;
		this.endPage = this.startPage + (PAGE_BLOCK - 1);
		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
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
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
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
	/*public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}*/
	@Override
	public String toString() {
		return "PagingDto [page=" + page + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", totalCount=" + totalCount + ", totalPage="
				+ totalPage + ", PAGE_BLOCK=" + PAGE_BLOCK + "]";
	}
	
	
}

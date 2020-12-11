package com.kh.greenfood.domain;

public class TestVo {
	int sno;
	String column;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	@Override
	public String toString() {
		return "TestVo [sno=" + sno + ", column=" + column + "]";
	}
	
	
}

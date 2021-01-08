package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class PointVo {
	
	private int point_no;
	private int point_category;
	private int point_score;
	private String user_id;
	private Timestamp point_date;
	private String point_category_dsc;
	private int rnum;
	public int getPoint_no() {
		return point_no;
	}
	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}
	public int getPoint_category() {
		return point_category;
	}
	public void setPoint_category(int point_category) {
		this.point_category = point_category;
	}
	public int getPoint_score() {
		return point_score;
	}
	public void setPoint_score(int point_score) {
		this.point_score = point_score;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}
	public String getPoint_category_dsc() {
		return point_category_dsc;
	}
	public void setPoint_category_dsc(String point_category_dsc) {
		this.point_category_dsc = point_category_dsc;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	@Override
	public String toString() {
		return "PointVo [point_no=" + point_no + ", point_category=" + point_category + ", point_score=" + point_score
				+ ", user_id=" + user_id + ", point_date=" + point_date + ", point_category_dsc=" + point_category_dsc
				+ ", rnum=" + rnum + "]";
	}
}

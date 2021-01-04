package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class QuestionVo {

	private int question_no;
	private String question_title;
	private String question_content;
	private Timestamp question_date;
	private int question_category;
	private String question_category_dsc;
	
	public int getQuestion_no() {
		return question_no;
	}
	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public Timestamp getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(Timestamp question_date) {
		this.question_date = question_date;
	}
	public int getQuestion_category() {
		return question_category;
	}
	public void setQuestion_category(int question_category) {
		this.question_category = question_category;
	}
	public String getQuestion_category_dsc() {
		return question_category_dsc;
	}
	public void setQuestion_category_dsc(String question_category_dsc) {
		this.question_category_dsc = question_category_dsc;
	}
	@Override
	public String toString() {
		return "QuestionVo [question_no=" + question_no + ", question_title=" + question_title + ", question_content="
				+ question_content + ", question_date=" + question_date + ", question_category=" + question_category
				+ ", question_category_dsc=" + question_category_dsc + "]";
	}
	
	
}

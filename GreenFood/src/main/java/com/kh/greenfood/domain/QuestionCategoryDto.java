package com.kh.greenfood.domain;

public class QuestionCategoryDto {

	private int question_category;
	private String question_category_dsc;
	
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
		return "QuestionCategoryDto [question_category=" + question_category + ", question_category_dsc="
				+ question_category_dsc + "]";
	}
	
	
}

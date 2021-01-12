package com.kh.greenfood.domain;

import java.sql.Timestamp;

public class QuestionOneVo {

	private int q_o_no;
	private int q_o_category;
	private String q_o_order_code;
	private String q_o_title;
	private String q_o_content;
	private String q_o_writer;
	private String q_o_email;
	private String q_o_phone;
	private Timestamp q_o_date;
	private String q_o_image;
	private String q_o_ok;
	private String question_category_dsc;
	private String q_o_answer;

	public String getQ_o_answer() {
		return q_o_answer;
	}
	public void setQ_o_answer(String q_o_answer) {
		this.q_o_answer = q_o_answer;
	}
	public int getQ_o_no() {
		return q_o_no;
	}
	public void setQ_o_no(int q_o_no) {
		this.q_o_no = q_o_no;
	}
	public int getQ_o_category() {
		return q_o_category;
	}
	public void setQ_o_category(int q_o_category) {
		this.q_o_category = q_o_category;
	}
	public String getQ_o_order_code() {
		return q_o_order_code;
	}
	public void setQ_o_order_code(String q_o_order_code) {
		this.q_o_order_code = q_o_order_code;
	}
	public String getQ_o_title() {
		return q_o_title;
	}
	public void setQ_o_title(String q_o_title) {
		this.q_o_title = q_o_title;
	}
	public String getQ_o_content() {
		return q_o_content;
	}
	public void setQ_o_content(String q_o_content) {
		this.q_o_content = q_o_content;
	}
	public String getQ_o_writer() {
		return q_o_writer;
	}
	public void setQ_o_writer(String q_o_writer) {
		this.q_o_writer = q_o_writer;
	}
	public String getQ_o_email() {
		return q_o_email;
	}
	public void setQ_o_email(String q_o_email) {
		this.q_o_email = q_o_email;
	}
	public String getQ_o_phone() {
		return q_o_phone;
	}
	public void setQ_o_phone(String q_o_phone) {
		this.q_o_phone = q_o_phone;
	}
	public Timestamp getQ_o_date() {
		return q_o_date;
	}
	public void setQ_o_date(Timestamp q_o_date) {
		this.q_o_date = q_o_date;
	}
	public String getQ_o_image() {
		return q_o_image;
	}
	public void setQ_o_image(String q_o_image) {
		this.q_o_image = q_o_image;
	}
	public String getQ_o_ok() {
		return q_o_ok;
	}
	public void setQ_o_ok(String q_o_ok) {
		this.q_o_ok = q_o_ok;
	}
	public String getQuestion_category_dsc() {
		return question_category_dsc;
	}
	public void setQuestion_category_dsc(String question_category_dsc) {
		this.question_category_dsc = question_category_dsc;
	}
	@Override
	public String toString() {
		return "QuestionOneVo [q_o_no=" + q_o_no + ", q_o_category=" + q_o_category + ", q_o_order_code="
				+ q_o_order_code + ", q_o_title=" + q_o_title + ", q_o_content=" + q_o_content + ", q_o_writer="
				+ q_o_writer + ", q_o_email=" + q_o_email + ", q_o_phone=" + q_o_phone + ", q_o_date=" + q_o_date
				+ ", q_o_image=" + q_o_image + ", q_o_ok=" + q_o_ok + ", question_category_dsc=" + question_category_dsc
				+ ", q_o_answer=" + q_o_answer + "]";
	}
	
	
}

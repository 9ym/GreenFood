package com.kh.greenfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/main")
public class CustomerCenterController {
	
	@RequestMapping(value="/notice/notice")
	public String notice() throws Exception{
		return "notice/notice";
	}
	
	@RequestMapping(value="/notice/noticeWriteForm")
	public String noticeWriteForm() throws Exception{
		return "notice/noticeWriteForm";
	}
	
	@RequestMapping(value="/question/customerQuestion")
	public String customerQuestion() throws Exception{
		return "question/customerQuestion";
	}
	
	@RequestMapping(value="/question/questionWriteForm")
	public String questionWriteForm() throws Exception{
		return "question/questionWriteForm";
	}
	
	

}

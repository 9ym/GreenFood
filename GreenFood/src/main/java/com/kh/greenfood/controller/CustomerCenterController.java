package com.kh.greenfood.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.greenfood.domain.NoticeVo;
import com.kh.greenfood.service.NoticeService;

@Controller
@RequestMapping(value="/customerCenter")
public class CustomerCenterController {
	
	@Inject
	private NoticeService noticeService;
	
	
	@RequestMapping(value="/notice/noticeWriteForm")
	public String noticeWriteForm() throws Exception{
		return "/customerCenter/notice/noticeWriteForm";
	}
	
	
	@RequestMapping(value="/notice/insertNotice", method=RequestMethod.GET)
	public String insertNotice(NoticeVo noticeVo, HttpSession session) throws Exception {
//		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
//		commentVo.setUser_id(memberVo.getUser_id());
//		System.out.println("noticeVo:" + noticeVo);
		noticeService.insertNotice(noticeVo);
		
		return "redirect:/main/customerCenter/customerCenterMain";
	}
	
	@RequestMapping(value="/customerCenterMain")
	public String listAll(Model model) throws Exception {
		List<NoticeVo> noticeList = noticeService.noticeList();
		System.out.println("CustomerCenterController, listAll, noticeList:" + noticeList);
		model.addAttribute("noticeList", noticeList);
		return "customerCenter/customerCenterMain";
	}
	
	@RequestMapping(value="/notice/noticeContent/{notice_no}", method=RequestMethod.GET)
	public String noticeContent(@PathVariable("notice_no") int notice_no) throws Exception{
		System.out.println("notice_no noticeContent :" + notice_no);
		return "/customerCenter/notice/noticeContent";
	}
	
	
	/*@RequestMapping(value="/content", method=RequestMethod.GET)
	public String content(int b_no, PagingDto pagingDto, Model model, HttpSession session) throws Exception {
		System.out.println("b_no :" + b_no);
		System.out.println("pagingDto :" + pagingDto);
		BoardVo boardVo = boardService.selectArticle(b_no);
		
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		String user_id = memberVo.getUser_id();
		boolean isLike = likeService.isLike(user_id, b_no);
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("isLike", isLike);
		return "board/content";
	}*/
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/question/questionContent")
	public String customerQuestion() throws Exception{
		return "/customerCenter/question/questionContent";
	}
	
	@RequestMapping(value="/question/questionWriteForm")
	public String questionWriteForm() throws Exception{
		return "/customerCenter/question/questionWriteForm";
	}
	
	

}

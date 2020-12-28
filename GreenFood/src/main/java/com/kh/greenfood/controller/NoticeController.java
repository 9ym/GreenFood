package com.kh.greenfood.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.NoticeVo;
import com.kh.greenfood.service.NoticeService;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	
	@Inject
	private NoticeService noticeService;
	
	@RequestMapping(value="/getNoticeList/{notice_no}", method=RequestMethod.GET)
//	@ResponseBody
	public List<NoticeVo> getNoticeList(@PathVariable("notice_no") int notice_no) throws Exception {
		List<NoticeVo> noticeList = noticeService.getNoticeList(notice_no);
		return noticeList;
	}
	
	@RequestMapping(value="/insertNotice", method=RequestMethod.GET)
	public String insertNotice(NoticeVo noticeVo, HttpSession session) throws Exception {
//		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
//		commentVo.setUser_id(memberVo.getUser_id());
//		System.out.println("noticeVo:" + noticeVo);
		noticeService.insertNotice(noticeVo);
		
		return "redirect:/main/customer/customerCenter";
	}
	
	@RequestMapping(value="/writeRun", method=RequestMethod.GET)
	public String writeRun(NoticeVo noticeVo, RedirectAttributes rttr, HttpSession session) throws Exception {
//		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
//		boardvo.setUser_id(memberVo.getUser_id());
		System.out.println("WriteRun_noticeVo:" + noticeVo);
		noticeService.insertNotice(noticeVo);
		rttr.addFlashAttribute("msg", "writeSuccess");
		return "redirect:/main/customer/customerCenter";
	}
	
	
	
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String notice(int notice_no, Model model, HttpSession session) throws Exception {
		System.out.println("notice_no :" + notice_no);
//		System.out.println("pagingDto :" + pagingDto);
		NoticeVo noticeVo = noticeService.selectNotice(notice_no);
		System.out.println("notice_noticeVo : " + noticeVo);
		
//		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
//		String user_id = memberVo.getUser_id();
//		boolean isLike = likeService.isLike(user_id, b_no);
		model.addAttribute("noticeVo", noticeVo);
//		model.addAttribute("isLike", isLike);
		return "notice/notice";
	
	
	}
}

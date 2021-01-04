package com.kh.greenfood.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.NoticeVo;
import com.kh.greenfood.domain.QuestionCategoryDto;
import com.kh.greenfood.domain.QuestionVo;
import com.kh.greenfood.service.NoticeService;
import com.kh.greenfood.service.QuestionService;

@Controller
@RequestMapping(value="/customerCenter")
public class CustomerCenterController {
	
	@Inject
	private NoticeService noticeService;
	
	@Inject
	private QuestionService questionService;
	
	
	@RequestMapping(value="/notice/noticeWriteForm")
	public String noticeWriteForm() throws Exception{
		return "/customerCenter/notice/noticeWriteForm";
	}
	
//	--------------------- 공지사항 입력하기 ------------------------------
	@RequestMapping(value="/notice/insertNotice", method=RequestMethod.GET)
	public String insertNotice(NoticeVo noticeVo, HttpSession session) throws Exception {
//		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
//		commentVo.setUser_id(memberVo.getUser_id());
//		System.out.println("noticeVo:" + noticeVo);
		noticeService.insertNotice(noticeVo);
		
		return "redirect:/customerCenter/customerCenterMain";
	}
	
	
//	-------------------- 공지사항 입력 데이타 리스트에 보여주기 -------------------------
	@RequestMapping(value="/customerCenterMain")
	public String listAll(Model model) throws Exception {
		List<NoticeVo> noticeList = noticeService.noticeList();
//		System.out.println("CustomerCenterController, listAll, noticeList:" + noticeList);
		model.addAttribute("noticeList", noticeList);
		return "customerCenter/customerCenterMain";
	}
	
// -------------------  공지사항 리스트 받아와서 noticeContent 로 보여주기 --------------------
	@RequestMapping(value="/notice/noticeContent/{notice_no}", method=RequestMethod.GET)
	public String noticeContent(@PathVariable("notice_no") int notice_no, Model model) throws Exception{
//		System.out.println("notice_no noticeContent :" + notice_no);
		NoticeVo noticeVo = noticeService.selectNotice(notice_no);
		model.addAttribute("noticeVo", noticeVo);
		return "/customerCenter/notice/noticeContent";
	}
	
	
// --------------------------  공지사항 수정하기	 -------------------------
	@RequestMapping(value="/notice/updateNotice", method=RequestMethod.GET)
	public String updateNotice(NoticeVo noticeVo) throws Exception {
		System.out.println("update: " + noticeVo);
		noticeService.updateNotice(noticeVo);
		/*rttr.addFlashAttribute("msg", "updateSuccess");*/
		
		return "redirect:/customerCenter/customerCenterMain";
	}
	
	
	
// ----------------------- 공지사항 삭제하기 ----------------------------------------
	
	
	@RequestMapping(value="/notice/deleteNotice", method=RequestMethod.GET)
	public String deleteNotice(int notice_no) throws Exception {
		noticeService.deleteNotice(notice_no);
		return "redirect:/customerCenter/customerCenterMain";
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
	
	
	@RequestMapping(value="/question/questionWriteForm")
	public String questionWriteForm() throws Exception{
		return "/customerCenter/question/questionWriteForm";
	}
	
	// -------------------------- 자주하는 질문 입력하기 --------------------------------
	@RequestMapping(value="/question/insertQuestion", method=RequestMethod.GET)
	public String insertQuestion(QuestionVo questionVo, HttpSession session) throws Exception {
//		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
//		commentVo.setUser_id(memberVo.getUser_id());
//		System.out.println("noticeVo:" + noticeVo);
		questionService.insertQuestion(questionVo);
		
		return "redirect:/customerCenter/question/questionContent";
	}
	
	// ------------------------ 자주하는 질문 입력 데이타 리스트에 보여주기 ---------------------
	@RequestMapping(value="/question/questionContent")
	public String questionListAll(Model model) throws Exception {
		List<QuestionVo> questionList = questionService.questionList();
		System.out.println("CustomerCenterController, questionListAll, questionList:" + questionList);
		model.addAttribute("questionList", questionList);
		return "customerCenter/question/questionContent";
	}
	
	// -------------------  자주하는 질문 리스트에 해당하는 글 받아오기 --------------------
		@RequestMapping(value="/question/questionAnswer/{question_no}", method=RequestMethod.GET)
		public String questionAnswer(@PathVariable("question_no") int question_no, Model model) throws Exception{
			System.out.println("questionAnswer question_no  :" + question_no);
			QuestionVo questionVo = questionService.selectQuestion(question_no);
			model.addAttribute("questionVo", questionVo);
			System.out.println("questionAnswer questionVo :" + questionVo);
			return "customerCenter/question/questionAnswer";
		}
		
	// ------------------- question_category 받아오기 ---------------------

		/*@RequestMapping(value="/question/questionAnswer/{question_category}", method=RequestMethod.GET)
		public String category(@PathVariable("question_category") int question_category, Model model) throws Exception {
		
			QuestionCategoryDto questionCategoryDto = questionService.getQuestionCategory(question_category);
			model.addAttribute("questionCategoryDto", questionCategoryDto);
//			System.out.println("questionCategoryDto question_category:" + questionCategoryDto);
			List<QuestionCategoryDto> categoryList = questionService.getCategoryList();
			model.addAttribute("categoryList", categoryList);
			System.out.println("questionCategoryDto categoryList:" + categoryList);
			return "customerCenter/question/questionContent";
		}*/
		
		// ----------------------- 자주하는 질문 삭제하기 ----------------------------------------
		
		@RequestMapping(value="/question/deleteQuestion", method=RequestMethod.GET)
		public String deleteQuestion(int question_no) throws Exception {
			questionService.deleteQuestion(question_no);
			return "redirect:/customerCenter/question/questionContent";
		}
}

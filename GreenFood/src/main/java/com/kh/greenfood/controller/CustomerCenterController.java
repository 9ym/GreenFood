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
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.QuestionOneVo;
import com.kh.greenfood.domain.QuestionVo;
import com.kh.greenfood.service.NoticeService;
import com.kh.greenfood.service.QuestionOneService;
import com.kh.greenfood.service.QuestionService;

@Controller
@RequestMapping(value="/customerCenter")
public class CustomerCenterController {
	
	@Inject
	private NoticeService noticeService;
	
	@Inject
	private QuestionService questionService;
	
	@Inject
	private QuestionOneService questionOneService;
	
	
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
	@RequestMapping(value="/customerCenterMain", method=RequestMethod.GET)
	public String listAll(Model model, PagingDto pagingDto) throws Exception {
		
		int count = noticeService.noticeListCount(pagingDto);
		pagingDto.setTotalCount(count);
		pagingDto.setPagingInfo();
		System.out.println("CustomerCenterController, listAll, pagingDto : " + pagingDto);
		List<NoticeVo> noticeList = noticeService.noticeList(pagingDto);
		
//		System.out.println("CustomerCenterController, listAll, noticeList:" + noticeList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagingDto", pagingDto);
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
	
	// ------------------------ 자주하는 질문 입력한 데이타 리스트에 보여주기 ---------------------
	@RequestMapping(value="/question/questionContent", method=RequestMethod.GET)
	public String questionListAll(Model model, PagingDto pagingDto) throws Exception {
		int count = questionService.questionListCount(pagingDto);
		pagingDto.setTotalCount(count);
		pagingDto.setPagingInfo();
		List<QuestionVo> questionList = questionService.getQuestionList(pagingDto);
		System.out.println("CustomerCenterController, questionListAll, questionList:" + questionList);
		model.addAttribute("questionList", questionList);
		model.addAttribute("pagingDto", pagingDto);
		return "customerCenter/question/questionContent";
	}
	
	// ------------------------ 자주하는 질문 카테고리별 데이타 리스트에 보여주기 ---------------------
		@RequestMapping(value="/question/questionListOfCategory/{question_category}", method=RequestMethod.POST)
		public String getQuestionListOfCategory(@PathVariable int question_category, Model model) throws Exception {
			System.out.println("getQuestionListOfCategory question_category :" + question_category);
			List<QuestionVo> questionListOfCategory = questionService.getQuestionListOfCategory(question_category);
//			System.out.println("CustomerCenterController,questionListOfCategory:" + questionListOfCategory);
			model.addAttribute("questionListOfCategory", questionListOfCategory);
			return "customerCenter/question/questionContent";
		}
	
	
	// -------------------  자주하는 질문 리스트에 해당하는 답변글 받아오기 --------------------
		@RequestMapping(value="/question/questionAnswer/{question_no}", method=RequestMethod.GET)
		public String questionAnswer(@PathVariable("question_no") int question_no, Model model) throws Exception{
			System.out.println("questionAnswer question_no  :" + question_no);
			QuestionVo questionVo = questionService.selectQuestion(question_no);
			model.addAttribute("questionVo", questionVo);
			System.out.println("questionAnswer questionVo :" + questionVo);
			return "customerCenter/question/questionAnswer";
		}
			
		
		// --------------------------  자주하는 질문 수정하기	 -------------------------
		@RequestMapping(value="/question/updateQuestion", method=RequestMethod.POST)
		public String updateQuestion(QuestionVo questionVo) throws Exception {
			System.out.println("updateQuestion, questionVo: " + questionVo);
			questionService.updateQuestion(questionVo);
//			rttr.addFlashAttribute("msg", "updateSuccess");
			
			return "redirect:/customerCenter/question/questionContent";
		}
		
		
		// ----------------------- 자주하는 질문 삭제하기 ----------------------------------------
		
		@RequestMapping(value="/question/deleteQuestion", method=RequestMethod.GET)
		public String deleteQuestion(int question_no) throws Exception {
			questionService.deleteQuestion(question_no);
			return "redirect:/customerCenter/question/questionContent";
		}
		
		
//  -------------------------  1 : 1 문의 관련 ---------------------------------------------------
		
		@RequestMapping(value="/questionOne/questionOneContent")
		public String questionOneListAll() throws Exception{
			return "/customerCenter/questionOne/questionOneContent";
		}
		
		@RequestMapping(value="/questionOne/questionOneWrite")
		public String questionOneWrite() throws Exception{
			return "/customerCenter/questionOne/questionOneWrite";
		}
		
		
		// -------------------------- 1:1 문의 입력하기 --------------------------------
		@RequestMapping(value="/questionOne/insertOuestionOne", method=RequestMethod.GET)
		public String insertQuestionOne(QuestionOneVo questionOneVo, HttpSession session) throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
			
//			commentVo.setUser_id(memberVo.getUser_id());
//			System.out.println("noticeVo:" + noticeVo);
			System.out.println("insertQuestionOne questionOneVo:" + questionOneVo);
//			questionOneService.insertQuestionOne(questionOneVo);
		
			
			return "redirect:/customerCenter/question/questionContent";
		}
		
		
		
		
}

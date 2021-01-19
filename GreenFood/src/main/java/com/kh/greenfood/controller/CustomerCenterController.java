package com.kh.greenfood.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.NoticeVo;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.QuestionOneVo;
import com.kh.greenfood.domain.QuestionVo;
import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.NoticeService;
import com.kh.greenfood.service.QuestionOneService;
import com.kh.greenfood.service.QuestionService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

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
//		System.out.println("CustomerCenterController, listAll, pagingDto : " + pagingDto);
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
//		System.out.println("update: " + noticeVo);
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
//		System.out.println("CustomerCenterController, questionListAll, questionList:" + questionList);
		model.addAttribute("questionList", questionList);
		model.addAttribute("pagingDto", pagingDto);
		return "customerCenter/question/questionContent";
	}
	
	// ------------------------ 자주하는 질문 카테고리별 데이타 리스트에 보여주기 ---------------------
		@RequestMapping(value="/question/questionContentCategory/{question_category}", method=RequestMethod.GET)
		public String getQuestionListCategory(@PathVariable int question_category, Model model) throws Exception {
//			System.out.println("CustomerCenterController getQuestionListCategory :" + getQuestionListCategory);
			List<QuestionVo> questionListCategory = questionService.getQuestionListCategory(question_category);
			System.out.println("CustomerCenterController,questionListCategory:" + questionListCategory);
			model.addAttribute("questionListCategory", questionListCategory);
			return "customerCenter/question/questionContentCategory";
		}
	
	
	// -------------------  자주하는 질문 리스트에 해당하는 답변글 받아오기 --------------------
		@RequestMapping(value="/question/questionAnswer/{question_no}", method=RequestMethod.GET)
		public String questionAnswer(@PathVariable("question_no") int question_no, Model model) throws Exception{
//			System.out.println("questionAnswer question_no  :" + question_no);
			QuestionVo questionVo = questionService.selectQuestion(question_no);
			model.addAttribute("questionVo", questionVo);
//			System.out.println("questionAnswer questionVo :" + questionVo);
			return "customerCenter/question/questionAnswer";
		}
			
		
		// --------------------------  자주하는 질문 수정하기	 -------------------------
		@RequestMapping(value="/question/updateQuestion", method=RequestMethod.POST)
		public String updateQuestion(QuestionVo questionVo) throws Exception {
//			System.out.println("updateQuestion, questionVo: " + questionVo);
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
		
		@RequestMapping(value="/questionOne/questionOneWrite")
		public String questionOneWrite(Model model, HttpSession session) throws Exception{
//			OrderVo orderVo = (OrderVo)session.getAttribute("orderVo");
//			String order_code = orderVo.getOrder_code();
//			System.out.println("questionOneContent, order_code:" + order_code);
			
			return "/customerCenter/questionOne/questionOneWrite";
		}
		
		
		// -------------------------- 1:1 문의 입력하기 --------------------------------
		@RequestMapping(value="/questionOne/insertOuestionOne", method=RequestMethod.POST)
		public String insertQuestionOne(QuestionOneVo questionOneVo, HttpSession session) throws Exception {
			
//			MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		
//			commentVo.setUser_id(memberVo.getUser_id());
//			System.out.println("noticeVo:" + noticeVo);
			System.out.println("insertQuestionOne questionOneVo:" + questionOneVo);
			questionOneService.insertQuestionOne(questionOneVo);
		
			return "redirect:/customerCenter/questionOne/questionOneContent";
		}
		
		
		// -------------------------- 1:1 문의 입력할때 주문내역 조회 리스트 가져오기 --------------------------------
		@RequestMapping(value="/questionOne/getOrderList", method=RequestMethod.POST)
		@ResponseBody
		public List<OrderVo> getOrderList(HttpSession session) throws Exception {
			TestVo testVo = (TestVo)session.getAttribute("testVo");
			System.out.println("getorderList, testVo :"  + testVo);
			String user_id = testVo.getUser_id();
			List<OrderVo> orderList = questionOneService.getOrderList(user_id);
			System.out.println("getOrderList, orderList :" + orderList);
					
			return orderList;
		}
		
		
		
		
		
		
//		-------------------- 1:1 문의 데이타 리스트에 보여주기 -------------------------
		@RequestMapping(value="/questionOne/questionOneContent", method=RequestMethod.GET)
		public String questionOneListAll(Model model, HttpSession session) throws Exception {
			TestVo testVo = (TestVo)session.getAttribute("testVo");
			String q_o_writer = testVo.getUser_id();
//			System.out.println("questionOneContent, q_o_writer:" + q_o_writer);
			/* 갯수 파악*/
			int count = questionOneService.questionOneListCountUser(q_o_writer);
			/*↑받는거*/  /*어디에 어디로 가겟다						*/	/*얘를 보내겟다*/				
			/* 리스트 받아오기*/
			
			List<QuestionOneVo> questionOneList = questionOneService.getQuestionOneList();
			
			model.addAttribute("questionOneList", questionOneList);
			model.addAttribute("count", count);
			
			return "/customerCenter/questionOne/questionOneContent";
		}
		
		// -------------------  1:1 문의 리스트에 해당하는 답변글 받아오기 --------------------
		@RequestMapping(value="/questionOne/questionOneAnswer/{q_o_no}", method=RequestMethod.GET)
		public String questionOneAnswer(@PathVariable("q_o_no") int q_o_no, Model model) throws Exception{
			System.out.println("questionOneAnswer q_o_no  :" + q_o_no);
			QuestionOneVo questionOneVo = questionOneService.selectQuestionOne(q_o_no);
			model.addAttribute("questionOneVo", questionOneVo);
			System.out.println("questionAnswer questionOneVo :" + questionOneVo);
			return "customerCenter/questionOne/questionOneAnswer";
		}
		
		// ---------------------- 1:1 문의에 대한 답변 창 나타내기 ----------------------------
		@RequestMapping(value="/questionOne/questionOneAnswerWrite/{q_o_no}", method=RequestMethod.GET)
		public String questionOneAnswerWrite(@PathVariable("q_o_no") int q_o_no, Model model) throws Exception{
			System.out.println("questionOneAnswerWrite q_o_no  :" + q_o_no);
			QuestionOneVo questionOneVo = questionOneService.selectQuestionOne(q_o_no);
			model.addAttribute("questionOneVo", questionOneVo);
			System.out.println("questionOneAnswerWrite questionOneVo :" + questionOneVo);
			return "customerCenter/questionOne/questionOneAnswerWrite";
		}
		
//		@RequestMapping(value="/questionOne/questionOneAnswerWrite")
//		public String questionOneAnswerWrite() throws Exception{
//			return "/customerCenter/questionOne/questionOneAnswerWrite";
//		}
		
		// --------------------------  1:1 문의 수정하기	 -------------------------
		@RequestMapping(value="/questionOne/updateQuestionOne", method=RequestMethod.POST)
		public String updateQuestionOne(QuestionOneVo questionOneVo) throws Exception {
			System.out.println("updateQuestionOne, questionOneVo: " + questionOneVo);
			questionOneService.updateQuestionOne(questionOneVo);
//			rttr.addFlashAttribute("msg", "updateSuccess");
					
			return "redirect:/customerCenter/questionOne/questionOneContent";
		}
		
		// --------------------------  1:1 문의 답변 넘겨주기	 -------------------------
		@RequestMapping(value="/questionOne/updateQuestionOneAnswer", method=RequestMethod.POST)
		public String updateQuestionOneAnswer(QuestionOneVo questionOneVo) throws Exception {
			System.out.println("CustomerCenterController updateQuestionOneAnswer, questionOneVo: " + questionOneVo);
			questionOneService.updateQuestionOneAnswer(questionOneVo);
//			rttr.addFlashAttribute("msg", "updateSuccess");

			/*//	----------- 문자 메세지 보내기 ---------------------------		
			String api_key = "NCSUYJ0RBVZP2OXB";
		    String api_secret = "DVQ7LGFSMK6FDRWFCNJFPTQMFRGQ19YS";
		    Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", "010-6428-4092");
		    params.put("from", "01093986307"); //무조건 자기번호 (인증)
		    params.put("type", "SMS");
		    params.put("text", "김봉규 보냄 테스트");
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		    	//send() 는 메시지를 보내는 함수  
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    } // 문자메시지 보내기 끝
*/			
		    return "redirect:/customerCenter/questionOne/questionOneContent";
		}
		
		
		// ----------------------- 1:1 문의 삭제하기 ----------------------------------------
		
		@RequestMapping(value="/questionOne/deleteQuestionOne", method=RequestMethod.GET)
		public String deleteQuestionOne(int q_o_no) throws Exception {
			questionOneService.deleteQuestionOne(q_o_no);
			return "redirect:/customerCenter/questionOne/questionOneContent";
		}
		
}

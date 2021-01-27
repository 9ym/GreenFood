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

import com.kh.greenfood.domain.NoticeVo;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.QuestionOneVo;
import com.kh.greenfood.domain.QuestionVo;
import com.kh.greenfood.domain.CustomerVo;
import com.kh.greenfood.service.NoticeService;
import com.kh.greenfood.service.ProductService;
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
	
	@Inject
	private ProductService productService;
	
	
	@RequestMapping(value="/notice/noticeWriteForm")
	public String noticeWriteForm(Model model) throws Exception{
		getProductCate(model);
		return "/customerCenter/notice/noticeWriteForm";
	}
	
//	--------------------- 공지사항 입력하기 ------------------------------
	@RequestMapping(value="/notice/insertNotice", method=RequestMethod.GET)
	public String insertNotice(Model model, NoticeVo noticeVo, HttpSession session) throws Exception {
		getProductCate(model);
		noticeService.insertNotice(noticeVo);
		return "redirect:/customerCenter/customerCenterMain";
	}
	
	
//	-------------------- 공지사항 입력 데이타 리스트에 보여주기 -------------------------
	@RequestMapping(value="/customerCenterMain", method=RequestMethod.GET)
	public String listAll(Model model, PagingDto pagingDto) throws Exception {
		getProductCate(model);
		int count = noticeService.noticeListCount(pagingDto);
		pagingDto.setTotalCount(count);
		pagingDto.setPagingInfo();
		List<NoticeVo> noticeList = noticeService.noticeList(pagingDto);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagingDto", pagingDto);
		return "customerCenter/customerCenterMain";
	}
	
	
// -------------------  공지사항 리스트 받아와서 noticeContent 로 보여주기 --------------------
	@RequestMapping(value="/notice/noticeContent/{notice_no}", method=RequestMethod.GET)
	public String noticeContent(@PathVariable("notice_no") int notice_no, Model model) throws Exception{
		getProductCate(model);
		NoticeVo noticeVo = noticeService.selectNotice(notice_no);
		model.addAttribute("noticeVo", noticeVo);
		return "/customerCenter/notice/noticeContent";
	}
	
	
// --------------------------  공지사항 수정하기	 -------------------------
	@RequestMapping(value="/notice/updateNotice", method=RequestMethod.GET)
	public String updateNotice(NoticeVo noticeVo) throws Exception {
		noticeService.updateNotice(noticeVo);
		return "redirect:/customerCenter/customerCenterMain";
	}
	
	
	
// ----------------------- 공지사항 삭제하기 ----------------------------------------
	
	
	@RequestMapping(value="/notice/deleteNotice", method=RequestMethod.GET)
	public String deleteNotice(int notice_no) throws Exception {
		noticeService.deleteNotice(notice_no);
		return "redirect:/customerCenter/customerCenterMain";
	}
	
	@RequestMapping(value="/question/questionWriteForm")
	public String questionWriteForm(Model model) throws Exception{
		getProductCate(model);
		return "/customerCenter/question/questionWriteForm";
	}
	
	// -------------------------- 자주하는 질문 입력하기 --------------------------------
	@RequestMapping(value="/question/insertQuestion", method=RequestMethod.GET)
	public String insertQuestion(QuestionVo questionVo, HttpSession session) throws Exception {
		questionService.insertQuestion(questionVo);
		return "redirect:/customerCenter/question/questionContent";
	}
	
	// ------------------------ 자주하는 질문 입력한 데이타 리스트에 보여주기 ---------------------
	@RequestMapping(value="/question/questionContent", method=RequestMethod.GET)
	public String questionListAll(Model model, PagingDto pagingDto) throws Exception {
		getProductCate(model);
		int count = questionService.questionListCount(pagingDto);
		pagingDto.setTotalCount(count);
		pagingDto.setPagingInfo();
		List<QuestionVo> questionList = questionService.getQuestionList(pagingDto);
		model.addAttribute("questionList", questionList);
		model.addAttribute("pagingDto", pagingDto);
		return "customerCenter/question/questionContent";
	}
	
	// ------------------------ 자주하는 질문 카테고리별 데이타 리스트에 보여주기 ---------------------
		@RequestMapping(value="/question/questionContentCategory/{question_category}", method=RequestMethod.GET)
		public String getQuestionListCategory(@PathVariable int question_category, Model model) throws Exception {
			List<QuestionVo> questionListCategory = questionService.getQuestionListCategory(question_category);
			model.addAttribute("questionListCategory", questionListCategory);
			return "customerCenter/question/questionContentCategory";
		}
	
	
	// -------------------  자주하는 질문 리스트에 해당하는 답변글 받아오기 --------------------
		@RequestMapping(value="/question/questionAnswer/{question_no}", method=RequestMethod.GET)
		public String questionAnswer(@PathVariable("question_no") int question_no, Model model) throws Exception{
			getProductCate(model);
			QuestionVo questionVo = questionService.selectQuestion(question_no);
			model.addAttribute("questionVo", questionVo);
			return "customerCenter/question/questionAnswer";
		}
			
		
		// --------------------------  자주하는 질문 수정하기	 -------------------------
		@RequestMapping(value="/question/updateQuestion", method=RequestMethod.POST)
		public String updateQuestion(QuestionVo questionVo) throws Exception {
			questionService.updateQuestion(questionVo);
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
			getProductCate(model);
			return "/customerCenter/questionOne/questionOneWrite";
		}
		
		
		// -------------------------- 1:1 문의 입력하기 --------------------------------
		@RequestMapping(value="/questionOne/insertOuestionOne", method=RequestMethod.POST)
		public String insertQuestionOne(QuestionOneVo questionOneVo, HttpSession session) throws Exception {
			questionOneService.insertQuestionOne(questionOneVo);
			return "redirect:/customerCenter/questionOne/questionOneContent";
		}
		
		
		// -------------------------- 1:1 문의 입력할때 주문내역 조회 리스트 가져오기 --------------------------------
		@RequestMapping(value="/questionOne/getOrderList", method=RequestMethod.POST)
		@ResponseBody
		public List<OrderVo> getOrderList(HttpSession session) throws Exception {
			CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
			String user_id = customerVo.getUser_id();
			List<OrderVo> orderedList = questionOneService.getOrderedList(user_id);
			return orderedList;
		}
		
//		-------------------- 1:1 문의 데이타 리스트에 보여주기 -------------------------
		@RequestMapping(value="/questionOne/questionOneContent", method=RequestMethod.GET)
		public String questionOneListAll(Model model, PagingDto pagingDto, HttpSession session) throws Exception {
			getProductCate(model);
			CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
			String q_o_writer = customerVo.getUser_id();
			
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
			QuestionOneVo questionOneVo = questionOneService.selectQuestionOne(q_o_no);
			model.addAttribute("questionOneVo", questionOneVo);
			return "customerCenter/questionOne/questionOneAnswer";
		}
		
		// ---------------------- 1:1 문의에 대한 답변 창 나타내기 ----------------------------
		@RequestMapping(value="/questionOne/questionOneAnswerWrite/{q_o_no}", method=RequestMethod.GET)
		public String questionOneAnswerWrite(@PathVariable("q_o_no") int q_o_no, Model model) throws Exception{
			QuestionOneVo questionOneVo = questionOneService.selectQuestionOne(q_o_no);
			model.addAttribute("questionOneVo", questionOneVo);
			return "customerCenter/questionOne/questionOneAnswerWrite";
		}
		
		// --------------------------  1:1 문의 수정하기	 -------------------------
		@RequestMapping(value="/questionOne/updateQuestionOne", method=RequestMethod.POST)
		public String updateQuestionOne(QuestionOneVo questionOneVo) throws Exception {
			questionOneService.updateQuestionOne(questionOneVo);
			return "redirect:/customerCenter/questionOne/questionOneContent";
		}
		
		// --------------------------  1:1 문의 답변 넘겨주기	 -------------------------
		@RequestMapping(value="/questionOne/updateQuestionOneAnswer", method=RequestMethod.POST)
		public String updateQuestionOneAnswer(QuestionOneVo questionOneVo, HttpSession session) throws Exception {
			questionOneService.updateQuestionOneAnswer(questionOneVo);
			String user_phone = questionOneVo.getQ_o_phone();
			String user_id = questionOneVo.getQ_o_writer();
			//	----------- 문자 메세지 보내기 ---------------------------		
			String api_key = "NCSUYJ0RBVZP2OXB";
		    String api_secret = "DVQ7LGFSMK6FDRWFCNJFPTQMFRGQ19YS";
		    Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", user_phone);
		    params.put("from", "01093986307"); //무조건 자기번호 (인증)
		    params.put("type", "SMS");
		    params.put("text", "안녕하세요. 그린푸드입니다." + user_id + "님 답변이 등록되었습니다.");
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		    	//send() 는 메시지를 보내는 함수  
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    } // 문자메시지 보내기 끝
		    
		    return "redirect:/customerCenter/questionOne/questionOneContent";
		}
		
		
		// ----------------------- 1:1 문의 삭제하기 ----------------------------------------
		
		@RequestMapping(value="/questionOne/deleteQuestionOne", method=RequestMethod.GET)
		public String deleteQuestionOne(int q_o_no) throws Exception {
			questionOneService.deleteQuestionOne(q_o_no);
			return "redirect:/customerCenter/questionOne/questionOneContent";
		}
		
		private void getProductCate (Model model) throws Exception{
			/* 상품 카테고리 */
			List<ProductCategoryDto> categoryList = productService.getCategory();
			model.addAttribute("categoryList", categoryList);
		}
		
}

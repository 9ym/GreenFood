package com.kh.greenfood.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Inject
	private AdminService adminService;
	
	// 회원 정보 리스트
	@RequestMapping(value="/customerList", method=RequestMethod.GET)
	public String customerList(Model model) throws Exception{
		List<TestVo> customerList = adminService.getCustomerList();
		model.addAttribute("customerList", customerList);
		return "/admin/customerList";
	}
	
	// 회원 강제 탈퇴
	@RequestMapping(value="/deleteCustomer", method=RequestMethod.POST)
	public String deleteCustomer(String user_id, RedirectAttributes rttr) throws Exception {
		int count = adminService.deleteCustomer(user_id);
		if(count > 0) {
			rttr.addFlashAttribute("msg", "deleteComp");
		} else {
			rttr.addFlashAttribute("msg", "deleteFail");
		}
		return "redirect:/admin/customerList";
	}
}

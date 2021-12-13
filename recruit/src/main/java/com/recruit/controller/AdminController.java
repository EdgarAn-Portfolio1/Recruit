package com.recruit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.service.AdminService;
import com.recruit.vo.AccountVO;

@Controller
@RequestMapping(path= {"/admin"})
public class AdminController {
	
	@Autowired
	@Qualifier("adminService")
	private AdminService adminService;
	
	@GetMapping(path = { "/adminPage" })
	public String selectAllMembers(Model model) {
		
		// 데이터 조회
		List<AccountVO> accounts = adminService.findAllMembers();
		System.out.println(accounts.size());
		
		// View에서 사용할 수 있도록 Model 타입의 전달인자에 저장 -> Request 객체에 저장
		model.addAttribute("account", accounts); // ""-> jsp의 $ 이름과 같게 !
		
		
		return "admin/adminPage";
	}
	
	@GetMapping(path = { "/adminEdit" })
	public String showEditForm(String memberId, Model model) {
		
//		System.out.println(memberId);
		
		AccountVO account = adminService.findMemberByMemberId(memberId);
		
		if (account == null) {
			return "redirect:adminPage";
		}
		
//		System.out.println(account);
		
		model.addAttribute("member", account);
		
		return "admin/adminEdit";
	}
	
	@PostMapping(path = { "/update" })
	public String update(AccountVO account) {
		
		// System.out.println("a:" + account);
		
		adminService.updateMember(account);
		
		return "redirect:adminEdit?memberId=" + account.getMemberId();
	}
	
	@GetMapping(path = { "/delete" })
	public String delete(String memberId) {
		
		adminService.deleteMember(memberId);
		
		return "redirect:adminPage";
	}

}

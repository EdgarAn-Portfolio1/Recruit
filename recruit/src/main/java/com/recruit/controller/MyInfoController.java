package com.recruit.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.recruit.service.MyInfoService;
import com.recruit.vo.AccountVO;
import com.recruit.vo.MyInfoVO;

@Controller
@RequestMapping(path= {"/mypage"})

public class MyInfoController {
	
	@Autowired
	@Qualifier("myInfoService")
	private MyInfoService myInfoService;
	
//	@GetMapping(path = { "/myinfo" })
//	public String myInfo(String memberId, String name, int year, String gender,
//						 String email, String degree, String career, String wish_site, Model model) {
//	HashMap<String, Object> params = new HashMap<>();
//	
//	List<MyInfoVO> MyInfo = myInfoService.selectMyInfo(params);
//	model.addAttribute("myInfo", MyInfo);
//	
//	return "mypage/myinfo";
//}
	@GetMapping(path = { "/myInfo" })
	public String myInfo(HttpSession session, Model model) {
		
		// 로그인한 사용자 정보 가져오기
		AccountVO accountVo = (AccountVO)session.getAttribute("loginuser");
		if (accountVo == null) {
			return "redirect:/account/login";
		}
		
		// memberId를 가지고 MyInfo 조회
		MyInfoVO MyInfo = myInfoService.selectMyInfo(accountVo.getMemberId());
		System.out.println(MyInfo);
		if (MyInfo == null) {
			
			return "mypage/myInfo";
			
		} else {
			
			model.addAttribute("myInfo", MyInfo);
			System.out.println(MyInfo.getName());
			return "mypage/myInfo_edit";
		}
	}
	
	
	@PostMapping(path = { "/myInfo_edit" })
	public String writeMyInfo(MyInfoVO newMyInfo) {
		
		// 상세 정보 등록 코드 작성
		myInfoService.writeNewMyInfo(newMyInfo);
		
		System.out.println("write my info");

		// return "mypage/myInfo_write";
		return "redirect:myInfo"; 

	}
	
	@PostMapping(path = { "updateMyInfo" })
	public String updateMyInfo(MyInfoVO myInfo) {
		
		myInfoService.updateMyInfo(myInfo);
		
		return "redirect:myInfo";
	}
	
}
	






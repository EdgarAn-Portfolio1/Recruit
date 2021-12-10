package com.recruit.controller;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.recruit.service.AccountService;
import com.recruit.vo.AccountVO;

@Controller
@RequestMapping(path = { "/account" })
public class AccountController {

	// 1. 회원가입
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

	@Autowired
	@Qualifier("accountService")
	AccountService service;

	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	@GetMapping(path = { "memberid-dup-check" })
	@ResponseBody // return을 jsp가 아니라 그대로 내보냄
	public String checkId(String memberId) {
		
//		if(memberId.equals("abc")) {
//			return "valid";
//		} else {
//			return "duplicated";
//		}
//	}
		boolean valid = service.checkId(memberId);
		if (valid) {
			return "valid";
		} else {
			return "duplicated";
		}
	}

	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(AccountVO accountVo) throws Exception {
		logger.info("post register");

		service.register(accountVo);

		return "account/login";
	}

	// 2. 로그인
	@GetMapping(path = { "/login" })
	public String login() {

		return "account/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(AccountVO account, HttpSession session) throws Exception {
		
		AccountVO selectedAccountVo = service.login(account);
		
		
		if(selectedAccountVo != null) {
			session.setAttribute("loginuser", selectedAccountVo);
			return "home";
		} else {
			return "redirect:/account/login?loginfail=true";
		}
		
	}
	
	// 3. 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	

}

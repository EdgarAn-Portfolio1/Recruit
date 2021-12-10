package com.recruit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller; import
org.springframework.ui.Model; import
org.springframework.web.bind.annotation.GetMapping; import
org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.service.BookMarkService;
import com.recruit.vo.AccountVO;
import com.recruit.vo.BookMarkVO;
import com.recruit.vo.EnterprisesVO;


@Controller
@RequestMapping(path= {"/mypage"})

public class BookMarkController {
	
	@Autowired
	@Qualifier("bookMarkService")
	private BookMarkService bookMarkService;

	@GetMapping(path = { "/bookmark" })
	public String bookmark(HttpSession session, Model model) {
		
		// 로그인한 사용자 정보 가져오기
		AccountVO accountVo = (AccountVO)session.getAttribute("loginuser");
		if (accountVo == null) {
			return "redirect:/account/login";
		}
		
		// memberId를 가지고 즐겨찾기(bookmark)정보 특히 recruit_num 가져오기
		List<BookMarkVO> Bookmarks = bookMarkService.selectBookMark(accountVo.getMemberId());
		
		model.addAttribute("bookmarks", Bookmarks);
		System.out.println(Bookmarks);
		
		// recruit_num으로 채용공고 조회
		//EnterprisesVO enterprisesVo = (EnterprisesVO)session.getAttribute("recruit_num");
		//Bookmarks recruit_no = (Bookmarks)model.getAttribute("recruit_num");
		//List<EnterprisesVO> recruits = bookMarkService.selectRecruit(Bookmarks.getrecruit_num());

		return "mypage/bookmark";
	}
 
}


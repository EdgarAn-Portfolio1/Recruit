package com.recruit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.service.BookMarkService;
import com.recruit.service.BooksService;
import com.recruit.vo.AccountVO;
import com.recruit.vo.BookMarkVO;
import com.recruit.vo.BooksVO;

@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("booksService")
	private BooksService booksService;
	
	@Autowired
	@Qualifier("bookMarkService")
	private BookMarkService bookMarkService;
	
	@GetMapping(path= {"/","/home"})
	public String home(HttpSession session, Model model) {

		List<BooksVO> booksList = booksService.selectBooks();
		model.addAttribute("booksList", booksList);	
		
		AccountVO accountVo = (AccountVO)session.getAttribute("loginuser");
		if (accountVo != null) {
			List<BookMarkVO> Bookmarks = bookMarkService.selectBookMark(accountVo.getMemberId());
			model.addAttribute("bookmarks", Bookmarks);
			return "home2"; // /WEB-INF/views/home.jsp
		} else {
			return "home";
		}
		
		
	}
	
}

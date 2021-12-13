package com.recruit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.service.BooksService;
import com.recruit.vo.BooksVO;

@Controller
@RequestMapping(path= {"/","/home"})
public class HomeController {
	
	@Autowired
	@Qualifier("booksService")
	private BooksService booksService;
	
	@GetMapping()
	public String home(Model model) {

		List<BooksVO> booksList = booksService.selectBooks();
		System.out.println(booksList);
		model.addAttribute("booksList", booksList);

		return "home"; // /WEB-INF/views/home.jsp
	}
	
}

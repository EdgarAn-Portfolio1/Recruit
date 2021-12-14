package com.recruit.controller;

import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.recruit.service.BookMarkService;
import com.recruit.service.BooksService;
import com.recruit.vo.AccountVO;
import com.recruit.vo.BookMarkVO;
import com.recruit.vo.BooksVO;

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.util.Date;

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

		InputStreamReader isr = null;
		BufferedReader br = null;
		URLConnection conn = null;
		String score = "";
		try {
			URL url = new URL("http://3.38.186.130:5002/team-two/recruit-score");
			conn = (URLConnection)url.openConnection();
			isr = new InputStreamReader(conn.getInputStream());
			br = new BufferedReader(isr);
			score = br.readLine();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try { br.close(); } catch (Exception ex) {}
			try { isr.close(); } catch (Exception ex) {}
		}
		
		model.addAttribute("score", score);
		model.addAttribute("today", new Date());
		
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

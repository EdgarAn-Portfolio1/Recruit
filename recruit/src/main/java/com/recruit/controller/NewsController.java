package com.recruit.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.service.NewsService;
import com.recruit.vo.NewsVO;

@Controller
@RequestMapping(path= {"/news"})
public class NewsController {
	
	@Autowired
	@Qualifier("newsService")
	private NewsService newsService;
	
	@GetMapping(path = { "/ITnews" })
	public String ITnews(String title, String date, String link, Model model) {
		HashMap<String, Object> params = new HashMap<>();
		
		if (title != null) {
			params.put("title", title);
			model.addAttribute("title", title);
		}
		
		if (date != null) {
			params.put("date", date);
			model.addAttribute("date", date);
		}
		
		if (link != null) {
			params.put("link", link);
			model.addAttribute("link", link);
		}
		
		List<NewsVO> newsList = newsService.selectNews(params);
		model.addAttribute("newsList", newsList);
		
		return "news/ITnews";

	}

}

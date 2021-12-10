package com.recruit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.service.SharespecBoardService;

@Controller
@RequestMapping(path= {"/board"})

public class SharespecBoardController {
	
	@Autowired
	@Qualifier("sharespecBoardService")
	private SharespecBoardService sharespecBoardService;
	
	@GetMapping(path = { "/splist" })
	public String shareSpec() {
		
		return "board/splist";
	}
	
	

}

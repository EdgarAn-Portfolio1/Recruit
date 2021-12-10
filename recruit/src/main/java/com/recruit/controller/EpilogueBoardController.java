package com.recruit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.service.EpilogueBoardService;

@Controller
@RequestMapping(path= {"/board"})

public class EpilogueBoardController {
	
	@Autowired
	@Qualifier("epilogueBoardService")
	private EpilogueBoardService EpilogueBoardService;
	
	@GetMapping(path = { "/eplist" })
	public String epilogue() {
		
		return "board/eplist";

	}
	
}

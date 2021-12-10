package com.recruit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.service.QuestionAnswerBoardService;
import com.recruit.vo.QuestionAnswerBoardVO;

@Controller
@RequestMapping(path= {"/board"})

public class QuestionAnswerBoardController {
	
	@Autowired
	@Qualifier("questionAnswerBoardService")
	private QuestionAnswerBoardService QuestionAnswerBoardService;
	
	@GetMapping(path = { "/qalist" })
	public String questionAnswerBoard(Model model) {
		
		List<QuestionAnswerBoardVO> qaboards = QuestionAnswerBoardService.findQaAll();
		
		model.addAttribute("qaboards", qaboards);
		
		return "board/qalist";

	}
	
	@GetMapping(path = { "/qawrite" })
	public String showWriteForm() {
		
		return "board/qawrite";	
	}
	
	@PostMapping(path= {"/qawrite"})
	public String write(QuestionAnswerBoardVO qaboard) {
		
		QuestionAnswerBoardService.qawriteBoard(qaboard);
		
		return "redirect:qalist";
	}
	
	@GetMapping(path = {"/qadetail" })
	public String qadetail(int board_qa_no, Model model) {
		
		QuestionAnswerBoardVO qaboard = QuestionAnswerBoardService.findQaBoardByboard_qa_no(board_qa_no);
		
		if(qaboard == null) {
			return "redirect:qalist";
		}
		
		QuestionAnswerBoardService.increaseQaBoardReadCount(board_qa_no);
		qaboard.setQa_readCount(qaboard.getQa_readCount() + 1);
		
		model.addAttribute("qaboard", qaboard);
		
		return "board/qadetail";
	}
	
	@GetMapping(path = { "/qadelete" })
	public String qadelete(int board_qa_no) {
		
		QuestionAnswerBoardService.deleteQaBoard(board_qa_no);
		
		return "redirect:qalist";
	}
	
	@GetMapping(path = { "/qaedit" })
	public String showEditForm(int board_qa_no, Model model) {
		
		QuestionAnswerBoardVO qaboard = QuestionAnswerBoardService.findQaBoardByboard_qa_no(board_qa_no);
		
		if (qaboard == null) {
			return "redirect:qalist";
		}
		
		model.addAttribute("qaboard", qaboard);
		
		return "board/qaedit";
	}
	
	@PostMapping(path = { "/qaupdate" })
	public String qaupdate(QuestionAnswerBoardVO qaboard) {
		
		QuestionAnswerBoardService.qaupdateQaBoard(qaboard);
		
		return "redirect:qadetail?board_qa_no=" + qaboard.getBoard_qa_no();
	}
	
}

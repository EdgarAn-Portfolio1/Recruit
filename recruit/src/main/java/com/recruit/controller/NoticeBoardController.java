package com.recruit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.service.NoticeBoardService;
import com.recruit.vo.NoticeBoardVO;

@Controller
@RequestMapping(path= {"/board"})

public class NoticeBoardController {
	
	@Autowired
	@Qualifier("noticeBoardService")
	private NoticeBoardService NoticeBoardService;
	
	@GetMapping(path = { "/nolist" })
	public String noticeBoard(Model model) {
		
		List<NoticeBoardVO> noboards = NoticeBoardService.findNoticeAll();
		
		model.addAttribute("noboards", noboards);
		
		return "board/nolist";

	}
	
	@GetMapping(path = { "/nowrite" })
	public String showWriteForm() {
		
		return "board/nowrite";	
	}
	
	@PostMapping(path= {"/nowrite"})
	public String write(NoticeBoardVO noboard) {
		
		NoticeBoardService.nowriteBoard(noboard);
		
		return "redirect:nolist";
	}
	
	@GetMapping(path = {"/nodetail" })
	public String nodetail(int board_notice_no, Model model) {
		
		NoticeBoardVO noboard = NoticeBoardService.findNoticeBoardByboard_notice_no(board_notice_no);
		
		if(noboard == null) {
			return "redirect:nolist";
		}
		
		NoticeBoardService.increaseNoticeBoardReadCount(board_notice_no);
		noboard.setNotice_readCount(noboard.getNotice_readCount() + 1);
		
		model.addAttribute("noboard", noboard);
		
		return "board/nodetail";
	}
	
	@GetMapping(path = { "/nodelete" })
	public String nodelete(int board_notice_no) {
		
		NoticeBoardService.deleteNoticeBoard(board_notice_no);
		
		return "redirect:nolist";
	}
	
	@GetMapping(path = { "/noedit" })
	public String showEditForm(int board_notice_no, Model model) {
		
		NoticeBoardVO noboard = NoticeBoardService.findNoticeBoardByboard_notice_no(board_notice_no);
		
		if (noboard == null) {
			return "redirect:nolist";
		}
		
		model.addAttribute("noboard", noboard);
		
		return "board/noedit";
	}
	
	@PostMapping(path = { "/noupdate" })
	public String noupdate(NoticeBoardVO noboard) {
		
		NoticeBoardService.noupdateNoticeBoard(noboard);
		
		return "redirect:nodetail?board_notice_no=" + noboard.getBoard_notice_no();
	}
	
}

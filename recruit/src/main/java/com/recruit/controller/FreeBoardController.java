package com.recruit.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.recruit.common.Util;
import com.recruit.service.FreeBoardService;
import com.recruit.ui.BoardPager;
import com.recruit.view.DownloadView;
import com.recruit.vo.AccountVO;
import com.recruit.vo.FreeBoardAttachVO;
import com.recruit.vo.FreeBoardVO;

@Controller
@RequestMapping(path= {"/board"})

public class FreeBoardController {
	
	@Autowired
	@Qualifier("freeBoardService")
	private FreeBoardService FreeBoardService;
	
//	@GetMapping(path = { "/frlist" })
//	public String freeBoard(Model model) {
//		
//		//데이터 조회
//		List<FreeBoardVO> frboards = FreeBoardService.findFreeAll();
//		
//		// View에서 사용할 수 있도록 Model 타입의 전달인자에 저장 -> Request객체에 저장
//		model.addAttribute("frboards", frboards);
//		
//		return "board/frlist";
//	}
	
	@GetMapping(path = { "/frlist" })
	public String frlist(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		
		int pageSize = 5;	// 한 페이지에 표시되는 게시물 개수
		int pagerSize = 3;	// 표시되는 페이지 번호 개수
		int count = 0;		// 총 게시물 개수
		
		// 데이터 조회
		List<FreeBoardVO> frboards = FreeBoardService.findByPage(pageNo, pageSize);
		
		count = FreeBoardService.findBoardCount();
		
		BoardPager pager = new BoardPager(count, pageNo, pageSize, pagerSize, "frlist");
		
		// View에서 사용할 수 있도록 Model 타입의 전달인자에 저장 -> Request 객체에 저장
		model.addAttribute("frboards", frboards);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		
		return "board/frlist";	// /WEB-INF/views/ + board/list + .jsp
	}
	
	@GetMapping(path = { "/frwrite" })
	public String showWriteForm(HttpSession session) {
		
		AccountVO accountVo = (AccountVO)session.getAttribute("loginuser");
		
		if (accountVo == null) {
			return "redirect:/account/login";
		}
		
		return "board/frwrite";	
	}
	
//	@PostMapping(path= {"/frwrite"})
//	public String write(FreeBoardVO frboard) {
//		
//		FreeBoardService.frwriteBoard(frboard);
//		
//		return "redirect:frlist";
//	}
	
	@PostMapping(path = { "/frwrite" })
	public String write(MultipartHttpServletRequest req, FreeBoardVO frboard, Model model) {
		
		// 데이터 읽기 ( 전달인자를 통해서 자동으로 읽어서 저장 )		
		MultipartFile mf = req.getFile("attachment");
		if (mf != null && !mf.isEmpty() && mf.getOriginalFilename() != null && mf.getOriginalFilename().length() > 0) {
			
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/resources/upload-files-free"); // web-path --> computer-path
			
			String userFileName = mf.getOriginalFilename();
			if (userFileName.contains("\\")) { // iexplore 경우
				//C:\AAA\BBB\CCC.png -> CCC.png 
				userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
			}
			String savedFileName = Util.makeUniqueFileName(userFileName);
			
			try {
				//1. 파일 저장
				mf.transferTo(new File(path, savedFileName)); 
				
				//2. 파일 정보 저장
				FreeBoardAttachVO attachment = new FreeBoardAttachVO();
				attachment.setUserFileName(userFileName);
				attachment.setSavedFileName(savedFileName);
				
				ArrayList<FreeBoardAttachVO> attachments = new ArrayList<>();
				attachments.add(attachment);
				frboard.setAttachments(attachments);

				
				
			} catch (Exception ex) {
				ex.printStackTrace();
				model.addAttribute("fail", true);
				return "board/frwrite";
			}
			
			
		}
		
		// 데이터베이스에 저장
		FreeBoardService.frwriteBoard(frboard);
		
		// 목록으로 이동
		return "redirect:frlist";
	}
	
	@GetMapping(path = {"/frdetail" })
	public String frdetail(int board_free_no, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		
		FreeBoardVO frboard = FreeBoardService.findFreeBoardByboard_free_no(board_free_no);
		// 테스트코드
		// System.out.println(frboard);
		if(frboard == null) {
			return "redirect:frlist";
		}
		
		FreeBoardService.increaseFreeBoardReadCount(board_free_no);
		frboard.setFree_readCount(frboard.getFree_readCount() + 1);
		
		model.addAttribute("frboard", frboard);
		model.addAttribute("pageNo", pageNo);
		// 테스트코드
		// System.out.println(frboard.getBoard_free_no());
		return "board/frdetail";
	}
	
	@GetMapping(path = { "/frdelete" })
	public String frdelete(int board_free_no) {
		
		FreeBoardService.deleteFreeBoard(board_free_no);
		
		return "redirect:frlist";
	}
	
	@GetMapping(path = { "/fredit" })
	public String showEditForm(int board_free_no, Model model) {
		
		FreeBoardVO frboard = FreeBoardService.findFreeBoardByboard_free_no(board_free_no);
		
		if (frboard == null) {
			return "redirect:frlist";
		}
		
		model.addAttribute("frboard", frboard);
		
		return "board/fredit";
	}
	
	@PostMapping(path = { "/frupdate" })
	public String frupdate(FreeBoardVO frboard) {
		
		FreeBoardService.frupdateFreeBoard(frboard);
		
		return "redirect:frdetail?board_free_no=" + frboard.getBoard_free_no();
	}
	
	@GetMapping(path = { "/download" })
	public View download(@RequestParam(defaultValue = "-1") int attach_free_no, Model model) {
		if (attach_free_no == -1) {
			// return "redirect:list";
			return new RedirectView("frlist");
		}
		
		FreeBoardAttachVO attachment = FreeBoardService.findBoardFreeAttachByAttachFreeNo(attach_free_no);
		if (attachment == null) {
			return new RedirectView("frlist");
		}
		model.addAttribute("attachment", attachment);
		
		// return "view-name or response content with @ResponseBody";
		DownloadView view = new DownloadView();
		return view;
	}
	
}

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
import com.recruit.service.NoticeBoardService;
import com.recruit.ui.BoardPager;
import com.recruit.view.DownloadView;
import com.recruit.vo.AccountVO;
import com.recruit.vo.NoticeBoardAttachVO;
import com.recruit.vo.NoticeBoardVO;

@Controller
@RequestMapping(path= {"/board"})

public class NoticeBoardController {
	
	@Autowired
	@Qualifier("noticeBoardService")
	private NoticeBoardService NoticeBoardService;
	
//	@GetMapping(path = { "/nolist" })
//	public String noticeBoard(Model model) {
//		
//		List<NoticeBoardVO> noboards = NoticeBoardService.findNoticeAll();
//		
//		model.addAttribute("noboards", noboards);
//		
//		return "board/nolist";
//
//	}
	
	@GetMapping(path = { "/nolist" })
	public String nolist(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		
		int pageSize = 3;	// 한 페이지에 표시되는 게시물 개수
		int pagerSize = 3;	// 표시되는 페이지 번호 개수
		int count = 0;		// 총 게시물 개수
		
		// 데이터 조회
		List<NoticeBoardVO> noboards = NoticeBoardService.findByPage(pageNo, pageSize);
		
		count = NoticeBoardService.findBoardCount();
		
		BoardPager pager = new BoardPager(count, pageNo, pageSize, pagerSize, "frlist");
		
		// View에서 사용할 수 있도록 Model 타입의 전달인자에 저장 -> Request 객체에 저장
		model.addAttribute("noboards", noboards);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		
		return "board/nolist";	// /WEB-INF/views/ + board/list + .jsp
	}
	
	@GetMapping(path = { "/nowrite" })
	public String showWriteForm(HttpSession session) {
		
		AccountVO accountVo = (AccountVO)session.getAttribute("loginuser");
		if (accountVo == null) {
			return "redirect:/account/login";
		}
		
		return "board/nowrite";	
	}
	
//	@PostMapping(path= {"/nowrite"})
//	public String write(NoticeBoardVO noboard) {
//		
//		NoticeBoardService.nowriteBoard(noboard);
//		
//		return "redirect:nolist";
//	}

	@PostMapping(path = { "/nowrite" })
	public String write(MultipartHttpServletRequest req, NoticeBoardVO noboard, Model model) {
		
		// 데이터 읽기 ( 전달인자를 통해서 자동으로 읽어서 저장 )		
		MultipartFile mf = req.getFile("attachment");
		if (mf != null) {
			
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/resources/upload-files-notice"); // web-path --> computer-path
			
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
				NoticeBoardAttachVO attachment = new NoticeBoardAttachVO();
				attachment.setUserFileName(userFileName);
				attachment.setSavedFileName(savedFileName);
				
				ArrayList<NoticeBoardAttachVO> attachments = new ArrayList<>();
				attachments.add(attachment);
				noboard.setAttachments(attachments);

				// 데이터베이스에 저장
				NoticeBoardService.nowriteBoard(noboard);
				
			} catch (Exception ex) {
				ex.printStackTrace();
				model.addAttribute("fail", true);
				return "board/nowrite";
			}
		}
		
		// 목록으로 이동
		return "redirect:nolist";
	}
	
	@GetMapping(path = {"/nodetail" })
	public String nodetail(int board_notice_no, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		
		NoticeBoardVO noboard = NoticeBoardService.findNoticeBoardByboard_notice_no(board_notice_no);
		
		if(noboard == null) {
			return "redirect:nolist";
		}
		
		NoticeBoardService.increaseNoticeBoardReadCount(board_notice_no);
		noboard.setNotice_readCount(noboard.getNotice_readCount() + 1);
		
		model.addAttribute("noboard", noboard);
		model.addAttribute("pageNo", pageNo);
		
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
	
//	@GetMapping(path = { "/nodownload" })
//	public View download(@RequestParam(defaultValue = "-1") int attach_notice_no, Model model) {
//		if (attach_notice_no == -1) {
//			// return "redirect:list";
//			return new RedirectView("nolist");
//		}
//		
//		NoticeBoardAttachVO attachment = NoticeBoardService.findBoardNoticeAttachByAttachNoticeNo(attach_notice_no);
//		if (attachment == null) {
//			return new RedirectView("nolist");
//		}
//		model.addAttribute("attachment", attachment);
//		
//		// return "view-name or response content with @ResponseBody";
//		DownloadView view = new DownloadView();
//		return view;
//	}
	
}

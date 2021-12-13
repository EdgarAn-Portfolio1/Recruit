package com.recruit.service;

import java.util.List;

import com.recruit.vo.NoticeBoardAttachVO;
import com.recruit.vo.NoticeBoardVO;

public interface NoticeBoardService {

	List<NoticeBoardVO> findNoticeAll();
	
	int nowriteBoard(NoticeBoardVO noboard);

	NoticeBoardVO findNoticeBoardByboard_notice_no(int board_notice_no);

	void increaseNoticeBoardReadCount(int board_notice_no);

	void deleteNoticeBoard(int board_notice_no);

	void noupdateNoticeBoard(NoticeBoardVO noboard);

	List<NoticeBoardVO> findByPage(int pageNo, int pageSize);

	int findBoardCount();

	NoticeBoardAttachVO findBoardNoticeAttachByAttachNoticeNo(int attach_notice_no);

}
package com.recruit.service;

import java.util.List;

import com.recruit.vo.NoticeBoardVO;

public interface NoticeBoardService {

	int nowriteBoard(NoticeBoardVO noboard);
	
	List<NoticeBoardVO> findNoticeAll();

	NoticeBoardVO findNoticeBoardByboard_notice_no(int board_notice_no);

	void increaseNoticeBoardReadCount(int board_notice_no);

	void deleteNoticeBoard(int board_notice_no);

	void noupdateNoticeBoard(NoticeBoardVO noboard);

}
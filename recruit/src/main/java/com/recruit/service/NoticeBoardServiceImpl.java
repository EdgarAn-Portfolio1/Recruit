package com.recruit.service;

import java.util.List;

import com.recruit.mapper.NoticeBoardMapper;
import com.recruit.vo.NoticeBoardVO;

import lombok.Setter;

public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Setter
	private NoticeBoardMapper noticeBoardMapper;
	
	@Override
	public int nowriteBoard(NoticeBoardVO noboard) {
		
		noticeBoardMapper.insertNoticeBoard(noboard);
		
		return 0;
		
	}

	@Override
	public List<NoticeBoardVO> findNoticeAll() {
		
		List<NoticeBoardVO> noboards = noticeBoardMapper.selectNoticeAll();
		
		return noboards;
	}

	@Override
	public NoticeBoardVO findNoticeBoardByboard_notice_no(int board_notice_no) {
		
		NoticeBoardVO noboard = noticeBoardMapper.selectNoticeBoardByNoticeBoardNo(board_notice_no);
		return noboard;
	}

	@Override
	public void increaseNoticeBoardReadCount(int board_notice_no) {
		noticeBoardMapper.updateNoticeBoardNoticeReadCount(board_notice_no);
		
	}

	@Override
	public void deleteNoticeBoard(int board_notice_no) {
		noticeBoardMapper.updateNoticeBoardNoticeDeleted(board_notice_no);
		
	}

	@Override
	public void noupdateNoticeBoard(NoticeBoardVO noboard) {
		noticeBoardMapper.updateNoticeBoard(noboard);
		
	}

}

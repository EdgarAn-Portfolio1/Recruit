package com.recruit.service;

import java.util.HashMap;
import java.util.List;

import com.recruit.mapper.NoticeBoardMapper;
import com.recruit.vo.FreeBoardAttachVO;
import com.recruit.vo.NoticeBoardAttachVO;
import com.recruit.vo.NoticeBoardVO;

import lombok.Setter;

public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Setter
	private NoticeBoardMapper noticeBoardMapper;
	
	@Override
	public int nowriteBoard(NoticeBoardVO noboard) {
		
		// board.boardNo ==> null
		
		//boardDao.insertBoard(board);		
		noticeBoardMapper.insertNoticeBoard(noboard); // Board 테이블에 데이터 저장 ( 데이터베이스에 새 boardNo 생성 )
		
		// 데이터베이스에 만들어진 boardNo를 조회하는 작업 필요 (mybaits가 자동으로 처리, useGeneratedKeys=true, ... )
		// board.boardNo ==> 새로 생성된 boardNo
		
		for (NoticeBoardAttachVO attachment : noboard.getAttachments()) {
			attachment.setBoard_notice_no(noboard.getBoard_notice_no());
			noticeBoardMapper.insertNoticeBoardAttach(attachment); // BoardAttach 테이블에 데이터 저장
		}
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

	@Override
	public List<NoticeBoardVO> findByPage(int pageNo, int pageSize) {

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("from", (pageNo - 1) * pageSize);
		params.put("cnt", pageSize );
		
		return noticeBoardMapper.selectByRange(params);
		
	}

	@Override
	public int findBoardCount() {
		return noticeBoardMapper.selectBoardCount();
	}

}

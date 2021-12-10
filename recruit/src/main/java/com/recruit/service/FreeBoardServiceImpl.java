package com.recruit.service;

import java.util.HashMap;
import java.util.List;

import com.recruit.mapper.FreeBoardMapper;
import com.recruit.vo.FreeBoardAttachVO;
import com.recruit.vo.FreeBoardVO;

import lombok.Setter;

public class FreeBoardServiceImpl implements FreeBoardService {

	@Setter
	private FreeBoardMapper freeBoardMapper;

	@Override
	public int frwriteBoard(FreeBoardVO frboard) {
		
		// board.boardNo ==> null
		
		//boardDao.insertBoard(board);		
		freeBoardMapper.insertFreeBoard(frboard); // Board 테이블에 데이터 저장 ( 데이터베이스에 새 boardNo 생성 )
		
		// 데이터베이스에 만들어진 boardNo를 조회하는 작업 필요 (mybaits가 자동으로 처리, useGeneratedKeys=true, ... )
		// board.boardNo ==> 새로 생성된 boardNo
		
		for (FreeBoardAttachVO attachment : frboard.getAttachments()) {
			attachment.setBoard_free_no(frboard.getBoard_free_no());
			freeBoardMapper.insertFreeBoardAttach(attachment); // BoardAttach 테이블에 데이터 저장
		}
				
		return 0;
	}

	@Override
	public List<FreeBoardVO> findFreeAll() {
		
		List<FreeBoardVO> frboards = freeBoardMapper.selectFreeAll();
		
		return frboards;
	}

	@Override
	public FreeBoardVO findFreeBoardByboard_free_no(int board_free_no) {
		
		FreeBoardVO frboard = freeBoardMapper.selectFreeBoardByFreeBoardNo(board_free_no);
		return frboard;
	}

	@Override
	public void increaseFreeBoardReadCount(int board_free_no) {
		freeBoardMapper.updateFreeBoardFreeReadCount(board_free_no);
	}

	@Override
	public void deleteFreeBoard(int board_free_no) {
		freeBoardMapper.updateFreeBoardFreeDeleted(board_free_no);
	}

	@Override
	public void frupdateFreeBoard(FreeBoardVO frboard) {
		freeBoardMapper.updateFreeBoard(frboard);
	}

	@Override
	public List<FreeBoardVO> findByPage(int pageNo, int pageSize) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("from", (pageNo - 1) * pageSize);
		params.put("cnt", pageSize );
		
		return freeBoardMapper.selectByRange(params);
	}

	@Override
	public int findBoardCount() {
		return freeBoardMapper.selectBoardCount();
	}

	@Override
	public FreeBoardAttachVO findBoardFreeAttachByAttachFreeNo(int attach_free_no) {
		return freeBoardMapper.selectBoardFreeAttachByAttachFreeNo(attach_free_no);
	}



}

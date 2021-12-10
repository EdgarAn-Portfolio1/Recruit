package com.recruit.service;

import java.util.List;

import com.recruit.vo.FreeBoardAttachVO;
import com.recruit.vo.FreeBoardVO;

public interface FreeBoardService {

	List<FreeBoardVO> findFreeAll();
	
	int frwriteBoard(FreeBoardVO frboard);

	FreeBoardVO findFreeBoardByboard_free_no(int board_free_no);

	void increaseFreeBoardReadCount(int board_free_no);

	void deleteFreeBoard(int board_free_no);

	void frupdateFreeBoard(FreeBoardVO frboard);

	List<FreeBoardVO> findByPage(int pageNo, int pageSize);

	int findBoardCount();

	FreeBoardAttachVO findBoardFreeAttachByAttachFreeNo(int attach_free_no);

}
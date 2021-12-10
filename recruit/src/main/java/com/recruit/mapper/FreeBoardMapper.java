package com.recruit.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.recruit.vo.FreeBoardAttachVO;
import com.recruit.vo.FreeBoardVO;

@Mapper
public interface FreeBoardMapper {
	
	List<FreeBoardVO> selectFreeAll();

	FreeBoardVO selectFreeBoardByFreeBoardNo(int board_free_no);

	void updateFreeBoardFreeReadCount(int board_free_no);

	void updateFreeBoardFreeDeleted(int board_free_no);

	void updateFreeBoard(FreeBoardVO frboard);

	void insertFreeBoard(FreeBoardVO frboard);
	
	int selectBoardCount();
	
	List<FreeBoardVO> selectByRange(HashMap<String, Object> params);

	void insertFreeBoardAttach(FreeBoardAttachVO attachment);

	FreeBoardAttachVO selectBoardFreeAttachByAttachFreeNo(int attach_free_no);

}

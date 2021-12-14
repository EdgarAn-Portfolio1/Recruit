package com.recruit.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.recruit.vo.NoticeBoardAttachVO;
import com.recruit.vo.NoticeBoardVO;

@Mapper
public interface NoticeBoardMapper {
	
	List<NoticeBoardVO> selectNoticeAll();
	
	NoticeBoardVO selectNoticeBoardByNoticeBoardNo(int board_notice_no);
	
	void updateNoticeBoardNoticeReadCount(int board_notice_no);

	void updateNoticeBoardNoticeDeleted(int board_notice_no);
	
	void updateNoticeBoard(NoticeBoardVO noboard);
	
	void insertNoticeBoard(NoticeBoardVO noticeboard);

	int selectBoardCount();
	
	List<NoticeBoardVO> selectByRange(HashMap<String, Object> params);

	void insertNoticeBoardAttach(NoticeBoardAttachVO attachment);

	NoticeBoardAttachVO selectBoardNoticeAttachByAttachNoticeNo(int attach_notice_no);

}

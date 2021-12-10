package com.recruit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.recruit.vo.NoticeBoardVO;

@Mapper
public interface NoticeBoardMapper {
	
	void insertNoticeBoard(NoticeBoardVO noticeboard);

	List<NoticeBoardVO> selectNoticeAll();

	void updateNoticeBoard(NoticeBoardVO noboard);

	NoticeBoardVO selectNoticeBoardByNoticeBoardNo(int board_notice_no);

	void updateNoticeBoardNoticeReadCount(int board_notice_no);

	void updateNoticeBoardNoticeDeleted(int board_notice_no);

}

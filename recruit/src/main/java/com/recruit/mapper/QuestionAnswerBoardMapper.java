package com.recruit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.recruit.vo.QuestionAnswerBoardVO;

@Mapper
public interface QuestionAnswerBoardMapper {

	List<QuestionAnswerBoardVO> selectQaAll();

	void insertQaBoard(QuestionAnswerBoardVO qaboard);

	QuestionAnswerBoardVO selectQaBoardByQaBoardNo(int board_qa_no);

	void updateQaBoardQaReadCount(int board_qa_no);

	void updateQaBoardQaDeleted(int board_qa_no);

	void updateQaBoard(QuestionAnswerBoardVO qaboard);

	
}

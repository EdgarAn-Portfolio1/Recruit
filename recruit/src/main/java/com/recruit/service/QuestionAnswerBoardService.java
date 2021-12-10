package com.recruit.service;

import java.util.List;

import com.recruit.vo.QuestionAnswerBoardVO;

public interface QuestionAnswerBoardService {

	List<QuestionAnswerBoardVO> findQaAll();

	int qawriteBoard(QuestionAnswerBoardVO qaboard);

	QuestionAnswerBoardVO findQaBoardByboard_qa_no(int board_qa_no);

	void increaseQaBoardReadCount(int board_qa_no);

	void deleteQaBoard(int board_qa_no);

	void qaupdateQaBoard(QuestionAnswerBoardVO qaboard);

	
}
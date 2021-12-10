package com.recruit.service;

import java.util.List;

import com.recruit.mapper.QuestionAnswerBoardMapper;
import com.recruit.vo.QuestionAnswerBoardVO;

import lombok.Setter;

public class QuestionAnswerBoardServiceImpl implements QuestionAnswerBoardService {

	@Setter
	private QuestionAnswerBoardMapper questionAnswerBoardMapper;

	@Override
	public List<QuestionAnswerBoardVO> findQaAll() {
		
		List<QuestionAnswerBoardVO> qaboards = questionAnswerBoardMapper.selectQaAll();
		
		return qaboards;
	}

	@Override
	public int qawriteBoard(QuestionAnswerBoardVO qaboard) {
		
		questionAnswerBoardMapper.insertQaBoard(qaboard);
		
		return 0;
	}

	@Override
	public QuestionAnswerBoardVO findQaBoardByboard_qa_no(int board_qa_no) {
		
		QuestionAnswerBoardVO qaboard = questionAnswerBoardMapper.selectQaBoardByQaBoardNo(board_qa_no);
		return qaboard;
	}

	@Override
	public void increaseQaBoardReadCount(int board_qa_no) {
		questionAnswerBoardMapper.updateQaBoardQaReadCount(board_qa_no);
		
	}

	@Override
	public void deleteQaBoard(int board_qa_no) {
		questionAnswerBoardMapper.updateQaBoardQaDeleted(board_qa_no);
		
	}

	@Override
	public void qaupdateQaBoard(QuestionAnswerBoardVO qaboard) {
		questionAnswerBoardMapper.updateQaBoard(qaboard);
		
	}

	

}

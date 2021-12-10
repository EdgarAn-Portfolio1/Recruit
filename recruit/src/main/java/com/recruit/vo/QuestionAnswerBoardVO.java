package com.recruit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionAnswerBoardVO {
	
	private int board_qa_no;
	private String qa_title;
	private String qa_writer;
	private String qa_content;
	private int qa_readCount;
	private boolean qa_deleted;
	private Date qa_Date;
	
}

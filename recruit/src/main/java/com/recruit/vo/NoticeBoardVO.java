package com.recruit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBoardVO {
	
	private int board_notice_no;
	private String notice_title;
	private String notice_writer;
	private String notice_content;
	private int notice_readCount;
	private boolean notice_deleted;
	private Date notice_Date;
	
}

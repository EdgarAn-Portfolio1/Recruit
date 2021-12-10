package com.recruit.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
	
	// NoticeBoardVO와 NoticeBoardAttachVO 사이의 1:Many 관계를 표현하는 필드 
	private List<NoticeBoardAttachVO> attachments;
		
	}
	


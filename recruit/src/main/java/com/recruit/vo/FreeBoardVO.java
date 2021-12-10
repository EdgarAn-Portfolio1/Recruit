package com.recruit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FreeBoardVO {
	
	private int board_free_no;
	private String free_title;
	private String free_writer;
	private String free_content;
	private int free_readCount;
	private boolean free_deleted;
	private Date free_Date;
	
	// FreeBoardVO와 FreeBoardAttachVO 사이의 1:Many 관계를 표현하는 필드 
	private List<FreeBoardAttachVO> attachments;
	
}

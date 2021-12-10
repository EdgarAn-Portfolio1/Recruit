package com.recruit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class EpilogueBoardVO {
	
	private int boardNo;
	private String title;
	private String writer;
	private String content;
	private int readCount;
	private boolean deleted;
	private Date regDate;
	
}

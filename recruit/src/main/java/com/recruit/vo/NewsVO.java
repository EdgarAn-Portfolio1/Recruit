package com.recruit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NewsVO {
	
	private int new_no;
	public String title;
	public String link;
	public String content;
	public String date;

}

package com.recruit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BookMarkVO {

	
	private int recruit_num;
	private String memberId;
	public Date bookmark_date;
	
	EnterprisesVO enterprises;
}

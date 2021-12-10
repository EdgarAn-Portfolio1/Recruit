package com.recruit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class LikeVO {

	
	private int recruit_num;
	private String memberId; // id --> Id
	public Date like_date;
	
}

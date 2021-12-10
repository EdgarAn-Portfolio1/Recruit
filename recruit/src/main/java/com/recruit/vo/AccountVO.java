package com.recruit.vo;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class AccountVO{
	
	private String memberId;
	private String passwd;
	private String email;
	private String userType;
	private Date regDate;
	private boolean active;

}
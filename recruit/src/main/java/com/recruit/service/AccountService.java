package com.recruit.service;

import com.recruit.vo.AccountVO;

public interface AccountService{
	
	public void register(AccountVO account) throws Exception;
	
	public AccountVO login(AccountVO account) throws Exception;

	 boolean checkId(String memberId); 
	
}
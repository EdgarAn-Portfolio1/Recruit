package com.recruit.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.recruit.vo.AccountVO;

@Mapper
public interface AccountMapper{
	
	void insertAccount(AccountVO account);
	
	AccountVO selectAccountByIdAndPasswd(AccountVO account);

	int selectCountByMemberId(String memberId); 
	
}


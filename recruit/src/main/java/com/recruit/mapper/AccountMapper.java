package com.recruit.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import com.recruit.vo.AccountVO;

@Mapper
public interface AccountMapper{
	
	void insertAccount(AccountVO account);
	
	AccountVO selectAccountByIdAndPasswd(AccountVO account);

	int selectCountByMemberId(String memberId); 
	
	String searchMemberId(String memberId);
	
	String searchPasswd(HashMap<String, Object> params); // 두개 이상일땐 해시맵으로 받기 !
	
}


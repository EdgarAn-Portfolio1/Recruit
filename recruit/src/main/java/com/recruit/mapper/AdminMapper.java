package com.recruit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.recruit.vo.AccountVO;

@Mapper
public interface AdminMapper{
	
	List<AccountVO> selectAllMembers();
	
	void updateMember(AccountVO account);
	
	AccountVO selectMemberByMemberID(String memberId);
	
	void updateMemberDeleted(String memberId);
	
}
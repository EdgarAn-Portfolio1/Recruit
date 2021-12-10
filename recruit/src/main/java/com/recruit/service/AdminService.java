package com.recruit.service;

import java.util.List;


import com.recruit.vo.AccountVO;

public interface AdminService {

	List<AccountVO> findAllMembers();

	void updateMember(AccountVO account);

	AccountVO findMemberByMemberId(String memberId);

	void deleteMember(String memberId);

}
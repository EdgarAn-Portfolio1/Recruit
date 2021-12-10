package com.recruit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recruit.mapper.AdminMapper;
import com.recruit.vo.AccountVO;

import lombok.Setter;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Setter
	private AdminMapper adminMapper;
	
	@Override
	public List<AccountVO> findAllMembers() {
		
		return adminMapper.selectAllMembers();
	}

	@Override
	public void updateMember(AccountVO account) {

		adminMapper.updateMember(account);
		
	}

	@Override
	public AccountVO findMemberByMemberId(String memberId) {

		return adminMapper.selectMemberByMemberID(memberId);
	}

	@Override
	public void deleteMember(String memberId) {

		adminMapper.updateMemberDeleted(memberId);
		
	}
	
	
}
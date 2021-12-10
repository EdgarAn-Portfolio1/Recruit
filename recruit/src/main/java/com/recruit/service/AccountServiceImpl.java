package com.recruit.service;

import org.springframework.stereotype.Service;

import com.recruit.mapper.AccountMapper;
import com.recruit.vo.AccountVO;

import lombok.Setter;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Setter
	private AccountMapper accountMapper;

	@Override
	public void register(AccountVO account) {

		accountMapper.insertAccount(account);

	}

	@Override
	public AccountVO login(AccountVO account) {

		AccountVO selectedAccount = accountMapper.selectAccountByIdAndPasswd(account);
		return selectedAccount;
	}

	
	@Override public boolean checkId(String memberId) { 
		  int count = accountMapper.selectCountByMemberId(memberId); 
		  return count == 0 ? true : false; 
	}
	 
}
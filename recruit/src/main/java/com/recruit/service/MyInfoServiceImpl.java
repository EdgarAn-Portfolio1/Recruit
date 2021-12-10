package com.recruit.service;

import java.util.HashMap;
import java.util.List;

import com.recruit.mapper.MyInfoMapper;
import com.recruit.vo.MyInfoVO;

import lombok.Setter;

public class MyInfoServiceImpl implements MyInfoService {

	@Setter
	private MyInfoMapper myInfoMapper;

	@Override
	public MyInfoVO selectMyInfo(String memberId) {
		return myInfoMapper.selectMyInfo(memberId);
	}

	@Override
	public String writeNewMyInfo(MyInfoVO newMyInfo) {
		myInfoMapper.writeNewMyInfo(newMyInfo);
		return null;
	}

	@Override
	public void updateMyInfo(MyInfoVO myInfo) {
		myInfoMapper.updateMyInfo(myInfo);
	}


	
}
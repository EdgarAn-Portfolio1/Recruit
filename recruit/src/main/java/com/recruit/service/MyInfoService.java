package com.recruit.service;

import java.util.HashMap;
import java.util.List;

import com.recruit.vo.MyInfoVO;

public interface MyInfoService {

// List<MyInfoVO> selectMyInfo(HashMap<String, Object> params);

    MyInfoVO selectMyInfo(String memberId);

	String writeNewMyInfo(MyInfoVO newMyInfo) ;

	void updateMyInfo(MyInfoVO myInfo);

}

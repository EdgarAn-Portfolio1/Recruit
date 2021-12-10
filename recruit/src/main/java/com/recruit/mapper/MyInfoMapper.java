package com.recruit.mapper;

import java.util.HashMap;
import java.util.List;

import com.recruit.vo.MyInfoVO;

public interface MyInfoMapper {

//	List<MyInfoVO> selectMyInfo(HashMap<String, Object> params);

	MyInfoVO selectMyInfo(String memberId);

	void writeNewMyInfo(MyInfoVO newMyInfo);

	void updateMyInfo(MyInfoVO myInfo);

	
}

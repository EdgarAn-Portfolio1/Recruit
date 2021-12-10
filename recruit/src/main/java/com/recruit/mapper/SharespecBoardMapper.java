package com.recruit.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.recruit.vo.SharespecBoardVO;

@Mapper
public interface SharespecBoardMapper {
	
	void insertSharespecBoard(SharespecBoardVO sharespecboard);

}

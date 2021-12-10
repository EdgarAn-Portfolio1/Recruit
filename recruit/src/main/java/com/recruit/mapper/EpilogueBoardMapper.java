package com.recruit.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.recruit.vo.EpilogueBoardVO;

@Mapper
public interface EpilogueBoardMapper {

	void insertEpilogueBoard(EpilogueBoardVO epilogueboard);
	
}

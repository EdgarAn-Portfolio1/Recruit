package com.recruit.service;

import com.recruit.mapper.EpilogueBoardMapper;
import com.recruit.vo.EpilogueBoardVO;

import lombok.Setter;

public class EpilogueBoardServiceImpl implements EpilogueBoardService {

	@Setter
	private EpilogueBoardMapper epilogueBoardMapper;
	
	@Override
	public int writeepilogueBoard(EpilogueBoardVO epilogueboard) {
		
		epilogueBoardMapper.insertEpilogueBoard(epilogueboard);
		
		return 0;
		
	}
	
}

package com.recruit.service;

import com.recruit.mapper.SharespecBoardMapper;
import com.recruit.vo.SharespecBoardVO;

import lombok.Setter;

public class SharespecBoardServiceImpl implements SharespecBoardService {

	@Setter
	private SharespecBoardMapper sharespecBoardMapper;
	
	@Override
	public int writesharespecBoard(SharespecBoardVO sharespecboard) {
		
		sharespecBoardMapper.insertSharespecBoard(sharespecboard);
		
		return 0;
	}

}

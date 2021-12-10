package com.recruit.service;

import java.util.List;

import com.recruit.mapper.BookMarkMapper;
import com.recruit.vo.BookMarkVO;

import lombok.Setter;

public class BookMarkServiceImpl implements BookMarkService {

	@Setter
	private BookMarkMapper bookMarkMapper;

	@Override
	public List<BookMarkVO> selectBookMark(String memberId) {
		
		List<BookMarkVO> bookmarks = bookMarkMapper.selectBookMark(memberId);
		
		return bookmarks;
	}


	
}
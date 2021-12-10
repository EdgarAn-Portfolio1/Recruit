package com.recruit.service;

import java.util.HashMap;
import java.util.List;

import com.recruit.mapper.BooksMapper;
import com.recruit.vo.BooksVO;

import lombok.Setter;

public class BooksServiceImpl implements BooksService{

	@Setter
	private BooksMapper booksMapper;

	@Override
	public List<BooksVO> selectBooks() {
		return booksMapper.selectBooks();
	}
}

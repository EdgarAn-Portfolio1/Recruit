package com.recruit.service;

import java.util.HashMap;
import java.util.List;

import com.recruit.mapper.NewsMapper;
import com.recruit.vo.NewsVO;

import lombok.Setter;

public class NewsServiceImpl implements NewsService {

	@Setter
	private NewsMapper newsMapper;
	
	@Override
	public List<NewsVO> selectNews(HashMap<String, Object> params) {
		
		List<NewsVO> news = newsMapper.selectNews(params);
		
		return news;
	}
}

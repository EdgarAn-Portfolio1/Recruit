package com.recruit.service;

import java.util.HashMap;
import java.util.List;

import com.recruit.vo.NewsVO;

public interface NewsService {

	List<NewsVO> selectNews(HashMap<String, Object> params);
	
}
package com.recruit.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.recruit.vo.NewsVO;

@Mapper
public interface NewsMapper {

	List<NewsVO> selectNews(HashMap<String, Object> params);
	
}

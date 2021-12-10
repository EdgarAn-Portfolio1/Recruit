package com.recruit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.recruit.vo.BooksVO;

@Mapper
public interface BooksMapper {

	List<BooksVO> selectBooks();

}

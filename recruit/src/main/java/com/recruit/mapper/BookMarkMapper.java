package com.recruit.mapper;

import java.util.List;

import com.recruit.vo.BookMarkVO;
import com.recruit.vo.EnterprisesVO;

public interface BookMarkMapper {

	List<BookMarkVO> selectBookMark(String memberId);
	
}

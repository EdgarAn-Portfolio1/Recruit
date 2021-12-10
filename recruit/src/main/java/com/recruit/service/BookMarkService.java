package com.recruit.service;

import java.util.List;

import com.recruit.vo.BookMarkVO;

public interface BookMarkService {

	List<BookMarkVO> selectBookMark(String memberId);

}
